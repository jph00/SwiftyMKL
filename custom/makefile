UNAME = ${shell uname}
ifeq ($(UNAME), Darwin)
lib_suf = dylib
default_root = /opt/intel
else ifeq ($(UNAME), Linux)
lib_suf = so
default_root = $(HOME)/intel
endif

ifndef IPLROOT
IPLROOT = $(default_root)/compilers_and_libraries/linux
endif

ifndef MKLROOT
MKLROOT = $(IPLROOT)/mkl
endif

ifndef IPPROOT
IPPROOT = $(IPLROOT)/ipp
endif

export := list_ipl

mkl_libpath=$(MKLROOT)/lib/intel64
ipp_libpath=$(IPPROOT)/lib/intel64
compiler_libpath=$(IPLROOT)/compiler/lib/intel64
$(info $(mkl_libpath))
$(info $(ipp_libpath))

mkl_libs := mkl_intel_lp64 mkl_sequential mkl_core
ipp_libs := ipps ippvm ippcore
ipl_libs := $(addprefix $(mkl_libpath)/lib,$(mkl_libs)) $(addprefix $(ipp_libpath)/lib,$(ipp_libs))
ipl_libs := $(addsuffix .a,$(ipl_libs))

sys_libs := $(addprefix -l,m pthread dl)

all:
	export LIBRARY_PATH=$(LIBRARY_PATH):$(LD_LIBRARY_PATH); 
	gcc -shared -Wl,-z,relro,-z,now -Bdynamic \
	$(addprefix -u ,$(shell grep -v '^[\#;]' "$(export)")) \
	-u mkl_serv_finalize -Wl,-fini=mkl_serv_finalize \
	-Wl,--start-group $(ipl_libs) -Wl,--end-group \
	$(sys_libs) \
	-L"$(compiler_libpath)" \
	-o "libintel_pl.$(lib_suf)"

