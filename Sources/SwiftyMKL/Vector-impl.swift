import Foundation
import CMKL
import CIPP


infix operator .+:  AdditionPrecedence
infix operator .+=: AssignmentPrecedence
infix operator .-:  AdditionPrecedence
infix operator .-=: AssignmentPrecedence
infix operator .*:  MultiplicationPrecedence
infix operator .*=: AssignmentPrecedence
infix operator ./:  MultiplicationPrecedence
infix operator ./=: AssignmentPrecedence

extension Vector {
  public func divCRev(_ val:Element, _ pDst:MutPtrT) {return Element.divCRev(self.p,val,pDst,self.c)}
  public func dot_cblas(_ incX:Int, _ Y:PtrT, _ incY:Int)->Element {return Element.dot(self.c,self.p,incX,Y,incY)}
  public func doti_cblas(_ indx:UnsafePointer<Int32>, _ Y:PtrT)->Element {return Element.doti(self.c,self.p,indx,Y)}
  public func nrm2_cblas(_ incX:Int)->Element {return Element.nrm2(self.c,self.p,incX)}
  public func asum_cblas(_ incX:Int)->Element {return Element.asum(self.c,self.p,incX)}
  public func swap_cblas(_ X:MutPtrT, _ incX:Int, _ Y:MutPtrT, _ incY:Int) {return Element.swap(self.c,X,incX,Y,incY)}
  public func copy_cblas(_ incX:Int, _ Y:MutPtrT, _ incY:Int) {return Element.copy(self.c,self.p,incX,Y,incY)}
  public func axpy_cblas(_ alpha:Element, _ incX:Int, _ Y:MutPtrT, _ incY:Int) {return Element.axpy(self.c,alpha,self.p,incX,Y,incY)}
  public func axpby_cblas(_ alpha:Element, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int) {return Element.axpby(self.c,alpha,self.p,incX,beta,Y,incY)}
  public func axpyi_cblas(_ alpha:Element, _ indx:UnsafePointer<Int32>, _ Y:MutPtrT) {return Element.axpyi(self.c,alpha,self.p,indx,Y)}
  public func gthr_cblas(_ Y:PtrT, _ X:MutPtrT, _ indx:UnsafePointer<Int32>) {return Element.gthr(self.c,Y,X,indx)}
  public func gthrz_cblas(_ Y:MutPtrT, _ X:MutPtrT, _ indx:UnsafePointer<Int32>) {return Element.gthrz(self.c,Y,X,indx)}
  public func sctr_cblas(_ indx:UnsafePointer<Int32>, _ Y:MutPtrT) {return Element.sctr(self.c,self.p,indx,Y)}
  
  
  public func rot_cblas(_ X:MutPtrT, _ incX:Int, _ Y:MutPtrT, _ incY:Int, _ c:Element, _ s:Element) {return Element.rot(self.c,X,incX,Y,incY,c,s)}
  public func roti_cblas(_ X:MutPtrT, _ indx:UnsafePointer<Int32>, _ Y:MutPtrT, _ c:Element, _ s:Element) {return Element.roti(self.c,X,indx,Y,c,s)}
  public func rotm_cblas(_ X:MutPtrT, _ incX:Int, _ Y:MutPtrT, _ incY:Int, _ P:PtrT) {return Element.rotm(self.c,X,incX,Y,incY,P)}
  public func scal_cblas(_ alpha:Element, _ X:MutPtrT, _ incX:Int) {return Element.scal(self.c,alpha,X,incX)}
  public func gemv_cblas(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ M:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int) {return Element.gemv(Layout,TransA,M,self.c,alpha,A,lda,self.p,incX,beta,Y,incY)}
  public func gbmv_cblas(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ M:Int, _ KL:Int, _ KU:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int) {return Element.gbmv(Layout,TransA,M,self.c,KL,KU,alpha,A,lda,self.p,incX,beta,Y,incY)}
  public func trmv_cblas(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ A:PtrT, _ lda:Int, _ X:MutPtrT, _ incX:Int) {return Element.trmv(Layout,Uplo,TransA,Diag,self.c,A,lda,X,incX)}
  public func tbmv_cblas(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ K:Int, _ A:PtrT, _ lda:Int, _ X:MutPtrT, _ incX:Int) {return Element.tbmv(Layout,Uplo,TransA,Diag,self.c,K,A,lda,X,incX)}
  public func tpmv_cblas(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ Ap:PtrT, _ X:MutPtrT, _ incX:Int) {return Element.tpmv(Layout,Uplo,TransA,Diag,self.c,Ap,X,incX)}
  public func trsv_cblas(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ A:PtrT, _ lda:Int, _ X:MutPtrT, _ incX:Int) {return Element.trsv(Layout,Uplo,TransA,Diag,self.c,A,lda,X,incX)}
  public func tbsv_cblas(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ K:Int, _ A:PtrT, _ lda:Int, _ X:MutPtrT, _ incX:Int) {return Element.tbsv(Layout,Uplo,TransA,Diag,self.c,K,A,lda,X,incX)}
  public func tpsv_cblas(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ Ap:PtrT, _ X:MutPtrT, _ incX:Int) {return Element.tpsv(Layout,Uplo,TransA,Diag,self.c,Ap,X,incX)}
  public func symv_cblas(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ alpha:Element, _ A:PtrT, _ lda:Int, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int) {return Element.symv(Layout,Uplo,self.c,alpha,A,lda,self.p,incX,beta,Y,incY)}
  public func sbmv_cblas(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ K:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int) {return Element.sbmv(Layout,Uplo,self.c,K,alpha,A,lda,self.p,incX,beta,Y,incY)}
  public func spmv_cblas(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ alpha:Element, _ Ap:PtrT, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int) {return Element.spmv(Layout,Uplo,self.c,alpha,Ap,self.p,incX,beta,Y,incY)}
  public func ger_cblas(_ Layout:CBLAS_LAYOUT, _ M:Int, _ alpha:Element, _ incX:Int, _ Y:PtrT, _ incY:Int, _ A:MutPtrT, _ lda:Int) {return Element.ger(Layout,M,self.c,alpha,self.p,incX,Y,incY,A,lda)}
  public func syr_cblas(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ alpha:Element, _ incX:Int, _ A:MutPtrT, _ lda:Int) {return Element.syr(Layout,Uplo,self.c,alpha,self.p,incX,A,lda)}
  public func spr_cblas(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ alpha:Element, _ incX:Int, _ Ap:MutPtrT) {return Element.spr(Layout,Uplo,self.c,alpha,self.p,incX,Ap)}
  public func syr2_cblas(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ alpha:Element, _ incX:Int, _ Y:PtrT, _ incY:Int, _ A:MutPtrT, _ lda:Int) {return Element.syr2(Layout,Uplo,self.c,alpha,self.p,incX,Y,incY,A,lda)}
  public func spr2_cblas(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ alpha:Element, _ incX:Int, _ Y:PtrT, _ incY:Int, _ A:MutPtrT) {return Element.spr2(Layout,Uplo,self.c,alpha,self.p,incX,Y,incY,A)}
  public func gemm_cblas(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ TransB:CBLAS_TRANSPOSE, _ M:Int, _ K:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:PtrT, _ ldb:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int) {return Element.gemm(Layout,TransA,TransB,M,self.c,K,alpha,A,lda,B,ldb,beta,C,ldc)}
  public func gemmt_cblas(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ TransB:CBLAS_TRANSPOSE, _ K:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:PtrT, _ ldb:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int) {return Element.gemmt(Layout,Uplo,TransA,TransB,self.c,K,alpha,A,lda,B,ldb,beta,C,ldc)}
  public func symm_cblas(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ M:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:PtrT, _ ldb:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int) {return Element.symm(Layout,Side,Uplo,M,self.c,alpha,A,lda,B,ldb,beta,C,ldc)}
  public func syrk_cblas(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ Trans:CBLAS_TRANSPOSE, _ K:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int) {return Element.syrk(Layout,Uplo,Trans,self.c,K,alpha,A,lda,beta,C,ldc)}
  public func syr2k_cblas(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ Trans:CBLAS_TRANSPOSE, _ K:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:PtrT, _ ldb:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int) {return Element.syr2k(Layout,Uplo,Trans,self.c,K,alpha,A,lda,B,ldb,beta,C,ldc)}
  public func trmm_cblas(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ M:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:MutPtrT, _ ldb:Int) {return Element.trmm(Layout,Side,Uplo,TransA,Diag,M,self.c,alpha,A,lda,B,ldb)}
  public func trsm_cblas(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ M:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:MutPtrT, _ ldb:Int) {return Element.trsm(Layout,Side,Uplo,TransA,Diag,M,self.c,alpha,A,lda,B,ldb)}
  public func gemm_pack_get_size_cblas(_ identifier:CBLAS_IDENTIFIER, _ M:Int, _ K:Int)->Int32 {return Element.gemm_pack_get_size(identifier,M,self.c,K)}
  public func gemm_pack_cblas(_ Layout:CBLAS_LAYOUT, _ identifier:CBLAS_IDENTIFIER, _ Trans:CBLAS_TRANSPOSE, _ M:Int, _ K:Int, _ alpha:Element, _ src:PtrT, _ ld:Int, _ dest:MutPtrT) {return Element.gemm_pack(Layout,identifier,Trans,M,self.c,K,alpha,src,ld,dest)}
  public func gemm_compute_cblas(_ Layout:CBLAS_LAYOUT, _ TransA:Int, _ TransB:Int, _ M:Int, _ K:Int, _ A:PtrT, _ lda:Int, _ B:PtrT, _ ldb:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int) {return Element.gemm_compute(Layout,TransA,TransB,M,self.c,K,A,lda,B,ldb,beta,C,ldc)}
  
