import CMKL

// #defines from mkl_vsl_defines.h not auto-converted by swift
let VSL_BRNG_INC = 1<<VSL_BRNG_SHIFT
let VSL_BRNG_MCG31        = VSL_BRNG_INC
let VSL_BRNG_R250         = VSL_BRNG_MCG31 + VSL_BRNG_INC
let VSL_BRNG_MRG32K3A     = VSL_BRNG_R250 + VSL_BRNG_INC
let VSL_BRNG_MCG59        = VSL_BRNG_MRG32K3A + VSL_BRNG_INC
let VSL_BRNG_WH           = VSL_BRNG_MCG59 + VSL_BRNG_INC
let VSL_BRNG_SOBOL        = VSL_BRNG_WH + VSL_BRNG_INC
let VSL_BRNG_NIEDERR      = VSL_BRNG_SOBOL + VSL_BRNG_INC
let VSL_BRNG_MT19937      = VSL_BRNG_NIEDERR + VSL_BRNG_INC
let VSL_BRNG_MT2203       = VSL_BRNG_MT19937 + VSL_BRNG_INC
let VSL_BRNG_IABSTRACT    = VSL_BRNG_MT2203 + VSL_BRNG_INC
let VSL_BRNG_DABSTRACT    = VSL_BRNG_IABSTRACT + VSL_BRNG_INC
let VSL_BRNG_SABSTRACT    = VSL_BRNG_DABSTRACT + VSL_BRNG_INC
let VSL_BRNG_SFMT19937    = VSL_BRNG_SABSTRACT + VSL_BRNG_INC
let VSL_BRNG_NONDETERM    = VSL_BRNG_SFMT19937 + VSL_BRNG_INC
let VSL_BRNG_ARS5         = VSL_BRNG_NONDETERM + VSL_BRNG_INC
let VSL_BRNG_PHILOX4X32X10 = VSL_BRNG_ARS5 + VSL_BRNG_INC

public class RandDistribStream {
  var p:Optional<VSLStreamStatePtr>
  public init() { vslNewStream(&p, 0, UInt32.random(in: 0..<UInt32.max)) }
  deinit { vslDeleteStream(&p) }
}


public protocol RandDistribProtocol { 
  associatedtype Scalar:SupportsMKL
  associatedtype V:Vector

  var stream:RandDistribStream {get}

  func gaussian(_ dest:V, _ a:Scalar, _ b:Scalar)
  func gaussian(_ n:Int, _ a:Scalar, _ b:Scalar)->V
  func uniform(_ dest:V, _ a:Scalar, _ b:Scalar)
  func uniform(_ n:Int, _ a:Scalar, _ b:Scalar)->V
  func exponential(_ dest:V, _ a:Scalar, _ b:Scalar)
  func exponential(_ n:Int, _ a:Scalar, _ b:Scalar)->V
  func laplace(_ dest:V, _ a:Scalar, _ b:Scalar)
  func laplace(_ n:Int, _ a:Scalar, _ b:Scalar)->V
  func cauchy(_ dest:V, _ a:Scalar, _ b:Scalar)
  func cauchy(_ n:Int, _ a:Scalar, _ b:Scalar)->V
  func rayleigh(_ dest:V, _ a:Scalar, _ b:Scalar)
  func rayleigh(_ n:Int, _ a:Scalar, _ b:Scalar)->V
  func gumbel(_ dest:V, _ a:Scalar, _ b:Scalar)
  func gumbel(_ n:Int, _ a:Scalar, _ b:Scalar)->V

  func gaussianMulti(_ dest:V, _ means:Array<Scalar>, _ stdevs:Array<Scalar>)
  func gaussianMulti(_ n:Int, _ means:Array<Scalar>, _ stdevs:Array<Scalar>)->V
}

struct RandDistribFloat:RandDistribProtocol {
  typealias Scalar=Float
  typealias V=VectorFloat
  var stream = RandDistribStream()

