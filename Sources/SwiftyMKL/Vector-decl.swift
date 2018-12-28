// This starts with 'z' so gyb gets to it last, since it needs SwiftyMKL.swift created already


public protocol Vector: BaseVector where Storage==ArrayStorage<Scalar> {
  func asum()->Scalar
  func nrm2()->Scalar
  func dot(_ b:Self)->Scalar
  func set(_ b: Scalar)
  func zero()
  func move(_ b:Self, _ n:Int)
  func move(_ b:Self, _ n:Int, fromIdx:Int, toIdx:Int)
  func packIncrement(_ incr:Int, _ n:Int, _ dest:Self)
  func packIncrement(_ incr:Int, _ n:Int)->Self
  func packIndices(_ idxs:[Int32], _ dest:Self)
  func packIndices(_ idxs:[Int32])->Self
  func packMasked(_ mask:[Int32], _ dest:Self)
  func packMasked(_ mask:[Int32])->Self
  func ln(_ dest: Self)
  func ln_()
  func ln() -> Self
  func abs(_ dest: Self)
  func abs_()
  func abs() -> Self
  func inv(_ dest: Self)
  func inv_()
  func inv() -> Self
  func sqr(_ dest: Self)
  func sqr_()
  func sqr() -> Self
  func exp(_ dest: Self)
  func exp_()
  func exp() -> Self
  func cos(_ dest: Self)
  func cos_()
  func cos() -> Self
  func sin(_ dest: Self)
  func sin_()
  func sin() -> Self
  func tan(_ dest: Self)
  func tan_()
  func tan() -> Self
  func erf(_ dest: Self)
  func erf_()
  func erf() -> Self
  func sqrt(_ dest: Self)
  func sqrt_()
  func sqrt() -> Self
  func cbrt(_ dest: Self)
  func cbrt_()
  func cbrt() -> Self
  func cosh(_ dest: Self)
  func cosh_()
  func cosh() -> Self
  func sinh(_ dest: Self)
  func sinh_()
  func sinh() -> Self
  func tanh(_ dest: Self)
  func tanh_()
  func tanh() -> Self
  func acos(_ dest: Self)
  func acos_()
  func acos() -> Self
  func asin(_ dest: Self)
  func asin_()
  func asin() -> Self
  func atan(_ dest: Self)
  func atan_()
  func atan() -> Self
  func erfc(_ dest: Self)
  func erfc_()
  func erfc() -> Self
  func ceil(_ dest: Self)
  func ceil_()
  func ceil() -> Self
  func rint(_ dest: Self)
  func rint_()
  func rint() -> Self
  func expm1(_ dest: Self)
  func expm1_()
  func expm1() -> Self
  func log10(_ dest: Self)
  func log10_()
  func log10() -> Self
  func log1p(_ dest: Self)
  func log1p_()
  func log1p() -> Self
  func acosh(_ dest: Self)
  func acosh_()
  func acosh() -> Self
  func asinh(_ dest: Self)
  func asinh_()
  func asinh() -> Self
  func atanh(_ dest: Self)
  func atanh_()
  func atanh() -> Self
  func floor(_ dest: Self)
  func floor_()
  func floor() -> Self
  func round(_ dest: Self)
  func round_()
  func round() -> Self
  func trunc(_ dest: Self)
  func trunc_()
  func trunc() -> Self
  func erfInv(_ dest: Self)
  func erfInv_()
  func erfInv() -> Self
  func pow3o2(_ dest: Self)
  func pow3o2_()
  func pow3o2() -> Self
  func pow2o3(_ dest: Self)
  func pow2o3_()
  func pow2o3() -> Self
  func invSqrt(_ dest: Self)
  func invSqrt_()
  func invSqrt() -> Self
  func invCbrt(_ dest: Self)
  func invCbrt_()
  func invCbrt() -> Self
  func nearbyInt(_ dest: Self)
  func nearbyInt_()
  func nearbyInt() -> Self
  func sum()->Scalar
  func mean()->Scalar
  func stdDev()->Scalar
  func max()->Scalar
  func min()->Scalar
  func add(_ b:Self, _ dest:Self)
  func add_(_ b:Self)
  func add(_ b:Self)->Self
  func sub(_ b:Self, _ dest:Self)
  func sub_(_ b:Self)
  func sub(_ b:Self)->Self
  func mul(_ b:Self, _ dest:Self)
  func mul_(_ b:Self)
  func mul(_ b:Self)->Self
  func div(_ b:Self, _ dest:Self)
  func div_(_ b:Self)
  func div(_ b:Self)->Self
  func pow(_ b:Self, _ dest:Self)
  func pow_(_ b:Self)
  func pow(_ b:Self)->Self
  func hypot(_ b:Self, _ dest:Self)
  func hypot_(_ b:Self)
  func hypot(_ b:Self)->Self
  func atan2(_ b:Self, _ dest:Self)
  func atan2_(_ b:Self)
  func atan2(_ b:Self)->Self
  func powx(_ b:Scalar, _ dest:Self)
  func powx_(_ b:Scalar)
  func powx(_ b:Scalar)->Self
  func add(_ b:Scalar, _ dest:Self)
  func add_(_ b:Scalar)
  func add(_ b:Scalar)->Self
  func sub(_ b:Scalar, _ dest:Self)
  func sub_(_ b:Scalar)
  func sub(_ b:Scalar)->Self
  func mul(_ b:Scalar, _ dest:Self)
  func mul_(_ b:Scalar)
  func mul(_ b:Scalar)->Self
  func div(_ b:Scalar, _ dest:Self)
  func div_(_ b:Scalar)
  func div(_ b:Scalar)->Self
  func normDiff_Inf(_ b:Self)->Scalar
  func normDiff_L1(_ b:Self)->Scalar
  func normDiff_L2(_ b:Self)->Scalar
  static func +  (lhs:Self, rhs:Self  ) -> Self
  static func +  (lhs:Self, rhs:Scalar) -> Self
  static func += (lhs:Self, rhs:Self  )
  static func += (lhs:Self, rhs:Scalar)
  static func -  (lhs:Self, rhs:Self  ) -> Self
  static func -  (lhs:Self, rhs:Scalar) -> Self
  static func -= (lhs:Self, rhs:Self  )
  static func -= (lhs:Self, rhs:Scalar)
  static func *  (lhs:Self, rhs:Self  ) -> Self
  static func *  (lhs:Self, rhs:Scalar) -> Self
  static func *= (lhs:Self, rhs:Self  )
  static func *= (lhs:Self, rhs:Scalar)
  static func /  (lhs:Self, rhs:Self  ) -> Self
  static func /  (lhs:Self, rhs:Scalar) -> Self
  static func /= (lhs:Self, rhs:Self  )
  static func /= (lhs:Self, rhs:Scalar)
  static func + (lhs:Scalar, rhs:Self) -> Self
  static func * (lhs:Scalar, rhs:Self) -> Self
}

