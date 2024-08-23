// RUN: stablehlo-translate --interpret -split-input-file %s

module attributes {jax.uses_shape_polymorphism = true} {
  func.func @main() -> tensor<i1> {
    %cst = stablehlo.constant dense<"0x288848C050B28C3EB3D5543E6C5ABEBF962EACC09CE397403948B0BFB5BAE43F7DCC5CC0237FC0BE2E43784018F321BF49B14C406568D5C066E2374087339CBF69864E3F0CD394C00AAB58405E4126C01725E8BE7791A640AE8606C0CFE6CBBF75A4843FDDB24C40D1ACD93F84F514BF7258C5C09F0F41405264E7BF5D0199BFC4697DBF6ACD5F40595768406E56D53F6E11C53E2CE3AABF7F0D3E3FDC0A0D40179642BFB474DE409A07564008DA8D40803F49C05D98F0BF5FFA93408D4FB73FEA097DC0A9F39CC0AC7F2D40BD4EE140A166E5BDA6E7933F6AD99A3EB6C6D8BFAF7756C04EBBA840D2C8553F87C761C08E953940583FA6BF7931A43E843B8CC0A0F7DC3F36F8FA40B8300EC0A1AFA540F4EA17400F15BFC0A1D48FBF02F22B3E1ABB4940360156C0D3D78CC0BB6CF33E8C5703BCEBD5E5C0641C82C0BA0617C079AD8D408DF9CC3E561251C05CC450C00FEBB7C003D954BF7DE7E340FD4EB0C0464F1CC07C4DDA3F3D7A06406710763F18E26BC0AC7034BFC71E63401292C8BDB03A0D408B7FB03E3CCA2D401959943FD371A1BE78FC05C0F8CEEFBE42C32BBB899C0840C0AAC03F53DAD0BFBB54693FEFC134BEA399E6BFF2645D407C0B2DBDF8004FC09522FBBF637A34C01CAAC63D9CA4B5BF1A593F40453302BFD95854BF67C0EDBF848F203F2DCC2340179DB9BF4F1B733FF8C184C04E80ED3DF491174037FB0740798A03C0CD6BDEBFFC2D1AC0732B1B40DB1BE6BF4F35434093FD06BF160C0140F057DD3ED9C690C08972993F8F445CBF2F393ABC1159C63E31D9D03E5DA058C02237AD3FC8560C3F0128E0C030AB68BFF737C8BEA7A104C05C9C2A3F9262973EDF691C3F14BB2940F64BC9BF467D9B3FB99A11C02B15CFBFFD860F4047C704BEDA7893C050407BC02D206BBF057323C0094A233F984BF6BF76ECA0C0939F343F6E0D75C0E79D2F40CA62754091A83AC0E2043DC01B6276C0B7E35A40F23EEF3DE4F2573F8CE8953FDA27643F2072B8401C8F89407E2E2140D621EEBC7A491B40158C48BFB8C6A9BE0A4ACBBF015DA13F03C6813DE8F65A3F3D7F03BF8528983F5BFB3DBF1A439C3E4CD81AC0E80CAF40792FACC00D5FDB3FF9B8C13F10B9023FDC29823E08F58EC0C4F811C0BD07A8BF5EC87E404E7BA53F0E0E0EBF7E00363F1E2AA3BE7B777FC0B9A185C0F79B87BEDDE26840275730C07513A74012E58E3FF2767ABEC2E73DC070D08440EFD894C0204946C09C70B5BE21ECD53EA9050940E9B9303F2C3C86407B5D48BF38C09D3FA56774BF45575E3F4514FFBFB5F806C04EDB6E40318D97BFD46428403DEC83BF67D438405CA874BEC0F4C93F006DC1BF25B7A540D1C4E63F4566F33F0190C13D7AB6D1BEF6421340756A89C069A6D33F5C1C903FE22E3140B4D76E3DD8F8B8C089965940E8CC12BF2572CDBFFB72A4BD81DB58BE814131C0B432F4BF45816FC0A3D70840F317833FDA4ED33E177B563ECA973640ADBCA14026B696BF2B56513D7F4A93C06D1BA5BFDE03533FFBDBB7BDAE061BC046DDCC3F1125BBBFB5DCD6BF554A4140838CC7C038CA1AC047EDC5C0E3B38840F4D2C03F38D70B40FD76ABBF51D3914016089DC0FAB2233D79F6B6BF3BCD28BD123994BEC23287407BBF88C04AD51C4042870F4027D1953FAF42ED3E1967964003CE7D40D2B554BE675243BEFC03C5BE71160040B2F4F33F435DB93E16BECE3E5E9B8C3FE5147E40B465DEBF37CB0E40D6BA1F4021E48D3F20B9A4BEC975AC3D3C79303F44CE8140946F9240E9078D3FD7583040F413D7408C9A433FA3274B3F743C00C05F3D3D405250F6BFA5946CBF2CB6FEBF1DA29AC04851F3BF0A635FBE12EB6CC07B139D401B14D5BDBD9EACBE8911353FDEF1D33F337EC73F1B62EE3F043E5A40D9D3D4C03139633F3329A03DF1B4A2400346273FD199FFBE5F3AEC3E506444C0014AFB3FC5FBE7BF343C84C0EE0CDFBF2CAAA33F8F96C83FFBF00540E0F9D640CF5BDD3F82498CC0633030408A6697C0D1CF09C17CD91B406CBBCCBF914285C070088EC02973383F4C66E1BDCDFF2DC08FE059BFDE94CDBF954923C0A0469FBE65B76C3E30B58A3FD9775BC0B8A2AE3F2DCEB03FAF651AC021142E3FB6B0E13E6E64E93E384A8ABE855B2C40C29C983FE97B9DC0F9D086C07BF0A6BFFBDB9B40C95D6540A7F98E3E4C700BC0BD5F5BC0F56803C0651FBFBF394BADC081E7463F547549C09560A6BE1E1F2640C07CB7C0E44665C091B20A404865973E07639F3EEA33ECC0A2C3813FD7E98740807513BF1ED32040229CF43F97D415C009E5CC3F27FCCD3F7CB664BFCA6EB3BD1DFDF1BF83D3A3C088C31B40D8F13ABFFEEAB33E49831D4091CCB4C0710C5140D3347CC045798240467C7AC06FDD2D40506DB1409B3DF03E6976CEC0EC749E408537BBC0C9B884C054EF533E6A90E33F4F23963D066962C0370CB6BEEC5AF9BF44839F402AEF7D4098FDA7C042D565BF9C876F3F579E26BF7ED35EC0DBD4B63FDC0EEEBE48D579BFB26036C06D521AC0AC818D40900D133E181B98C0937D6ABF0B0864C0F6C62EBD5E3D89409ECDEABE38596940AA948A406A5093404DC690C04AABC7C02EA852C0BBCDCFBF47786F40A3878E40DFA3DEBD20F682C0963A8D3FC79A0240C0448FBF184F88BF454C97C0939583C0EE43823F2BB89CC0B063F43EAA74D2BFAF250D405DDA5E3CF0B62EC00FAD0A3F5A4F6F40EFA3F2BFC1C403C0BE236EC0AF50F83FF3C084C0745CBFBFF22325C09074463FD7739BBFDA5D8DBF7C5C6A401B0BC03ED319A3C0A0F0B0BE450D0F407498E5400B5497C04108EF3F98446CC020ADE0C0DB15903F1E0B1240E1A9EC3FEE35F03F16EF6DBFD31704C0B0014D3FF33D753FB2E3B7BF448E4240F4FB80C046C3593E438CB53FBF674FC0390CC83F9A0006C02DB40140A50E44BF23534BC03274AFBE2873C03F25B225BF27DBF2BFBB19613FB7F488BE7983A4BEC6CE2ABFE19117C0942E0240A27F77409693A2BF8BA26EC0ECE459C07E5ED13F79975BC01B34BD3F"> : tensor<2x3x9x10xf32>
    %cst_0 = stablehlo.constant dense<"0x216179C00F588F3D7850AE3F77399FBF14A31AC03AEF6C4040C4F8BE30E152C061E6A040EF3C7BC0702195C0D6A5A13FC04C0740254146BEA0D83DC0789A6C40DBEC9FBF4AC47CC0381080C06B3E1F40C78FC43FA963DB3F0B9287C0663BC0BFAE13BEBFDD981440C7D1973F4040EC4055790BC01A2900C043207BC0325035BD662BEABFC4AB2140D4E1D1C051F2B33E67DDBB3F3A4092403F621BBDD3E78940C67DB53D070E53C0906539C08FEC69BF92188E40625E04C09B20CABF54B5ADC09E47D83F3DD194BF4E4B4A3FDEF189C065FE15407771A940E6D18240EA53B7BF38781940DFFA55C08169B63D37D5BF3F9161C6BC6F6EB8BF218922C03C1F91404B8E234003E24FC0417E14C00E3D8EC08EEE863D1B93AB3E3F884DBF8E407D40C84F1DBF6812A5C02A5FCDBFC89A4BC0EF45BB408A427140978A983F709622C0F1695CC03352C43FE5E5AF40B95C8C3FDDC04EC095B685BFC6929DC09B3B11C0C921D0406829833FA33820408F4AA8BE73AFA3BF5B65423F47C4494067BE31C039E6B8BF61276E3FF6F5F0BFA9A657409EB1CCBF07341F409105EFBFA2778B3F414A6F3FB4C529BFD87BCF3F04A19D40CB613740BD2E8FBF1666D13F27B47BBF412928406B8AA0BFA96A30C0237FE93E1F158EBF3A615B3FC791614081343D3E075732BFCC6484406DA60EC09BCD55BEF81356405DCB843F38F9F5BF9877933E45C1E7BFC451CEBD89302640A1E8C53FDBEB4C3F330B363C9FF9B13F78AFD63F09AB6840B5D8AB401E5810C0AEC1EBBF08E82640127B5CC085090A402877733F18C12E40AA589FC0949B9DC05215CA3F3D3A753F7B83883F918FBBBFA65BBFC09A95ACBFF3561F3E7F34C54078B099BFC97ECDBF15780E3ECAF53A3F4DF1F2BF9B5309C00BBF703F4ED80F40D4021EBF3CB0493F8387D9C094D9F53FE78F643F742E25BFB552E83FFEFAC33F79FD6FC0EFDF3540027C13BF7ADAA2BE7302E3BF0D239FC06717B13DF2C54840605C37BD"> : tensor<3x3x4x5xf32>
    %cst_1 = stablehlo.constant dense<"0x4C0AC6404751D64049E4D040BF28F4409C4906415DEE844097FD1B41152124411D930341D10C3340C4E1E34058351541C607D9409A231141C92D4E41442B6141C6075941DE37024146BEDB405AC88F40C92DCE40DB110D41C5745E410A1C4A4150C33541CF79384158351541C607D93E5DEE044116B41E41CBC048418E8B3C41CF7938410D423F411C00094153E92A41D97E92403FDFF640106834418AD24C41407271418DF8414197FD1B41CBC04841BF28F44050C3B5403FDFF6405B5B0A41583515419BB60B411A6D0E4150C335411D93034157A21A41547CA540BE95F94057A21A41D29F2D41BF28F4404072F1405B5B0A41CBC048414A77CB404C0AC6404E30BB40DE378240C24E6940DCA407414E30BB40CF79B840C574DE40D97E9240D8EB17405DEE84405AC88F40C607D93FDE37823FC4E16340C4E1E33FD3322840BC027F4049E4D040D332A840C4E1E340C1BBEE40C24EE940D33228414105EC403D4CFC40CC53C340442BE140C4E1E3400FD5394192442C41DB110D41001770410FD539411521244115212441CBC0C840C92DCE409C49064157A21A414D9D404183F36741BC027F4146BE5B41CC53C3409EDC00414C0AC64058351541D10C3341C89A534115212441C92D4E418DF8414153E92A41CF79B840106834418E8B3C410A1C4A41FE2E8041C60759419A231141BC027F41CEE63D41547CA54057A21A41560F20410D423F4194D726418AD24C4153E92A415156B040DB110D414072F14094D7264112FB2E4194D72641BC02FF404E303B415156304197FD1B41C1BBEE40D5C5A2404A77CB40DE370241D5C522415DEE0441C92DCE40C1BBEE4015212441BF287440C92D4E40D6589D40C5745E40CC534340547CA540BE9579405AC88F40BC027F40C607D93F46BEDB40560FA040138E2941D29FAD4019DA1341BF28F44010683441C24EE9404072F140C574DE40D10CB3408DF84141D10C33418B65474187AC5741DE378241CF7938410D423F41547CA54050C3B5409EDC004146BE5B4194D72641442B6141DE378241442B6141C1BBEE404C0AC6404072F14050C33541D3322841C89A53414D9D404185195D41C607594158351541C4E1E34053E92A414C0A46414A774B41C5745E41BF287441033D6541C607594198901641D5C5A2409EDC00418DF84141CC53434183F3674109894F41106834415835154119DA13415DEE044153E92A4112FB2E4153E92A4150C335419A231141D97E124117471941C92DCE40BE9579409BB60B41BF28F440560F204119DA13414751D64057A21A413D4CFC4046BEDB40D332A840DCA48740C89A534046BEDB40DCA48740C1BB6E4053E9AA40560FA040C4E16340DCA487404D9DC040C607D940D5C52241C89AD3401D93034197FD1B41C24EE940CEE6BD40D97E9240C4E1E3404A77CB40547CA54046BE5B41442B6141C1BBEE4091B131415DEE0441CEE63D40D6589D404C0A4641C1BB6E415AC80F4191B1314143986641C60759411C000941CBC048405B5B0A4119DA134157A21A41D8EB1741D8EB174112FB2E418AD24C418E8B3C414C0AC6405B5B0A411D9303414A774B41CC5343410CAF4441C89A5341883F524157A21A413FDFF64057A21A410D423F413FDFF640442BE1404A774B414E303B419BB60B41956A21414072F140CC53C34012FB2E4183F36741C24EE940547C25419EDC00418E8B3C41C89AD340DB118D3FC574DE4046BEDB40C89AD34019DA1341BF28F440442BE14049E4D040D10CB340C1BBEE3FDCA40740560FA040BE9579405DEE8440DB118D40DCA48740CEE63D40DB118D3FCBC0C840BF2874404072F140CEE6BD40BE95F940C1BBEE40D97E124119DA1341C89AD340C1BBEE4046BEDB40DCA407415DEE0441D8EB1741CBC04841D332284192442C41C92DCE4058351541D8EB174149E4D040956A21410A1C4A4146BE5B418B654741D10C3341D29F2D414A77CB40547C25418F1E3741CEE63D41560F20419C490641BC027F4151563041C89AD3404A77CB40152124411C0009418F1E37414D9D404105D05F41883F5241C89A534191B131419BB60B41BC02FF4058351541C92D4E41D10C334146BE5B4181606D41BF2874414A774B4116B41E415156304141056C4115212441D29F2D410FD53941138E2941956A2141DE370241D29FAD40CEE6BD40BE95F940C4E1E340D29F2D415DEE04411C000941583515415B5B8A40D8EB1740547CA540547CA540CC53C340C24E6940C92D4E40CEE63D40DE370240D6589D40CF79B840547CA5404E30BB40DCA407414398E640C24EE94019DA13413FDFF6405156B040CBC0C8404D9DC0405156304194D72641D10C3341C60759418AD24C414A774B41C4E1E34019DA134197FD1B411C000941475156410D423F4105D05F41C24E69415B5B8A415B5B0A41C24EE94098901641D6581D414D9D4041D10C3341BF28744106635A4115212441583515414E30BB40BC02FF40956A2141D29F2D418F1E37410A1C4A414D9D4041FF837541956A214150C3B540DCA4074106635A4187AC57414E303B41FF837541BF287441BF2874418DF8414149E4D040442B61410FD5394151563041033D65418E8B3C4108F654414C0A464117471941D5C5A2405B5B0A4192442C410CAF4441138E29418AD24C41DCA4074153E92A41BE95F9405DEE84404E30BB40DCA487404751D640547CA540C574DE40D5C522404D9DC040D8EB9740"> : tensor<2x3x9x9xf32>
    %0 = stablehlo.uniform_quantize %cst_0 : (tensor<3x3x4x5xf32>) -> tensor<3x3x4x5x!quant.uniform<i8:f32, 0.0039212212843053483:-128>>
    %1 = stablehlo.uniform_quantize %cst : (tensor<2x3x9x10xf32>) -> tensor<2x3x9x10x!quant.uniform<i8:f32, 0.0039215482917486456:-128>>
    %2 = stablehlo.transpose %1, dims = [0, 2, 3, 1] : (tensor<2x3x9x10x!quant.uniform<i8:f32, 0.0039215482917486456:-128>>) -> tensor<2x9x10x3x!quant.uniform<i8:f32, 0.0039215482917486456:-128>>
    %3 = stablehlo.transpose %0, dims = [2, 3, 1, 0] : (tensor<3x3x4x5x!quant.uniform<i8:f32, 0.0039212212843053483:-128>>) -> tensor<4x5x3x3x!quant.uniform<i8:f32, 0.0039212212843053483:-128>>
    %4 = stablehlo.convolution(%2, %3) dim_numbers = [b, 0, 1, f]x[0, 1, i, o]->[b, 0, 1, f], window = {pad = [[1, 2], [2, 1]]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<2x9x10x3x!quant.uniform<i8:f32, 0.0039215482917486456:-128>>, tensor<4x5x3x3x!quant.uniform<i8:f32, 0.0039212212843053483:-128>>) -> tensor<2x9x9x3x!quant.uniform<i32:f32, 1.537725862903607E-5>>
    %5 = stablehlo.uniform_quantize %4 : (tensor<2x9x9x3x!quant.uniform<i32:f32, 1.537725862903607E-5>>) -> tensor<2x9x9x3x!quant.uniform<i8:f32, 0.084777487960516234:-128>>
    %6 = stablehlo.transpose %5, dims = [0, 3, 1, 2] : (tensor<2x9x9x3x!quant.uniform<i8:f32, 0.084777487960516234:-128>>) -> tensor<2x3x9x9x!quant.uniform<i8:f32, 0.084777487960516234:-128>>
    %7 = stablehlo.uniform_dequantize %6 : (tensor<2x3x9x9x!quant.uniform<i8:f32, 0.084777487960516234:-128>>) -> tensor<2x3x9x9xf32>
    %8 = stablehlo.custom_call @check.eq(%cst_1, %7) : (tensor<2x3x9x9xf32>, tensor<2x3x9x9xf32>) -> tensor<i1>
    return %8 : tensor<i1>
  }
}