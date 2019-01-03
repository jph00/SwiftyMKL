# Swifty MKL

A Swift wrapper for Intel Performance Libraries.

## Current status

The `Vector` protocol provides access to Intel Performance Libraries functionality, and is added as an extension to:

- Regular swift arrays
- `struct VectorP` which aligns storage on 64bit boundaries for better performance

What works:

- Basic unary and binary MKL and IPP functions
- MKL random number generators
- Standard math ops on scalars and vectors, and optimized in-place assignment versions
- Packing functions using increment, indices, and masks

## Building

Only tested on Linux, but should work on Mac too. Assuming you selected the defaults when installing the Intel Performance Libraries, you can add them to the environment
with:

```bash
source ~/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64
source ~/intel/compilers_and_libraries/linux/ipp/bin/ippvars.sh intel64 linux
```

Then run `make test` for unit tests, or `make run` for a small benchmark.

