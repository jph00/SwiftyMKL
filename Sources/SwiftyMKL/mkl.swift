import CSwiftyMKL

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
public let mkl_malloc = MKL_malloc
public let mkl_free = MKL_free

