source_gybs := $(patsubst %.swift.gyb,%.swift,$(wildcard Sources/SwiftyMKL/*.swift.gyb))
gybs := $(source_gybs) Tests/SwiftyMKLTests/SwiftyMKLTests.swift Tests/LinuxMain.swift

all: build

run: $(gybs)
	swift run

test: $(gybs)
	swift test

build: $(gybs)
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
	rm -rf .build $(gybs)

