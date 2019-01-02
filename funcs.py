"""
Read MKL headers and convert them in to a form usable in Swift.
Uses hacky regexes. Would be better if it used a real parser.
To support new types, edit the `replace` tuple below.
"""

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
ipp2  = "SubCRev AddC SubC MulC DivC".split()
# No 'C' needed in names in Swift, due to function overloading
ipp2b = "SubRev  Add  Sub  Mul  Div ".split()
# IPPAPI(IppStatus, ippsNormDiff_Inf_32f, (const Ipp32f* pSrc1, const Ipp32f* pSrc2, int len, Ipp32f* pNorm))
ipp3 = "NormDiff_Inf NormDiff_L1 NormDiff_L2".split()
vmls = vml1+vml2+"Powx PackI PackV PackM".split()
mkls = mkl1
ipps = ipp1+ipp2+ipp3 + "Set Zero Move".split()

def word(name): return fr'(?P<{name}>[\w]+)'
params_re = r'\((?P<ps>[^)]+)\)'
func_re = word("f")
ret_re  = word("r")
l_re = r'(?P<l>[sd])'
n_re = r'(?P<l>32f|64f)'
vml_re = re.compile(fr"_Mkl_Api\( *{ret_re}, *v{l_re}{func_re}, *{params_re}\)")
mkl_re = re.compile(fr"{ret_re} cblas_{l_re}{func_re}{params_re}")
ipp_re = re.compile(fr"IPPAPI\( *{ret_re}, *ipps{func_re}_{n_re}, *{params_re}\)")

param_re = re.compile(fr'(?P<const>const *)?{word("t")} *(?P<ptr>\*?) *{word("name")}(?P<arr>\[\])?')

type_replace = dict(
    MKL_INT='Int32',
    double='Double', float='Float', int='Int32',
    Ipp64f='Double', Ipp32f='Float',
    Ipp64s='Int64',  Ipp32s='Int32',  Ipp16s='Int16',  Ipp8s ='Int8',
    Ipp64u='UInt64', Ipp32u='UInt32', Ipp16u='UInt16', Ipp8u ='UInt8',
    void='Void'
)
no_replace = set("CBLAS_LAYOUT CBLAS_TRANSPOSE CBLAS_UPLO CBLAS_DIAG CBLAS_SIDE CBLAS_IDENTIFIER IppHintAlgorithm".split())

def c2swift(s):
    m = param_re.search(s)
    is_ptr = m.group('ptr') or m.group('arr')
    t = m.group('t')
    if t not in no_replace: t = type_replace[t]
    if is_ptr:
        if t=='Float':  t = f"{'PtrT'          if m.group('const') else 'MutPtrT'}"
        elif t=='Void': t = 'UnsafeRawPointer'
        else:           t = f"{'UnsafePointer' if m.group('const') else 'UnsafeMutablePointer'}<{t}>"
    else:
        if t=='Float': t = "T"
    name = m.group('name')
    return name,t

def vml_name(n,t='Float'): return f'v{"s" if t=="Float" else "d"}{n}'
def mkl_name(n,t='Float'): return f'cblas_{"s" if t=="Float" else "d"}{n}'
def ipp_name(n,t='Float'): return f'ipps{n}_{"32f" if t=="Float" else "64f"}'
name_lu = dict(vml=vml_name, cblas=mkl_name, ipp=ipp_name)

