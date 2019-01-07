import Foundation
import BaseMath
import CIPL


extension Vector {
  @inlinable public func dot(_ incX:Int, _ Y:Self, _ incY:Int)->Element {return Element.dot(self.c,self.p,incX,Y.p,incY)}
  @inlinable public func doti(_ indx:UnsafePointer<Int32>, _ Y:Self)->Element {return Element.doti(self.c,self.p,indx,Y.p)}
  @inlinable public func nrm2(_ incX:Int)->Element {return Element.nrm2(self.c,self.p,incX)}
  @inlinable public func asum(_ incX:Int)->Element {return Element.asum(self.c,self.p,incX)}
  @inlinable public func swap(_ X:Self, _ incX:Int, _ Y:Self, _ incY:Int) {return Element.swap(self.c,X.p,incX,Y.p,incY)}
  @inlinable public func copy(_ incX:Int, _ Y:Self, _ incY:Int) {return Element.copy(self.c,self.p,incX,Y.p,incY)}
  @inlinable public func axpy(_ alpha:Element, _ incX:Int, _ Y:Self, _ incY:Int) {return Element.axpy(self.c,alpha,self.p,incX,Y.p,incY)}
  @inlinable public func axpby(_ alpha:Element, _ incX:Int, _ beta:Element, _ Y:Self, _ incY:Int) {return Element.axpby(self.c,alpha,self.p,incX,beta,Y.p,incY)}
  @inlinable public func axpyi(_ alpha:Element, _ indx:UnsafePointer<Int32>, _ Y:Self) {return Element.axpyi(self.c,alpha,self.p,indx,Y.p)}
  @inlinable public func gthr(_ Y:Self, _ X:Self, _ indx:UnsafePointer<Int32>) {return Element.gthr(self.c,Y.p,X.p,indx)}
  @inlinable public func gthrz(_ Y:Self, _ X:Self, _ indx:UnsafePointer<Int32>) {return Element.gthrz(self.c,Y.p,X.p,indx)}
  @inlinable public func sctr(_ indx:UnsafePointer<Int32>, _ Y:Self) {return Element.sctr(self.c,self.p,indx,Y.p)}
  
  
  @inlinable public func rot(_ X:Self, _ incX:Int, _ Y:Self, _ incY:Int, _ c:Element, _ s:Element) {return Element.rot(self.c,X.p,incX,Y.p,incY,c,s)}
  @inlinable public func roti(_ X:Self, _ indx:UnsafePointer<Int32>, _ Y:Self, _ c:Element, _ s:Element) {return Element.roti(self.c,X.p,indx,Y.p,c,s)}
  @inlinable public func rotm(_ X:Self, _ incX:Int, _ Y:Self, _ incY:Int, _ P:Self) {return Element.rotm(self.c,X.p,incX,Y.p,incY,P.p)}
  @inlinable public func scal(_ alpha:Element, _ X:Self, _ incX:Int) {return Element.scal(self.c,alpha,X.p,incX)}
  @inlinable public func gemv(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ M:Int, _ alpha:Element, _ A:Self, _ lda:Int, _ incX:Int, _ beta:Element, _ Y:Self, _ incY:Int) {return Element.gemv(Layout,TransA,M,self.c,alpha,A.p,lda,self.p,incX,beta,Y.p,incY)}
  @inlinable public func gbmv(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ M:Int, _ KL:Int, _ KU:Int, _ alpha:Element, _ A:Self, _ lda:Int, _ incX:Int, _ beta:Element, _ Y:Self, _ incY:Int) {return Element.gbmv(Layout,TransA,M,self.c,KL,KU,alpha,A.p,lda,self.p,incX,beta,Y.p,incY)}
  @inlinable public func trmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ lda:Int, _ X:Self, _ incX:Int) {return Element.trmv(Layout,Uplo,TransA,Diag,self.c,self.p,lda,X.p,incX)}
  @inlinable public func tbmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ K:Int, _ lda:Int, _ X:Self, _ incX:Int) {return Element.tbmv(Layout,Uplo,TransA,Diag,self.c,K,self.p,lda,X.p,incX)}
  @inlinable public func tpmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ Ap:Self, _ X:Self, _ incX:Int) {return Element.tpmv(Layout,Uplo,TransA,Diag,self.c,Ap.p,X.p,incX)}
  @inlinable public func trsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ lda:Int, _ X:Self, _ incX:Int) {return Element.trsv(Layout,Uplo,TransA,Diag,self.c,self.p,lda,X.p,incX)}
  @inlinable public func tbsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ K:Int, _ lda:Int, _ X:Self, _ incX:Int) {return Element.tbsv(Layout,Uplo,TransA,Diag,self.c,K,self.p,lda,X.p,incX)}
  @inlinable public func tpsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ Ap:Self, _ X:Self, _ incX:Int) {return Element.tpsv(Layout,Uplo,TransA,Diag,self.c,Ap.p,X.p,incX)}
  @inlinable public func symv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ alpha:Element, _ A:Self, _ lda:Int, _ incX:Int, _ beta:Element, _ Y:Self, _ incY:Int) {return Element.symv(Layout,Uplo,self.c,alpha,A.p,lda,self.p,incX,beta,Y.p,incY)}
  @inlinable public func sbmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ K:Int, _ alpha:Element, _ A:Self, _ lda:Int, _ incX:Int, _ beta:Element, _ Y:Self, _ incY:Int) {return Element.sbmv(Layout,Uplo,self.c,K,alpha,A.p,lda,self.p,incX,beta,Y.p,incY)}
  @inlinable public func spmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ alpha:Element, _ Ap:Self, _ incX:Int, _ beta:Element, _ Y:Self, _ incY:Int) {return Element.spmv(Layout,Uplo,self.c,alpha,Ap.p,self.p,incX,beta,Y.p,incY)}
  @inlinable public func ger(_ Layout:CBLAS_LAYOUT, _ M:Int, _ alpha:Element, _ incX:Int, _ Y:Self, _ incY:Int, _ A:Self, _ lda:Int) {return Element.ger(Layout,M,self.c,alpha,self.p,incX,Y.p,incY,A.p,lda)}
  @inlinable public func syr(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ alpha:Element, _ incX:Int, _ A:Self, _ lda:Int) {return Element.syr(Layout,Uplo,self.c,alpha,self.p,incX,A.p,lda)}
  @inlinable public func spr(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ alpha:Element, _ incX:Int, _ Ap:Self) {return Element.spr(Layout,Uplo,self.c,alpha,self.p,incX,Ap.p)}
  @inlinable public func syr2(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ alpha:Element, _ incX:Int, _ Y:Self, _ incY:Int, _ A:Self, _ lda:Int) {return Element.syr2(Layout,Uplo,self.c,alpha,self.p,incX,Y.p,incY,A.p,lda)}
  @inlinable public func spr2(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ alpha:Element, _ incX:Int, _ Y:Self, _ incY:Int, _ A:Self) {return Element.spr2(Layout,Uplo,self.c,alpha,self.p,incX,Y.p,incY,A.p)}
  @inlinable public func gemm(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ TransB:CBLAS_TRANSPOSE, _ M:Int, _ K:Int, _ alpha:Element, _ lda:Int, _ B:Self, _ ldb:Int, _ beta:Element, _ C:Self, _ ldc:Int) {return Element.gemm(Layout,TransA,TransB,M,self.c,K,alpha,self.p,lda,B.p,ldb,beta,C.p,ldc)}
  @inlinable public func gemmt(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ TransB:CBLAS_TRANSPOSE, _ K:Int, _ alpha:Element, _ lda:Int, _ B:Self, _ ldb:Int, _ beta:Element, _ C:Self, _ ldc:Int) {return Element.gemmt(Layout,Uplo,TransA,TransB,self.c,K,alpha,self.p,lda,B.p,ldb,beta,C.p,ldc)}
  @inlinable public func symm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ M:Int, _ alpha:Element, _ lda:Int, _ B:Self, _ ldb:Int, _ beta:Element, _ C:Self, _ ldc:Int) {return Element.symm(Layout,Side,Uplo,M,self.c,alpha,self.p,lda,B.p,ldb,beta,C.p,ldc)}
  @inlinable public func syrk(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ Trans:CBLAS_TRANSPOSE, _ K:Int, _ alpha:Element, _ lda:Int, _ beta:Element, _ C:Self, _ ldc:Int) {return Element.syrk(Layout,Uplo,Trans,self.c,K,alpha,self.p,lda,beta,C.p,ldc)}
  @inlinable public func syr2k(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ Trans:CBLAS_TRANSPOSE, _ K:Int, _ alpha:Element, _ lda:Int, _ B:Self, _ ldb:Int, _ beta:Element, _ C:Self, _ ldc:Int) {return Element.syr2k(Layout,Uplo,Trans,self.c,K,alpha,self.p,lda,B.p,ldb,beta,C.p,ldc)}
  @inlinable public func trmm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ M:Int, _ alpha:Element, _ lda:Int, _ B:Self, _ ldb:Int) {return Element.trmm(Layout,Side,Uplo,TransA,Diag,M,self.c,alpha,self.p,lda,B.p,ldb)}
  @inlinable public func trsm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ M:Int, _ alpha:Element, _ lda:Int, _ B:Self, _ ldb:Int) {return Element.trsm(Layout,Side,Uplo,TransA,Diag,M,self.c,alpha,self.p,lda,B.p,ldb)}
  @inlinable public func gemm_pack_get_size(_ identifier:CBLAS_IDENTIFIER, _ M:Int, _ K:Int)->Int32 {return Element.gemm_pack_get_size(identifier,M,self.c,K)}
  @inlinable public func gemm_pack(_ Layout:CBLAS_LAYOUT, _ identifier:CBLAS_IDENTIFIER, _ Trans:CBLAS_TRANSPOSE, _ M:Int, _ K:Int, _ alpha:Element, _ src:Self, _ ld:Int, _ dest:Self) {return Element.gemm_pack(Layout,identifier,Trans,M,self.c,K,alpha,src.p,ld,dest.p)}
  @inlinable public func gemm_compute(_ Layout:CBLAS_LAYOUT, _ TransA:Int, _ TransB:Int, _ M:Int, _ K:Int, _ lda:Int, _ B:Self, _ ldb:Int, _ beta:Element, _ C:Self, _ ldc:Int) {return Element.gemm_compute(Layout,TransA,TransB,M,self.c,K,self.p,lda,B.p,ldb,beta,C.p,ldc)}
  
  @inlinable public func abs(_ r:Self) {return Element.abs(self.c,self.p,r.p)}
  @inlinable public func inv(_ r:Self) {return Element.inv(self.c,self.p,r.p)}
  @inlinable public func sqrt(_ r:Self) {return Element.sqrt(self.c,self.p,r.p)}
  @inlinable public func invSqrt(_ r:Self) {return Element.invSqrt(self.c,self.p,r.p)}
  @inlinable public func cbrt(_ r:Self) {return Element.cbrt(self.c,self.p,r.p)}
  @inlinable public func invCbrt(_ r:Self) {return Element.invCbrt(self.c,self.p,r.p)}
  @inlinable public func sqr(_ r:Self) {return Element.sqr(self.c,self.p,r.p)}
  @inlinable public func exp(_ r:Self) {return Element.exp(self.c,self.p,r.p)}
  @inlinable public func exp2(_ r:Self) {return Element.exp2(self.c,self.p,r.p)}
  @inlinable public func exp10(_ r:Self) {return Element.exp10(self.c,self.p,r.p)}
  @inlinable public func expm1(_ r:Self) {return Element.expm1(self.c,self.p,r.p)}
  @inlinable public func ln(_ r:Self) {return Element.ln(self.c,self.p,r.p)}
  @inlinable public func log2(_ r:Self) {return Element.log2(self.c,self.p,r.p)}
  @inlinable public func log10(_ r:Self) {return Element.log10(self.c,self.p,r.p)}
  @inlinable public func log1p(_ r:Self) {return Element.log1p(self.c,self.p,r.p)}
  @inlinable public func logb(_ r:Self) {return Element.logb(self.c,self.p,r.p)}
  @inlinable public func cos(_ r:Self) {return Element.cos(self.c,self.p,r.p)}
  @inlinable public func sin(_ r:Self) {return Element.sin(self.c,self.p,r.p)}
  @inlinable public func tan(_ r:Self) {return Element.tan(self.c,self.p,r.p)}
  @inlinable public func cospi(_ r:Self) {return Element.cospi(self.c,self.p,r.p)}
  @inlinable public func sinpi(_ r:Self) {return Element.sinpi(self.c,self.p,r.p)}
  @inlinable public func tanpi(_ r:Self) {return Element.tanpi(self.c,self.p,r.p)}
  @inlinable public func cosd(_ r:Self) {return Element.cosd(self.c,self.p,r.p)}
  @inlinable public func sind(_ r:Self) {return Element.sind(self.c,self.p,r.p)}
  @inlinable public func tand(_ r:Self) {return Element.tand(self.c,self.p,r.p)}
  @inlinable public func cosh(_ r:Self) {return Element.cosh(self.c,self.p,r.p)}
  @inlinable public func sinh(_ r:Self) {return Element.sinh(self.c,self.p,r.p)}
  @inlinable public func tanh(_ r:Self) {return Element.tanh(self.c,self.p,r.p)}
  @inlinable public func acos(_ r:Self) {return Element.acos(self.c,self.p,r.p)}
  @inlinable public func asin(_ r:Self) {return Element.asin(self.c,self.p,r.p)}
  @inlinable public func atan(_ r:Self) {return Element.atan(self.c,self.p,r.p)}
  @inlinable public func acospi(_ r:Self) {return Element.acospi(self.c,self.p,r.p)}
  @inlinable public func asinpi(_ r:Self) {return Element.asinpi(self.c,self.p,r.p)}
  @inlinable public func atanpi(_ r:Self) {return Element.atanpi(self.c,self.p,r.p)}
  @inlinable public func acosh(_ r:Self) {return Element.acosh(self.c,self.p,r.p)}
  @inlinable public func asinh(_ r:Self) {return Element.asinh(self.c,self.p,r.p)}
  @inlinable public func atanh(_ r:Self) {return Element.atanh(self.c,self.p,r.p)}
  @inlinable public func erf(_ r:Self) {return Element.erf(self.c,self.p,r.p)}
  @inlinable public func erfInv(_ r:Self) {return Element.erfInv(self.c,self.p,r.p)}
  @inlinable public func hypot(_ b:Self, _ r:Self) {return Element.hypot(self.c,self.p,b.p,r.p)}
  @inlinable public func erfc(_ r:Self) {return Element.erfc(self.c,self.p,r.p)}
  @inlinable public func erfcInv(_ r:Self) {return Element.erfcInv(self.c,self.p,r.p)}
  @inlinable public func cdfNorm(_ r:Self) {return Element.cdfNorm(self.c,self.p,r.p)}
  @inlinable public func cdfNormInv(_ r:Self) {return Element.cdfNormInv(self.c,self.p,r.p)}
  @inlinable public func lGamma(_ r:Self) {return Element.lGamma(self.c,self.p,r.p)}
  @inlinable public func tGamma(_ r:Self) {return Element.tGamma(self.c,self.p,r.p)}
  @inlinable public func atan2(_ b:Self, _ r:Self) {return Element.atan2(self.c,self.p,b.p,r.p)}
  @inlinable public func atan2pi(_ b:Self, _ r:Self) {return Element.atan2pi(self.c,self.p,b.p,r.p)}
  @inlinable public func pow(_ b:Self, _ r:Self) {return Element.pow(self.c,self.p,b.p,r.p)}
  @inlinable public func pow3o2(_ r:Self) {return Element.pow3o2(self.c,self.p,r.p)}
  @inlinable public func pow2o3(_ r:Self) {return Element.pow2o3(self.c,self.p,r.p)}
  @inlinable public func powx(_ b:Element, _ r:Self) {return Element.powx(self.c,self.p,b,r.p)}
  @inlinable public func powr(_ b:Self, _ r:Self) {return Element.powr(self.c,self.p,b.p,r.p)}
  @inlinable public func sinCos(_ r1:Self, _ r2:Self) {return Element.sinCos(self.c,self.p,r1.p,r2.p)}
  @inlinable public func linearFrac(_ b:Self, _ scalea:Element, _ shifta:Element, _ scaleb:Element, _ shiftb:Element, _ r:Self) {return Element.linearFrac(self.c,self.p,b.p,scalea,shifta,scaleb,shiftb,r.p)}
  @inlinable public func ceil(_ r:Self) {return Element.ceil(self.c,self.p,r.p)}
  @inlinable public func floor(_ r:Self) {return Element.floor(self.c,self.p,r.p)}
  @inlinable public func frac(_ r:Self) {return Element.frac(self.c,self.p,r.p)}
  @inlinable public func modf(_ r1:Self, _ r2:Self) {return Element.modf(self.c,self.p,r1.p,r2.p)}
  @inlinable public func fmod(_ r1:Self, _ r2:Self) {return Element.fmod(self.c,self.p,r1.p,r2.p)}
  @inlinable public func remainder(_ r1:Self, _ r2:Self) {return Element.remainder(self.c,self.p,r1.p,r2.p)}
  @inlinable public func nextAfter(_ r1:Self, _ r2:Self) {return Element.nextAfter(self.c,self.p,r1.p,r2.p)}
  @inlinable public func copySign(_ r1:Self, _ r2:Self) {return Element.copySign(self.c,self.p,r1.p,r2.p)}
  @inlinable public func fdim(_ r1:Self, _ r2:Self) {return Element.fdim(self.c,self.p,r1.p,r2.p)}
  @inlinable public func fmax(_ r1:Self, _ r2:Self) {return Element.fmax(self.c,self.p,r1.p,r2.p)}
  @inlinable public func fmin(_ r1:Self, _ r2:Self) {return Element.fmin(self.c,self.p,r1.p,r2.p)}
  @inlinable public func maxMag(_ r1:Self, _ r2:Self) {return Element.maxMag(self.c,self.p,r1.p,r2.p)}
  @inlinable public func minMag(_ r1:Self, _ r2:Self) {return Element.minMag(self.c,self.p,r1.p,r2.p)}
  @inlinable public func nearbyInt(_ r:Self) {return Element.nearbyInt(self.c,self.p,r.p)}
  @inlinable public func rint(_ r:Self) {return Element.rint(self.c,self.p,r.p)}
  @inlinable public func round(_ r:Self) {return Element.round(self.c,self.p,r.p)}
  @inlinable public func trunc(_ r:Self) {return Element.trunc(self.c,self.p,r.p)}
  @inlinable public func expInt1(_ r:Self) {return Element.expInt1(self.c,self.p,r.p)}
  @inlinable public func packI(_ incra:Int, _ y:Self) {return Element.packI(self.c,self.p,incra,y.p)}
  @inlinable public func packV(_ ia:UnsafePointer<Int32>, _ y:Self) {return Element.packV(self.c,self.p,ia,y.p)}
  @inlinable public func packM(_ ma:UnsafePointer<Int32>, _ y:Self) {return Element.packM(self.c,self.p,ma,y.p)}
  @inlinable public func unpackI(_ y:Self, _ incry:Int) {return Element.unpackI(self.c,self.p,y.p,incry)}
  @inlinable public func unpackV(_ y:Self, _ iy:UnsafePointer<Int32>) {return Element.unpackV(self.c,self.p,y.p,iy)}
  @inlinable public func unpackM(_ y:Self, _ my:UnsafePointer<Int32>) {return Element.unpackM(self.c,self.p,y.p,my)}
  @inlinable public func copy(_ pDst:Self) {return Element.copy(self.p,pDst.p,self.c)}
  @inlinable public func move(_ pDst:Self) {return Element.move(self.p,pDst.p,self.c)}
  @inlinable public func set(_ val:Element, _ pDst:Self) {return Element.set(val,pDst.p,self.c)}
  @inlinable public func zero(_ pDst:Self) {return Element.zero(pDst.p,self.c)}
  @inlinable public func triangle(_ pDst:Self, _ magn:Element, _ rFreq:Element, _ asym:Element, _ pPhase:Self) {return Element.triangle(pDst.p,self.c,magn,rFreq,asym,pPhase.p)}
  @inlinable public func vectorJaehne(_ pDst:Self, _ magn:Element) {return Element.vectorJaehne(pDst.p,self.c,magn)}
  @inlinable public func vectorSlope(_ pDst:Self, _ offset:Element, _ slope:Element) {return Element.vectorSlope(pDst.p,self.c,offset,slope)}
  @inlinable public func addProduct(_ pSrc2:Self, _ pSrcDst:Self) {return Element.addProduct(self.p,pSrc2.p,pSrcDst.p,self.c)}
  @inlinable public func sumLn(_ pSum:Self) {return Element.sumLn(self.p,self.c,pSum.p)}
  @inlinable public func arctan(_ pDst:Self) {return Element.arctan(self.p,pDst.p,self.c)}
  @inlinable public func normalize(_ pDst:Self, _ vSub:Element, _ vDiv:Element) {return Element.normalize(self.p,pDst.p,self.c,vSub,vDiv)}
  @inlinable public func magnitude(_ pSrcRe:Self, _ pSrcIm:Self, _ pDst:Self) {return Element.magnitude(pSrcRe.p,pSrcIm.p,pDst.p,self.c)}
  @inlinable public func phase(_ pSrcRe:Self, _ pSrcIm:Self, _ pDst:Self) {return Element.phase(pSrcRe.p,pSrcIm.p,pDst.p,self.c)}
  @inlinable public func powerSpectr(_ pSrcRe:Self, _ pSrcIm:Self, _ pDst:Self) {return Element.powerSpectr(pSrcRe.p,pSrcIm.p,pDst.p,self.c)}
  @inlinable public func threshold_LT(_ pDst:Self, _ level:Element) {return Element.threshold_LT(self.p,pDst.p,self.c,level)}
  @inlinable public func threshold_GT(_ pDst:Self, _ level:Element) {return Element.threshold_GT(self.p,pDst.p,self.c,level)}
  @inlinable public func threshold_LTAbs(_ pDst:Self, _ level:Element) {return Element.threshold_LTAbs(self.p,pDst.p,self.c,level)}
  @inlinable public func threshold_GTAbs(_ pDst:Self, _ level:Element) {return Element.threshold_GTAbs(self.p,pDst.p,self.c,level)}
  @inlinable public func threshold_LTAbsVal(_ pDst:Self, _ level:Element, _ value:Element) {return Element.threshold_LTAbsVal(self.p,pDst.p,self.c,level,value)}
  @inlinable public func threshold_LTVal(_ pDst:Self, _ level:Element, _ value:Element) {return Element.threshold_LTVal(self.p,pDst.p,self.c,level,value)}
  @inlinable public func threshold_GTVal(_ pDst:Self, _ level:Element, _ value:Element) {return Element.threshold_GTVal(self.p,pDst.p,self.c,level,value)}
  @inlinable public func threshold_LTValGTVal(_ pDst:Self, _ levelLT:Element, _ valueLT:Element, _ levelGT:Element, _ valueGT:Element) {return Element.threshold_LTValGTVal(self.p,pDst.p,self.c,levelLT,valueLT,levelGT,valueGT)}
  @inlinable public func threshold_LTInv(_ pDst:Self, _ level:Element) {return Element.threshold_LTInv(self.p,pDst.p,self.c,level)}
  @inlinable public func cartToPolar(_ pSrcRe:Self, _ pSrcIm:Self, _ pDstMagn:Self, _ pDstPhase:Self) {return Element.cartToPolar(pSrcRe.p,pSrcIm.p,pDstMagn.p,pDstPhase.p,self.c)}
  @inlinable public func polarToCart(_ pSrcMagn:Self, _ pSrcPhase:Self, _ pDstRe:Self, _ pDstIm:Self) {return Element.polarToCart(pSrcMagn.p,pSrcPhase.p,pDstRe.p,pDstIm.p,self.c)}
  @inlinable public func flip(_ pDst:Self) {return Element.flip(self.p,pDst.p,self.c)}
  @inlinable public func winBartlett(_ pDst:Self) {return Element.winBartlett(self.p,pDst.p,self.c)}
  @inlinable public func winHann(_ pDst:Self) {return Element.winHann(self.p,pDst.p,self.c)}
  @inlinable public func winHamming(_ pDst:Self) {return Element.winHamming(self.p,pDst.p,self.c)}
  @inlinable public func winBlackman(_ pDst:Self, _ alpha:Element) {return Element.winBlackman(self.p,pDst.p,self.c,alpha)}
  @inlinable public func winBlackmanStd(_ pDst:Self) {return Element.winBlackmanStd(self.p,pDst.p,self.c)}
  @inlinable public func winBlackmanOpt(_ pDst:Self) {return Element.winBlackmanOpt(self.p,pDst.p,self.c)}
  @inlinable public func winKaiser(_ pDst:Self, _ alpha:Element) {return Element.winKaiser(self.p,pDst.p,self.c,alpha)}
  @inlinable public func min(_ pMin:Self) {return Element.min(self.p,self.c,pMin.p)}
  @inlinable public func max(_ pMax:Self) {return Element.max(self.p,self.c,pMax.p)}
  @inlinable public func minMax(_ pMin:Self, _ pMax:Self) {return Element.minMax(self.p,self.c,pMin.p,pMax.p)}
  @inlinable public func minAbs(_ pMinAbs:Self) {return Element.minAbs(self.p,self.c,pMinAbs.p)}
  @inlinable public func maxAbs(_ pMaxAbs:Self) {return Element.maxAbs(self.p,self.c,pMaxAbs.p)}
  @inlinable public func minIndx(_ pMin:Self, _ pIndx:UnsafeMutablePointer<Int32>) {return Element.minIndx(self.p,self.c,pMin.p,pIndx)}
  @inlinable public func maxIndx(_ pMax:Self, _ pIndx:UnsafeMutablePointer<Int32>) {return Element.maxIndx(self.p,self.c,pMax.p,pIndx)}
  @inlinable public func minMaxIndx(_ pMin:Self, _ pMinIndx:UnsafeMutablePointer<Int32>, _ pMax:Self, _ pMaxIndx:UnsafeMutablePointer<Int32>) {return Element.minMaxIndx(self.p,self.c,pMin.p,pMinIndx,pMax.p,pMaxIndx)}
  @inlinable public func mean(_ pMean:Self) {return Element.mean(self.p,self.c,pMean.p)}
  @inlinable public func stdDev(_ pStdDev:Self) {return Element.stdDev(self.p,self.c,pStdDev.p)}
  @inlinable public func meanStdDev(_ pMean:Self, _ pStdDev:Self) {return Element.meanStdDev(self.p,self.c,pMean.p,pStdDev.p)}
  @inlinable public func norm_Inf(_ pNorm:Self) {return Element.norm_Inf(self.p,self.c,pNorm.p)}
  @inlinable public func norm_L1(_ pNorm:Self) {return Element.norm_L1(self.p,self.c,pNorm.p)}
  @inlinable public func norm_L2(_ pNorm:Self) {return Element.norm_L2(self.p,self.c,pNorm.p)}
  @inlinable public func normDiff_Inf(_ pSrc2:Self, _ pNorm:Self) {return Element.normDiff_Inf(self.p,pSrc2.p,self.c,pNorm.p)}
  @inlinable public func normDiff_L1(_ pSrc2:Self, _ pNorm:Self) {return Element.normDiff_L1(self.p,pSrc2.p,self.c,pNorm.p)}
  @inlinable public func normDiff_L2(_ pSrc2:Self, _ pNorm:Self) {return Element.normDiff_L2(self.p,pSrc2.p,self.c,pNorm.p)}
  @inlinable public func dotProd(_ pSrc2:Self, _ pDp:Self) {return Element.dotProd(self.p,pSrc2.p,self.c,pDp.p)}
  @inlinable public func minEvery(_ pSrc2:Self, _ pDst:Self, _ len:UInt32) {return Element.minEvery(self.p,pSrc2.p,pDst.p,len)}
  @inlinable public func maxEvery(_ pSrc2:Self, _ pDst:Self, _ len:UInt32) {return Element.maxEvery(self.p,pSrc2.p,pDst.p,len)}
  @inlinable public func maxOrder(_ pOrder:UnsafeMutablePointer<Int32>) {return Element.maxOrder(self.p,self.c,pOrder)}
  @inlinable public func sampleUp(_ srcLen:Int, _ pDst:Self, _ pDstLen:UnsafeMutablePointer<Int32>, _ factor:Int, _ pPhase:UnsafeMutablePointer<Int32>) {return Element.sampleUp(self.p,srcLen,pDst.p,pDstLen,factor,pPhase)}
  @inlinable public func sampleDown(_ srcLen:Int, _ pDst:Self, _ pDstLen:UnsafeMutablePointer<Int32>, _ factor:Int, _ pPhase:UnsafeMutablePointer<Int32>) {return Element.sampleDown(self.p,srcLen,pDst.p,pDstLen,factor,pPhase)}
  @inlinable public func filterMedian(_ pDst:Self, _ maskSize:Int, _ pDlySrc:Self, _ pDlyDst:Self, _ pBuffer:UnsafeMutablePointer<UInt8>) {return Element.filterMedian(self.p,pDst.p,self.c,maskSize,pDlySrc.p,pDlyDst.p,pBuffer)}
  @inlinable public func rngCauchy(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:Self, _ a:Element, _ b:Element)->Int32 {return Element.rngCauchy(method,stream,self.c,r.p,a,b)}
  @inlinable public func rngUniform(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:Self, _ a:Element, _ b:Element)->Int32 {return Element.rngUniform(method,stream,self.c,r.p,a,b)}
  @inlinable public func rngGaussian(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:Self, _ a:Element, _ b:Element)->Int32 {return Element.rngGaussian(method,stream,self.c,r.p,a,b)}
  @inlinable public func rngGaussianMV(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:Self, _ dimen:Int, _ mstorage:Int32, _ t:Self)->Int32 {return Element.rngGaussianMV(method,stream,self.c,r.p,dimen,mstorage,self.p,t.p)}
  @inlinable public func rngExponential(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:Self, _ a:Element, _ b:Element)->Int32 {return Element.rngExponential(method,stream,self.c,r.p,a,b)}
  @inlinable public func rngLaplace(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:Self, _ a:Element, _ b:Element)->Int32 {return Element.rngLaplace(method,stream,self.c,r.p,a,b)}
  @inlinable public func rngWeibull(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:Self, _ a:Element, _ b:Element, _ c:Element)->Int32 {return Element.rngWeibull(method,stream,self.c,r.p,a,b,c)}
  @inlinable public func rngRayleigh(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:Self, _ a:Element, _ b:Element)->Int32 {return Element.rngRayleigh(method,stream,self.c,r.p,a,b)}
  @inlinable public func rngLognormal(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:Self, _ a:Element, _ b:Element, _ c:Element, _ d:Element)->Int32 {return Element.rngLognormal(method,stream,self.c,r.p,a,b,c,d)}
  @inlinable public func rngGumbel(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:Self, _ a:Element, _ b:Element)->Int32 {return Element.rngGumbel(method,stream,self.c,r.p,a,b)}
  @inlinable public func rngGamma(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:Self, _ a:Element, _ b:Element, _ c:Element)->Int32 {return Element.rngGamma(method,stream,self.c,r.p,a,b,c)}
  @inlinable public func rngBeta(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:Self, _ a:Element, _ b:Element, _ c:Element, _ d:Element)->Int32 {return Element.rngBeta(method,stream,self.c,r.p,a,b,c,d)}

  @inlinable public func asum()->Element { return asum(1) }
  @inlinable public func nrm2()->Element { return nrm2(1) }
  @inlinable public func dot(_ b:Self)->Element { return dot(1, b, 1) }
  @inlinable public func set(_ b: Element) { set(b,self) }
  @inlinable public func zero() { zero(self) }
  @inlinable public func move(_ b:Self, _ n:Int) { Element.move(p, b.p, n) }
  @inlinable public func move(_ b:Self, _ n:Int, fromIdx:Int, toIdx:Int) { Element.move(p+fromIdx, b.p+toIdx, n) }

  @inlinable public func ln_() { ln(self) }
  @inlinable public func ln() -> Self  { return new_call(ln) }
  @inlinable public func abs_() { abs(self) }
  @inlinable public func abs() -> Self  { return new_call(abs) }
  @inlinable public func inv_() { inv(self) }
  @inlinable public func inv() -> Self  { return new_call(inv) }
  @inlinable public func sqr_() { sqr(self) }
  @inlinable public func sqr() -> Self  { return new_call(sqr) }
  @inlinable public func exp_() { exp(self) }
  @inlinable public func exp() -> Self  { return new_call(exp) }
  @inlinable public func cos_() { cos(self) }
  @inlinable public func cos() -> Self  { return new_call(cos) }
  @inlinable public func sin_() { sin(self) }
  @inlinable public func sin() -> Self  { return new_call(sin) }
  @inlinable public func tan_() { tan(self) }
  @inlinable public func tan() -> Self  { return new_call(tan) }
  @inlinable public func erf_() { erf(self) }
  @inlinable public func erf() -> Self  { return new_call(erf) }
  @inlinable public func sqrt_() { sqrt(self) }
  @inlinable public func sqrt() -> Self  { return new_call(sqrt) }
  @inlinable public func cbrt_() { cbrt(self) }
  @inlinable public func cbrt() -> Self  { return new_call(cbrt) }
  @inlinable public func cosh_() { cosh(self) }
  @inlinable public func cosh() -> Self  { return new_call(cosh) }
  @inlinable public func sinh_() { sinh(self) }
  @inlinable public func sinh() -> Self  { return new_call(sinh) }
  @inlinable public func tanh_() { tanh(self) }
  @inlinable public func tanh() -> Self  { return new_call(tanh) }
  @inlinable public func acos_() { acos(self) }
  @inlinable public func acos() -> Self  { return new_call(acos) }
  @inlinable public func asin_() { asin(self) }
  @inlinable public func asin() -> Self  { return new_call(asin) }
  @inlinable public func atan_() { atan(self) }
  @inlinable public func atan() -> Self  { return new_call(atan) }
  @inlinable public func erfc_() { erfc(self) }
  @inlinable public func erfc() -> Self  { return new_call(erfc) }
  @inlinable public func ceil_() { ceil(self) }
  @inlinable public func ceil() -> Self  { return new_call(ceil) }
  @inlinable public func rint_() { rint(self) }
  @inlinable public func rint() -> Self  { return new_call(rint) }
  @inlinable public func expm1_() { expm1(self) }
  @inlinable public func expm1() -> Self  { return new_call(expm1) }
  @inlinable public func log10_() { log10(self) }
  @inlinable public func log10() -> Self  { return new_call(log10) }
  @inlinable public func log1p_() { log1p(self) }
  @inlinable public func log1p() -> Self  { return new_call(log1p) }
  @inlinable public func acosh_() { acosh(self) }
  @inlinable public func acosh() -> Self  { return new_call(acosh) }
  @inlinable public func asinh_() { asinh(self) }
  @inlinable public func asinh() -> Self  { return new_call(asinh) }
  @inlinable public func atanh_() { atanh(self) }
  @inlinable public func atanh() -> Self  { return new_call(atanh) }
  @inlinable public func floor_() { floor(self) }
  @inlinable public func floor() -> Self  { return new_call(floor) }
  @inlinable public func round_() { round(self) }
  @inlinable public func round() -> Self  { return new_call(round) }
  @inlinable public func trunc_() { trunc(self) }
  @inlinable public func trunc() -> Self  { return new_call(trunc) }
  @inlinable public func erfInv_() { erfInv(self) }
  @inlinable public func erfInv() -> Self  { return new_call(erfInv) }
  @inlinable public func pow3o2_() { pow3o2(self) }
  @inlinable public func pow3o2() -> Self  { return new_call(pow3o2) }
  @inlinable public func pow2o3_() { pow2o3(self) }
  @inlinable public func pow2o3() -> Self  { return new_call(pow2o3) }
  @inlinable public func invSqrt_() { invSqrt(self) }
  @inlinable public func invSqrt() -> Self  { return new_call(invSqrt) }
  @inlinable public func invCbrt_() { invCbrt(self) }
  @inlinable public func invCbrt() -> Self  { return new_call(invCbrt) }
  @inlinable public func nearbyInt_() { nearbyInt(self) }
  @inlinable public func nearbyInt() -> Self  { return new_call(nearbyInt) }

  @inlinable public func pow_(_ b:Self) { pow(b, self) }
  @inlinable public func pow(_ b:Self)->Self { return new_call(pow, b) }
  @inlinable public func hypot_(_ b:Self) { hypot(b, self) }
  @inlinable public func hypot(_ b:Self)->Self { return new_call(hypot, b) }
  @inlinable public func atan2_(_ b:Self) { atan2(b, self) }
  @inlinable public func atan2(_ b:Self)->Self { return new_call(atan2, b) }

  @inlinable func ipp_reduce(_ f:(Self)->())->Element { let res = Self.init(1); f(res); return res[0] }

  @inlinable public func mean()->Element { return ipp_reduce(mean) }
  @inlinable public func stdDev()->Element { return ipp_reduce(stdDev) }
  @inlinable public func max()->Element { return ipp_reduce(max) }
  @inlinable public func min()->Element { return ipp_reduce(min) }

  @inlinable public func normDiff_Inf(_ b:Self)->Element {return ipp_reduce({normDiff_Inf(b, $0)})}
  @inlinable public func normDiff_L1(_ b:Self)->Element {return ipp_reduce({normDiff_L1(b, $0)})}
  @inlinable public func normDiff_L2(_ b:Self)->Element {return ipp_reduce({normDiff_L2(b, $0)})}

  @inlinable public func powx_(_ b:Element) { powx(b, self) }
  @inlinable public func powx(_ b:Element)->Self { return new_call(powx, b) }

  @inlinable public func packIncrement(_ incr:Int, _ from:Int, _ n:Int, _ dest:Self) { Element.packI(n, p+from, incr, dest.p) }
  @inlinable public func packIncrement(_ incr:Int, _ from:Int, _ n:Int)->Self {
    let res = new(n); packIncrement(incr, from, n, res); return res
  }
  @inlinable public func packIndices(_ idxs:[Int32], _ dest:Self) { Element.packV(idxs.count, p, idxs, dest.p) }
  @inlinable public func packMasked( _ mask:[Int32], _ dest:Self) { Element.packM(mask.count, p, mask, dest.p) }
  @inlinable public func packIndices(_ idxs:[Int32])->Self { return new_call(packIndices, idxs, n:idxs.count) }
  @inlinable public func packMasked( _ mask:[Int32])->Self { return new_call(packMasked,  mask, n:Int(mask.reduce(0,+))) }
}

