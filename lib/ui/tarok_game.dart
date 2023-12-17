import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';

import '../globals.dart' as globals;
import 'card.dart';
import '../game_logic/deck.dart';
import 'player_pile.dart';
import 'win_pile.dart';
import 'table_pile.dart';

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

    /*Deck d = Deck ();
    d.setFullDeck ();
    d.shuffle (ShuffleMethod.Random);
    Vector2 pos = Vector2 (600, 0);
    for (int i = 0; i < d.length; i++) {
      d[i].angle = Random ().nextInt(2) * pi + 0.2 - Random ().nextDouble() * 0.4;
      d[i].position = pos;
      world.add(d[i]);
      if ((i + 1) % 9 == 0) {
        pos.x = 600.0;
        pos.y += 900.0;
      }
      else {
        pos.x += 600.0;
      }
    }*/

    List<WinPile> wins = List.generate(
      PlayerPosition.values.length, (i) => WinPile (PlayerPosition.values[i]),
    );
    world.addAll (wins);

    List<PlayerPile> players = List.generate(
      PlayerPosition.values.length, (i) => PlayerPile (PlayerPosition.values[i]),
    );
    world.addAll (players);

    TablePile tablePile = TablePile ();
    tablePile.position = Vector2 (900, 9009);
    tablePile.size = Vector2 (7200, 7200);
    world.add (tablePile);

    Deck playingDeck = Deck ();
    playingDeck.setFullDeck();
    playingDeck.shuffle(ShuffleMethod.Random);
    
    for (int i = 0; i < PlayerPosition.values.length; i++) {
      for (int j = 0; j < 12; j++) {
        playingDeck.moveTo(players[i].deck!, card: playingDeck[0]);
      }
      players[i].deck.sort ([Suit.Hearts, Suit.Clubs, Suit.Tarock, Suit.Spades, Suit.Diamonds]);
      players[i].arrangeDeck();
    }

    camera.viewfinder.visibleGameSize = Vector2(9000, 9000);
    camera.viewfinder.position = Vector2(4500, 4500);
    camera.viewfinder.anchor = Anchor.center;
  }
}