import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';

import '../globals.dart' as globals;
import 'deck.dart';

class TarokGame extends FlameGame {
  List<String> imageFiles = <String>[
    globals.cardBackFace + 'backside.png',
    globals.cardFace + 'clubs_7.png',
    globals.cardFace + 'clubs_8.png',
    globals.cardFace + 'clubs_9.png',
    globals.cardFace + 'clubs_10.png',
    globals.cardFace + 'clubs_jack.png',
    globals.cardFace + 'clubs_knight.png',
    globals.cardFace + 'clubs_queen.png',
    globals.cardFace + 'clubs_king.png',
    globals.cardFace + 'diamonds_1.png',
    globals.cardFace + 'diamonds_2.png',
    globals.cardFace + 'diamonds_3.png',
    globals.cardFace + 'diamonds_4.png',
    globals.cardFace + 'diamonds_jack.png',
    globals.cardFace + 'diamonds_knight.png',
    globals.cardFace + 'diamonds_queen.png',
    globals.cardFace + 'diamonds_king.png',
    globals.cardFace + 'hearts_1.png',
    globals.cardFace + 'hearts_2.png',
    globals.cardFace + 'hearts_3.png',
    globals.cardFace + 'hearts_4.png',
    globals.cardFace + 'hearts_knight.png',
    globals.cardFace + 'hearts_queen.png',
    globals.cardFace + 'hearts_jack.png',
    globals.cardFace + 'hearts_king.png',
    globals.cardFace + 'spades_7.png',
    globals.cardFace + 'spades_8.png',
    globals.cardFace + 'spades_9.png',
    globals.cardFace + 'spades_10.png',
    globals.cardFace + 'spades_jack.png',
    globals.cardFace + 'spades_knight.png',
    globals.cardFace + 'spades_queen.png',
    globals.cardFace + 'spades_king.png',
    globals.cardFace + 'I.png',
    globals.cardFace + 'II.png',
    globals.cardFace + 'III.png',
    globals.cardFace + 'IIII.png',
    globals.cardFace + 'V.png',
    globals.cardFace + 'VI.png',
    globals.cardFace + 'VII.png',
    globals.cardFace + 'VIII.png',
    globals.cardFace + 'IX.png',
    globals.cardFace + 'X.png',
    globals.cardFace + 'XI.png',
    globals.cardFace + 'XII.png',
    globals.cardFace + 'XIII.png',
    globals.cardFace + 'XIV.png',
    globals.cardFace + 'XV.png',
    globals.cardFace + 'XVI.png',
    globals.cardFace + 'XVII.png',
    globals.cardFace + 'XVIII.png',
    globals.cardFace + 'XIX.png',
    globals.cardFace + 'XX.png',
    globals.cardFace + 'XXI.png',
    globals.cardFace + 'skis.png',
  ];

  @override
  Future<void> onLoad () async {
    await super.onLoad ();
    await Flame.images.loadAll (imageFiles);
    //await Flame.device.fullScreen ();
    //await Flame.device.setLandscape ();

    Deck d = Deck ();
    d.setFullDeck ();
    world.add (Deck.hearts1);

    camera.viewfinder.visibleGameSize = Vector2(1000, 2000);
    camera.viewfinder.position = Vector2(500, 1000);
    camera.viewfinder.anchor = Anchor.center;
  }
}