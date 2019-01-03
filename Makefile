source_gybs := $(patsubst %.swift.gyb,%.swift,$(wildcard Sources/SwiftyMKL/*.swift.gyb))
conv_gybs := $(source_gybs) Tests/SwiftyMKLTests/SwiftyMKLTests.swift Tests/LinuxMain.swift
sources := $(wildcard Sources/SwiftyMKL/*.swift) $(wildcard Tests/SwiftyMKLTests/*.swift) Tests/LinuxMain.swift $(conv_gybs) Sources/CSwiftyMKL/CSwiftyMKL.c Sources/CSwiftyMKL/include/CSwiftyMKL.h
headers := $(wildcard all_%.h)

all: build

#-Xswiftc -Ounchecked -Xswiftc -Rpass-missed=loop-vectorize -Xswiftc -Rpass=loop-vectorize -Xswiftc -Xllvm -Xswiftc -force-vector-width=4 -Xswiftc -Xllvm -Xswiftc -force-vector-interleave=4
run: $(sources)
	swift run -c release

test: $(sources)
	swift test

build: $(sources)
	swift build -v

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

