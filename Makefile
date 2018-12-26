all: build

run: Sources/SwiftyMKL/SwiftyMKL.swift
	swift run

test: Sources/SwiftyMKL/SwiftyMKL.swift
	swift test

build: Sources/SwiftyMKL/SwiftyMKL.swift
	swift build

Sources/SwiftyMKL/SwiftyMKL.swift: Sources/SwiftyMKL/SwiftyMKL.swift.gyb
	./gyb.py Sources/SwiftyMKL/SwiftyMKL.swift.gyb > Sources/SwiftyMKL/SwiftyMKL.swift

.PHONY: clean   
clean:
	rm -rf .build Sources/SwiftyMKL/SwiftyMKL.swift