  public func gaussian(_ dest:V, _ a: Scalar, _ b: Scalar) {
    vsRngGaussian(VSL_RNG_METHOD_GAUSSIANMV_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func gaussian(_ n:Int, _ a: Scalar, _ b: Scalar)->V {
    let dest = V(n)
    gaussian(dest, a, b)
    return dest
  }
  public func uniform(_ dest:V, _ a: Scalar, _ b: Scalar) {
    vsRngUniform(VSL_RNG_METHOD_UNIFORM_STD, stream.p, dest.c, dest.p, a, b)
  }
  public func uniform(_ n:Int, _ a: Scalar, _ b: Scalar)->V {
    let dest = V(n)
    uniform(dest, a, b)
    return dest
  }
  public func exponential(_ dest:V, _ a: Scalar, _ b: Scalar) {
    vsRngExponential(VSL_RNG_METHOD_EXPONENTIAL_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func exponential(_ n:Int, _ a: Scalar, _ b: Scalar)->V {
    let dest = V(n)
    exponential(dest, a, b)
    return dest
  }
  public func laplace(_ dest:V, _ a: Scalar, _ b: Scalar) {
    vsRngLaplace(VSL_RNG_METHOD_LAPLACE_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func laplace(_ n:Int, _ a: Scalar, _ b: Scalar)->V {
    let dest = V(n)
    laplace(dest, a, b)
    return dest
  }
  public func cauchy(_ dest:V, _ a: Scalar, _ b: Scalar) {
    vsRngCauchy(VSL_RNG_METHOD_CAUCHY_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func cauchy(_ n:Int, _ a: Scalar, _ b: Scalar)->V {
    let dest = V(n)
    cauchy(dest, a, b)
    return dest
  }
  public func rayleigh(_ dest:V, _ a: Scalar, _ b: Scalar) {
    vsRngRayleigh(VSL_RNG_METHOD_RAYLEIGH_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func rayleigh(_ n:Int, _ a: Scalar, _ b: Scalar)->V {
    let dest = V(n)
    rayleigh(dest, a, b)
    return dest
  }
  public func gumbel(_ dest:V, _ a: Scalar, _ b: Scalar) {
    vsRngGumbel(VSL_RNG_METHOD_GUMBEL_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func gumbel(_ n:Int, _ a: Scalar, _ b: Scalar)->V {
    let dest = V(n)
    gumbel(dest, a, b)
    return dest
  }

  public func gaussianMulti(_ dest:V, _ means:Array<Scalar>, _ stdevs:Array<Scalar>) {
    vsRngGaussianMV(VSL_RNG_METHOD_GAUSSIAN_ICDF, stream.p, numericCast(dest.count/means.count), dest.p, numericCast(means.count), VSL_MATRIX_STORAGE_DIAGONAL, means, stdevs);
  }
  public func gaussianMulti(_ n:Int, _ means:Array<Scalar>, _ stdevs:Array<Scalar>)->V {
    let dest = V(n * means.count)
    gaussianMulti(dest, means, stdevs)
    return dest
  }

}
struct RandDistribDouble:RandDistribProtocol {
  typealias Scalar=Double
  typealias V=VectorDouble
  var stream = RandDistribStream()

  public func gaussian(_ dest:V, _ a: Scalar, _ b: Scalar) {
    vdRngGaussian(VSL_RNG_METHOD_GAUSSIANMV_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func gaussian(_ n:Int, _ a: Scalar, _ b: Scalar)->V {
    let dest = V(n)
    gaussian(dest, a, b)
    return dest
  }
  public func uniform(_ dest:V, _ a: Scalar, _ b: Scalar) {
    vdRngUniform(VSL_RNG_METHOD_UNIFORM_STD, stream.p, dest.c, dest.p, a, b)
  }
  public func uniform(_ n:Int, _ a: Scalar, _ b: Scalar)->V {
    let dest = V(n)
    uniform(dest, a, b)
    return dest
  }
  public func exponential(_ dest:V, _ a: Scalar, _ b: Scalar) {
    vdRngExponential(VSL_RNG_METHOD_EXPONENTIAL_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func exponential(_ n:Int, _ a: Scalar, _ b: Scalar)->V {
    let dest = V(n)
    exponential(dest, a, b)
    return dest
  }
  public func laplace(_ dest:V, _ a: Scalar, _ b: Scalar) {
    vdRngLaplace(VSL_RNG_METHOD_LAPLACE_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func laplace(_ n:Int, _ a: Scalar, _ b: Scalar)->V {
    let dest = V(n)
    laplace(dest, a, b)
    return dest
  }
  public func cauchy(_ dest:V, _ a: Scalar, _ b: Scalar) {
    vdRngCauchy(VSL_RNG_METHOD_CAUCHY_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func cauchy(_ n:Int, _ a: Scalar, _ b: Scalar)->V {
    let dest = V(n)
    cauchy(dest, a, b)
    return dest
  }
  public func rayleigh(_ dest:V, _ a: Scalar, _ b: Scalar) {
    vdRngRayleigh(VSL_RNG_METHOD_RAYLEIGH_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func rayleigh(_ n:Int, _ a: Scalar, _ b: Scalar)->V {
    let dest = V(n)
    rayleigh(dest, a, b)
    return dest
  }
  public func gumbel(_ dest:V, _ a: Scalar, _ b: Scalar) {
    vdRngGumbel(VSL_RNG_METHOD_GUMBEL_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func gumbel(_ n:Int, _ a: Scalar, _ b: Scalar)->V {
    let dest = V(n)
    gumbel(dest, a, b)
    return dest
  }

  public func gaussianMulti(_ dest:V, _ means:Array<Scalar>, _ stdevs:Array<Scalar>) {
    vdRngGaussianMV(VSL_RNG_METHOD_GAUSSIAN_ICDF, stream.p, numericCast(dest.count/means.count), dest.p, numericCast(means.count), VSL_MATRIX_STORAGE_DIAGONAL, means, stdevs);
  }
  public func gaussianMulti(_ n:Int, _ means:Array<Scalar>, _ stdevs:Array<Scalar>)->V {
    let dest = V(n * means.count)
    gaussianMulti(dest, means, stdevs)
    return dest
  }

}

