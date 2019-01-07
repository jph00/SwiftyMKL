ifeq ($(mode),)
mode := debug
endif

xtra_args := -Xswiftc -Ounchecked $(addprefix -Xcc ,-ffast-math -O3 -march=native)
#xtra_args := #$(xtra_args) $(addprefix -Xcc ,-Rpass-missed=loop-vectorize -Rpass=loop-vectorize) # -Xllvm -force-vector-width=4 -Xllvm -force-vector-interleave=4)

UNAME = ${shell uname}
ifeq ($(UNAME), Darwin)
PLATFORM = x86_64-apple-macosx*
EXECUTABLE = ./.build/${PLATFORM}/${mode}
LIB_SUF = dylib
xtra_args := $(xtra_args) -Xlinker -rpath -Xlinker ${shell pwd}/Darwin
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

link_args := $(libs_args) $(xtra_args)

gybs := $(shell find Sources Tests -type f -name '*.gyb')
conv_gybs := $(patsubst %.gyb,%,$(gybs))
sources := $(conv_gybs) $(shell find Sources Tests -type f -name '*.swift')
sources := $(sources) $(shell find Sources Tests -type f -name '*.c')
sources := $(sources) $(shell find Sources Tests -type f -name '*.h')
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

%.swift: %.swift.gyb
	gyb --line-directive '' -o $@ $<

%.c: %.c.gyb
	gyb --line-directive '' -o $@ $<

%.h: %.h.gyb
	gyb --line-directive '' -o $@ $<

Sources/SwiftyMKL/MathFunctions.swift Sources/SwiftyMKL/Vector-impl.swift: mkl_funcs.py funcs.py

mkl_funcs.py: get_headers.py $(headers)
	python get_headers.py

.PHONY: clean   
clean:
	rm -rf .build $(conv_gybs)