  public func abs_vml(_ r:MutPtrT) {return Element.abs(self.c,self.p,r)}
  public func add_vml(_ b:PtrT, _ r:MutPtrT) {return Element.add(self.c,self.p,b,r)}
  public func sub_vml(_ b:PtrT, _ r:MutPtrT) {return Element.sub(self.c,self.p,b,r)}
  public func inv_vml(_ r:MutPtrT) {return Element.inv(self.c,self.p,r)}
  public func sqrt_vml(_ r:MutPtrT) {return Element.sqrt(self.c,self.p,r)}
  public func invSqrt_vml(_ r:MutPtrT) {return Element.invSqrt(self.c,self.p,r)}
  public func cbrt_vml(_ r:MutPtrT) {return Element.cbrt(self.c,self.p,r)}
  public func invCbrt_vml(_ r:MutPtrT) {return Element.invCbrt(self.c,self.p,r)}
  public func sqr_vml(_ r:MutPtrT) {return Element.sqr(self.c,self.p,r)}
  public func exp_vml(_ r:MutPtrT) {return Element.exp(self.c,self.p,r)}
  public func exp2_vml(_ r:MutPtrT) {return Element.exp2(self.c,self.p,r)}
  public func exp10_vml(_ r:MutPtrT) {return Element.exp10(self.c,self.p,r)}
  public func expm1_vml(_ r:MutPtrT) {return Element.expm1(self.c,self.p,r)}
  public func ln_vml(_ r:MutPtrT) {return Element.ln(self.c,self.p,r)}
  public func log2_vml(_ r:MutPtrT) {return Element.log2(self.c,self.p,r)}
  public func log10_vml(_ r:MutPtrT) {return Element.log10(self.c,self.p,r)}
  public func log1p_vml(_ r:MutPtrT) {return Element.log1p(self.c,self.p,r)}
  public func logb_vml(_ r:MutPtrT) {return Element.logb(self.c,self.p,r)}
  public func cos_vml(_ r:MutPtrT) {return Element.cos(self.c,self.p,r)}
  public func sin_vml(_ r:MutPtrT) {return Element.sin(self.c,self.p,r)}
  public func tan_vml(_ r:MutPtrT) {return Element.tan(self.c,self.p,r)}
  public func cospi_vml(_ r:MutPtrT) {return Element.cospi(self.c,self.p,r)}
  public func sinpi_vml(_ r:MutPtrT) {return Element.sinpi(self.c,self.p,r)}
  public func tanpi_vml(_ r:MutPtrT) {return Element.tanpi(self.c,self.p,r)}
  public func cosd_vml(_ r:MutPtrT) {return Element.cosd(self.c,self.p,r)}
  public func sind_vml(_ r:MutPtrT) {return Element.sind(self.c,self.p,r)}
  public func tand_vml(_ r:MutPtrT) {return Element.tand(self.c,self.p,r)}
  public func cosh_vml(_ r:MutPtrT) {return Element.cosh(self.c,self.p,r)}
  public func sinh_vml(_ r:MutPtrT) {return Element.sinh(self.c,self.p,r)}
  public func tanh_vml(_ r:MutPtrT) {return Element.tanh(self.c,self.p,r)}
  public func acos_vml(_ r:MutPtrT) {return Element.acos(self.c,self.p,r)}
  public func asin_vml(_ r:MutPtrT) {return Element.asin(self.c,self.p,r)}
  public func atan_vml(_ r:MutPtrT) {return Element.atan(self.c,self.p,r)}
  public func acospi_vml(_ r:MutPtrT) {return Element.acospi(self.c,self.p,r)}
  public func asinpi_vml(_ r:MutPtrT) {return Element.asinpi(self.c,self.p,r)}
  public func atanpi_vml(_ r:MutPtrT) {return Element.atanpi(self.c,self.p,r)}
  public func acosh_vml(_ r:MutPtrT) {return Element.acosh(self.c,self.p,r)}
  public func asinh_vml(_ r:MutPtrT) {return Element.asinh(self.c,self.p,r)}
  public func atanh_vml(_ r:MutPtrT) {return Element.atanh(self.c,self.p,r)}
  public func erf_vml(_ r:MutPtrT) {return Element.erf(self.c,self.p,r)}
  public func erfInv_vml(_ r:MutPtrT) {return Element.erfInv(self.c,self.p,r)}
  public func hypot_vml(_ b:PtrT, _ r:MutPtrT) {return Element.hypot(self.c,self.p,b,r)}
  public func erfc_vml(_ r:MutPtrT) {return Element.erfc(self.c,self.p,r)}
  public func erfcInv_vml(_ r:MutPtrT) {return Element.erfcInv(self.c,self.p,r)}
  public func cdfNorm_vml(_ r:MutPtrT) {return Element.cdfNorm(self.c,self.p,r)}
  public func cdfNormInv_vml(_ r:MutPtrT) {return Element.cdfNormInv(self.c,self.p,r)}
  public func lGamma_vml(_ r:MutPtrT) {return Element.lGamma(self.c,self.p,r)}
  public func tGamma_vml(_ r:MutPtrT) {return Element.tGamma(self.c,self.p,r)}
  public func atan2_vml(_ b:PtrT, _ r:MutPtrT) {return Element.atan2(self.c,self.p,b,r)}
  public func atan2pi_vml(_ b:PtrT, _ r:MutPtrT) {return Element.atan2pi(self.c,self.p,b,r)}
  public func mul_vml(_ b:PtrT, _ r:MutPtrT) {return Element.mul(self.c,self.p,b,r)}
  public func div_vml(_ b:PtrT, _ r:MutPtrT) {return Element.div(self.c,self.p,b,r)}
  public func pow_vml(_ b:PtrT, _ r:MutPtrT) {return Element.pow(self.c,self.p,b,r)}
  public func pow3o2_vml(_ r:MutPtrT) {return Element.pow3o2(self.c,self.p,r)}
  public func pow2o3_vml(_ r:MutPtrT) {return Element.pow2o3(self.c,self.p,r)}
  public func powx_vml(_ b:Element, _ r:MutPtrT) {return Element.powx(self.c,self.p,b,r)}
  public func powr_vml(_ b:PtrT, _ r:MutPtrT) {return Element.powr(self.c,self.p,b,r)}
  public func sinCos_vml(_ r1:MutPtrT, _ r2:MutPtrT) {return Element.sinCos(self.c,self.p,r1,r2)}
  public func linearFrac_vml(_ b:PtrT, _ scalea:Element, _ shifta:Element, _ scaleb:Element, _ shiftb:Element, _ r:MutPtrT) {return Element.linearFrac(self.c,self.p,b,scalea,shifta,scaleb,shiftb,r)}
  public func ceil_vml(_ r:MutPtrT) {return Element.ceil(self.c,self.p,r)}
  public func floor_vml(_ r:MutPtrT) {return Element.floor(self.c,self.p,r)}
  public func frac_vml(_ r:MutPtrT) {return Element.frac(self.c,self.p,r)}
  public func modf_vml(_ r1:MutPtrT, _ r2:MutPtrT) {return Element.modf(self.c,self.p,r1,r2)}
  public func fmod_vml(_ r1:MutPtrT, _ r2:MutPtrT) {return Element.fmod(self.c,self.p,r1,r2)}
  public func remainder_vml(_ r1:MutPtrT, _ r2:MutPtrT) {return Element.remainder(self.c,self.p,r1,r2)}
  public func nextAfter_vml(_ r1:MutPtrT, _ r2:MutPtrT) {return Element.nextAfter(self.c,self.p,r1,r2)}
  public func copySign_vml(_ r1:MutPtrT, _ r2:MutPtrT) {return Element.copySign(self.c,self.p,r1,r2)}
  public func fdim_vml(_ r1:MutPtrT, _ r2:MutPtrT) {return Element.fdim(self.c,self.p,r1,r2)}
  public func fmax_vml(_ r1:MutPtrT, _ r2:MutPtrT) {return Element.fmax(self.c,self.p,r1,r2)}
  public func fmin_vml(_ r1:MutPtrT, _ r2:MutPtrT) {return Element.fmin(self.c,self.p,r1,r2)}
  public func maxMag_vml(_ r1:MutPtrT, _ r2:MutPtrT) {return Element.maxMag(self.c,self.p,r1,r2)}
  public func minMag_vml(_ r1:MutPtrT, _ r2:MutPtrT) {return Element.minMag(self.c,self.p,r1,r2)}
  public func nearbyInt_vml(_ r:MutPtrT) {return Element.nearbyInt(self.c,self.p,r)}
  public func rint_vml(_ r:MutPtrT) {return Element.rint(self.c,self.p,r)}
  public func round_vml(_ r:MutPtrT) {return Element.round(self.c,self.p,r)}
  public func trunc_vml(_ r:MutPtrT) {return Element.trunc(self.c,self.p,r)}
  public func expInt1_vml(_ r:MutPtrT) {return Element.expInt1(self.c,self.p,r)}
  public func packI_vml(_ incra:Int, _ y:MutPtrT) {return Element.packI(self.c,self.p,incra,y)}
  public func packV_vml(_ ia:UnsafePointer<Int32>, _ y:MutPtrT) {return Element.packV(self.c,self.p,ia,y)}
  public func packM_vml(_ ma:UnsafePointer<Int32>, _ y:MutPtrT) {return Element.packM(self.c,self.p,ma,y)}
  public func unpackI_vml(_ y:MutPtrT, _ incry:Int) {return Element.unpackI(self.c,self.p,y,incry)}
  public func unpackV_vml(_ y:MutPtrT, _ iy:UnsafePointer<Int32>) {return Element.unpackV(self.c,self.p,y,iy)}
  public func unpackM_vml(_ y:MutPtrT, _ my:UnsafePointer<Int32>) {return Element.unpackM(self.c,self.p,y,my)}
  public func copy(_ pDst:MutPtrT) {return Element.copy(self.p,pDst,self.c)}
  public func move(_ pDst:MutPtrT) {return Element.move(self.p,pDst,self.c)}
  public func set(_ val:Element, _ pDst:MutPtrT) {return Element.set(val,pDst,self.c)}
  public func zero(_ pDst:MutPtrT) {return Element.zero(pDst,self.c)}
  public func triangle(_ pDst:MutPtrT, _ magn:Element, _ rFreq:Element, _ asym:Element, _ pPhase:MutPtrT) {return Element.triangle(pDst,self.c,magn,rFreq,asym,pPhase)}
  public func vectorJaehne(_ pDst:MutPtrT, _ magn:Element) {return Element.vectorJaehne(pDst,self.c,magn)}
  public func vectorSlope(_ pDst:MutPtrT, _ offset:Element, _ slope:Element) {return Element.vectorSlope(pDst,self.c,offset,slope)}
  public func addC(_ val:Element, _ pDst:MutPtrT) {return Element.addC(self.p,val,pDst,self.c)}
  public func add(_ pSrc2:PtrT, _ pDst:MutPtrT) {return Element.add(self.p,pSrc2,pDst,self.c)}
  public func addProductC(_ val:Element, _ pSrcDst:MutPtrT) {return Element.addProductC(self.p,val,pSrcDst,self.c)}
  public func addProduct(_ pSrc2:PtrT, _ pSrcDst:MutPtrT) {return Element.addProduct(self.p,pSrc2,pSrcDst,self.c)}
  public func mulC(_ val:Element, _ pDst:MutPtrT) {return Element.mulC(self.p,val,pDst,self.c)}
  public func mul(_ pSrc2:PtrT, _ pDst:MutPtrT) {return Element.mul(self.p,pSrc2,pDst,self.c)}
  public func subC(_ val:Element, _ pDst:MutPtrT) {return Element.subC(self.p,val,pDst,self.c)}
  public func subCRev(_ val:Element, _ pDst:MutPtrT) {return Element.subCRev(self.p,val,pDst,self.c)}
  public func sub(_ pSrc2:PtrT, _ pDst:MutPtrT) {return Element.sub(self.p,pSrc2,pDst,self.c)}
  public func divC(_ val:Element, _ pDst:MutPtrT) {return Element.divC(self.p,val,pDst,self.c)}
  public func div(_ pSrc2:PtrT, _ pDst:MutPtrT) {return Element.div(self.p,pSrc2,pDst,self.c)}
  public func abs(_ pDst:MutPtrT) {return Element.abs(self.p,pDst,self.c)}
  public func sqr(_ pDst:MutPtrT) {return Element.sqr(self.p,pDst,self.c)}
  public func sqrt(_ pDst:MutPtrT) {return Element.sqrt(self.p,pDst,self.c)}
  public func exp(_ pDst:MutPtrT) {return Element.exp(self.p,pDst,self.c)}
  public func ln(_ pDst:MutPtrT) {return Element.ln(self.p,pDst,self.c)}
  public func sumLn(_ pSum:MutPtrT) {return Element.sumLn(self.p,self.c,pSum)}
  public func arctan(_ pDst:MutPtrT) {return Element.arctan(self.p,pDst,self.c)}
  public func normalize(_ pDst:MutPtrT, _ vSub:Element, _ vDiv:Element) {return Element.normalize(self.p,pDst,self.c,vSub,vDiv)}
  public func magnitude(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT) {return Element.magnitude(pSrcRe,pSrcIm,pDst,self.c)}
  public func phase(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT) {return Element.phase(pSrcRe,pSrcIm,pDst,self.c)}
  public func powerSpectr(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT) {return Element.powerSpectr(pSrcRe,pSrcIm,pDst,self.c)}
  public func threshold_LT(_ pDst:MutPtrT, _ level:Element) {return Element.threshold_LT(self.p,pDst,self.c,level)}
  public func threshold_GT(_ pDst:MutPtrT, _ level:Element) {return Element.threshold_GT(self.p,pDst,self.c,level)}
  public func threshold_LTAbs(_ pDst:MutPtrT, _ level:Element) {return Element.threshold_LTAbs(self.p,pDst,self.c,level)}
  public func threshold_GTAbs(_ pDst:MutPtrT, _ level:Element) {return Element.threshold_GTAbs(self.p,pDst,self.c,level)}
  public func threshold_LTAbsVal(_ pDst:MutPtrT, _ level:Element, _ value:Element) {return Element.threshold_LTAbsVal(self.p,pDst,self.c,level,value)}
  public func threshold_LTVal(_ pDst:MutPtrT, _ level:Element, _ value:Element) {return Element.threshold_LTVal(self.p,pDst,self.c,level,value)}
  public func threshold_GTVal(_ pDst:MutPtrT, _ level:Element, _ value:Element) {return Element.threshold_GTVal(self.p,pDst,self.c,level,value)}
  public func threshold_LTValGTVal(_ pDst:MutPtrT, _ levelLT:Element, _ valueLT:Element, _ levelGT:Element, _ valueGT:Element) {return Element.threshold_LTValGTVal(self.p,pDst,self.c,levelLT,valueLT,levelGT,valueGT)}
  public func threshold_LTInv(_ pDst:MutPtrT, _ level:Element) {return Element.threshold_LTInv(self.p,pDst,self.c,level)}
  public func cartToPolar(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDstMagn:MutPtrT, _ pDstPhase:MutPtrT) {return Element.cartToPolar(pSrcRe,pSrcIm,pDstMagn,pDstPhase,self.c)}
  public func polarToCart(_ pSrcMagn:PtrT, _ pSrcPhase:PtrT, _ pDstRe:MutPtrT, _ pDstIm:MutPtrT) {return Element.polarToCart(pSrcMagn,pSrcPhase,pDstRe,pDstIm,self.c)}
  public func flip(_ pDst:MutPtrT) {return Element.flip(self.p,pDst,self.c)}
  public func winBartlett(_ pDst:MutPtrT) {return Element.winBartlett(self.p,pDst,self.c)}
  public func winHann(_ pDst:MutPtrT) {return Element.winHann(self.p,pDst,self.c)}
  public func winHamming(_ pDst:MutPtrT) {return Element.winHamming(self.p,pDst,self.c)}
  public func winBlackman(_ pDst:MutPtrT, _ alpha:Element) {return Element.winBlackman(self.p,pDst,self.c,alpha)}
  public func winBlackmanStd(_ pDst:MutPtrT) {return Element.winBlackmanStd(self.p,pDst,self.c)}
  public func winBlackmanOpt(_ pDst:MutPtrT) {return Element.winBlackmanOpt(self.p,pDst,self.c)}
  public func winKaiser(_ pDst:MutPtrT, _ alpha:Element) {return Element.winKaiser(self.p,pDst,self.c,alpha)}
  public func sum(_ pSum:MutPtrT) {return Element.sum(self.p,self.c,pSum)}
  public func min(_ pMin:MutPtrT) {return Element.min(self.p,self.c,pMin)}
  public func max(_ pMax:MutPtrT) {return Element.max(self.p,self.c,pMax)}
  public func minMax(_ pMin:MutPtrT, _ pMax:MutPtrT) {return Element.minMax(self.p,self.c,pMin,pMax)}
  public func minAbs(_ pMinAbs:MutPtrT) {return Element.minAbs(self.p,self.c,pMinAbs)}
  public func maxAbs(_ pMaxAbs:MutPtrT) {return Element.maxAbs(self.p,self.c,pMaxAbs)}
  public func minIndx(_ pMin:MutPtrT, _ pIndx:UnsafeMutablePointer<Int32>) {return Element.minIndx(self.p,self.c,pMin,pIndx)}
  public func maxIndx(_ pMax:MutPtrT, _ pIndx:UnsafeMutablePointer<Int32>) {return Element.maxIndx(self.p,self.c,pMax,pIndx)}
  public func minMaxIndx(_ pMin:MutPtrT, _ pMinIndx:UnsafeMutablePointer<Int32>, _ pMax:MutPtrT, _ pMaxIndx:UnsafeMutablePointer<Int32>) {return Element.minMaxIndx(self.p,self.c,pMin,pMinIndx,pMax,pMaxIndx)}
  public func mean(_ pMean:MutPtrT) {return Element.mean(self.p,self.c,pMean)}
  public func stdDev(_ pStdDev:MutPtrT) {return Element.stdDev(self.p,self.c,pStdDev)}
  public func meanStdDev(_ pMean:MutPtrT, _ pStdDev:MutPtrT) {return Element.meanStdDev(self.p,self.c,pMean,pStdDev)}
  public func norm_Inf(_ pNorm:MutPtrT) {return Element.norm_Inf(self.p,self.c,pNorm)}
  public func norm_L1(_ pNorm:MutPtrT) {return Element.norm_L1(self.p,self.c,pNorm)}
  public func norm_L2(_ pNorm:MutPtrT) {return Element.norm_L2(self.p,self.c,pNorm)}
  public func normDiff_Inf(_ pSrc2:PtrT, _ pNorm:MutPtrT) {return Element.normDiff_Inf(self.p,pSrc2,self.c,pNorm)}
  public func normDiff_L1(_ pSrc2:PtrT, _ pNorm:MutPtrT) {return Element.normDiff_L1(self.p,pSrc2,self.c,pNorm)}
  public func normDiff_L2(_ pSrc2:PtrT, _ pNorm:MutPtrT) {return Element.normDiff_L2(self.p,pSrc2,self.c,pNorm)}
  public func dotProd(_ pSrc2:PtrT, _ pDp:MutPtrT) {return Element.dotProd(self.p,pSrc2,self.c,pDp)}
  public func minEvery(_ pSrc2:PtrT, _ pDst:MutPtrT, _ len:UInt32) {return Element.minEvery(self.p,pSrc2,pDst,len)}
  public func maxEvery(_ pSrc2:PtrT, _ pDst:MutPtrT, _ len:UInt32) {return Element.maxEvery(self.p,pSrc2,pDst,len)}
  public func maxOrder(_ pOrder:UnsafeMutablePointer<Int32>) {return Element.maxOrder(self.p,self.c,pOrder)}
  public func sampleUp(_ srcLen:Int, _ pDst:MutPtrT, _ pDstLen:UnsafeMutablePointer<Int32>, _ factor:Int, _ pPhase:UnsafeMutablePointer<Int32>) {return Element.sampleUp(self.p,srcLen,pDst,pDstLen,factor,pPhase)}
  public func sampleDown(_ srcLen:Int, _ pDst:MutPtrT, _ pDstLen:UnsafeMutablePointer<Int32>, _ factor:Int, _ pPhase:UnsafeMutablePointer<Int32>) {return Element.sampleDown(self.p,srcLen,pDst,pDstLen,factor,pPhase)}
  public func filterMedian(_ pDst:MutPtrT, _ maskSize:Int, _ pDlySrc:PtrT, _ pDlyDst:MutPtrT, _ pBuffer:UnsafeMutablePointer<UInt8>) {return Element.filterMedian(self.p,pDst,self.c,maskSize,pDlySrc,pDlyDst,pBuffer)}
  public func floor(_ r:MutPtrT) {return Element.floor(self.p,r,self.c)}
  public func ceil(_ r:MutPtrT) {return Element.ceil(self.p,r,self.c)}
  public func trunc(_ r:MutPtrT) {return Element.trunc(self.p,r,self.c)}
  public func round(_ r:MutPtrT) {return Element.round(self.p,r,self.c)}
  public func rint(_ r:MutPtrT) {return Element.rint(self.p,r,self.c)}
  public func nearbyInt(_ r:MutPtrT) {return Element.nearbyInt(self.p,r,self.c)}
  public func modf(_ r1:MutPtrT, _ r2:MutPtrT) {return Element.modf(self.p,r1,r2,self.c)}
  public func frac(_ r:MutPtrT) {return Element.frac(self.p,r,self.c)}
  public func rngCauchy_vml(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return Element.rngCauchy(method,stream,self.c,r,a,b)}
  public func rngUniform_vml(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return Element.rngUniform(method,stream,self.c,r,a,b)}
  public func rngGaussian_vml(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return Element.rngGaussian(method,stream,self.c,r,a,b)}
  public func rngGaussianMV_vml(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:MutPtrT, _ dimen:Int, _ mstorage:Int32, _ t:PtrT)->Int32 {return Element.rngGaussianMV(method,stream,self.c,r,dimen,mstorage,self.p,t)}
  public func rngExponential_vml(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return Element.rngExponential(method,stream,self.c,r,a,b)}
  public func rngLaplace_vml(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return Element.rngLaplace(method,stream,self.c,r,a,b)}
  public func rngWeibull_vml(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:MutPtrT, _ a:Element, _ b:Element, _ c:Element)->Int32 {return Element.rngWeibull(method,stream,self.c,r,a,b,c)}
  public func rngRayleigh_vml(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return Element.rngRayleigh(method,stream,self.c,r,a,b)}
  public func rngLognormal_vml(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:MutPtrT, _ a:Element, _ b:Element, _ c:Element, _ d:Element)->Int32 {return Element.rngLognormal(method,stream,self.c,r,a,b,c,d)}
  public func rngGumbel_vml(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return Element.rngGumbel(method,stream,self.c,r,a,b)}
  public func rngGamma_vml(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:MutPtrT, _ a:Element, _ b:Element, _ c:Element)->Int32 {return Element.rngGamma(method,stream,self.c,r,a,b,c)}
  public func rngBeta_vml(_ method:Int32, _ stream:VSLStreamStatePtr, _ r:MutPtrT, _ a:Element, _ b:Element, _ c:Element, _ d:Element)->Int32 {return Element.rngBeta(method,stream,self.c,r,a,b,c,d)}

