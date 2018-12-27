import CMKL

public struct MKL {
  public static func get_version_string()->String {
    var d = Array<Int8>(repeating: 0, count: 180)
    mkl_get_version_string(&d, numericCast(d.count))
    return String(cString: UnsafePointer(d))
  }

  public static func get_version()->MKLVersion {
    var version = MKLVersion()
    mkl_get_version(&version)
    return version
  }
}


// typedefs from MKL headers that Swift doesn't handle automatically

public let mkl_get_version_string = MKL_Get_Version_String
public let mkl_get_version = MKL_Get_Version
public let mkl_free_buffers = MKL_Free_Buffers
public let mkl_thread_free_buffers = MKL_Thread_Free_Buffers
public let mkl_mem_stat = MKL_Mem_Stat
public let mkl_peak_mem_usage = MKL_Peak_Mem_Usage
public let mkl_malloc = MKL_malloc
public let mkl_calloc = MKL_calloc
public let mkl_realloc = MKL_realloc
public let mkl_free = MKL_free
public let mkl_get_cpu_clocks = MKL_Get_Cpu_Clocks
public let mkl_get_cpu_frequency = MKL_Get_Cpu_Frequency
public let mkl_get_max_cpu_frequency = MKL_Get_Max_Cpu_Frequency
public let mkl_get_clocks_frequency = MKL_Get_Clocks_Frequency
public let mkl_set_num_threads_local = MKL_Set_Num_Threads_Local
public let mkl_set_num_threads = MKL_Set_Num_Threads
public let mkl_get_max_threads = MKL_Get_Max_Threads
public let mkl_set_num_stripes = MKL_Set_Num_Stripes
public let mkl_get_num_stripes = MKL_Get_Num_Stripes
public let mkl_domain_set_num_threads = MKL_Domain_Set_Num_Threads
public let mkl_domain_get_max_threads = MKL_Domain_Get_Max_Threads
public let mkl_set_dynamic = MKL_Set_Dynamic
public let mkl_get_dynamic = MKL_Get_Dynamic
public let mkl_cbwr_get = MKL_CBWR_Get
public let mkl_cbwr_set = MKL_CBWR_Set
public let mkl_cbwr_get_auto_branch = MKL_CBWR_Get_Auto_Branch
public let mkl_set_env_mode = MKL_Set_Env_Mode
public let mkl_verbose = MKL_Verbose
public let mkl_verbose_output_file = MKL_Verbose_Output_File
public let mkl_set_exit_handler = MKL_Set_Exit_Handler
public let mkl_set_mpi = MKL_Set_mpi
public let mkl_set_memory_limit = MKL_Set_Memory_Limit
public let mkl_finalize = MKL_Finalize