class MklHeader():
    def __init__(self,h):
        h = re.sub(' +', ' ', h)
        self.source = 'cblas'
        parsed = re.search(mkl_re, h)
        if not parsed:
            self.source = 'ipp'
            parsed = re.search(ipp_re, h)
        if not parsed:
            self.source = 'vml'
            parsed = re.search(vml_re, h)
        if not parsed: raise Exception(f'Failed to match: {h}')

        ps,self.uname,self.ret,self.type = [parsed.group(o) for o in ("ps","f","r","l")]
        ps = re.split(r', *', ps)
        try: ps = [c2swift(p) for p in ps]
        except Exception as e: raise Exception(f"{e}:\n{inp}\n{param_re}")
        self.parsed = parsed
        self.params = ps
        self.lname = lower1(self.uname)

    def decl(self,t):
        r = self.ret
        if r in ('void','IppStatus'): r = ''
        elif r not in no_replace: r = type_replace[r]
        if r == "Float": r = "T"
        if r: r = f"->{r}"
        params = [f'_ {n}:{t}' for n,t in self.params if t != 'IppHintAlgorithm']
        pstr = ', '.join(params)
        return f'{self.lname}({pstr}){r}'

    def impl(self,t):
        params = [f'{"ippAlgHintFast" if n=="hint" else n}'
                  for n,ty in self.params if (ty != 'IppHintAlgorithm') or (t=="Float")]
        pstr = ','.join(params)
        if self.ret=='IppStatus': ret='_='
        elif self.ret and (self.ret != 'void'): ret='return '
        else: ret=''
        f_name = name_lu[self.source]
        return f'{ret}{f_name(self.uname,t)}({pstr})'

def test_parse() :
    vml1_in = "_Mkl_Api(void,vsLog1p,(const MKL_INT n,  const float  a[], float  r[]))"
    vml2_in = "_Mkl_Api(void,vsAtan2,(const MKL_INT n, const float a[], const float b[], float r[]))"
    mkl1_in = "float  cblas_sasum(const MKL_INT N, const float *X, const MKL_INT incX)"
    ipp1_in = "IPPAPI(IppStatus, ippsStdDev_32f,   (const Ipp32f* pSrc, int len, Ipp32f* pStdDev, IppHintAlgorithm hint))"
    ipp2_in = "IPPAPI(IppStatus, ippsAddC_32f, (const Ipp32f* pSrc, Ipp32f val, Ipp32f* pDst, int len))"
    ipp3_in = "IPPAPI(IppStatus, ippsNormDiff_Inf_32f,  (const Ipp32f* pSrc1, const Ipp32f* pSrc2, int len, Ipp32f* pNorm))"
    all_in = (vml1_in, vml2_in, mkl1_in, ipp1_in, ipp2_in, ipp3_in)

    vml1_exp_decl = "log1p(_ n:Int32, _ a:PtrT, _ r:MutPtrT)"
    vml2_exp_decl = "atan2(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)"
    mkl1_exp_decl = "asum(_ N:Int32, _ X:PtrT, _ incX:Int32)->T"
    ipp1_exp_decl = "stdDev(_ pSrc:PtrT, _ len:Int32, _ pStdDev:MutPtrT)"
    ipp2_exp_decl = "addC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32)"
    ipp3_exp_decl = "normDiff_Inf(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pNorm:MutPtrT)"
    all_exp_decl = (vml1_exp_decl, vml2_exp_decl, mkl1_exp_decl, ipp1_exp_decl, ipp2_exp_decl, ipp3_exp_decl)

    vml1_exp_impl = "vsLog1p(n,a,r)"
    vml2_exp_impl = "vsAtan2(n,a,b,r)"
    mkl1_exp_impl = "return cblas_sasum(N,X,incX)"
    ipp1_exp_impl =  "_=ippsStdDev_32f(pSrc,len,pStdDev,ippAlgHintFast)"
    ipp1b_exp_impl = "_=ippsStdDev_64f(pSrc,len,pStdDev)"
    ipp2_exp_impl = "_=ippsAddC_32f(pSrc,val,pDst,len)"
    ipp3_exp_impl = "_=ippsNormDiff_Inf_32f(pSrc1,pSrc2,len,pNorm)"
    all_exp_impl = (vml1_exp_impl, vml2_exp_impl, mkl1_exp_impl, ipp1_exp_impl, ipp2_exp_impl, ipp3_exp_impl)

    for inp,decl,impl in zip(all_in, all_exp_decl, all_exp_impl):
        c = MklHeader(inp)
        res = c.decl('Float')
        assert res == decl, f'{res}\n{decl}'
        res = c.impl('Float')
        assert res == impl, f'{res}\n{impl}'

    c = MklHeader(ipp1_in)
    assert c.decl('Double') == ipp1_exp_decl
    assert c.impl('Double') == ipp1b_exp_impl

    print("done")

if __name__=='__main__': test_parse()

