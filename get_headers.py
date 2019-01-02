"""
Since it takes a long time to find the right header lines in MKL,
this script copies just the ones we need into a new file called 'mkl_funcs.py'.
"""

def get_lines(fn): return [o.strip() for o in open(fn).readlines()]

mkl_lines,vml_lines,ipp_lines,rng_lines,rngi_lines = map(get_lines,
    ('all_cblas','all_vml','all_ipps','all_rng','all_rngi'))

f = open('mkl_funcs.py', 'w')
print('### AUTO-GENERATED BY get_headers.py ###\n', file=f)
for o in 'cblas vml ipps rng rngi'.split():
    print(f'{o}_lines={get_lines("all_"+o)}', file=f)

