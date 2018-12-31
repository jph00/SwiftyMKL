source_gybs := $(patsubst %.swift.gyb,%.swift,$(wildcard Sources/SwiftyMKL/*.swift.gyb))
conv_gybs := $(source_gybs) Tests/SwiftyMKLTests/SwiftyMKLTests.swift Tests/LinuxMain.swift
sources := $(wildcard Sources/SwiftyMKL/*.swift) $(wildcard Tests/SwiftyMKLTests/*.swift) Tests/LinuxMain.swift $(conv_gybs)

all: build

run: $(sources)
	swift run

test: $(sources)
	swift test

build: $(sources)
	swift build -v

Tests/LinuxMain.swift: Tests/SwiftyMKLTests/SwiftyMKLTests.swift

Tests/%.swift: Tests/%.swift.gyb
	gyb --line-directive '' -o $@ $<

Tests/SwiftyMKL/%.swift: Tests/SwiftyMKL/%.swift.gyb
	gyb --line-directive '' -o $@ $<

Sources/SwiftyMKL/%.swift: Sources/SwiftyMKL/%.swift.gyb
	gyb --line-directive '' -o $@ $<

.PHONY: clean   
clean:
	rm -rf .build $(conv_gybs)

