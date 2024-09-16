// RUN: stablehlo-opt --chlo-legalize-to-stablehlo %s | stablehlo-translate --interpret
// This file is generated, see build_tools/math/README.md for more information.
module @atanh_complex64 {
  func.func private @samples() -> tensor<173xcomplex<f32>> {
    %0 = stablehlo.constant dense<"0x000080FF000080FFFFFF7FFF000080FFFEFF7FFF000080FF0000C0BF000080FF0000E09F000080FF01000080000080FF00000000000080FF01000000000080FF0000E01F000080FF0000C03F000080FFFEFF7F7F000080FFFFFF7F7F000080FF0000807F000080FF000080FFFFFF7FFFFFFF7FFFFFFF7FFFFEFF7FFFFFFF7FFF0000C0BFFFFF7FFF0000E09FFFFF7FFF01000080FFFF7FFF00000000FFFF7FFF01000000FFFF7FFF0000E01FFFFF7FFF0000C03FFFFF7FFFFEFF7F7FFFFF7FFFFFFF7F7FFFFF7FFF0000807FFFFF7FFF000080FFFEFF7FFFFFFF7FFFFEFF7FFFFEFF7FFFFEFF7FFF0000C0BFFEFF7FFF0000E09FFEFF7FFF01000080FEFF7FFF00000000FEFF7FFF01000000FEFF7FFF0000E01FFEFF7FFF0000C03FFEFF7FFFFEFF7F7FFEFF7FFFFFFF7F7FFEFF7FFF0000807FFEFF7FFF000080FF0000C0BFFFFF7FFF0000C0BFFEFF7FFF0000C0BF0000C0BF0000C0BF0000E09F0000C0BF010000800000C0BF000000000000C0BF010000000000C0BF0000E01F0000C0BF0000C03F0000C0BFFEFF7F7F0000C0BFFFFF7F7F0000C0BF0000807F0000C0BF000080FF0000E09FFFFF7FFF0000E09FFEFF7FFF0000E09F0000C0BF0000E09F0000E09F0000E09F010000800000E09F000000000000E09F010000000000E09F0000E01F0000E09F0000C03F0000E09FFEFF7F7F0000E09FFFFF7F7F0000E09F0000807F0000E09F000080FF01000080FFFF7FFF01000080FEFF7FFF010000800000C0BF010000800000E09F010000800100008001000080000000000100008001000000010000800000E01F010000800000C03F01000080FEFF7F7F01000080FFFF7F7F010000800000807F01000080000080FF00000000FFFF7FFF00000000FEFF7FFF000000000000C0BF000000000000E09F000000000100008000000000000000000000000001000000000000000000E01F000000000000C03F00000000FEFF7F7F00000000FFFF7F7F000000000000807F00000000000080FF01000000FFFF7FFF01000000FEFF7FFF010000000000C0BF010000000000E09F010000000100008001000000000000000100000001000000010000000000E01F010000000000C03F01000000FEFF7F7F01000000FFFF7F7F010000000000807F01000000000080FF0000E01FFFFF7FFF0000E01FFEFF7FFF0000E01F0000C0BF0000E01F0000E09F0000E01F010000800000E01F000000000000E01F010000000000E01F0000E01F0000E01F0000C03F0000E01FFEFF7F7F0000E01FFFFF7F7F0000E01F0000807F0000E01F000080FF0000C03FFFFF7FFF0000C03FFEFF7FFF0000C03F0000C0BF0000C03F0000E09F0000C03F010000800000C03F000000000000C03F010000000000C03F0000E01F0000C03F0000C03F0000C03FFEFF7F7F0000C03FFFFF7F7F0000C03F0000807F0000C03F000080FFFEFF7F7FFFFF7FFFFEFF7F7FFEFF7FFFFEFF7F7F0000C0BFFEFF7F7F0000E09FFEFF7F7F01000080FEFF7F7F00000000FEFF7F7F01000000FEFF7F7F0000E01FFEFF7F7F0000C03FFEFF7F7FFEFF7F7FFEFF7F7FFFFF7F7FFEFF7F7F0000807FFEFF7F7F000080FFFFFF7F7FFFFF7FFFFFFF7F7FFEFF7FFFFFFF7F7F0000C0BFFFFF7F7F0000E09FFFFF7F7F01000080FFFF7F7F00000000FFFF7F7F01000000FFFF7F7F0000E01FFFFF7F7F0000C03FFFFF7F7FFEFF7F7FFFFF7F7FFFFF7F7FFFFF7F7F0000807FFFFF7F7F000080FF0000807FFFFF7FFF0000807FFEFF7FFF0000807F0000C0BF0000807F0000E09F0000807F010000800000807F000000000000807F010000000000807F0000E01F0000807F0000C03F0000807FFEFF7F7F0000807FFFFF7F7F0000807F0000807F0000807F34757EBFB687DCB934757E3F4D9D5FBA68EA3CBFA3A9B33DF36B8F572D2B0656"> : tensor<173xcomplex<f32>>
    return %0 : tensor<173xcomplex<f32>>
  }
  func.func private @expected() -> tensor<173xcomplex<f32>> {
    %0 = stablehlo.constant dense<"0x00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00001080DB0FC9BF00001080DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00001000DB0FC9BF00001000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00001080DB0FC9BF00001080DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00001000DB0FC9BF00001000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00002080DB0FC9BF00002080DB0FC9BFACA49CBEB9B59BBF9ED8099F5F987BBF000000005F987BBF000000005F987BBF000000005F987BBF9ED8091F5F987BBFACA49C3EB9B59BBF00002000DB0FC9BF00002000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00002080DB0FC9BF00002080DB0FC9BF10024EBFDB0FC9BF0000E09F0000E09F010000800000E09F000000000000E09F010000000000E09F0000E01F0000E09F10024E3FDB0FC9BF00002000DB0FC9BF00002000DB0FC9BF00000000DB0FC9BF00000000DB0FC9BF00002080DB0FC9BF00002080DB0FC9BF10024EBFDB0FC9BF0000E09F010000800100008001000080000000000100008001000000010000800000E01F0100008010024E3FDB0FC9BF00002000DB0FC9BF00002000DB0FC9BF00000000DB0FC9BF00000000DB0FC93F00002080DB0FC93F00002080DB0FC93F10024EBFDB0FC93F0000E09F000000000100008000000000000000000000000001000000000000000000E01F0000000010024E3FDB0FC93F00002000DB0FC93F00002000DB0FC93F00000000DB0FC93F00000000DB0FC93F00002080DB0FC93F00002080DB0FC93F10024EBFDB0FC93F0000E09F010000000100008001000000000000000100000001000000010000000000E01F0100000010024E3FDB0FC93F00002000DB0FC93F00002000DB0FC93F00000000DB0FC93F00000000DB0FC93F00002080DB0FC93F00002080DB0FC93F10024EBFDB0FC93F0000E09F0000E01F010000800000E01F000000000000E01F010000000000E01F0000E01F0000E01F10024E3FDB0FC93F00002000DB0FC93F00002000DB0FC93F00000000DB0FC93F00000000DB0FC93F00002080DB0FC93F00002080DB0FC93FACA49CBEB9B59B3F9ED8099F5F987B3F000000005F987B3F000000005F987B3F000000005F987B3F9ED8091F5F987B3FACA49C3EB9B59B3F00002000DB0FC93F00002000DB0FC93F00000000DB0FC93F00000000DB0FC93F00001080DB0FC93F00001080DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00001000DB0FC93F00001000DB0FC93F00000000DB0FC93F00000000DB0FC93F00001080DB0FC93F00001080DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00001000DB0FC93F00001000DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93F00000000DB0FC93FFF9639C01F330FBD9B593940D57A90BD35886BBF5B383F3E23646127DB0FC93F"> : tensor<173xcomplex<f32>>
    return %0 : tensor<173xcomplex<f32>>
  }
  func.func public @main() {
    %0 = call @samples() : () -> tensor<173xcomplex<f32>>
    %1 = "chlo.atanh"(%0) : (tensor<173xcomplex<f32>>) -> tensor<173xcomplex<f32>>
    %2 = call @expected() : () -> tensor<173xcomplex<f32>>
    check.expect_close %1, %2, max_ulp_difference = 3 : tensor<173xcomplex<f32>>, tensor<173xcomplex<f32>>
    func.return
  }
}