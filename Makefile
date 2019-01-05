# TODO: put all libs and headers in one archive
# This is for static compilation, although it doesn't work as a static lib yet. It also doesn't work with VSL.
#link_args := -Xlinker ${MKLROOT}/lib/intel64/libmkl_intel_lp64.a -Xlinker ${MKLROOT}/lib/intel64/libmkl_sequential.a -Xlinker ${MKLROOT}/lib/intel64/libmkl_core.a -Xlinker ${IPPROOT}/lib/intel64/libippi.a -Xlinker ${IPPROOT}/lib/intel64/libipps.a -Xlinker ${IPPROOT}/lib/intel64/libippvm.a -Xlinker ${IPPROOT}/lib/intel64/libippcore.a -Xlinker -lpthread -Xlinker -lm -Xlinker -ldl
#link_args := -Xlinker -L. -Xlinker -lSwiftyMKL-Static
link_args := -Xlinker -L${MKLROOT}/lib -Xlinker -L${IPPROOT}/lib -Xlinker -lippi -Xlinker -lipps -Xlinker -lippvm -Xlinker -lippcore -Xlinker -lmkl_intel_lp64 -Xlinker -lmkl_sequential -Xlinker -lmkl_core -Xlinker -lm
#link_args := -Xlinker -L/home/jhoward/git/SwiftyMKL/intel64 -Xlinker -lipp_custom -Xlinker -lmkl_custom -Xlinker -lm -Xlinker -lpthread -Xlinker -ldl
source_gybs := $(patsubst %.swift.gyb,%.swift,$(wildcard Sources/SwiftyMKL/*.swift.gyb))
conv_gybs := $(source_gybs) Tests/SwiftyMKLTests/SwiftyMKLTests.swift Tests/LinuxMain.swift
sources := $(wildcard Sources/SwiftyMKL/*.swift) $(wildcard Tests/SwiftyMKLTests/*.swift) Tests/LinuxMain.swift $(conv_gybs) Sources/CSwiftyMKL/CSwiftyMKL.c Sources/CSwiftyMKL/include/CSwiftyMKL.h
headers := $(wildcard all_%.h)

all: build

#-Xswiftc -Ounchecked -Xswiftc -Rpass-missed=loop-vectorize -Xswiftc -Rpass=loop-vectorize -Xswiftc -Xllvm -Xswiftc -force-vector-width=4 -Xswiftc -Xllvm -Xswiftc -force-vector-interleave=4
# -Xcc -ffast-math -Xswiftc -Rpass-missed=loop-vectorize -Xswiftc -Rpass=loop-vectorize -Xswiftc -Xllvm -Xswiftc -force-vector-width=4 -Xswiftc -Xllvm -Xswiftc -force-vector-interleave=4
run: $(sources)
	swift run -c release $(link_args) -Xswiftc -Ounchecked -Xcc -ffast-math

test: $(sources)
	swift test $(link_args)

build: $(sources)
	swift build -v -c release $(link_args)

Tests/LinuxMain.swift: Tests/SwiftyMKLTests/SwiftyMKLTests.swift

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

