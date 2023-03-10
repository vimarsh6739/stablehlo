// RUN-DISABLED: stablehlo-translate --deserialize %s.0_9_0.bc | stablehlo-opt -inline | stablehlo-translate --interpret
// RUN: diff <(stablehlo-translate --deserialize %s.0_9_0.bc | stablehlo-opt) <(stablehlo-opt %s)
// RUN: diff <(stablehlo-translate --serialize --target=current %s | stablehlo-translate --deserialize | stablehlo-opt) <(stablehlo-opt %s)

module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = stablehlo.constant dense<1> : tensor<2x1xi32>
    %1:2 = call @inputs() : () -> (tensor<3x5x40xui16>, tensor<3x5x2xui16>)
    %2 = call @expected() : () -> tensor<3x5x40xui16>
    %3 = "stablehlo.scatter"(%1#0, %0, %1#1) ({
    ^bb0(%arg0: tensor<ui16>, %arg1: tensor<ui16>):
      %5 = stablehlo.minimum %arg0, %arg1 : tensor<ui16>
      stablehlo.return %5 : tensor<ui16>
    }) {scatter_dimension_numbers = #stablehlo.scatter<update_window_dims = [0, 1], inserted_window_dims = [2], scatter_dims_to_operand_dims = [2], index_vector_dim = 1>} : (tensor<3x5x40xui16>, tensor<2x1xi32>, tensor<3x5x2xui16>) -> tensor<3x5x40xui16>
    %4 = stablehlo.custom_call @check.eq(%3, %2) : (tensor<3x5x40xui16>, tensor<3x5x40xui16>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<3x5x40xui16>, tensor<3x5x2xui16>) {
    %0 = stablehlo.constant dense<"0x030003000000000003000100020000000200000002000100020003000200070003000000000001000100000002000300020004000200050003000100010003000000000000000100010001000000050005000400050003000000000002000000010000000000000000000600000003000100020001000400000001000300040003000100040002000000010000000400000000000100010002000500020000000400020001000100030000000300000001000000080001000300000000000300000003000200000007000000020000000400020000000100020001000400000002000000000001000600000002000100030001000000020000000100020003000100010001000000040001000100000000000000000000000200020000000A00000000000000030001000100020000000900010003000200050001000000010004000300000000000300000001000100020004000000010002000000040004000000000001000200020004000000030002000000040002000000040000000100010001000500000005000400040005000000030001000100010000000100030004000600010001000100010001000100050000000000020002000600030001000100050004000000000001000000050001000000030001000100040005000200030003000200010002000100000002000200010000000000000002000600020000000200050001000400020005000100000000000100030007000100020003000200010002000000000002000300000004000600000004000500020000000500000000000200050004000300000000000000010003000100020000000100000001000300010001000300000001000300020001000200060005000000000001000300000002000100000000000300020001000100000001000100010001000200000000000100020001000200020000000000030002000100030004000200040004000000020002000100000000000700020002000300010008000100000001000400040006000000000002000000030000000100000003000100040004000300040004000100050000000200000001000100020002000000010006000000010000000600050001000100000000000100010000000000020004000000010000000000010002000100030002000200020001000100010002000300020000000300010005000000040003000300010002000200000003000000020000000300010001000100020003000200010001000300040002000000000006000400000004000200040001000100050001000300020000000000050001000200000002000400030005000100000007000100070002000300020002000000000000000000030003000000010000000000000002000100000002000400000002000400020003000300000004000200010000000000050002000100070001000100010001000200010007000200060001000400000003000100000000000300000000000200000001000000000001000000010002000100010005000100000003000000030000000200000001000100000002000300000000000300050001000200070001000600030006000100000002000100010003000100010000000100000000000400050006000000030002000200040003000400"> : tensor<3x5x40xui16>
    %1 = stablehlo.constant dense<[[[2, 2], [8, 0], [0, 0], [3, 3], [3, 1]], [[5, 0], [2, 4], [1, 2], [2, 0], [4, 1]], [[0, 5], [0, 1], [2, 2], [3, 0], [0, 0]]]> : tensor<3x5x2xui16>
    return %0, %1 : tensor<3x5x40xui16>, tensor<3x5x2xui16>
  }
  func.func private @expected() -> tensor<3x5x40xui16> {
    %0 = stablehlo.constant dense<"0x030002000000000003000100020000000200000002000100020003000200070003000000000001000100000002000300020004000200050003000100010003000000000000000100010001000000050005000000050003000000000002000000010000000000000000000600000003000100020001000400000001000300040003000100040002000000010000000400000000000100010002000500020000000400000001000100030000000300000001000000080001000300000000000300000003000200000007000000020000000400020000000100020001000400000002000000000001000600000002000100030001000000020000000100020003000100010001000000040001000100000000000000000000000200020000000A00000000000000030001000100020000000900010003000200050001000000010004000100000000000300000001000100020004000000010002000000040004000000000001000200020004000000030002000000040002000000040000000100010001000500000005000400040005000000000001000100010000000100030004000600010001000100010001000100050000000000020002000600030001000100050004000000000001000000050001000000030001000100040005000200030002000200010002000100000002000200010000000000000002000600020000000200050001000400020005000100000000000100030007000100020003000200010002000000000002000300000004000100000004000500020000000500000000000200050004000300000000000000010003000100020000000100000001000300010001000300000001000300020001000200060005000000000001000300000002000100000000000300020001000100000001000100010001000200000000000100020001000200020000000000030002000100030004000200040004000000020002000100000000000700020001000300010008000100000001000400040006000000000002000000030000000100000003000100040004000300040004000100050000000200000001000100020002000000010006000000010000000000050001000100000000000100010000000000020004000000010000000000010002000100030002000200020001000100010002000300020000000300010005000000040003000300010002000200000003000000020000000300010001000100020003000200010001000300040002000000000006000400000004000200040001000100050001000300020000000000050001000200000002000400030002000100000007000100070002000300020002000000000000000000030003000000010000000000000002000100000002000400000002000400020003000300000004000200010000000000050002000000070001000100010001000200010007000200060001000400000003000100000000000300000000000200000001000000000001000000010002000100010005000100000003000000030000000200000001000100000002000300000000000300050001000200070001000600030006000100000002000100010003000100010000000100000000000400050006000000030002000200040003000400"> : tensor<3x5x40xui16>
    return %0 : tensor<3x5x40xui16>
  }
}
