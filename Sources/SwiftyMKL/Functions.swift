@inlinable
public func divCRev<E:SupportsMKL>(_ n:Int, _ pSrc:UnsafeMutablePointer<E>, _ val:E, _ pDst:UnsafeMutablePointer<E>) {
  for i in 0..<n { pDst[i] = val/pSrc[i] }
}

@inlinable
public func divCRev<T:Vector>(_ pSrc:T, _ val:T.Element, _ pDst:T) {
  divCRev(pSrc.count, pSrc.p, val, pDst.p)
}

