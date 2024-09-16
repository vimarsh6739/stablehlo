// RUN: stablehlo-opt -inline %s | stablehlo-translate --interpret
// RUN: stablehlo-translate --serialize --target=current %s | stablehlo-translate --deserialize | stablehlo-opt > %t.0
// RUN: stablehlo-opt %s > %t.1
// RUN: diff %t.0 %t.1

module @jit_main attributes {mhlo.num_partitions = 1 : i32, mhlo.num_replicas = 1 : i32} {
  func.func public @main() -> (tensor<20x20xcomplex<f32>> {jax.result_info = "", mhlo.layout_mode = "default"}) {
    %0 = call @inputs() : () -> tensor<20x20xcomplex<f32>>
    %1 = call @expected() : () -> tensor<20x20xcomplex<f32>>
    %2 = stablehlo.exponential %0 : tensor<20x20xcomplex<f32>>
    stablehlo.custom_call @check.expect_close(%2, %1) {has_side_effect = true} : (tensor<20x20xcomplex<f32>>, tensor<20x20xcomplex<f32>>) -> ()
    return %2 : tensor<20x20xcomplex<f32>>
  }
  func.func private @inputs() -> (tensor<20x20xcomplex<f32>> {mhlo.layout_mode = "default"}) {
    %cst = stablehlo.constant dense<"0x676094402E2CB93FB16895BF2866A6BF084C583ECE8A5240C88B163F5B364C4051B856C073D902C0243549C0CECAEABFFADE35BE1DAC0140961203C01AF3813FBE5F144008C9E8BFF5AB4CBE4AECF43F465E8B40552F543F5DF50A407F7DAE3F34694CBE0DADC83F423121C0DAD25BC0121DC8BF9346D43F85CEBC407F393440788E8EC04BCA83402C2CE1BF301BA7BFCA1B05C0FFB3303FCF781F40505885C08AD635C03BD54FC0FA0F75BFB833EDBFAC46A5BFFC5EB7BF5C6351C0E58C73C07D76B93F8A3F5BC01490DABF9B87B4C0BDC18C4061AF4CBF953187C0F3A81240764D62409D06A1BF80CA53BF8FA90BC0A4A9D2BF91D88AC036327BBFF7C2114009511FC06616C13FAB119FBF7053C7BF676DBFBE57006840E2A12FC077ADC93F1D5C38BC87318CC013D757C00E4E423F8846B0405912E9C05BC00740B400123DEC020D3EB3002BC0413E203F8C3A0A40EB4FC83F9AB18240AD288F3F99692C404C6C91BF75410441F324E03FC72D23400F5328C0A50F5E401AE8EA3FA97044C0B52E7740D03560BF6B3E86C084D3863F6B6AE1BF4D44E13FD19B9ABF08320FC07D8820BFF2C704C0072CC43E38D575C0F67B823F14D88A3F54623D40CA9294BE48A4B8BE974F2F40A295703F5A4A93C01BD5F73F63AF563F7626CBBF32C46AC0BF0AB3BD7F01AD3D503FEB3F2FFDC040176258BEA535E03FC90EF43F2A8543BE6C2C94C000B49B405F97F13C42F9A9C0806315408A88C1BDAA25C3BFE6B3F2BC9B608ABFF344D2C0579C50BFB68587BF2837CB40B8C458BE9AA65740DB88B1C0DBFAC6BAAF9C2E40DE106240668588C00831D3BE57040B4034F11D3FDB0A86C074665BC097B58340C1D52E40AC2C3D40F0EE7A40C6310C40F358613F98254440FB7A0BC0A9CAF83E58B221404A133AC01D5F6A3E1B1AC2C0DE1ADCC0D8913DC073B6ECBF5D66D8BED8F64DC0E849383E1FDBBF3F058E76C0549F23C02EC853C0DE184D40F02885BFD723F73FE04EB440EA179E40B529493F089A8240077258C0E7F86CC042290640D64A473F5AD66F40602D90BF809A2DBFDF13B0BE4F3BC54063BF21BE35C08BBFD7B754408E7737BE65DF854013E6CF3F2CDBDDBF877F8ABF23163040643A2140002CAA405ADD4AC0622311BF779CB4BEC6F82640F5EF013F5460C1C08B0ED33FEE832FBF0B499940EB385ABF2AFC19C06AD4CFBF86985CBE78A04D3ECEFA07BEE8ED603E47B74DC00A8A3540EDD7C5404F306B3F3DEC33C0CE48BF3E08153A3F15F23B3F997AB4C06EDA4CC0CD2ADEBC86B20CBE2E750B3EE15BB1BF639CAA3FCFC5DDC0E49B77C000A1BB3FD3FB1240DAD9A5404FA86DC0DF6182BF034A0341893D0FC02C8A4F40BE727040D56F07BF492ADB4031D51DBFAD37B0C0E31F90BEBC2818C0FD1537BF242DC640B93D8D3F11F2083F5B50F9C0EA88604070F9C540775CA7BF0B43FB3F86455E403B8E823EF80F8540C3BAEE3FB6A13ABFA6E49D40D2A671BEA1CCD5BFF8049EC0062924BF6EAB86407A55493F875879C0548D0040DDC62540E0C8383FB0FF6F3F44BECE3F304D7540011D6BBFB34DD8C0C5D39D40D93688C044CC27C05D1AA63F60C534C00AF34A3F3E52D2BFBA5761C0DB98294042B28CBD2CE9C1BFB6F539C0FD79DCBFDD7524BF9815F03E15F3D43F063B57C0DAF1D9C09545D1BF2467873EDB5A453E8C2E42C01E7FF9BF6C32CDBFAC3FFF3FDCEAA13FC524A63FC7E5A5BF47C2C040A6A747C01F33B23F518506BF9E68C83FA9C8D8BFB0B6A63F9DF49D40A81165BF42DAF5BF0F2D99BFE1989ABF3468D3BE610643C0A9F50EC0702806C00C1A29C04A111140BE72EB3EE0938B3E01D95F3FC293BFBF8FDBE5BF0CB410BE597032C03AACC4BFF7DB61403BE5A23F985DF03F036D8240DF9EA2BEE02BBFBF72DBFF3EF0653A40BBC75A40DDF5B8BF808584BFC5695FC08ABD303EFC9CB2BF708CF03F74828040390484BF1BA322402FF562C0A9D310C0E0C7953F3598EA3FF1E923407BE11B4013B78B40B6AB23C001731E40A1B73A3F135DB43F5881413F87AC7CBF7297C8BF726B373F98D95440C9965AC010F80140AE73023E89803A3FDC7612C05F00633F4094B83FF97633C0C0C8AEBE5C9188BFA7DD9840E2A07D401D53ABBD262A863FCCE3AB3F0EA6974054BBD2BFCD9D35BF2FEB5A3E220CAEBFB510E6408C2F8E3F96DF2AC0973112BFBC10843D9ACB81C0A8388140E7EB6340290EC73E994B053C1052843FB1CF0AC0D7E9374083435F40883E0541BD761040189C72BF2AC28C401A5301BFCC4979BFA72B27C05330E5C0C0C117C01D0D8F3F330D90C08E096E3FBDFF5E40BD615FBFB1CF3D3F1600B83F285B5FC06E72C63FB07BA0C0C4068240C879C7BF9D85BABEF08939401CAF2540E87D30401840EF3FA9844940ED14B4BF738D11C00999F7BED931D2BF81F5C0BE328323409092B73FDB4304BFBA38033E4DCE633FEACE673EE6EF08C0A1C366400FB340402ADE11408D5EDAC06B0488BF5018F3BFA22437C098B5E3BFD3377840BB15AA3EF8FB643E165B124044025F3E0CECB540229EA2C0887D6B3E350E85C08674BD3D933FFDBFF2FBA6BFBD38AB3FFB6B2CC0D6F258409BA9BEC0CFA4753F6F854B404738DBC0AF36883F8D320F3F56E1DC3FBDD4B33FF88201C0B3D9A6BF2C2402C0180131C0E13366BFDBDFADBFEB7D3840EDF99DC0A5FA6EBDED6DB0BFDC3218C016AF99C0F22A693F05348540DEB5AC3FBD2564C010EED33ED54A83BF485905C022FC5EBFFE5BA73F65D5EFBF718679BFBB74C9BF80928240B9294EC05151B84043BE893FA91B03C0D09AA2BF6F8C3140C10B9040A7E8DD3F8764C93FEECB74400BFACAC05793D53F0CC91DC0FCC26A4095AA8DBD97037A3FA2EE88C0DC22C340E46396C09BBB8340FBE6A8BE01DEC3BFCA9D7D3F819C013FE95AE93D0146B53F92C7BDBFB8C3D03D4069B6BD19805DBF09F19E3FBEF42B4051C7A13FDCFFC2BE356D303E1D8D81C0C0CAFD3F2F0B793F5C06D33FBE59793F2DAFC63F72B29CC0321FCA4021B26C40C19A2E3FFF48F1BDD455CF3FCBC494C0F875A040A7F9ECBF4C5785BF4F9D0B4015AB1CC03C3965406DB78BBE5938963F293A813FB476DB3F8AFBE33F70DF8BBE9E2DD0BF559E7DC0F35A893F527CAF3FEF65E6BF2B946BC0BBAD93BF1FA2D8BEC6BDD8BF38CF50BC332E5CC08555054030DFFEBF629502C1958739BCFEDAC6C0DA353AC07F7E9A4082C221BF4FD446BCA80A30C0F015B3BFF317923F0DFC093EC962D13EB90EAB3E2C41ECBFDDAEFF3F5DAA95C09801084083DB1D4026F077BF44ED724009EE7E409FAE85BF1A0E4BC0BE4DA2C0138EB140945441C09C16ACC0208979C060EFFBBDD33825404D03413F4D4E33C0A6C916C07E6640C0B31CA5408A763BBDBD7D0B3D1EF95FBF343B8CC0F4FC1D40F249873F020D0A40E6E3C1BD81EB46BF63BC0FBF3D10304034E5A2C0139404C0A42C0EC0947369404EC5AEC0522391BDE66493406C4DCABFC06218C04898313DB6619A3FE4C684C0BE522940B589D6BF1A20E8BF6DD8A3BFF0E7A03F745F25C00A7A68BEFC1986BF45AE2BC0C4B780404CEF8EBFC5DB09405CEA55BF95294FC0C2D97340393C0140F87F2540537607C085E40840358DA83FA38EB2BEC3A10DC09FDE834098F98E404046583F7F9CADBFAF063BC0FAA4A33FF08A604004E628408B4AFCBEB4905FC02EC4B74009A7FABFC10AC2C02DEB40C049760CBFB2344E4071669A4000070F40E3DA863F6F2D1B409CE90B40C6479CBF50E7CB40BE8BD9BF968238407F2D45C0FE1845C0E0BFC2BFEA77DABFEF47D23FCCEAC8408496294065F6953EE4210340C58892402F09FFBF90C37C40877EA4C0FE26F93E7691883F996AEEBF88E608408DFC11C0345C844029868F400B8E5040CA5EA0BF3BAD38C05A3097C0A756BDBFE10D24BFF926F03D401FC540DED6983EB560C3BEAAC589BFC2CACD3CD8B0ECBFEC845D3F5E45F63EBD7596BF737BE4BFC26E034096BA58C0606BBF3FA92685BF87828A4083A383404D641D3FFD5EE5BF171DE4BF6CA5A23FB5AB1CBEBBBDB1404A567CBFCC2B0B4032BE0C40E063954007117C405C463840CA3ABF3FFB53C1BFD898953FF7E697C050EBF040220E103F1EA535C0D0292BC029293040D8F3EA3F8483313FB7DA93C0B1535B3F816317C0043AF1BEB57EFEC059934C408B94D940077FC73F1B8B6AC0476236400BBF413FC6E3B73F6E1D2FBEEB4F2740E1A0D63EEAAA8CBDF008AEC0EED98FC01CBF30C031C8D33F49C21ABF0055A540802CC0405402E8C05776A93F666225BEDE1689C03384D7BD924CEDBDE5B0B7C0A2FE963F9737A8BF33580840CB646FC0BB8912BFEFCDB4BFF029B140D8A60140D5BBB43E669283404031ADBF3C498A3E864BF43FF1262540B2CF37C0B3A7F2BF359485C07AEB473F566B8E408492EDC002C7423F7699A5BFBDBD49C0F68474BF63C45E3F58D8543F11F782BFE08C0240"> : tensor<20x20xcomplex<f32>>
    return %cst : tensor<20x20xcomplex<f32>>
  }
  func.func private @expected() -> (tensor<20x20xcomplex<f32>> {mhlo.layout_mode = "default"}) {
    %cst = stablehlo.constant dense<"0x86774C4101D5CC429180AA3D848999BE935F9CBFD7AC3ABEAC2FE6BFE770B5BDE27682BCF97BFEBC010138BC67812ABDA984BCBEBE80403FEF548B3D7B71E03DD77D1FC02A931DC15DDD8CBE3D6F453F5785524284A865428D56E73FC84A094107D9213B7CAC513FA7F79DBD93BABE3CBB1B96BC19A1553E5FF7ACC36A92E9422F1ED5BB73CC1DBC4DE9383D6F272ABEEA52C53DB9F0A23DCD8EC8C092462541F7AE6DBD5FECC93B1D12DBBDEACABCBEF4251B3DB16C8BBE63CEF4BCCA85BF3C02CF82C06ED1983FA8BD143E613EDE3DB6C96242C84C69C2FC2B1EBC3810343C9B022941E6A602C2D98080BE5F4DB7BE4E1990BDD4DF373EBB3F79BE76F4913E2F43A93BD795A93DC640803B68BF93BE49F51BBFA0BFA3BEC123A2B94FAD833D5FB2A4BED55D6F3F1EE2CB3C1265C13C9F490543DFB84FC3BA5C0541002F983EB1FD82BF86F804BF81FA84BF9506C73FB8E033C036A377C0C28B30C01C8AA93F1CA703BE06A1963E93FD98C093B94D4063BB8BBDBF44BEBCDD00C8C0C17FE7BE1BB4F341D62612C23843F43BCD90563C425304BD9ED92C3ED2363DBE557D70BE460D84BE8A7DEFBEE6A98FBF28CA713FC0BAA53F7FD51C40D3CC9341088AB0C0083D24BFDBCA8B3E79498FBE36D22240604B944038FBA440490C35BEF685D23DD2BB693FC1559E3D33B2C24080BFC8BF9E1715BEACDB4B3F0D79D3401D81A3BFEB32C33A50E11DBC4AB8143F39B7593FED662441A95079BF94D65E3E4553D3BBD38BA63E3A27C5BD8F195E3ECC96C5BEF4FE0B4489B0F0C2CE74AC4142F79B4165176ABF9B50CD3EDA1A6CC159D6F64152C2BFBE54BE0B3FE3346DBF8A71CD3F325095BC4AE9DBBC408A71C15A8C3540CD62EAC1183F244222E219C0B6753D3E65D6CC3DC05F583D9BB142C124C539C005219D3F05E68A3E89D284BA77E140B94BF1123EA72D84BDE34D213D66C7EA3BDE1E59C0E9EE3A40D6A29CBDC4E0533C3C8547410E13AAC176D6AF40CF4585C07AABC5426BD3C5426F1466C25793614148A54ABC55BDAE3C5F2EE5BFCAC59EBFD343813EB94450BE7C34343FFB62ADBDA57EC93E84FE41BF618DDA41C4539EC0B92060C06E018342FEEDA93D0FC31FBEBF9F4BC1F51B12414BDE4BC3CFCEB7408246083F96AE48BE7EF33D41474AD340CD3642B982221B3BFC54203D349400BF69DCA1BE697C92BE2E3D453EE7A32CBD9B169B3F68BB25BE96059FBF3E59B93DD6C38741AA37DBBF9EB717C0031250BFF5F88A3FA32E773F6C6BD53F8EF89F3F06C3263D16C290BAAE115D3FA45BF23D0A7B713D65F5783E5D6E3FBAB1622A3AB4FD37C0D9544F40ECD715C39DDAC04212AFFEBD4692AD3E2751D9BD0C9230BC0DDD1342F4E4ACC1D2504044CD4A08C4EC8B7F3B31CB93BA03768F3D913679BDB9725C432C6CDA43A8DFDB3DCB1BDABFBDF304426FE34DC0A2BBD3BD6DF47F3EDA86F94109160241556794C1DAD37442844CD93D9DEDF0BE47B1A0BDA12F49BFC139BC3B30828CBBE6023E425E6A3E42062B0DBC31C7963CFF2020417FF50C41BA0BE8BD9B4423408558E041FAD312C2DE878439C45D94BA437D49BCB898E6BB219D5EC0DD1592BFA68623BEF2090DC0E38CD5BCBDB5643CFA87553D6DA16EBFF67207BCE2895DBDE73FF03EED6B733E3ECBA4C0015D943F921B94B8A01F90BA5BA9A33FB7827F3EC19F91BC782637BD9C55A9BD78E83B3EFF5F743F3E5E5A405865873EF5C38FBDA695003C700F323DFAC3453B625D173FE8A9473DD686353EE638AE42F337D9C26B4A5B3D11A40BBEBF278C3E089AF5BD856CEFBCDF4F19BDA2FFDCBD731B71BD5B520A41AB038940BBAC573F82F8803F078D4CBDFB765FBE938550BFD6E199BEF9F64BBE7278A6BD8B208ABF1CCE5940E2CE5F42302793C103D9493EC564DC3DAE9C8DC107F4A0C0C559F63D0D9D4FBE3FF2F53C7E81AB3BB50A9ABD4AB3713E2FF3E341F5633EC2BEB73AC1B3EC9F407535263DA236C43DA346A7C0D6655B40E02278C084EB2BC1FDAA79BDD81B443D55F2AA3E43FD0240663D963F2E6EE3BF971E213E36500C3E8645D6C18EC5F04082DCF14024D6773F716CAEBF06CBC7BF99959F3E700D1A4075BC693D0016A6BCB724B63C83CAAFBE4EB65142E8AC8CC0EFFB243F47D531408D0D0AC1FEFDE3C21521F63E7ABED53D0F1A223E0CF64E3E98222DC00AA2B0BFB951103F121C153D431E31BC0DA25DBC70520242F1885541E209043F37C25D3FE6BBE1BD05E6F73C44FB6EC1900BE9410376B2403458F8C0655E8E42A3781DC2C6DFA6BE3B5943BE7FDE11BA418E0DBA6CC223BFF1583F4049BF18C06A085ABF17C99D3E147E903E65447DC05EF3B73F64D8B33F00F78F403A87383FE5A668C216A22CBFF1D92A3E548445C10B939F404571CFC0EB4D3DBD9D3822BE7E3F3FBEC50934BD7B701DBF703F12BF9473C23EA57F6940B0A804C06830373F7F1A623FDEED2CBF753D87BF2BF911C23576994091FD0541AAF2A0C0F43BE4BD0877A7BEC09D41BC792365BDD0D03642AA457C414E2452BF1688713F2684833FBC3933BF3317C63B9180B93A76227F3CEE5ABD3A7703153D329B08BE89D65BC0EA08D3BF6EDDE041B78617410AF326C0D763CDBD02AE063A53B1723AC8238ABED543DD3F5837E4BF83876AC01C3EF8BD19DB78BE9B63203DC3CB49BD22787EBE14CB863D87CDEA3BB970DBB9776A3ABECF6B32BE82E7A43BC97BD43BBECC614108AD7A422E46D43CBD813A3CC11E34BE19F69FBE6F15DF3D78E5CE3E508DB03D341F02BEC2BCFABD55392BBE05930D3D0059A3BC8FA2ACBF50B526C0BA2486BEF782CE3D20DF69C128E8B142D85B6FC046E442C0430734B9A673E53A9D7496BDA6EB2EBDD6BC053F4EF2453F5A1D5F3C4C2E27BBB548A7BBC8C4F6BBFFF9EE3CE6E937BF29BC16408D2AA73F35B5303EBEBC8D3FCF46673E4842BD3C05DC173FC84532BF3A0647C0A3A1C23F00475240C264A8BF99683BBF38886F3F27D682403B14C0401D053B4083A2894040A35D3F6C8A944001F6EAC3B44192C3646BFB3F08126EBE91CCA3BEDB57A1402CC526C2A4AD10C3992F4FBE2201943E3C39A0BDCDDE16BDCCC2963E19B1333F2751C9BE80D52D400AECB640D803CDBF9F3109BEB562133ED998143FFE6F3740DE3D11BEB4DBAD3D2045933E68A204BED34F3C3E6B9B19BB26C680BCB3D8E43C644329BDAB4005BE16847C3FC8838B3D9EE7CD3B4CBF5DBD0414083F5463D3BBF0D3323C5CEA80BD74914640CA5CD73EA604B63F66B8FC3E1EDA85BDB832133E2883A0BB7FA5013CA495D5407C551BC11E3AEDC15DC704C2A416B4BEB387333CB377983B48B689BB2F9CF63C8B201D3DF6BBA43CF3F022BB872C1A4183C5104142CF2FBD94DB2FBD9655AF3C7BB636BDE567743FA439053D35670ABE50EDC93EA9B0B9408A7E244190B50941123951BFF342C73E74AB7ABEE9F6B840F0D56841E04B9CBD044FCDBDBA23D141A9DBE0410078CABD95236DBF82B918BE625211BE85B3BE3E07C3793F525563BC0DFBF53B592B38BD8AFB39BED9B6AF3DC366873E589B963DC82A8BBCF8FDA0BE87281FBE92F3C341DAB548C23E01B9400795CCC05189FCBCB97CC7BCA6CACCC016517E4017B984BD4CE9CF3D8D7060402237A3BFBAC979BD84F1B9BD4E8067420D658242B8BB80BE3F8D65BDA98956C052E3A4BFFF584541DBECD3C0A78FD53C0E2880BC5E080D3ED78EFB3CAE832B3DADB0D1BC945C34402659C7C163DD9340A8F4014109B2D0C0599D1341B66B963EB048D63C54EC34BE5D733F3DFFB73BBD26483ABBE889F2BCA7905DBEFC6DA5402793BFBC74C7584166BF824009E783BF6E1CF6C093FCC0BDB1D9C9BD6896A93BC871333BF81156BF2A2632C0252CB1C0AD06CEC0648E61C14AD673C22A1B0241E3B0C5C1B573333A08A2643D42003B3E4D790BBEE3D58E3F36670DBEA81DA03F817F00BF5E74AE3EEA440C3C83FAD03DF35CF53D3F7C1F3FDF17BFBF328D9FBDBE2D183ED0DC263B642D0A3DB18B07BE79C0A7BEA3E24742DC230D42DB2C0FBDF2D526BE556261403A050BBF64B20E43256557C3377CA5C01CC6E34099E894C2646398C201DCAE3F64FE8D4143FAB03D1118503E6ABD353B76BA063CF66ED6BF334206BFFDA582BDCB40D63C0D469A401F3780400A58D33BCDE0F33B455EAB3DBE972EBD2B12B8B94DDAA1B7449C2F41784E6044A9EEC8BC4E75F13B7BF8913E89300740E1723ABF1428D93E1132C23F23C0D5BD314E75BA590E8B3BD533ADBBD1F3803DAD78753E805BFBBE22456643DEF6A6C307646D40B0B51ABF46A2603CC9CFBDBA6B37433F3E8CEB3E815D533FA26349C0737DDEC0A3DD97400218B63DDA9E0EBF7909DFC2D9EF634368F84DBF024996BF1E0E7F3E023A8D3D88B3B6C006A56540F9FB93BC58A25BBD3509333C1172313CD8D10E42CAC49BC203DA153F2FBE03C09546CA3C2CFB0EBD45E8CD3FA4CAE13F696326BE0D2AA43E"> : tensor<20x20xcomplex<f32>>
    return %cst : tensor<20x20xcomplex<f32>>
  }
}