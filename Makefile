gybs = Sources/SwiftyMKL/SwiftyMKL.swift Sources/SwiftyMKL/MathFunctions.swift Tests/LinuxMain.swift Tests/SwiftyMKLTests/SwiftyMKLTests.swift
all: build

run: $(gybs)
	swift run

test: $(gybs)
	swift test

build: $(gybs)
	swift build

Tests/%.swift: Tests/%.swift.gyb
	./gyb.py --line-directive '' -o $@ $<

Tests/SwiftyMKL/%.swift: Tests/SwiftyMKL/%.swift.gyb
	./gyb.py --line-directive '' -o $@ $<

Sources/SwiftyMKL/%.swift: Sources/SwiftyMKL/%.swift.gyb
	./gyb.py --line-directive '' -o $@ $<

.PHONY: clean   
clean:
	rm -rf .build Sources/SwiftyMKL/SwiftyMKL.swift

