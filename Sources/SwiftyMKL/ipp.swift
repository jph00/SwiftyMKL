import CIPP

public struct IPP {
  public static func setup() { if ippInit() != ippStsNoErr { print("ippInit failed") } }
  public static func getLibVersion()->IppLibraryVersion { return ippGetLibVersion()!.pointee }
}

