UNAME = ${shell uname}
ifeq ($(UNAME), Darwin)
	lib_suf = dylib
	default_root = /opt/intel
	ipl_platform = mac
	func_pre = _
else ifeq ($(UNAME), Linux)
	lib_suf = so
	default_root = $(HOME)/intel
	ipl_platform = linux
	xtra_path = /intel64
else
	$(error Unknown or unsupported platform $(UNAME))
endif

ifndef IPLROOT
	IPLROOT = $(default_root)/compilers_and_libraries/$(ipl_platform)
endif

ifndef MKLROOT
	MKLROOT = $(IPLROOT)/mkl
endif

ifndef IPPROOT
	IPPROOT = $(IPLROOT)/ipp
endif

expname := list_ipl
name := libintel_pl.$(lib_suf)

mkl_libpath=$(MKLROOT)/lib$(xtra_path)
ipp_libpath=$(IPPROOT)/lib$(xtra_path)
compiler_libpath=$(IPLROOT)/compiler/lib$(xtra_path)
$(info $(mkl_libpath))
$(info $(ipp_libpath))

mkl_libs := mkl_intel_lp64 mkl_sequential mkl_core
ipp_libs := ipps ippvm ippcore
ipl_libs := $(addprefix $(mkl_libpath)/lib,$(mkl_libs)) $(addprefix $(ipp_libpath)/lib,$(ipp_libs))
ipl_libs := $(addsuffix .a,$(ipl_libs))

sys_libs := $(addprefix -l,m pthread dl)

ifeq ($(UNAME), Darwin)
	compiler := gcc -arch x86_64 -dynamiclib -single_module -install_name "@rpath/$(name)"
else ifeq ($(UNAME), Linux)
	ipl_libs := -Wl,--start-group $(ipl_libs) -Wl,--end-group
	compiler := gcc -shared -Wl,-z,relro,-z,now -Bdynamic
endif

all:
	export LIBRARY_PATH=$(LIBRARY_PATH):$(LD_LIBRARY_PATH); 
	$(compiler) \
	$(addprefix -u $(func_pre),$(shell grep -v '^[\#;]' "$(expname)")) \
	$(ipl_libs) \
	$(sys_libs) \
	-o "$(name)"