  func new_call(_ f:(Self)         ->()              )->Self { let res = new(); f(      res); return res }
  func new_call(_ f:(Self, Self)   ->(), _ b:Self    )->Self { let res = new(); f(b,    res); return res }
  func new_call<T>(_ f:(T, Self)   ->(), _ b:T       )->Self { let res = new(); f(b,    res); return res }
  func new_call<T>(_ f:(T, T, Self)->(), _ b:T, _ c:T)->Self { let res = new(); f(b, c, res); return res }

  func new_call<T>(_ f:(T, Self)->(), _ b:T, n:Int)->Self { let res = new(n); f(b, res); return res }
  func new_call<T>(_ f:(T, T, Self)->(), _ b:T, _ c:T, n:Int)->Self { let res = new(n); f(b, c, res); return res }

  public func asum()->Element { return asum_cblas(1) }
  public func nrm2()->Element { return nrm2_cblas(1) }
  public func dot(_ b:Self)->Element { return dot_cblas(1, b.p, 1) }
  public func set(_ b: Element) { set(b,p) }
  public func zero() { zero(p) }
  public func move(_ b:Self, _ n:Int) { Element.move(p, b.p, n) }
  public func move(_ b:Self, _ n:Int, fromIdx:Int, toIdx:Int) { _=Element.move(p+fromIdx, b.p+toIdx, n) }

