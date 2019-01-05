cd ~/intel/ipp/tools/builder
make libintel64 threading=sequential export=list_mkl name=libmkl_custom
cd ~/intel/ipp/tools/custom_library_tool
./ipp_custom_library_tool -n ipp_custom -l list_ipp.txt -o .

