from funcs import *

def any_contains(s, l):
    for o in l:
        if o.search(s): return True
    return False

h_path = '../mklh/all_headers'
lines = open(h_path).readlines()

def get_lines(f, names):
    funcs = [re.compile(fr'\W{f(o)}\W') for o in names]
    return [o.strip() for o in lines if any_contains(o, funcs)]

mkl_lines = get_lines(get_mkl_name, mkls)
vml_lines = get_lines(get_vml_name, vmls)
ipp_lines = get_lines(get_ipp_name, ipps)
f = open('mkl_funcs.py', 'w')
print(f'mkl_lines={mkl_lines}', file=f)
print(f'vml_lines={vml_lines}', file=f)
print(f'ipp_lines={ipp_lines}', file=f)

