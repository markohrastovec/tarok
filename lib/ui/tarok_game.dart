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
    List<String> face = <String>[
      'slo',
      'slo2',
    ];
    for (int i = 0; i < face.length; i++) {
      imageFile.add ('cards/backs/${face[i]}/backside.png');
      imageFile.add ('cards/faces/${face[i]}/clubs_7.png');
      imageFile.add ('cards/faces/${face[i]}/clubs_8.png');
      imageFile.add ('cards/faces/${face[i]}/clubs_9.png');
      imageFile.add ('cards/faces/${face[i]}/clubs_10.png');
      imageFile.add ('cards/faces/${face[i]}/clubs_jack.png');
      imageFile.add ('cards/faces/${face[i]}/clubs_knight.png');
      imageFile.add ('cards/faces/${face[i]}/clubs_queen.png');
      imageFile.add ('cards/faces/${face[i]}/clubs_king.png');
      imageFile.add ('cards/faces/${face[i]}/diamonds_1.png');
      imageFile.add ('cards/faces/${face[i]}/diamonds_2.png');
      imageFile.add ('cards/faces/${face[i]}/diamonds_3.png');
      imageFile.add ('cards/faces/${face[i]}/diamonds_4.png');
      imageFile.add ('cards/faces/${face[i]}/diamonds_jack.png');
      imageFile.add ('cards/faces/${face[i]}/diamonds_knight.png');
      imageFile.add ('cards/faces/${face[i]}/diamonds_queen.png');
      imageFile.add ('cards/faces/${face[i]}/diamonds_king.png');
      imageFile.add ('cards/faces/${face[i]}/hearts_1.png');
      imageFile.add ('cards/faces/${face[i]}/hearts_2.png');
      imageFile.add ('cards/faces/${face[i]}/hearts_3.png');
      imageFile.add ('cards/faces/${face[i]}/hearts_4.png');
      imageFile.add ('cards/faces/${face[i]}/hearts_knight.png');
      imageFile.add ('cards/faces/${face[i]}/hearts_queen.png');
      imageFile.add ('cards/faces/${face[i]}/hearts_jack.png');
      imageFile.add ('cards/faces/${face[i]}/hearts_king.png');
      imageFile.add ('cards/faces/${face[i]}/spades_7.png');
      imageFile.add ('cards/faces/${face[i]}/spades_8.png');
      imageFile.add ('cards/faces/${face[i]}/spades_9.png');
      imageFile.add ('cards/faces/${face[i]}/spades_10.png');
      imageFile.add ('cards/faces/${face[i]}/spades_jack.png');
      imageFile.add ('cards/faces/${face[i]}/spades_knight.png');
      imageFile.add ('cards/faces/${face[i]}/spades_queen.png');
      imageFile.add ('cards/faces/${face[i]}/spades_king.png');
      imageFile.add ('cards/faces/${face[i]}/I.png');
      imageFile.add ('cards/faces/${face[i]}/II.png');
      imageFile.add ('cards/faces/${face[i]}/III.png');
      imageFile.add ('cards/faces/${face[i]}/IIII.png');
      imageFile.add ('cards/faces/${face[i]}/V.png');
      imageFile.add ('cards/faces/${face[i]}/VI.png');
      imageFile.add ('cards/faces/${face[i]}/VII.png');
      imageFile.add ('cards/faces/${face[i]}/VIII.png');
      imageFile.add ('cards/faces/${face[i]}/IX.png');
      imageFile.add ('cards/faces/${face[i]}/X.png');
      imageFile.add ('cards/faces/${face[i]}/XI.png');
      imageFile.add ('cards/faces/${face[i]}/XII.png');
      imageFile.add ('cards/faces/${face[i]}/XIII.png');
      imageFile.add ('cards/faces/${face[i]}/XIV.png');
      imageFile.add ('cards/faces/${face[i]}/XV.png');
      imageFile.add ('cards/faces/${face[i]}/XVI.png');
      imageFile.add ('cards/faces/${face[i]}/XVII.png');
      imageFile.add ('cards/faces/${face[i]}/XVIII.png');
      imageFile.add ('cards/faces/${face[i]}/XIX.png');
      imageFile.add ('cards/faces/${face[i]}/XX.png');
      imageFile.add ('cards/faces/${face[i]}/XXI.png');
      imageFile.add ('cards/faces/${face[i]}/skis.png');
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