from pdb import set_trace
from mkl_funcs import *
import re

def lower1(s): return s[:1].lower() + s[1:]

typ_typs = (('Float', 's', '32'), ('Double', 'd', '64'))

# _Mkl_Api(void,vsLog1p,(const MKL_INT n,  const float  a[], float  r[]))
vml1 = """Ln Abs Inv Sqr Exp Cos Sin Tan Erf Sqrt Cbrt Cosh Sinh Tanh Acos Asin Atan Erfc Ceil Rint Expm1 Log10 Log1p
  Acosh Asinh Atanh Floor Round Trunc ErfInv Pow3o2 Pow2o3 InvSqrt InvCbrt NearbyInt """.split()
# _Mkl_Api(void,vsAtan2,(const MKL_INT n, const float a[], const float b[], float r[]))
vml2 = "Add Sub Mul Div Pow Hypot Atan2".split()
# float  cblas_sasum(const MKL_INT N, const float *X, const MKL_INT incX)
mkl1 = "asum nrm2 dot".split()
# IPPAPI(IppStatus, ippsStdDev_32f, (const Ipp32f* pSrc, int len, Ipp32f* pStdDev, IppHintAlgorithm hint))
ipp1 = "Sum Mean StdDev Max Min".split()
# IPPAPI(IppStatus, ippsAddC_32f, (const Ipp32f* pSrc, Ipp32f val, Ipp32f* pDst, int len))
ipp2 = "SubCRev AddC SubC MulC DivC".split()
# IPPAPI(IppStatus, ippsNormDiff_Inf_32f, (const Ipp32f* pSrc1, const Ipp32f* pSrc2, int len, Ipp32f* pNorm))
ipp3 = "NormDiff_Inf NormDiff_L1 NormDiff_L2".split()
vmls = vml1+vml2+"Powx PackI PackV PackM".split()
mkls = mkl1
ipps = ipp1+ipp2+ipp3 + "Set Zero Move".split()

params_re = r'\((?P<ps>[^)]+)\)'
func_re = r'(?P<f>[\w]+)'
ret_re  = r'(?P<r>[\w]+)'
l_re = r'(?P<l>[sd])'
vml_re = fr"_Mkl_Api\({ret_re},v{l_re}{func_re},{params_re}\)"
mkl_re = fr"{ret_re} cblas_{l_re}{func_re}{params_re}"
n_re = r'(?P<l>32f|64f)'
ipp_re = fr"IPPAPI\({ret_re}, ipps{func_re}_{n_re}, {params_re}\)"

def param(p):
    replace = (
        (r'const float XX\[\]', 'PtrT'),
        (r'const int XX\[\]', 'UnsafePointer<Int32>'),
        (r'const MKL_INT XX\[\]', 'UnsafePointer<Int32>'),
        (r'float XX\[\]', 'MutPtrT'),
        (r'int XX\[\]', 'UnsafeMutablePointer<Int32>'),
        (r'MKL_INT XX\[\]', 'UnsafeMutablePointer<Int32>'),
        (r'const float \*XX', 'PtrT'),
        (r'const float XX', 'T'),
        (r'const Ipp32f\* XX', 'PtrT'),
        (r'Ipp32f\* XX', 'MutPtrT'),
        (r'Ipp32f XX', 'T'),
        ('const MKL_INT XX', 'Int32'),
        ('int XX', 'Int32'),
        ('IppHintAlgorithm XX', 'IppHintAlgorithm'),
    )
    #if "ia[]" in p: set_trace()
    for r1,r2 in replace:
        r1 = re.sub('XX', r'([\w]+)', r1)
        p = re.sub(r1, fr'\1:{r2}', p)
    if ':' not in p: raise Exception(f"Unknown type in: {p}")
    return p.split(':')

def parse_h(h, inp_re):
    inp = re.sub(' +', ' ', h)
    #print(inp)
    gs = re.search(inp_re, inp)
    ps = gs.group('ps')
    ps = re.split(r', *', ps)
    ps = [param(p) for p in ps]
    return gs, ps

def param2str(ps):
    res = [f'_ {n}:{t}' for n,t in ps if t != 'IppHintAlgorithm']
    return ', '.join(res)

def param2call(ps, t):
    res = [f'{"ippAlgHintFast" if n=="hint" else n}' for n,ty in ps if (ty != 'IppHintAlgorithm') or (t=="Float")]
    return ','.join(res)

def get_ret(r):
    if r in ('void','IppStatus'): return ''
    if r.lower() in ("float","double"): r = "T"
    return f"->{r}"

def parse_det(h, inp_re):
    gs,ps = parse_h(h, inp_re)
    pstr = param2str(ps)
    ret = get_ret(gs.group("r"))
    uname = gs.group("f")
    lname = lower1(uname)
    return pstr,ret,uname,lname,gs

