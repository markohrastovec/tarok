import 'package:flame/flame.dart';
import 'package:flame/game.dart';

import '../globals.dart' as globals;
import 'main_page.dart';
import 'settings_page.dart';
import 'start_page.dart';
import 'end_page.dart';

class TarokGame extends FlameGame {
  List<String> imageFile = <String>[];

  TarokGame ()
  : super ()
  {
    for (int i = 0; i < globals.cardBackFace.length; i++) {
      imageFile.add('cards/backs/${globals.cardBackFace[i]}/backside.png');
    }
    for (int i = 0; i < globals.cardFace.length; i++) {
      imageFile.add ('cards/faces/${globals.cardFace[i]}/clubs_7.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/clubs_8.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/clubs_9.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/clubs_10.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/clubs_jack.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/clubs_knight.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/clubs_queen.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/clubs_king.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/diamonds_1.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/diamonds_2.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/diamonds_3.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/diamonds_4.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/diamonds_jack.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/diamonds_knight.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/diamonds_queen.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/diamonds_king.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/hearts_1.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/hearts_2.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/hearts_3.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/hearts_4.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/hearts_knight.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/hearts_queen.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/hearts_jack.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/hearts_king.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/spades_7.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/spades_8.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/spades_9.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/spades_10.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/spades_jack.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/spades_knight.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/spades_queen.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/spades_king.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/I.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/II.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/III.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/IIII.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/V.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/VI.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/VII.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/VIII.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/IX.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/X.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/XI.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/XII.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/XIII.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/XIV.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/XV.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/XVI.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/XVII.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/XVIII.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/XIX.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/XX.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/XXI.png');
      imageFile.add ('cards/faces/${globals.cardFace[i]}/skis.png');
    }
  }

  late final RouterComponent router;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await images.loadAll(imageFile);
    await Flame.device.fullScreen();
    //await Flame.device.setLandscape();

    add(
      router = RouterComponent (
        routes: {
          'start': Route (StartPage.new),
          'main': Route (MainPage.new),
          'settings': Route (SettingsPage.new/*, transparent: true*/),
          'end': Route (EndPage.new),
        },
        initialRoute: 'start',
      ),
    );
  }
}