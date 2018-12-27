all: build

run: Sources/SwiftyMKL/SwiftyMKL.swift
	swift run

test: Sources/SwiftyMKL/SwiftyMKL.swift Tests/LinuxMain.swift Tests/SwiftyMKLTests/SwiftyMKLTests.swift
	swift test

build: Sources/SwiftyMKL/SwiftyMKL.swift
	swift build

Tests/LinuxMain.swift: Tests/SwiftyMKLTests/SwiftyMKLTests.swift.gyb

Tests/%.swift: Tests/%.swift.gyb
	./gyb.py --line-directive '' -o $@ $<

Tests/SwiftyMKL/%.swift: Tests/SwiftyMKL/%.swift.gyb
	./gyb.py --line-directive '' -o $@ $<

Sources/SwiftyMKL/%.swift: Sources/SwiftyMKL/%.swift.gyb
	./gyb.py --line-directive '' -o $@ $<

.PHONY: clean   
clean:
	rm -rf .build Sources/SwiftyMKL/SwiftyMKL.swift

