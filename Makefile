all: judge MahjongGB test sample-bot
.PHNOY: all

FILE_EXT:= .out

.PHONY: judge
judge: judge/judge$(FILE_EXT)

judge/judge$(FILE_EXT): judge/main.cpp lib/libmahjong-algorithm.a
	g++ judge/main.cpp -o judge/judge$(FILE_EXT) -Llib -lmahjong-algorithm -ljsoncpp -Iinclude

lib/libmahjong-algorithm.a: package/mahjong-algorithm/fan_calculator.o package/mahjong-algorithm/shanten.o package/mahjong-algorithm/stringify.o
	ar -crv $@ $^

package/mahjong-algorithm/%.o: package/mahjong-algorithm/%.cpp
	g++ -Ipackage/mahjong-algorithm/include -c $< -o $@

.PHONY: MahjongGB
MahjongGB: lib/libmahjonggb.a

lib/libmahjonggb.a: MahjongGB/MahjongGB.o lib/libmahjong-algorithm.a
	ar -crv $@ $< package/mahjong-algorithm/*.o

MahjongGB/MahjongGB.o: MahjongGB/MahjongGB.cpp
	g++ -c $< -o $@

.PHONY: test
test: test$(FILE_EXT)

test$(FILE_EXT): test.cpp lib/libmahjonggb.a
	g++ test.cpp -Iinclude -Llib -lmahjonggb -o test$(FILE_EXT)

.PHONY: sample-bot
sample-bot: sample-bot/sample$(FILE_EXT)

sample-bot/sample$(FILE_EXT): sample-bot/sample.cpp lib/libmahjonggb.a
	g++ $< -Iinclude -Llib -ljsoncpp -lmahjonggb -o $@

.PHONY: clean
clean:
	if [ -f "lib/libmahjong-algorithm.a" ]; then rm lib/libmahjong-algorithm.a; fi
	find -name "*.o" -exec rm -f {} \;
	find -name "*$(FILE_EXT)" -exec rm -f {} \;
	if [ -f "lib/libmahjonggb.a" ]; then rm lib/libmahjonggb.a; fi