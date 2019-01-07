
extension SupportsMKL {
  @inlinable public static func divCRev(_ n:Int, _ pSrc:PtrT, _ val:Element, _ pDst:MutPtrT) {
    for i in 0..<n { pDst[i] = val/pSrc[i] }
  }

  @inlinable public static func sinO(_ n:Int, _ pSrc:PtrT, _ pDst:MutPtrT) {
    for i in 0..<n { pDst[i] = pSrc[i].sin() }
  }
}

extension Vector {
  @inlinable public func sinO(_ pDst:Self) { Element.sin(c, p, pDst.p) }
  @inlinable public static func divCRev(_ pSrc:Self, _ val:Element, _ pDst:Self) { Element.divCRev(pSrc.c, pSrc.p, val, pDst.p) }
  @inlinable public        func divCRev(             _ val:Element, _ pDst:Self) { Self.divCRev(self, val, pDst) }
}
 
