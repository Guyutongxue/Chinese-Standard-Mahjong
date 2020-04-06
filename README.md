# Chinese-Standard-Mahjong

![Build status](https://api.travis-ci.org/Guyutongxue/Chinese-Standard-Mahjong.svg)

README: [English](README-en.md) | [中文](README.md)

此项目提供的资料为北京大学网络所人工智能实验室与微智娱（北京）科技有限公司联合举办的国标麻将比赛。

[点此查看](https://www.botzone.org.cn/static/gamecontest2020a.html)Botzone上的国标麻将比赛。

[Botzone](https://www.botzone.org.cn/)是在线的AI程序对抗平台。用户根据游戏规则编写AI程序提交，平台使用天梯排名和小组比赛机制来评测AI的相对水平。在以下内容叙述中，我们将AI程序又称为bot。

[点此查看](https://wiki.botzone.org.cn/index.php?title=%E9%A6%96%E9%A1%B5/en)维基来了解更多关于Botzone。

- [比赛宗旨](#比赛宗旨)
- [麻将历史](#麻将历史)
- [项目使用](#项目使用)
- [贡献者](#贡献者)

## 比赛宗旨

- 基于Botzone平台开发国标麻将AI，使之具有能与麻将专业玩家匹配的水平。
- 吸引更多研究团队使用Botzone，在此平台上做学术、教育等方面的研究。

## 麻将历史

麻将是一个非完全信息的四人游戏，起源于3000多年前的中国，而后传播至世界各地，延伸出不同的版本，深受人们喜爱，具有广泛的群众基础。1998年中国国家体育总局制订了国标麻将的规则，这也是我们在本次比赛中所使用的规则。在Botzone上的国标麻将，我们将原本的打4圈（共16局）简化为1局，但在实际比赛中我们将考虑座次公平性，交换座次在相同起手下进行比赛。

想打好麻将需要策略，也需要一定运气。这种不确定性增加了麻将的趣味性和挑战性。不同于日本立直麻将，国标麻将鼓励玩家采取进攻性策略，（有所表现为多吃多碰多杠），这使得游戏的可观赏性大大增加。

## 项目使用

我们在此项目中提供了以下资料：

- [MahjongGB 算番器](https://github.com/Guyutongxue/Chinese-Standard-Mahjong/tree/master/MahjongGB)：这引自[ChineseOfficialMahjongHelper](https://github.com/summerinsects/ChineseOfficialMahjongHelper/tree/master/Classes/mahjong-algorithm)。根目录下的 `test.cpp` 为算番器的样例代码。
- [Judge Program 裁判程序](https://github.com/Guyutongxue/Chinese-Standard-Mahjong/tree/master/judge)：[点此查看](https://wiki.botzone.org.cn/index.php?title=%E8%A3%81%E5%88%A4)Botzone裁判程序维基资料。
- [Mahjong Rules 麻将规则](https://github.com/Guyutongxue/Chinese-Standard-Mahjong/tree/master/mahjong-rules)：我们提供了中英文的麻将番种说明。[点此查看](https://wiki.botzone.org.cn/index.php?title=Chinese-Standard-Mahjong)Botzone上的国标麻将游戏说明。
- [Sample bot 样例bot程序](https://github.com/Guyutongxue/Chinese-Standard-Mahjong/tree/master/sample-bot)：这是Botzone上的样例bot程序。

## 编译

如果你没有配置 Boost 库，请自行配置。

请前往 [JsonCpp](https://github.com/open-source-parsers/jsoncpp) 获取 JsonCpp 源码并编译。将生成的 `libjsoncpp.a` 导入本仓库的 `lib` 文件夹中。
执行以下 Make 目标来生成你想要生成的东西：
```Shell
make                # 生成全部
make all            # 生成全部
make judge          # 生成裁判程序
make MahjongGB      # 生成算番器
make test           # 生成算番器演示代码（依赖于 MahjongGB）
make sample-bot     # 生成样例 Bot （依赖于 MahjongGB，尽管实际不需要）
```

如果你在 Windows 上使用 MinGW 系列，请更改命令为 `mingw32-make`，并将 `Makefile` 中 `FILE_EXT` 改为 `.exe`。

暂时不考虑 MSVC。


当然也提供了 `make clean` 目标用以清除生成文件，但是目前不支持 Windows 系统。

P.S. 如果你高兴的话，你可以按照 `.travis.yml` 里的步骤去做。

## Note

为了兼容性，我将 `package/mahjong-algorithm/include` 内的文件全部复制到 `include\mahjong-algorithm` 中，而非建立链接。

## 微信公众号

欢迎关注Botzone官方公众号，接收最新比赛通知！

![avatar](https://www.botzone.org.cn/images/qrcode_for_gh_3a40a410124d_258.jpg)

## 贡献者

@ailab-pku
