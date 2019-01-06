# Swifty MKL

A Swift wrapper for Intel Performance Libraries.

## Current status

The `Vector` protocol provides access to the Intel Performance Libraries'
functionality, supports RandomAccessCollection, MutableCollection,
ExpressibleByArrayLiteral, and CustomStringConvertible, and is added as an
extension to:

- Regular swift arrays
- `struct VectorP`, which aligns storage on 64bit boundaries for better performance

Currently provided (more to come!):

- Basic unary and binary MKL and IPP functions
- MKL random number generators
- Standard math ops on scalars and vectors, and optimized in-place assignment versions
- Packing functions using increment, indices, and masks

## Building

Tested on Windows 10 and MacOS 10. No prerequisites other than standard Swift
command line tools.

Running `make` will download and unzip an appropriate MKL/IPP custom lib for
your system (if not done before) and build the library. For release mode (up to
100x faster!) run `make mode=release`. You can add `mode=release` to any of the
below make commands too:

- `make run`: run a small benchmark
- `make test`: unit tests (Swift on Mac doesn't know how to find them however,
  but works fine on Linux)

