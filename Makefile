ifeq ($(mode),)
mode := debug
endif

# Adapted from vadimeisenbergibm/SwiftResourceHandlingExample
UNAME = ${shell uname}
ifeq ($(UNAME), Darwin)
PLATFORM = x86_64-apple-macosx*
EXECUTABLE = ./.build/${PLATFORM}/${mode}
LIB_SUF = dylib
else ifeq ($(UNAME), Linux)
PLATFORM = x86_64-unknown-linux
EXECUTABLE = ./.build/${PLATFORM}/${mode}
LIB_SUF = so
endif

# Use these if linking against full IPP/MKL
#libs := $(addprefix -l,ippi ipps ippvm ippcore mkl_intel_lp64 mkl_sequential mkl_core m pthread dl)
#libs_args := -Xcc -I${MKLROOT}/include -Xcc -I${IPPROOT}/include $(addprefix -Xlinker ,-L${MKLROOT}/lib -L${IPPROOT}/lib $(libs))

# Use these if linking against custom lib (recommended)
custom := ./$(UNAME)
libs_args := -Xcc -I$(custom) -Xlinker -L$(custom)
prefix := LD_LIBRARY_PATH=$(custom)

#$(addprefix -Xswiftc ,-Rpass-missed=loop-vectorize -Rpass=loop-vectorize -Xllvm -force-vector-width=4 -Xllvm -force-vector-interleave=4)
xtra_args := -Xswiftc -Ounchecked -Xcc -ffast-math
link_args := $(libs_args) $(xtra_args)

source_gybs := $(patsubst %.swift.gyb,%.swift,$(wildcard Sources/SwiftyMKL/*.swift.gyb))
conv_gybs := $(source_gybs) Tests/SwiftyMKLTests/SwiftyMKLTests.swift Tests/LinuxMain.swift
sources := $(wildcard Sources/SwiftyMKL/*.swift) $(wildcard Tests/SwiftyMKLTests/*.swift) Tests/LinuxMain.swift $(conv_gybs) Sources/CSwiftyMKL/CSwiftyMKL.c Sources/CSwiftyMKL/include/CSwiftyMKL.h
headers := $(wildcard all_%.h)

yaml := ./.build/${mode}.yaml
run_args := -c $(mode) $(link_args)
custom_dir := $(UNAME)/.dirstamp

all: $(yaml)

run: $(yaml)
	$(prefix) swift run $(run_args)

test: $(yaml)
	$(prefix) swift test $(run_args)

$(yaml): gyb $(custom_dir)
	swift build -v $(run_args)

Tests/LinuxMain.swift: Tests/SwiftyMKLTests/SwiftyMKLTests.swift

gyb: $(sources)

$(custom_dir): $(UNAME).tgz
	tar xf $(UNAME).tgz
	touch $(custom_dir)

$(UNAME).tgz:
	wget http://files.fast.ai/files/$(UNAME).tgz

Tests/%.swift: Tests/%.swift.gyb
	gyb --line-directive '' -o $@ $<

Tests/SwiftyMKL/%.swift: Tests/SwiftyMKL/%.swift.gyb
	gyb --line-directive '' -o $@ $<

Sources/SwiftyMKL/%.swift: Sources/SwiftyMKL/%.swift.gyb funcs.py mkl_funcs.py
	gyb --line-directive '' -o $@ $<

mkl_funcs.py: get_headers.py $(headers)
	python get_headers.py

.PHONY: clean   
clean:
	rm -rf .build $(conv_gybs)

