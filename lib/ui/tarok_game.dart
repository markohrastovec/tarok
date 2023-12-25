import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';

import '../globals.dart' as globals;
import 'card.dart';
import '../game_logic/deck.dart';
import 'player_pile.dart';
import 'win_pile.dart';
import 'table_pile.dart';

enum PlayerPosition {
  South,
  East,
  North,
  West
}

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

    //TODO: Position elements according to actual screen width/height ratio.
    //TODO: Move code to a function that is executed on each resize. Calculate ratio from "Rect visibleWorld = camera.visibleWorldRect;"
    double screenRatio = camera.visibleWorldRect.width / camera.visibleWorldRect.height;

    TablePile tablePile = TablePile ();
    tablePile.position = Vector2.all (Card.cardHeight * (1.0 - Card.cardOverlap));
    tablePile.size = Vector2.all (12 * Card.cardWidth * (1.0 - Card.cardOverlap));
    world.add (tablePile);
    double excessPlayerSpace = 0.0;
    double visibleGameSize = tablePile.size.x + 2.0 * tablePile.position.x;
    if (screenRatio > 1.0) {
      excessPlayerSpace = (screenRatio - 1.0) * visibleGameSize / 2.0;
    }
    else if (screenRatio < 1.0) {
      excessPlayerSpace = (1.0 / screenRatio - 1.0) * visibleGameSize / 2.0;
    }

    List<WinPile> wins = List.generate(
      PlayerPosition.values.length, (i) {
      WinPile winPile = WinPile();
      winPile.size = tablePile.position;
      switch (PlayerPosition.values[i]) {
        case PlayerPosition.South:
          winPile.position = Vector2.all(winPile.size.x + tablePile.size.x);
          if (screenRatio < 1.0) {
            winPile.size.y += excessPlayerSpace;
          }
          else {
            winPile.size.x += excessPlayerSpace;
          }
          break;
        case PlayerPosition.East:
          winPile.position = Vector2(winPile.size.y + tablePile.size.x, winPile.size.y);
          winPile.angle = -pi / 2.0;
          if (screenRatio > 1.0) {
            winPile.size.y += excessPlayerSpace;
          }
          else {
            winPile.size.x += excessPlayerSpace;
          }
          break;
        case PlayerPosition.North:
          winPile.position = Vector2(winPile.size.x, winPile.size.y);
          winPile.angle = pi;
          if (screenRatio < 1.0) {
            winPile.size.y += excessPlayerSpace;
          }
          else {
            winPile.size.x += excessPlayerSpace;
          }
          break;
        case PlayerPosition.West:
          winPile.position = Vector2(winPile.size.y, winPile.size.y + tablePile.size.x);
          winPile.angle = pi / 2.0;
          if (screenRatio > 1.0) {
            winPile.size.y += excessPlayerSpace;
          }
          else {
            winPile.size.x += excessPlayerSpace;
          }
          break;
      }
      return winPile;
    });
    world.addAll (wins);

    List<PlayerPile> players = List.generate(
      PlayerPosition.values.length, (i) {
      PlayerPile playerPile = PlayerPile();
      playerPile.size = Vector2(tablePile.size.x, Card.cardHeight * (1.0 - Card.cardOverlap));
      switch (PlayerPosition.values[i]) {
        case PlayerPosition.South:
          playerPile.position = Vector2(playerPile.size.y, playerPile.size.y + tablePile.size.y);
          if (screenRatio < 1.0) {
            playerPile.size.y += excessPlayerSpace;
          }
          break;
        case PlayerPosition.East:
          playerPile.position = Vector2.all(playerPile.size.y + tablePile.size.x);
          playerPile.angle = -pi / 2.0;
          if (screenRatio > 1.0) {
            playerPile.size.y += excessPlayerSpace;
          }
          break;
        case PlayerPosition.North:
          playerPile.position = Vector2(playerPile.size.y + tablePile.size.x, playerPile.size.y);
          playerPile.angle = pi;
          if (screenRatio < 1.0) {
            playerPile.size.y += excessPlayerSpace;
          }
          break;
        case PlayerPosition.West:
          playerPile.position = Vector2(playerPile.size.y, playerPile.size.y);
          playerPile.angle = pi / 2.0;
          if (screenRatio > 1.0) {
            playerPile.size.y += excessPlayerSpace;
          }
          break;
      }
      return playerPile;
    });
    world.addAll (players);

    Deck playingDeck = Deck ();
    playingDeck.setFullDeck();
    playingDeck.shuffle(ShuffleMethod.Random);
    
    for (int i = 0; i < PlayerPosition.values.length; i++) {
      for (int j = 0; j < 12; j++) {
        playingDeck.moveTo(players[i].deck, card: playingDeck[0]);
      }
      players[i].deck.sort ([Suit.Hearts, Suit.Clubs, Suit.Tarock, Suit.Spades, Suit.Diamonds]);
      players[i].arrangeDeck(setAngle: true);
    }

    camera.viewfinder.visibleGameSize = Vector2.all(visibleGameSize);
    camera.viewfinder.position = Vector2.copy (camera.viewfinder.visibleGameSize!) / 2.0;
    camera.viewfinder.anchor = Anchor.center;
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
  }
}