def get_decl(h, inp_re):
    pstr,ret,uname,lname,gs = parse_det(h, inp_re)
    return f'{lname}({pstr}){ret}'

def parse_call(h, inp_re, t):
    gs,ps = parse_h(h, inp_re)
    pstr = param2call(ps, t)
    ret = get_ret(gs.group("r"))
    if ret: ret='return '
    uname = gs.group("f")
    lname = lower1(uname)
    return pstr,ret,uname,lname,gs

def get_vml_name(n,t='Float'): return f'v{"s" if t=="Float" else "d"}{n}'
def get_vml_impl(h,t):
    pstr,ret,uname,lname,gs = parse_call(h, vml_re, t)
    return f'{ret}{get_vml_name(uname,t)}({pstr})'

def get_mkl_name(n,t='Float'): return f'cblas_{"s" if t=="Float" else "d"}{n}'
def get_mkl_impl(h,t):
    pstr,ret,uname,lname,gs = parse_call(h, mkl_re, t)
    return f'{ret}{get_mkl_name(uname,t)}({pstr})'

def get_ipp_name(n,t='Float'): return f'ipps{n}_{"32f" if t=="Float" else "64f"}'
def get_ipp_impl(h,t):
    pstr,ret,uname,lname,gs = parse_call(h, ipp_re, t)
    return f'_={get_ipp_name(uname,t)}({pstr})'

def test_parse() :
    vml1_in = "_Mkl_Api(void,vsLog1p,(const MKL_INT n,  const float  a[], float  r[]))"
    vml2_in = "_Mkl_Api(void,vsAtan2,(const MKL_INT n, const float a[], const float b[], float r[]))"
    mkl1_in = "float  cblas_sasum(const MKL_INT N, const float *X, const MKL_INT incX)"
    ipp1_in = "IPPAPI(IppStatus, ippsStdDev_32f,   (const Ipp32f* pSrc, int len, Ipp32f* pStdDev, IppHintAlgorithm hint))"
    ipp2_in = "IPPAPI(IppStatus, ippsAddC_32f, (const Ipp32f* pSrc, Ipp32f val, Ipp32f* pDst, int len))"
    ipp3_in = "IPPAPI(IppStatus, ippsNormDiff_Inf_32f,  (const Ipp32f* pSrc1, const Ipp32f* pSrc2, int len, Ipp32f* pNorm))"
    all_in = (vml1_in, vml2_in, mkl1_in, ipp1_in, ipp2_in, ipp3_in)

    vml1_exp_decl = "log1p(_ n:Int32, _ a:PtrT, _ r:PtrT)"
    vml2_exp_decl = "atan2(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:PtrT)"
    mkl1_exp_decl = "asum(_ N:Int32, _ X:PtrT, _ incX:Int32)->T"
    ipp1_exp_decl = "stdDev(_ pSrc:PtrT, _ len:Int32, _ pStdDev:MutPtrT)->IppStatus"
    ipp2_exp_decl = "addC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32)->IppStatus"
    ipp3_exp_decl = "normDiff_Inf(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pNorm:MutPtrT)->IppStatus"
    all_exp_decl = (vml1_exp_decl, vml2_exp_decl, mkl1_exp_decl, ipp1_exp_decl, ipp2_exp_decl, ipp3_exp_decl)

    vml1_exp_impl = "vsLog1p(n,a,r)"
    vml2_exp_impl = "vsAtan2(n,a,b,r)"
    mkl1_exp_impl = "return cblas_sasum(N,X,incX)"
    ipp1_exp_impl =  "return ippsStdDev_32f(pSrc,len,pStdDev,hint)"
    ipp1b_exp_impl = "return ippsStdDev_64f(pSrc,len,pStdDev)"
    ipp2_exp_impl = "return ippsAddC_32f(pSrc,val,pDst,len)"
    ipp3_exp_impl = "return ippsNormDiff_Inf_32f(pSrc1,pSrc2,len,pNorm)"
    all_exp_impl = (vml1_exp_impl, vml2_exp_impl, mkl1_exp_impl, ipp1_exp_impl, ipp2_exp_impl, ipp3_exp_impl)

    res = [f(inp,"Float") for inp,f in
           zip(all_in, [get_vml_impl,get_vml_impl,get_mkl_impl,get_ipp_impl,get_ipp_impl,get_ipp_impl])]
    for a,b in zip(all_exp_impl, res):
        print(a,b)
        assert a==b
    assert get_ipp_impl(ipp1_in, False) == ipp1b_exp_impl

    res = [get_decl(inp,inp_re) for inp,inp_re in
           zip(all_in, [vml_re,vml_re,mkl_re,ipp_re,ipp_re,ipp_re])]
    for a,b in zip(all_exp_decl, res):
        print(a,b)
        assert a==b

if __name__=='__main__': test_parse()

