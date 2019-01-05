ifeq ($(mode),)
mode := debug
endif

# Adapted from vadimeisenbergibm/SwiftResourceHandlingExample
#   Darwin version untested
UNAME = ${shell uname}
ifeq ($(UNAME), Darwin)
PLATFORM = x86_64-apple-macosx*
EXECUTABLE = ./.build/${PLATFORM}/${mode}
TEST = ./.build/${PLATFORM}/${mode}/*.xctest/Contents/Resources
else ifeq ($(UNAME), Linux)
PLATFORM = x86_64-unknown-linux
EXECUTABLE = ./.build/${PLATFORM}/${mode}
TEST = ${EXECUTABLE}
endif

# Use these if linking against full IPP/MKL
#libs := $(addprefix -l,ippi ipps ippvm ippcore mkl_intel_lp64 mkl_sequential mkl_core m pthread dl)
#libs_args := -Xcc -I${MKLROOT}/include -Xcc -I${IPPROOT}/include $(addprefix -Xlinker ,-L${MKLROOT}/lib -L${IPPROOT}/lib $(libs))

libs := $(addprefix -l,mkl_custom ipp_custom m pthread dl)
libs_args := -Xcc -I./$(UNAME) $(addprefix -Xlinker ,-L./$(UNAME) $(libs))

#$(addprefix -Xswiftc ,-Ounchecked -Rpass-missed=loop-vectorize -Rpass=loop-vectorize -Xllvm -force-vector-width=4 -Xllvm -force-vector-interleave=4)
xtra_args := -Xswiftc -Ounchecked -Xcc -ffast-math
link_args := $(libs_args) $(xtra_args)

source_gybs := $(patsubst %.swift.gyb,%.swift,$(wildcard Sources/SwiftyMKL/*.swift.gyb))
conv_gybs := $(source_gybs) Tests/SwiftyMKLTests/SwiftyMKLTests.swift Tests/LinuxMain.swift
sources := $(wildcard Sources/SwiftyMKL/*.swift) $(wildcard Tests/SwiftyMKLTests/*.swift) Tests/LinuxMain.swift $(conv_gybs) Sources/CSwiftyMKL/CSwiftyMKL.c Sources/CSwiftyMKL/include/CSwiftyMKL.h
headers := $(wildcard all_%.h)

yaml := ./.build/${mode}.yaml
run_args := -c $(mode) $(link_args)

all: $(yaml)

run: $(yaml)
	swift run $(run_args)

test: $(yaml)
	swift test $(run_args)

$(yaml): $(sources) $(UNAME)
	swift build -v $(run_args)
	cp $(UNAME)/*.so $(EXECUTABLE)/
	cp $(UNAME)/*.so $(TEST)/

Tests/LinuxMain.swift: Tests/SwiftyMKLTests/SwiftyMKLTests.swift

$(UNAME): $(UNAME).tgz
	tar xf $(UNAME).tgz

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