  public func ln(_ dest: Self) { ln_vml(dest.p) }
  public func ln_() { ln(self) }
  public func ln() -> Self  { return new_call(ln) }
  public func abs(_ dest: Self) { abs_vml(dest.p) }
  public func abs_() { abs(self) }
  public func abs() -> Self  { return new_call(abs) }
  public func inv(_ dest: Self) { inv_vml(dest.p) }
  public func inv_() { inv(self) }
  public func inv() -> Self  { return new_call(inv) }
  public func sqr(_ dest: Self) { sqr_vml(dest.p) }
  public func sqr_() { sqr(self) }
  public func sqr() -> Self  { return new_call(sqr) }
  public func exp(_ dest: Self) { exp_vml(dest.p) }
  public func exp_() { exp(self) }
  public func exp() -> Self  { return new_call(exp) }
  public func cos(_ dest: Self) { cos_vml(dest.p) }
  public func cos_() { cos(self) }
  public func cos() -> Self  { return new_call(cos) }
  public func sin(_ dest: Self) { sin_vml(dest.p) }
  public func sin_() { sin(self) }
  public func sin() -> Self  { return new_call(sin) }
  public func tan(_ dest: Self) { tan_vml(dest.p) }
  public func tan_() { tan(self) }
  public func tan() -> Self  { return new_call(tan) }
  public func erf(_ dest: Self) { erf_vml(dest.p) }
  public func erf_() { erf(self) }
  public func erf() -> Self  { return new_call(erf) }
  public func sqrt(_ dest: Self) { sqrt_vml(dest.p) }
  public func sqrt_() { sqrt(self) }
  public func sqrt() -> Self  { return new_call(sqrt) }
  public func cbrt(_ dest: Self) { cbrt_vml(dest.p) }
  public func cbrt_() { cbrt(self) }
  public func cbrt() -> Self  { return new_call(cbrt) }
  public func cosh(_ dest: Self) { cosh_vml(dest.p) }
  public func cosh_() { cosh(self) }
  public func cosh() -> Self  { return new_call(cosh) }
  public func sinh(_ dest: Self) { sinh_vml(dest.p) }
  public func sinh_() { sinh(self) }
  public func sinh() -> Self  { return new_call(sinh) }
  public func tanh(_ dest: Self) { tanh_vml(dest.p) }
  public func tanh_() { tanh(self) }
  public func tanh() -> Self  { return new_call(tanh) }
  public func acos(_ dest: Self) { acos_vml(dest.p) }
  public func acos_() { acos(self) }
  public func acos() -> Self  { return new_call(acos) }
  public func asin(_ dest: Self) { asin_vml(dest.p) }
  public func asin_() { asin(self) }
  public func asin() -> Self  { return new_call(asin) }
  public func atan(_ dest: Self) { atan_vml(dest.p) }
  public func atan_() { atan(self) }
  public func atan() -> Self  { return new_call(atan) }
  public func erfc(_ dest: Self) { erfc_vml(dest.p) }
  public func erfc_() { erfc(self) }
  public func erfc() -> Self  { return new_call(erfc) }
  public func ceil(_ dest: Self) { ceil_vml(dest.p) }
  public func ceil_() { ceil(self) }
  public func ceil() -> Self  { return new_call(ceil) }
  public func rint(_ dest: Self) { rint_vml(dest.p) }
  public func rint_() { rint(self) }
  public func rint() -> Self  { return new_call(rint) }
  public func expm1(_ dest: Self) { expm1_vml(dest.p) }
  public func expm1_() { expm1(self) }
  public func expm1() -> Self  { return new_call(expm1) }
  public func log10(_ dest: Self) { log10_vml(dest.p) }
  public func log10_() { log10(self) }
  public func log10() -> Self  { return new_call(log10) }
  public func log1p(_ dest: Self) { log1p_vml(dest.p) }
  public func log1p_() { log1p(self) }
  public func log1p() -> Self  { return new_call(log1p) }
  public func acosh(_ dest: Self) { acosh_vml(dest.p) }
  public func acosh_() { acosh(self) }
  public func acosh() -> Self  { return new_call(acosh) }
  public func asinh(_ dest: Self) { asinh_vml(dest.p) }
  public func asinh_() { asinh(self) }
  public func asinh() -> Self  { return new_call(asinh) }
  public func atanh(_ dest: Self) { atanh_vml(dest.p) }
  public func atanh_() { atanh(self) }
  public func atanh() -> Self  { return new_call(atanh) }
  public func floor(_ dest: Self) { floor_vml(dest.p) }
  public func floor_() { floor(self) }
  public func floor() -> Self  { return new_call(floor) }
  public func round(_ dest: Self) { round_vml(dest.p) }
  public func round_() { round(self) }
  public func round() -> Self  { return new_call(round) }
  public func trunc(_ dest: Self) { trunc_vml(dest.p) }
  public func trunc_() { trunc(self) }
  public func trunc() -> Self  { return new_call(trunc) }
  public func erfInv(_ dest: Self) { erfInv_vml(dest.p) }
  public func erfInv_() { erfInv(self) }
  public func erfInv() -> Self  { return new_call(erfInv) }
  public func pow3o2(_ dest: Self) { pow3o2_vml(dest.p) }
  public func pow3o2_() { pow3o2(self) }
  public func pow3o2() -> Self  { return new_call(pow3o2) }
  public func pow2o3(_ dest: Self) { pow2o3_vml(dest.p) }
  public func pow2o3_() { pow2o3(self) }
  public func pow2o3() -> Self  { return new_call(pow2o3) }
  public func invSqrt(_ dest: Self) { invSqrt_vml(dest.p) }
  public func invSqrt_() { invSqrt(self) }
  public func invSqrt() -> Self  { return new_call(invSqrt) }
  public func invCbrt(_ dest: Self) { invCbrt_vml(dest.p) }
  public func invCbrt_() { invCbrt(self) }
  public func invCbrt() -> Self  { return new_call(invCbrt) }
  public func nearbyInt(_ dest: Self) { nearbyInt_vml(dest.p) }
  public func nearbyInt_() { nearbyInt(self) }
  public func nearbyInt() -> Self  { return new_call(nearbyInt) }

