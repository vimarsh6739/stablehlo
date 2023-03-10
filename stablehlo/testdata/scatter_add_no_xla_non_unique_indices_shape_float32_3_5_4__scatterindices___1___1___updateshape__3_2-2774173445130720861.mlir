// RUN-DISABLED: stablehlo-translate --deserialize %s.0_9_0.bc | stablehlo-opt -inline | stablehlo-translate --interpret
// RUN: diff <(stablehlo-translate --deserialize %s.0_9_0.bc | stablehlo-opt) <(stablehlo-opt %s)
// RUN: diff <(stablehlo-translate --serialize --target=current %s | stablehlo-translate --deserialize | stablehlo-opt) <(stablehlo-opt %s)

module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = stablehlo.constant dense<1> : tensor<2x1xi32>
    %1:2 = call @inputs() : () -> (tensor<3x5x4xf32>, tensor<3x2x4xf32>)
    %2 = call @expected() : () -> tensor<3x5x4xf32>
    %3 = "stablehlo.scatter"(%1#0, %0, %1#1) ({
    ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>):
      %5 = stablehlo.add %arg0, %arg1 : tensor<f32>
      stablehlo.return %5 : tensor<f32>
    }) {scatter_dimension_numbers = #stablehlo.scatter<update_window_dims = [0, 2], inserted_window_dims = [1], scatter_dims_to_operand_dims = [1], index_vector_dim = 1>} : (tensor<3x5x4xf32>, tensor<2x1xi32>, tensor<3x2x4xf32>) -> tensor<3x5x4xf32>
    %4 = stablehlo.custom_call @check.eq(%3, %2) : (tensor<3x5x4xf32>, tensor<3x5x4xf32>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<3x5x4xf32>, tensor<3x2x4xf32>) {
    %0 = stablehlo.constant dense<[[[0.196193904, 0.97405225, 2.48024297, -1.41864908], [2.07361817, 2.57976866, -6.3679471, 1.25424111], [2.09294677, 0.933672308, -3.32030869, 3.99832153], [1.01409435, 1.62192452, -4.06931257, -7.15769434], [1.20341945, 5.62951231, 2.9049561, 1.73433852]], [[5.08167315, -2.46945739, -0.659353315, -0.40442574], [4.94045496, -3.32478142, -2.99553609, 4.94746113], [2.25978398, 2.78413796, -1.65129805, -4.721600e+00], [-1.07830191, -1.07963133, 2.84327722, -0.056066487], [-1.84372413, -5.65175343, 2.11339569, 0.707846343]], [[4.068640e+00, -1.81431341, 0.0149968099, -0.847524523], [-1.03055048, -2.41931844, -3.1217339, -6.71114683], [-1.76611781, 0.0526492111, 1.307500e+00, -1.62344062], [0.0364969932, 1.05880713, -3.39481592, 3.20973969], [-2.50827384, -1.23827076, 1.40860832, -4.1847558]]]> : tensor<3x5x4xf32>
    %1 = stablehlo.constant dense<[[[-8.1037693, 0.718130231, -0.0607936345, 0.0441842154], [2.39026928, -1.59290469, 2.20849395, 1.66054404]], [[3.26096582, 0.0379721597, -2.62122726, 1.41802037], [-4.98332405, -0.984499275, 8.249970e+00, 4.22934103]], [[-1.84862506, 4.6599617, -0.1659493, 4.9601326], [4.34762573, -2.89475346, -1.13841033, 3.62496018]]]> : tensor<3x2x4xf32>
    return %0, %1 : tensor<3x5x4xf32>, tensor<3x2x4xf32>
  }
  func.func private @expected() -> tensor<3x5x4xf32> {
    %0 = stablehlo.constant dense<[[[0.196193904, 0.97405225, 2.48024297, -1.41864908], [-3.63988209, 1.70499408, -4.22024632, 2.95896935], [2.09294677, 0.933672308, -3.32030869, 3.99832153], [1.01409435, 1.62192452, -4.06931257, -7.15769434], [1.20341945, 5.62951231, 2.9049561, 1.73433852]], [[5.08167315, -2.46945739, -0.659353315, -0.40442574], [3.21809673, -4.27130842, 2.63320732, 10.5948219], [2.25978398, 2.78413796, -1.65129805, -4.721600e+00], [-1.07830191, -1.07963133, 2.84327722, -0.056066487], [-1.84372413, -5.65175343, 2.11339569, 0.707846343]], [[4.068640e+00, -1.81431341, 0.0149968099, -0.847524523], [1.46845007, -0.654110193, -4.42609358, 1.87394595], [-1.76611781, 0.0526492111, 1.307500e+00, -1.62344062], [0.0364969932, 1.05880713, -3.39481592, 3.20973969], [-2.50827384, -1.23827076, 1.40860832, -4.1847558]]]> : tensor<3x5x4xf32>
    return %0 : tensor<3x5x4xf32>
  }
}
