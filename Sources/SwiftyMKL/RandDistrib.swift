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


struct RandDistrib {
  var stream = RandDistribStream()

  public func gaussian(_ dest:VectorS<Float>, _ a: Float, _ b: Float) {
    vsRngGaussian(VSL_RNG_METHOD_GAUSSIANMV_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func gaussian(_ n:Int, _ a: Float, _ b: Float)->VectorS<Float> {
    let dest = VectorS<Float>(n)
    gaussian(dest, a, b)
    return dest
  }
  public func uniform(_ dest:VectorS<Float>, _ a: Float, _ b: Float) {
    vsRngUniform(VSL_RNG_METHOD_UNIFORM_STD, stream.p, dest.c, dest.p, a, b)
  }
  public func uniform(_ n:Int, _ a: Float, _ b: Float)->VectorS<Float> {
    let dest = VectorS<Float>(n)
    uniform(dest, a, b)
    return dest
  }
  public func exponential(_ dest:VectorS<Float>, _ a: Float, _ b: Float) {
    vsRngExponential(VSL_RNG_METHOD_EXPONENTIAL_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func exponential(_ n:Int, _ a: Float, _ b: Float)->VectorS<Float> {
    let dest = VectorS<Float>(n)
    exponential(dest, a, b)
    return dest
  }
  public func laplace(_ dest:VectorS<Float>, _ a: Float, _ b: Float) {
    vsRngLaplace(VSL_RNG_METHOD_LAPLACE_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func laplace(_ n:Int, _ a: Float, _ b: Float)->VectorS<Float> {
    let dest = VectorS<Float>(n)
    laplace(dest, a, b)
    return dest
  }
  public func cauchy(_ dest:VectorS<Float>, _ a: Float, _ b: Float) {
    vsRngCauchy(VSL_RNG_METHOD_CAUCHY_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func cauchy(_ n:Int, _ a: Float, _ b: Float)->VectorS<Float> {
    let dest = VectorS<Float>(n)
    cauchy(dest, a, b)
    return dest
  }
  public func rayleigh(_ dest:VectorS<Float>, _ a: Float, _ b: Float) {
    vsRngRayleigh(VSL_RNG_METHOD_RAYLEIGH_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func rayleigh(_ n:Int, _ a: Float, _ b: Float)->VectorS<Float> {
    let dest = VectorS<Float>(n)
    rayleigh(dest, a, b)
    return dest
  }
  public func gumbel(_ dest:VectorS<Float>, _ a: Float, _ b: Float) {
    vsRngGumbel(VSL_RNG_METHOD_GUMBEL_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func gumbel(_ n:Int, _ a: Float, _ b: Float)->VectorS<Float> {
    let dest = VectorS<Float>(n)
    gumbel(dest, a, b)
    return dest
  }

  public func gaussianMulti(_ dest:VectorS<Float>, _ means:Array<Float>, _ stdevs:Array<Float>) {
    vsRngGaussianMV(VSL_RNG_METHOD_GAUSSIAN_ICDF, stream.p, numericCast(dest.count/means.count),
      dest.p, numericCast(means.count), VSL_MATRIX_STORAGE_DIAGONAL, means, stdevs);
  }
  public func gaussianMulti(_ n:Int, _ means:Array<Float>, _ stdevs:Array<Float>)->VectorS<Float> {
    let dest = VectorS<Float>(n * means.count)
    gaussianMulti(dest, means, stdevs)
    return dest
  }
  public func gaussian(_ dest:VectorS<Double>, _ a: Double, _ b: Double) {
    vdRngGaussian(VSL_RNG_METHOD_GAUSSIANMV_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func gaussian(_ n:Int, _ a: Double, _ b: Double)->VectorS<Double> {
    let dest = VectorS<Double>(n)
    gaussian(dest, a, b)
    return dest
  }
  public func uniform(_ dest:VectorS<Double>, _ a: Double, _ b: Double) {
    vdRngUniform(VSL_RNG_METHOD_UNIFORM_STD, stream.p, dest.c, dest.p, a, b)
  }
  public func uniform(_ n:Int, _ a: Double, _ b: Double)->VectorS<Double> {
    let dest = VectorS<Double>(n)
    uniform(dest, a, b)
    return dest
  }
  public func exponential(_ dest:VectorS<Double>, _ a: Double, _ b: Double) {
    vdRngExponential(VSL_RNG_METHOD_EXPONENTIAL_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func exponential(_ n:Int, _ a: Double, _ b: Double)->VectorS<Double> {
    let dest = VectorS<Double>(n)
    exponential(dest, a, b)
    return dest
  }
  public func laplace(_ dest:VectorS<Double>, _ a: Double, _ b: Double) {
    vdRngLaplace(VSL_RNG_METHOD_LAPLACE_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func laplace(_ n:Int, _ a: Double, _ b: Double)->VectorS<Double> {
    let dest = VectorS<Double>(n)
    laplace(dest, a, b)
    return dest
  }
  public func cauchy(_ dest:VectorS<Double>, _ a: Double, _ b: Double) {
    vdRngCauchy(VSL_RNG_METHOD_CAUCHY_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func cauchy(_ n:Int, _ a: Double, _ b: Double)->VectorS<Double> {
    let dest = VectorS<Double>(n)
    cauchy(dest, a, b)
    return dest
  }
  public func rayleigh(_ dest:VectorS<Double>, _ a: Double, _ b: Double) {
    vdRngRayleigh(VSL_RNG_METHOD_RAYLEIGH_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func rayleigh(_ n:Int, _ a: Double, _ b: Double)->VectorS<Double> {
    let dest = VectorS<Double>(n)
    rayleigh(dest, a, b)
    return dest
  }
  public func gumbel(_ dest:VectorS<Double>, _ a: Double, _ b: Double) {
    vdRngGumbel(VSL_RNG_METHOD_GUMBEL_ICDF, stream.p, dest.c, dest.p, a, b)
  }
  public func gumbel(_ n:Int, _ a: Double, _ b: Double)->VectorS<Double> {
    let dest = VectorS<Double>(n)
    gumbel(dest, a, b)
    return dest
  }

  public func gaussianMulti(_ dest:VectorS<Double>, _ means:Array<Double>, _ stdevs:Array<Double>) {
    vdRngGaussianMV(VSL_RNG_METHOD_GAUSSIAN_ICDF, stream.p, numericCast(dest.count/means.count),
      dest.p, numericCast(means.count), VSL_MATRIX_STORAGE_DIAGONAL, means, stdevs);
  }
  public func gaussianMulti(_ n:Int, _ means:Array<Double>, _ stdevs:Array<Double>)->VectorS<Double> {
    let dest = VectorS<Double>(n * means.count)
    gaussianMulti(dest, means, stdevs)
    return dest
  }

  public func uniform(_ dest: inout Array<Int32>, _ lowerinc:Int32, _ upperexc:Int32) {
    viRngUniform(VSL_RNG_METHOD_UNIFORM_STD, stream.p, numericCast(dest.count), &dest, lowerinc, upperexc)
  }
  public func uniform(_ n:Int, _ lowerinc:Int32, _ upperexc:Int32)->Array<Int32> {
    var res = Array<Int32>(repeating:0, count:n)
    uniform(&res, lowerinc, upperexc)
    return res
  }
  public func binomial(_ dest: inout Array<Int32>, _ ntrial:Int32, _ p:Double) {
    viRngBinomial(VSL_RNG_METHOD_BINOMIAL_BTPE, stream.p, numericCast(dest.count), &dest, ntrial, p)
  }
  public func binomial(_ n:Int, _ ntrial:Int32, _ p:Double)->Array<Int32> {
    var res = Array<Int32>(repeating:0, count:n)
    binomial(&res, ntrial, p)
    return res
  }
  public func negBinomial(_ dest: inout Array<Int32>, _ a:Double, _ p:Double) {
    viRngNegBinomial(VSL_RNG_METHOD_NEGBINOMIAL_NBAR, stream.p, numericCast(dest.count), &dest, a, p)
  }
  public func negBinomial(_ n:Int, _ a:Double, _ p:Double)->Array<Int32> {
    var res = Array<Int32>(repeating:0, count:n)
    negBinomial(&res, a, p)
    return res
  }

  public func bernoulli(_ dest: inout Array<Int32>, _ p:Double) {
    viRngBernoulli(VSL_RNG_METHOD_BERNOULLI_ICDF, stream.p, numericCast(dest.count), &dest, p)
  }
  public func bernoulli(_ n:Int, _ p:Double)->Array<Int32> {
    var res = Array<Int32>(repeating:0, count:n)
    bernoulli(&res, p)
    return res
  }
  public func geometric(_ dest: inout Array<Int32>, _ p:Double) {
    viRngGeometric(VSL_RNG_METHOD_GEOMETRIC_ICDF, stream.p, numericCast(dest.count), &dest, p)
  }
  public func geometric(_ n:Int, _ p:Double)->Array<Int32> {
    var res = Array<Int32>(repeating:0, count:n)
    geometric(&res, p)
    return res
  }
  public func poisson(_ dest: inout Array<Int32>, _ lambda:Double) {
    viRngPoisson(VSL_RNG_METHOD_POISSON_PTPE, stream.p, numericCast(dest.count), &dest, lambda)
  }
  public func poisson(_ n:Int, _ lambda:Double)->Array<Int32> {
    var res = Array<Int32>(repeating:0, count:n)
    poisson(&res, lambda)
    return res
  }
}