  public func add(_ b:Self, _ dest:Self) { add_vml(b.p, dest.p) }
  public func add_(_ b:Self) { add(b, self) }
  public func add(_ b:Self)->Self { return new_call(add, b) }
  public func sub(_ b:Self, _ dest:Self) { sub_vml(b.p, dest.p) }
  public func sub_(_ b:Self) { sub(b, self) }
  public func sub(_ b:Self)->Self { return new_call(sub, b) }
  public func mul(_ b:Self, _ dest:Self) { mul_vml(b.p, dest.p) }
  public func mul_(_ b:Self) { mul(b, self) }
  public func mul(_ b:Self)->Self { return new_call(mul, b) }
  public func div(_ b:Self, _ dest:Self) { div_vml(b.p, dest.p) }
  public func div_(_ b:Self) { div(b, self) }
  public func div(_ b:Self)->Self { return new_call(div, b) }
  public func pow(_ b:Self, _ dest:Self) { pow_vml(b.p, dest.p) }
  public func pow_(_ b:Self) { pow(b, self) }
  public func pow(_ b:Self)->Self { return new_call(pow, b) }
  public func hypot(_ b:Self, _ dest:Self) { hypot_vml(b.p, dest.p) }
  public func hypot_(_ b:Self) { hypot(b, self) }
  public func hypot(_ b:Self)->Self { return new_call(hypot, b) }
  public func atan2(_ b:Self, _ dest:Self) { atan2_vml(b.p, dest.p) }
  public func atan2_(_ b:Self) { atan2(b, self) }
  public func atan2(_ b:Self)->Self { return new_call(atan2, b) }

