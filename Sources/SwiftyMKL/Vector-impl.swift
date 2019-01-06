import Foundation
import CSwiftyMKL


extension Vector {
  public func divCRev(_ val:Element, _ pDst:Self) {return Element.divCRev(self.p,val,pDst.p,self.c)}
  public func dot(_ incX:Int, _ Y:Self, _ incY:Int)->Element {return Element.dot(self.c,self.p,incX,Y.p,incY)}
  public func doti(_ indx:UnsafePointer<Int32>, _ Y:Self)->Element {return Element.doti(self.c,self.p,indx,Y.p)}
  public func nrm2(_ incX:Int)->Element {return Element.nrm2(self.c,self.p,incX)}
  public func asum(_ incX:Int)->Element {return Element.asum(self.c,self.p,incX)}
  public func swap(_ X:Self, _ incX:Int, _ Y:Self, _ incY:Int) {return Element.swap(self.c,X.p,incX,Y.p,incY)}
  public func copy(_ incX:Int, _ Y:Self, _ incY:Int) {return Element.copy(self.c,self.p,incX,Y.p,incY)}
  public func axpy(_ alpha:Element, _ incX:Int, _ Y:Self, _ incY:Int) {return Element.axpy(self.c,alpha,self.p,incX,Y.p,incY)}
  public func axpby(_ alpha:Element, _ incX:Int, _ beta:Element, _ Y:Self, _ incY:Int) {return Element.axpby(self.c,alpha,self.p,incX,beta,Y.p,incY)}
  public func axpyi(_ alpha:Element, _ indx:UnsafePointer<Int32>, _ Y:Self) {return Element.axpyi(self.c,alpha,self.p,indx,Y.p)}
  public func gthr(_ Y:Self, _ X:Self, _ indx:UnsafePointer<Int32>) {return Element.gthr(self.c,Y.p,X.p,indx)}
  public func gthrz(_ Y:Self, _ X:Self, _ indx:UnsafePointer<Int32>) {return Element.gthrz(self.c,Y.p,X.p,indx)}
  public func sctr(_ indx:UnsafePointer<Int32>, _ Y:Self) {return Element.sctr(self.c,self.p,indx,Y.p)}
  
  
  public func rot(_ X:Self, _ incX:Int, _ Y:Self, _ incY:Int, _ c:Element, _ s:Element) {return Element.rot(self.c,X.p,incX,Y.p,incY,c,s)}
  public func roti(_ X:Self, _ indx:UnsafePointer<Int32>, _ Y:Self, _ c:Element, _ s:Element) {return Element.roti(self.c,X.p,indx,Y.p,c,s)}
  public func rotm(_ X:Self, _ incX:Int, _ Y:Self, _ incY:Int, _ P:Self) {return Element.rotm(self.c,X.p,incX,Y.p,incY,P.p)}
  public func scal(_ alpha:Element, _ X:Self, _ incX:Int) {return Element.scal(self.c,alpha,X.p,incX)}
  public func gemv(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ M:Int, _ alpha:Element, _ A:Self, _ lda:Int, _ incX:Int, _ beta:Element, _ Y:Self, _ incY:Int) {return Element.gemv(Layout,TransA,M,self.c,alpha,A.p,lda,self.p,incX,beta,Y.p,incY)}
  public func gbmv(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ M:Int, _ KL:Int, _ KU:Int, _ alpha:Element, _ A:Self, _ lda:Int, _ incX:Int, _ beta:Element, _ Y:Self, _ incY:Int) {return Element.gbmv(Layout,TransA,M,self.c,KL,KU,alpha,A.p,lda,self.p,incX,beta,Y.p,incY)}
  public func trmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ lda:Int, _ X:Self, _ incX:Int) {return Element.trmv(Layout,Uplo,TransA,Diag,self.c,self.p,lda,X.p,incX)}
  public func tbmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ K:Int, _ lda:Int, _ X:Self, _ incX:Int) {return Element.tbmv(Layout,Uplo,TransA,Diag,self.c,K,self.p,lda,X.p,incX)}
  public func tpmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ Ap:Self, _ X:Self, _ incX:Int) {return Element.tpmv(Layout,Uplo,TransA,Diag,self.c,Ap.p,X.p,incX)}
  public func trsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ lda:Int, _ X:Self, _ incX:Int) {return Element.trsv(Layout,Uplo,TransA,Diag,self.c,self.p,lda,X.p,incX)}
  public func tbsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ K:Int, _ lda:Int, _ X:Self, _ incX:Int) {return Element.tbsv(Layout,Uplo,TransA,Diag,self.c,K,self.p,lda,X.p,incX)}
  public func tpsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ Ap:Self, _ X:Self, _ incX:Int) {return Element.tpsv(Layout,Uplo,TransA,Diag,self.c,Ap.p,X.p,incX)}
  public func symv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ alpha:Element, _ A:Self, _ lda:Int, _ incX:Int, _ beta:Element, _ Y:Self, _ incY:Int) {return Element.symv(Layout,Uplo,self.c,alpha,A.p,lda,self.p,incX,beta,Y.p,incY)}
  public func sbmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ K:Int, _ alpha:Element, _ A:Self, _ lda:Int, _ incX:Int, _ beta:Element, _ Y:Self, _ incY:Int) {return Element.sbmv(Layout,Uplo,self.c,K,alpha,A.p,lda,self.p,incX,beta,Y.p,incY)}
  public func spmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ alpha:Element, _ Ap:Self, _ incX:Int, _ beta:Element, _ Y:Self, _ incY:Int) {return Element.spmv(Layout,Uplo,self.c,alpha,Ap.p,self.p,incX,beta,Y.p,incY)}
  public func ger(_ Layout:CBLAS_LAYOUT, _ M:Int, _ alpha:Element, _ incX:Int, _ Y:Self, _ incY:Int, _ A:Self, _ lda:Int) {return Element.ger(Layout,M,self.c,alpha,self.p,incX,Y.p,incY,A.p,lda)}
  public func syr(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ alpha:Element, _ incX:Int, _ A:Self, _ lda:Int) {return Element.syr(Layout,Uplo,self.c,alpha,self.p,incX,A.p,lda)}
  public func spr(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ alpha:Element, _ incX:Int, _ Ap:Self) {return Element.spr(Layout,Uplo,self.c,alpha,self.p,incX,Ap.p)}
  public func syr2(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ alpha:Element, _ incX:Int, _ Y:Self, _ incY:Int, _ A:Self, _ lda:Int) {return Element.syr2(Layout,Uplo,self.c,alpha,self.p,incX,Y.p,incY,A.p,lda)}
  public func spr2(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ alpha:Element, _ incX:Int, _ Y:Self, _ incY:Int, _ A:Self) {return Element.spr2(Layout,Uplo,self.c,alpha,self.p,incX,Y.p,incY,A.p)}
  public func gemm(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ TransB:CBLAS_TRANSPOSE, _ M:Int, _ K:Int, _ alpha:Element, _ lda:Int, _ B:Self, _ ldb:Int, _ beta:Element, _ C:Self, _ ldc:Int) {return Element.gemm(Layout,TransA,TransB,M,self.c,K,alpha,self.p,lda,B.p,ldb,beta,C.p,ldc)}
  public func gemmt(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ TransB:CBLAS_TRANSPOSE, _ K:Int, _ alpha:Element, _ lda:Int, _ B:Self, _ ldb:Int, _ beta:Element, _ C:Self, _ ldc:Int) {return Element.gemmt(Layout,Uplo,TransA,TransB,self.c,K,alpha,self.p,lda,B.p,ldb,beta,C.p,ldc)}
  public func symm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ M:Int, _ alpha:Element, _ lda:Int, _ B:Self, _ ldb:Int, _ beta:Element, _ C:Self, _ ldc:Int) {return Element.symm(Layout,Side,Uplo,M,self.c,alpha,self.p,lda,B.p,ldb,beta,C.p,ldc)}
  public func syrk(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ Trans:CBLAS_TRANSPOSE, _ K:Int, _ alpha:Element, _ lda:Int, _ beta:Element, _ C:Self, _ ldc:Int) {return Element.syrk(Layout,Uplo,Trans,self.c,K,alpha,self.p,lda,beta,C.p,ldc)}
  public func syr2k(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ Trans:CBLAS_TRANSPOSE, _ K:Int, _ alpha:Element, _ lda:Int, _ B:Self, _ ldb:Int, _ beta:Element, _ C:Self, _ ldc:Int) {return Element.syr2k(Layout,Uplo,Trans,self.c,K,alpha,self.p,lda,B.p,ldb,beta,C.p,ldc)}
  public func trmm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ M:Int, _ alpha:Element, _ lda:Int, _ B:Self, _ ldb:Int) {return Element.trmm(Layout,Side,Uplo,TransA,Diag,M,self.c,alpha,self.p,lda,B.p,ldb)}
  public func trsm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ M:Int, _ alpha:Element, _ lda:Int, _ B:Self, _ ldb:Int) {return Element.trsm(Layout,Side,Uplo,TransA,Diag,M,self.c,alpha,self.p,lda,B.p,ldb)}
  public func gemm_pack_get_size(_ identifier:CBLAS_IDENTIFIER, _ M:Int, _ K:Int)->Int32 {return Element.gemm_pack_get_size(identifier,M,self.c,K)}
  public func gemm_pack(_ Layout:CBLAS_LAYOUT, _ identifier:CBLAS_IDENTIFIER, _ Trans:CBLAS_TRANSPOSE, _ M:Int, _ K:Int, _ alpha:Element, _ src:Self, _ ld:Int, _ dest:Self) {return Element.gemm_pack(Layout,identifier,Trans,M,self.c,K,alpha,src.p,ld,dest.p)}
  public func gemm_compute(_ Layout:CBLAS_LAYOUT, _ TransA:Int, _ TransB:Int, _ M:Int, _ K:Int, _ lda:Int, _ B:Self, _ ldb:Int, _ beta:Element, _ C:Self, _ ldc:Int) {return Element.gemm_compute(Layout,TransA,TransB,M,self.c,K,self.p,lda,B.p,ldb,beta,C.p,ldc)}
  
  public func abs(_ r:Self) {return Element.abs(self.c,self.p,r.p)}
  public func add(_ b:Self, _ r:Self) {return Element.add(self.c,self.p,b.p,r.p)}
  public func sub(_ b:Self, _ r:Self) {return Element.sub(self.c,self.p,b.p,r.p)}
  public func inv(_ r:Self) {return Element.inv(self.c,self.p,r.p)}
  public func sqrt(_ r:Self) {return Element.sqrt(self.c,self.p,r.p)}
  public func invSqrt(_ r:Self) {return Element.invSqrt(self.c,self.p,r.p)}
  public func cbrt(_ r:Self) {return Element.cbrt(self.c,self.p,r.p)}
  public func invCbrt(_ r:Self) {return Element.invCbrt(self.c,self.p,r.p)}
  public func sqr(_ r:Self) {return Element.sqr(self.c,self.p,r.p)}
  public func exp(_ r:Self) {return Element.exp(self.c,self.p,r.p)}
  public func exp2(_ r:Self) {return Element.exp2(self.c,self.p,r.p)}
  public func exp10(_ r:Self) {return Element.exp10(self.c,self.p,r.p)}
  public func expm1(_ r:Self) {return Element.expm1(self.c,self.p,r.p)}
  public func ln(_ r:Self) {return Element.ln(self.c,self.p,r.p)}
  public func log2(_ r:Self) {return Element.log2(self.c,self.p,r.p)}
  public func log10(_ r:Self) {return Element.log10(self.c,self.p,r.p)}
  public func log1p(_ r:Self) {return Element.log1p(self.c,self.p,r.p)}
  public func logb(_ r:Self) {return Element.logb(self.c,self.p,r.p)}
  public func cos(_ r:Self) {return Element.cos(self.c,self.p,r.p)}
  public func sin(_ r:Self) {return Element.sin(self.c,self.p,r.p)}
  public func tan(_ r:Self) {return Element.tan(self.c,self.p,r.p)}
  public func cospi(_ r:Self) {return Element.cospi(self.c,self.p,r.p)}
  public func sinpi(_ r:Self) {return Element.sinpi(self.c,self.p,r.p)}
  public func tanpi(_ r:Self) {return Element.tanpi(self.c,self.p,r.p)}
  public func cosd(_ r:Self) {return Element.cosd(self.c,self.p,r.p)}
  public func sind(_ r:Self) {return Element.sind(self.c,self.p,r.p)}
  public func tand(_ r:Self) {return Element.tand(self.c,self.p,r.p)}
  public func cosh(_ r:Self) {return Element.cosh(self.c,self.p,r.p)}
  public func sinh(_ r:Self) {return Element.sinh(self.c,self.p,r.p)}
  public func tanh(_ r:Self) {return Element.tanh(self.c,self.p,r.p)}
  public func acos(_ r:Self) {return Element.acos(self.c,self.p,r.p)}
  public func asin(_ r:Self) {return Element.asin(self.c,self.p,r.p)}
  public func atan(_ r:Self) {return Element.atan(self.c,self.p,r.p)}
  public func acospi(_ r:Self) {return Element.acospi(self.c,self.p,r.p)}
  public func asinpi(_ r:Self) {return Element.asinpi(self.c,self.p,r.p)}
  public func atanpi(_ r:Self) {return Element.atanpi(self.c,self.p,r.p)}
  public func acosh(_ r:Self) {return Element.acosh(self.c,self.p,r.p)}
  public func asinh(_ r:Self) {return Element.asinh(self.c,self.p,r.p)}
  public func atanh(_ r:Self) {return Element.atanh(self.c,self.p,r.p)}
  public func erf(_ r:Self) {return Element.erf(self.c,self.p,r.p)}
  public func erfInv(_ r:Self) {return Element.erfInv(self.c,self.p,r.p)}
  public func hypot(_ b:Self, _ r:Self) {return Element.hypot(self.c,self.p,b.p,r.p)}
  public func erfc(_ r:Self) {return Element.erfc(self.c,self.p,r.p)}
  public func erfcInv(_ r:Self) {return Element.erfcInv(self.c,self.p,r.p)}
  public func cdfNorm(_ r:Self) {return Element.cdfNorm(self.c,self.p,r.p)}
  public func cdfNormInv(_ r:Self) {return Element.cdfNormInv(self.c,self.p,r.p)}
  public func lGamma(_ r:Self) {return Element.lGamma(self.c,self.p,r.p)}
  public func tGamma(_ r:Self) {return Element.tGamma(self.c,self.p,r.p)}
  public func atan2(_ b:Self, _ r:Self) {return Element.atan2(self.c,self.p,b.p,r.p)}
  public func atan2pi(_ b:Self, _ r:Self) {return Element.atan2pi(self.c,self.p,b.p,r.p)}
  public func mul(_ b:Self, _ r:Self) {return Element.mul(self.c,self.p,b.p,r.p)}
  public func div(_ b:Self, _ r:Self) {return Element.div(self.c,self.p,b.p,r.p)}
  public func pow(_ b:Self, _ r:Self) {return Element.pow(self.c,self.p,b.p,r.p)}
  public func pow3o2(_ r:Self) {return Element.pow3o2(self.c,self.p,r.p)}
  public func pow2o3(_ r:Self) {return Element.pow2o3(self.c,self.p,r.p)}
  public func powx(_ b:Element, _ r:Self) {return Element.powx(self.c,self.p,b,r.p)}
  public func powr(_ b:Self, _ r:Self) {return Element.powr(self.c,self.p,b.p,r.p)}
  public func sinCos(_ r1:Self, _ r2:Self) {return Element.sinCos(self.c,self.p,r1.p,r2.p)}
  public func linearFrac(_ b:Self, _ scalea:Element, _ shifta:Element, _ scaleb:Element, _ shiftb:Element, _ r:Self) {return Element.linearFrac(self.c,self.p,b.p,scalea,shifta,scaleb,shiftb,r.p)}
  public func ceil(_ r:Self) {return Element.ceil(self.c,self.p,r.p)}
  public func floor(_ r:Self) {return Element.floor(self.c,self.p,r.p)}
  public func frac(_ r:Self) {return Element.frac(self.c,self.p,r.p)}
  public func modf(_ r1:Self, _ r2:Self) {return Element.modf(self.c,self.p,r1.p,r2.p)}
  public func fmod(_ r1:Self, _ r2:Self) {return Element.fmod(self.c,self.p,r1.p,r2.p)}
  public func remainder(_ r1:Self, _ r2:Self) {return Element.remainder(self.c,self.p,r1.p,r2.p)}
  public func nextAfter(_ r1:Self, _ r2:Self) {return Element.nextAfter(self.c,self.p,r1.p,r2.p)}
  public func copySign(_ r1:Self, _ r2:Self) {return Element.copySign(self.c,self.p,r1.p,r2.p)}
  public func fdim(_ r1:Self, _ r2:Self) {return Element.fdim(self.c,self.p,r1.p,r2.p)}
  public func fmax(_ r1:Self, _ r2:Self) {return Element.fmax(self.c,self.p,r1.p,r2.p)}
  public func fmin(_ r1:Self, _ r2:Self) {return Element.fmin(self.c,self.p,r1.p,r2.p)}
  public func maxMag(_ r1:Self, _ r2:Self) {return Element.maxMag(self.c,self.p,r1.p,r2.p)}
  public func minMag(_ r1:Self, _ r2:Self) {return Element.minMag(self.c,self.p,r1.p,r2.p)}
  public func nearbyInt(_ r:Self) {return Element.nearbyInt(self.c,self.p,r.p)}
  public func rint(_ r:Self) {return Element.rint(self.c,self.p,r.p)}
  public func round(_ r:Self) {return Element.round(self.c,self.p,r.p)}
  public func trunc(_ r:Self) {return Element.trunc(self.c,self.p,r.p)}
  public func expInt1(_ r:Self) {return Element.expInt1(self.c,self.p,r.p)}
  public func packI(_ incra:Int, _ y:Self) {return Element.packI(self.c,self.p,incra,y.p)}
  public func packV(_ ia:UnsafePointer<Int32>, _ y:Self) {return Element.packV(self.c,self.p,ia,y.p)}
  public func packM(_ ma:UnsafePointer<Int32>, _ y:Self) {return Element.packM(self.c,self.p,ma,y.p)}
  public func unpackI(_ y:Self, _ incry:Int) {return Element.unpackI(self.c,self.p,y.p,incry)}
  public func unpackV(_ y:Self, _ iy:UnsafePointer<Int32>) {return Element.unpackV(self.c,self.p,y.p,iy)}
  public func unpackM(_ y:Self, _ my:UnsafePointer<Int32>) {return Element.unpackM(self.c,self.p,y.p,my)}
  public func copy(_ pDst:Self) {return Element.copy(self.p,pDst.p,self.c)}
  public func move(_ pDst:Self) {return Element.move(self.p,pDst.p,self.c)}
  public func set(_ val:Element, _ pDst:Self) {return Element.set(val,pDst.p,self.c)}
  public func zero(_ pDst:Self) {return Element.zero(pDst.p,self.c)}
  public func triangle(_ pDst:Self, _ magn:Element, _ rFreq:Element, _ asym:Element, _ pPhase:Self) {return Element.triangle(pDst.p,self.c,magn,rFreq,asym,pPhase.p)}
  public func vectorJaehne(_ pDst:Self, _ magn:Element) {return Element.vectorJaehne(pDst.p,self.c,magn)}
  public func vectorSlope(_ pDst:Self, _ offset:Element, _ slope:Element) {return Element.vectorSlope(pDst.p,self.c,offset,slope)}
  public func addC(_ val:Element, _ pDst:Self) {return Element.addC(self.p,val,pDst.p,self.c)}
  public func addProduct(_ pSrc2:Self, _ pSrcDst:Self) {return Element.addProduct(self.p,pSrc2.p,pSrcDst.p,self.c)}
  public func mulC(_ val:Element, _ pDst:Self) {return Element.mulC(self.p,val,pDst.p,self.c)}
  public func subC(_ val:Element, _ pDst:Self) {return Element.subC(self.p,val,pDst.p,self.c)}
  public func subCRev(_ val:Element, _ pDst:Self) {return Element.subCRev(self.p,val,pDst.p,self.c)}
  public func divC(_ val:Element, _ pDst:Self) {return Element.divC(self.p,val,pDst.p,self.c)}
  public func sumLn(_ pSum:Self) {return Element.sumLn(self.p,self.c,pSum.p)}
  public func arctan(_ pDst:Self) {return Element.arctan(self.p,pDst.p,self.c)}
  public func normalize(_ pDst:Self, _ vSub:Element, _ vDiv:Element) {return Element.normalize(self.p,pDst.p,self.c,vSub,vDiv)}
  public func magnitude(_ pSrcRe:Self, _ pSrcIm:Self, _ pDst:Self) {return Element.magnitude(pSrcRe.p,pSrcIm.p,pDst.p,self.c)}
  public func phase(_ pSrcRe:Self, _ pSrcIm:Self, _ pDst:Self) {return Element.phase(pSrcRe.p,pSrcIm.p,pDst.p,self.c)}
  public func powerSpectr(_ pSrcRe:Self, _ pSrcIm:Self, _ pDst:Self) {return Element.powerSpectr(pSrcRe.p,pSrcIm.p,pDst.p,self.c)}
  public func threshold_LT(_ pDst:Self, _ level:Element) {return Element.threshold_LT(self.p,pDst.p,self.c,level)}
  public func threshold_GT(_ pDst:Self, _ level:Element) {return Element.threshold_GT(self.p,pDst.p,self.c,level)}
  public func threshold_LTAbs(_ pDst:Self, _ level:Element) {return Element.threshold_LTAbs(self.p,pDst.p,self.c,level)}
  public func threshold_GTAbs(_ pDst:Self, _ level:Element) {return Element.threshold_GTAbs(self.p,pDst.p,self.c,level)}
  public func threshold_LTAbsVal(_ pDst:Self, _ level:Element, _ value:Element) {return Element.threshold_LTAbsVal(self.p,pDst.p,self.c,level,value)}
  public func threshold_LTVal(_ pDst:Self, _ level:Element, _ value:Element) {return Element.threshold_LTVal(self.p,pDst.p,self.c,level,value)}
  public func threshold_GTVal(_ pDst:Self, _ level:Element, _ value:Element) {return Element.threshold_GTVal(self.p,pDst.p,self.c,level,value)}
  public func threshold_LTValGTVal(_ pDst:Self, _ levelLT:Element, _ valueLT:Element, _ levelGT:Element, _ valueGT:Element) {return Element.threshold_LTValGTVal(self.p,pDst.p,self.c,levelLT,valueLT,levelGT,valueGT)}
  public func threshold_LTInv(_ pDst:Self, _ level:Element) {return Element.threshold_LTInv(self.p,pDst.p,self.c,level)}
  public func cartToPolar(_ pSrcRe:Self, _ pSrcIm:Self, _ pDstMagn:Self, _ pDstPhase:Self) {return Element.cartToPolar(pSrcRe.p,pSrcIm.p,pDstMagn.p,pDstPhase.p,self.c)}
  public func polarToCart(_ pSrcMagn:Self, _ pSrcPhase:Self, _ pDstRe:Self, _ pDstIm:Self) {return Element.polarToCart(pSrcMagn.p,pSrcPhase.p,pDstRe.p,pDstIm.p,self.c)}
  public func flip(_ pDst:Self) {return Element.flip(self.p,pDst.p,self.c)}
  public func winBartlett(_ pDst:Self) {return Element.winBartlett(self.p,pDst.p,self.c)}
  public func winHann(_ pDst:Self) {return Element.winHann(self.p,pDst.p,self.c)}
  public func winHamming(_ pDst:Self) {return Element.winHamming(self.p,pDst.p,self.c)}
  public func winBlackman(_ pDst:Self, _ alpha:Element) {return Element.winBlackman(self.p,pDst.p,self.c,alpha)}
  public func winBlackmanStd(_ pDst:Self) {return Element.winBlackmanStd(self.p,pDst.p,self.c)}
  public func winBlackmanOpt(_ pDst:Self) {return Element.winBlackmanOpt(self.p,pDst.p,self.c)}
  public func winKaiser(_ pDst:Self, _ alpha:Element) {return Element.winKaiser(self.p,pDst.p,self.c,alpha)}
  public func sum(_ pSum:Self) {return Element.sum(self.p,self.c,pSum.p)}
  public func min(_ pMin:Self) {return Element.min(self.p,self.c,pMin.p)}
  public func max(_ pMax:Self) {return Element.max(self.p,self.c,pMax.p)}
  public func minMax(_ pMin:Self, _ pMax:Self) {return Element.minMax(self.p,self.c,pMin.p,pMax.p)}
  public func minAbs(_ pMinAbs:Self) {return Element.minAbs(self.p,self.c,pMinAbs.p)}
  public func maxAbs(_ pMaxAbs:Self) {return Element.maxAbs(self.p,self.c,pMaxAbs.p)}
  public func minIndx(_ pMin:Self, _ pIndx:UnsafeMutablePointer<Int32>) {return Element.minIndx(self.p,self.c,pMin.p,pIndx)}
  public func maxIndx(_ pMax:Self, _ pIndx:UnsafeMutablePointer<Int32>) {return Element.maxIndx(self.p,self.c,pMax.p,pIndx)}
  public func minMaxIndx(_ pMin:Self, _ pMinIndx:UnsafeMutablePointer<Int32>, _ pMax:Self, _ pMaxIndx:UnsafeMutablePointer<Int32>) {return Element.minMaxIndx(self.p,self.c,pMin.p,pMinIndx,pMax.p,pMaxIndx)}
  public func mean(_ pMean:Self) {return Element.mean(self.p,self.c,pMean.p)}
  public func stdDev(_ pStdDev:Self) {return Element.stdDev(self.p,self.c,pStdDev.p)}
  public func meanStdDev(_ pMean:Self, _ pStdDev:Self) {return Element.meanStdDev(self.p,self.c,pMean.p,pStdDev.p)}
  public func norm_Inf(_ pNorm:Self) {return Element.norm_Inf(self.p,self.c,pNorm.p)}
  public func norm_L1(_ pNorm:Self) {return Element.norm_L1(self.p,self.c,pNorm.p)}
  public func norm_L2(_ pNorm:Self) {return Element.norm_L2(self.p,self.c,pNorm.p)}
  public func normDiff_Inf(_ pSrc2:Self, _ pNorm:Self) {return Element.normDiff_Inf(self.p,pSrc2.p,self.c,pNorm.p)}
  public func normDiff_L1(_ pSrc2:Self, _ pNorm:Self) {return Element.normDiff_L1(self.p,pSrc2.p,self.c,pNorm.p)}
  public func normDiff_L2(_ pSrc2:Self, _ pNorm:Self) {return Element.normDiff_L2(self.p,pSrc2.p,self.c,pNorm.p)}
  public func dotProd(_ pSrc2:Self, _ pDp:Self) {return Element.dotProd(self.p,pSrc2.p,self.c,pDp.p)}
  public func minEvery(_ pSrc2:Self, _ pDst:Self, _ len:UInt32) {return Element.minEvery(self.p,pSrc2.p,pDst.p,len)}
  public func maxEvery(_ pSrc2:Self, _ pDst:Self, _ len:UInt32) {return Element.maxEvery(self.p,pSrc2.p,pDst.p,len)}
  public func maxOrder(_ pOrder:UnsafeMutablePointer<Int32>) {return Element.maxOrder(self.p,self.c,pOrder)}
  public func sampleUp(_ srcLen:Int, _ pDst:Self, _ pDstLen:UnsafeMutablePointer<Int32>, _ factor:Int, _ pPhase:UnsafeMutablePointer<Int32>) {return Element.sampleUp(self.p,srcLen,pDst.p,pDstLen,factor,pPhase)}
  public func sampleDown(_ srcLen:Int, _ pDst:Self, _ pDstLen:UnsafeMutablePointer<Int32>, _ factor:Int, _ pPhase:UnsafeMutablePointer<Int32>) {return Element.sampleDown(self.p,srcLen,pDst.p,pDstLen,factor,pPhase)}
  public func filterMedian(_ pDst:Self, _ maskSize:Int, _ pDlySrc:Self, _ pDlyDst:Self, _ pBuffer:UnsafeMutablePointer<UInt8>) {return Element.filterMedian(self.p,pDst.p,self.c,maskSize,pDlySrc.p,pDlyDst.p,pBuffer)}

  func new_call(_ f:(Self)         ->()              )->Self { let res = new(); f(      res); return res }
  func new_call(_ f:(Self, Self)   ->(), _ b:Self    )->Self { let res = new(); f(b,    res); return res }
  func new_call<T>(_ f:(T, Self)   ->(), _ b:T       )->Self { let res = new(); f(b,    res); return res }
  func new_call<T>(_ f:(T, T, Self)->(), _ b:T, _ c:T)->Self { let res = new(); f(b, c, res); return res }

  func new_call<T>(_ f:(T, Self)->(), _ b:T, n:Int)->Self { let res = new(n); f(b, res); return res }
  func new_call<T>(_ f:(T, T, Self)->(), _ b:T, _ c:T, n:Int)->Self { let res = new(n); f(b, c, res); return res }

  public func asum()->Element { return asum(1) }
  public func nrm2()->Element { return nrm2(1) }
  public func dot(_ b:Self)->Element { return dot(1, b, 1) }
  public func set(_ b: Element) { set(b,self) }
  public func zero() { zero(self) }
  public func move(_ b:Self, _ n:Int) { Element.move(p, b.p, n) }
  public func move(_ b:Self, _ n:Int, fromIdx:Int, toIdx:Int) { Element.move(p+fromIdx, b.p+toIdx, n) }

  public func ln_() { ln(self) }
  public func ln() -> Self  { return new_call(ln) }
  public func abs_() { abs(self) }
  public func abs() -> Self  { return new_call(abs) }
  public func inv_() { inv(self) }
  public func inv() -> Self  { return new_call(inv) }
  public func sqr_() { sqr(self) }
  public func sqr() -> Self  { return new_call(sqr) }
  public func exp_() { exp(self) }
  public func exp() -> Self  { return new_call(exp) }
  public func cos_() { cos(self) }
  public func cos() -> Self  { return new_call(cos) }
  public func sin_() { sin(self) }
  public func sin() -> Self  { return new_call(sin) }
  public func tan_() { tan(self) }
  public func tan() -> Self  { return new_call(tan) }
  public func erf_() { erf(self) }
  public func erf() -> Self  { return new_call(erf) }
  public func sqrt_() { sqrt(self) }
  public func sqrt() -> Self  { return new_call(sqrt) }
  public func cbrt_() { cbrt(self) }
  public func cbrt() -> Self  { return new_call(cbrt) }
  public func cosh_() { cosh(self) }
  public func cosh() -> Self  { return new_call(cosh) }
  public func sinh_() { sinh(self) }
  public func sinh() -> Self  { return new_call(sinh) }
  public func tanh_() { tanh(self) }
  public func tanh() -> Self  { return new_call(tanh) }
  public func acos_() { acos(self) }
  public func acos() -> Self  { return new_call(acos) }
  public func asin_() { asin(self) }
  public func asin() -> Self  { return new_call(asin) }
  public func atan_() { atan(self) }
  public func atan() -> Self  { return new_call(atan) }
  public func erfc_() { erfc(self) }
  public func erfc() -> Self  { return new_call(erfc) }
  public func ceil_() { ceil(self) }
  public func ceil() -> Self  { return new_call(ceil) }
  public func rint_() { rint(self) }
  public func rint() -> Self  { return new_call(rint) }
  public func expm1_() { expm1(self) }
  public func expm1() -> Self  { return new_call(expm1) }
  public func log10_() { log10(self) }
  public func log10() -> Self  { return new_call(log10) }
  public func log1p_() { log1p(self) }
  public func log1p() -> Self  { return new_call(log1p) }
  public func acosh_() { acosh(self) }
  public func acosh() -> Self  { return new_call(acosh) }
  public func asinh_() { asinh(self) }
  public func asinh() -> Self  { return new_call(asinh) }
  public func atanh_() { atanh(self) }
  public func atanh() -> Self  { return new_call(atanh) }
  public func floor_() { floor(self) }
  public func floor() -> Self  { return new_call(floor) }
  public func round_() { round(self) }
  public func round() -> Self  { return new_call(round) }
  public func trunc_() { trunc(self) }
  public func trunc() -> Self  { return new_call(trunc) }
  public func erfInv_() { erfInv(self) }
  public func erfInv() -> Self  { return new_call(erfInv) }
  public func pow3o2_() { pow3o2(self) }
  public func pow3o2() -> Self  { return new_call(pow3o2) }
  public func pow2o3_() { pow2o3(self) }
  public func pow2o3() -> Self  { return new_call(pow2o3) }
  public func invSqrt_() { invSqrt(self) }
  public func invSqrt() -> Self  { return new_call(invSqrt) }
  public func invCbrt_() { invCbrt(self) }
  public func invCbrt() -> Self  { return new_call(invCbrt) }
  public func nearbyInt_() { nearbyInt(self) }
  public func nearbyInt() -> Self  { return new_call(nearbyInt) }

  public func add_(_ b:Self) { add(b, self) }
  public func add(_ b:Self)->Self { return new_call(add, b) }
  public func sub_(_ b:Self) { sub(b, self) }
  public func sub(_ b:Self)->Self { return new_call(sub, b) }
  public func mul_(_ b:Self) { mul(b, self) }
  public func mul(_ b:Self)->Self { return new_call(mul, b) }
  public func div_(_ b:Self) { div(b, self) }
  public func div(_ b:Self)->Self { return new_call(div, b) }
  public func pow_(_ b:Self) { pow(b, self) }
  public func pow(_ b:Self)->Self { return new_call(pow, b) }
  public func hypot_(_ b:Self) { hypot(b, self) }
  public func hypot(_ b:Self)->Self { return new_call(hypot, b) }
  public func atan2_(_ b:Self) { atan2(b, self) }
  public func atan2(_ b:Self)->Self { return new_call(atan2, b) }

  public func subCRev_(_ b:Element) { subCRev(b, self) }
  public func subCRev(_ b:Element)->Self { return new_call(subCRev, b) }
  public func divCRev_(_ b:Element) { divCRev(b, self) }
  public func divCRev(_ b:Element)->Self { return new_call(divCRev, b) }
  public func addC_(_ b:Element) { addC(b, self) }
  public func addC(_ b:Element)->Self { return new_call(addC, b) }
  public func subC_(_ b:Element) { subC(b, self) }
  public func subC(_ b:Element)->Self { return new_call(subC, b) }
  public func mulC_(_ b:Element) { mulC(b, self) }
  public func mulC(_ b:Element)->Self { return new_call(mulC, b) }
  public func divC_(_ b:Element) { divC(b, self) }
  public func divC(_ b:Element)->Self { return new_call(divC, b) }

  func ipp_reduce(_ f:(Self)->())->Element { let res = Self.init(1); f(res); return res[0] }

  public func sum()->Element { return ipp_reduce(sum) }
  public func mean()->Element { return ipp_reduce(mean) }
  public func stdDev()->Element { return ipp_reduce(stdDev) }
  public func max()->Element { return ipp_reduce(max) }
  public func min()->Element { return ipp_reduce(min) }

  public func normDiff_Inf(_ b:Self)->Element {return ipp_reduce({normDiff_Inf(b, $0)})}
  public func normDiff_L1(_ b:Self)->Element {return ipp_reduce({normDiff_L1(b, $0)})}
  public func normDiff_L2(_ b:Self)->Element {return ipp_reduce({normDiff_L2(b, $0)})}

  public func powx_(_ b:Element) { powx(b, self) }
  public func powx(_ b:Element)->Self { return new_call(powx, b) }

  public static func +  (lhs:Self, rhs:Self   ) -> Self { return lhs.add(  rhs) }
  public static func +  (lhs:Self, rhs:Element) -> Self { return lhs.addC( rhs) }
  public static func += (lhs:Self, rhs:Self   )         {        lhs.add_( rhs) }
  public static func += (lhs:Self, rhs:Element)         {        lhs.addC_(rhs) }
  public static func -  (lhs:Self, rhs:Self   ) -> Self { return lhs.sub(  rhs) }
  public static func -  (lhs:Self, rhs:Element) -> Self { return lhs.subC( rhs) }
  public static func -= (lhs:Self, rhs:Self   )         {        lhs.sub_( rhs) }
  public static func -= (lhs:Self, rhs:Element)         {        lhs.subC_(rhs) }
  public static func *  (lhs:Self, rhs:Self   ) -> Self { return lhs.mul(  rhs) }
  public static func *  (lhs:Self, rhs:Element) -> Self { return lhs.mulC( rhs) }
  public static func *= (lhs:Self, rhs:Self   )         {        lhs.mul_( rhs) }
  public static func *= (lhs:Self, rhs:Element)         {        lhs.mulC_(rhs) }
  public static func /  (lhs:Self, rhs:Self   ) -> Self { return lhs.div(  rhs) }
  public static func /  (lhs:Self, rhs:Element) -> Self { return lhs.divC( rhs) }
  public static func /= (lhs:Self, rhs:Self   )         {        lhs.div_( rhs) }
  public static func /= (lhs:Self, rhs:Element)         {        lhs.divC_(rhs) }
  public static func +  (lhs:Element, rhs:Self) -> Self { return rhs.addC(  lhs) }
  public static func -  (lhs:Element, rhs:Self) -> Self { return rhs.subCRev(  lhs) }
  public static func *  (lhs:Element, rhs:Self) -> Self { return rhs.mulC(  lhs) }
  public static func /  (lhs:Element, rhs:Self) -> Self { return rhs.divCRev(  lhs) }

  public func packIncrement(_ incr:Int, _ from:Int, _ n:Int, _ dest:Self) { Element.packI(n, p+from, incr, dest.p) }
  public func packIncrement(_ incr:Int, _ from:Int, _ n:Int)->Self {
    let res = new(n); packIncrement(incr, from, n, res); return res
  }
  public func packIndices(_ idxs:[Int32], _ dest:Self) { Element.packV(idxs.count, p, idxs, dest.p) }
  public func packMasked( _ mask:[Int32], _ dest:Self) { Element.packM(mask.count, p, mask, dest.p) }
  public func packIndices(_ idxs:[Int32])->Self { return new_call(packIndices, idxs, n:idxs.count) }
  public func packMasked( _ mask:[Int32])->Self { return new_call(packMasked,  mask, n:Int(mask.reduce(0,+))) }
}

/*
// Currently unused
infix operator .+:  AdditionPrecedence
infix operator .+=: AssignmentPrecedence
infix operator .-:  AdditionPrecedence
infix operator .-=: AssignmentPrecedence
infix operator .*:  MultiplicationPrecedence
infix operator .*=: AssignmentPrecedence
infix operator ./:  MultiplicationPrecedence
infix operator ./=: AssignmentPrecedence
*/

