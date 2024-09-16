// RUN: stablehlo-opt -inline %s | stablehlo-translate --interpret
// RUN: stablehlo-translate --serialize --target=current %s | stablehlo-translate --deserialize | stablehlo-opt > %t.0
// RUN: stablehlo-opt %s > %t.1
// RUN: diff %t.0 %t.1

module @jit_main attributes {mhlo.num_partitions = 1 : i32, mhlo.num_replicas = 1 : i32} {
  func.func public @main() -> (tensor<1x3xf32> {jax.result_info = "", mhlo.layout_mode = "default"}) {
    %0 = call @inputs() : () -> tensor<2x4xf32>
    %1 = call @expected() : () -> tensor<1x3xf32>
    %cst = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %2 = stablehlo.broadcast_in_dim %cst, dims = [] : (tensor<f32>) -> tensor<f32>
    %3 = "stablehlo.reduce_window"(%0, %2) <{window_dimensions = array<i64: 2, 2>}> ({
    ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>):
      %4 = stablehlo.maximum %arg0, %arg1 : tensor<f32>
      stablehlo.return %4 : tensor<f32>
    }) : (tensor<2x4xf32>, tensor<f32>) -> tensor<1x3xf32>
    stablehlo.custom_call @check.expect_close(%3, %1) {has_side_effect = true} : (tensor<1x3xf32>, tensor<1x3xf32>) -> ()
    return %3 : tensor<1x3xf32>
  }
  func.func private @inputs() -> (tensor<2x4xf32> {mhlo.layout_mode = "default"}) {
    %cst = stablehlo.constant dense<[[0.180554599, 4.83959723, -3.06038165, 6.29835796], [-0.574667037, -3.2395606, -7.343575, -0.321981102]]> : tensor<2x4xf32>
    return %cst : tensor<2x4xf32>
  }
  func.func private @expected() -> (tensor<1x3xf32> {mhlo.layout_mode = "default"}) {
    %cst = stablehlo.constant dense<[[4.83959723, 4.83959723, 6.29835796]]> : tensor<1x3xf32>
    return %cst : tensor<1x3xf32>
  }
}