  public func subCRev(_ b:Element, _ dest:Self) { subCRev(b, dest.p) }
  public func subCRev_(_ b:Element) { subCRev(b, self) }
  public func subCRev(_ b:Element)->Self { return new_call(subCRev, b) }
  public func divCRev(_ b:Element, _ dest:Self) { divCRev(b, dest.p) }
  public func divCRev_(_ b:Element) { divCRev(b, self) }
  public func divCRev(_ b:Element)->Self { return new_call(divCRev, b) }
  public func addC(_ b:Element, _ dest:Self) { addC(b, dest.p) }
  public func addC_(_ b:Element) { addC(b, self) }
  public func addC(_ b:Element)->Self { return new_call(addC, b) }
  public func subC(_ b:Element, _ dest:Self) { subC(b, dest.p) }
  public func subC_(_ b:Element) { subC(b, self) }
  public func subC(_ b:Element)->Self { return new_call(subC, b) }
  public func mulC(_ b:Element, _ dest:Self) { mulC(b, dest.p) }
  public func mulC_(_ b:Element) { mulC(b, self) }
  public func mulC(_ b:Element)->Self { return new_call(mulC, b) }
  public func divC(_ b:Element, _ dest:Self) { divC(b, dest.p) }
  public func divC_(_ b:Element) { divC(b, self) }
  public func divC(_ b:Element)->Self { return new_call(divC, b) }

  // IPP convenience functions
  typealias ippFuncReduce = (UnsafePointer<Element>,Int,MutPtrT)->()
  func ipp_reduce(_ f:(MutPtrT)->())->Element { var res:Element=Element.init(); f(&res); return res }
  func ipp_reduce(_ f:ippFuncReduce)->Element { return ipp_reduce({f(p, c, $0)}) }

  public func sum()->Element { return ipp_reduce(sum) }
  public func mean()->Element { return ipp_reduce(mean) }
  public func stdDev()->Element { return ipp_reduce(stdDev) }
  public func max()->Element { return ipp_reduce(max) }
  public func min()->Element { return ipp_reduce(min) }

  public func normDiff_Inf(_ b:Self)->Element {return ipp_reduce({normDiff_Inf(b.p, $0)})}
  public func normDiff_L1(_ b:Self)->Element {return ipp_reduce({normDiff_L1(b.p, $0)})}
  public func normDiff_L2(_ b:Self)->Element {return ipp_reduce({normDiff_L2(b.p, $0)})}

  public func powx(_ b:Element, _ dest:Self) { powx_vml(b, dest.p) }
  public func powx_(_ b:Element) { powx(b, self) }
  public func powx(_ b:Element)->Self { return new_call(powx, b) }

  public static func .+  (lhs:Self, rhs:Self  ) -> Self { return lhs.add(  rhs) }
  public static func .+  (lhs:Self, rhs:Element) -> Self { return lhs.addC( rhs) }
  public static func .+= (lhs:Self, rhs:Self  )         {        lhs.add_( rhs) }
  public static func .+= (lhs:Self, rhs:Element)         {        lhs.addC_(rhs) }
  public static func .-  (lhs:Self, rhs:Self  ) -> Self { return lhs.sub(  rhs) }
  public static func .-  (lhs:Self, rhs:Element) -> Self { return lhs.subC( rhs) }
  public static func .-= (lhs:Self, rhs:Self  )         {        lhs.sub_( rhs) }
  public static func .-= (lhs:Self, rhs:Element)         {        lhs.subC_(rhs) }
  public static func .*  (lhs:Self, rhs:Self  ) -> Self { return lhs.mul(  rhs) }
  public static func .*  (lhs:Self, rhs:Element) -> Self { return lhs.mulC( rhs) }
  public static func .*= (lhs:Self, rhs:Self  )         {        lhs.mul_( rhs) }
  public static func .*= (lhs:Self, rhs:Element)         {        lhs.mulC_(rhs) }
  public static func ./  (lhs:Self, rhs:Self  ) -> Self { return lhs.div(  rhs) }
  public static func ./  (lhs:Self, rhs:Element) -> Self { return lhs.divC( rhs) }
  public static func ./= (lhs:Self, rhs:Self  )         {        lhs.div_( rhs) }
  public static func ./= (lhs:Self, rhs:Element)         {        lhs.divC_(rhs) }
  public static func .+  (lhs:Element, rhs:Self) -> Self { return rhs.addC(  lhs) }
  public static func .-  (lhs:Element, rhs:Self) -> Self { return rhs.subCRev(  lhs) }
  public static func .*  (lhs:Element, rhs:Self) -> Self { return rhs.mulC(  lhs) }
  public static func ./  (lhs:Element, rhs:Self) -> Self { return rhs.divCRev(  lhs) }

  public func packIncrement(_ incr:Int, _ from:Int, _ n:Int, _ dest:Self) { Element.packI(n, p+from, incr, dest.p) }
  public func packIncrement(_ incr:Int, _ from:Int, _ n:Int)->Self {
    let res = new(n); packIncrement(incr, from, n, res); return res
  }
  public func packIndices(_ idxs:[Int32], _ dest:Self) { Element.packV(idxs.count, p, idxs, dest.p) }
  public func packIndices(_ idxs:[Int32])->Self { return new_call(packIndices, idxs, n:idxs.count) }
  public func packMasked(_ mask:[Int32], _ dest:Self) { Element.packM(c, p, mask, dest.p) }
  public func packMasked(_ mask:[Int32])->Self { return new_call(packMasked, mask, n:Int(mask.reduce(0,+))) }
}

