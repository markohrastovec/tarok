import 'dart:html';
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

  TablePile tablePile = TablePile ();
  List<WinPile> wins = <WinPile>[];
  List<PlayerPile> players = <PlayerPile>[];

  @override
  Future<void> onLoad () async {
    await super.onLoad ();
    await Flame.images.loadAll (imageFiles);
    //await Flame.device.fullScreen ();
    //await Flame.device.setLandscape ();

    //TODO: Position elements according to actual screen width/height ratio.
    double screenRatio = camera.visibleWorldRect.width / camera.visibleWorldRect.height;

    world.add (tablePile);

    wins = List.generate(
      PlayerPosition.values.length, (i) {
      WinPile winPile = WinPile ();
      return winPile;
    });
    world.addAll (wins);

    players = List.generate(
      PlayerPosition.values.length, (i) {
      PlayerPile playerPile = PlayerPile ();
      return playerPile;
    });
    world.addAll (players);

    arrangePiles ();

    for (int i = 0; i < PlayerPosition.values.length; i++) {
      wins[i].arrangeDeck();
    }

    Deck playingDeck = Deck ();
    playingDeck.setFullDeck ();
    playingDeck.shuffle (ShuffleMethod.Random);
    
    for (int i = 0; i < PlayerPosition.values.length; i++) {
      for (int j = 0; j < 12; j++) {
        playingDeck.moveTo (players[i].deck, card: playingDeck[0]);
      }
      players[i].deck.sort ([Suit.Hearts, Suit.Clubs, Suit.Tarock, Suit.Spades, Suit.Diamonds]);
      players[i].arrangeDeck (setAngle: true); //TODO: this should be called onMount???
    }
  }

  void arrangePiles () {
    double screenRatio = camera.visibleWorldRect.width / camera.visibleWorldRect.height;

    tablePile.position = Vector2.all (Card.cardHeight * (1.0 - Card.cardOverlap));
    double tableSizeFor12Cards = Card.cardWidth + 11 * Card.cardWidth * (1.0 - Card.cardOverlap);
    if (screenRatio >= 1.0) {
      tablePile.size = Vector2 (tableSizeFor12Cards, tableSizeFor12Cards / screenRatio);
    }
    else {
      tablePile.size = Vector2 (tableSizeFor12Cards * screenRatio, tableSizeFor12Cards);
    }

    Vector2 visibleGameSize = Vector2 (tablePile.size.x + 2.0 * tablePile.position.x, tablePile.size.y + 2.0 * tablePile.position.y);

    for (int i = 0; i < wins.length; i++) {
      wins[i].size = tablePile.position;
      switch (PlayerPosition.values[i]) {
        case PlayerPosition.South:
          wins[i].position = Vector2 (wins[i].size.x + tablePile.size.x, wins[i].size.y + tablePile.size.y);
          if (screenRatio < 1.0) {
            wins[i].size.y /= screenRatio;
          }
          else {
            wins[i].size.x *= screenRatio;
          }
          break;
        case PlayerPosition.East:
          wins[i].position = Vector2 (wins[i].size.x + tablePile.size.x, wins[i].size.y);
          wins[i].angle = -pi / 2.0;
          if (screenRatio > 1.0) {
            wins[i].size.y *= screenRatio;
          }
          else {
            wins[i].size.x /= screenRatio;
          }
          break;
        case PlayerPosition.North:
          wins[i].position = Vector2 (wins[i].size.x, wins[i].size.y);
          wins[i].angle = pi;
          if (screenRatio < 1.0) {
            wins[i].size.y /= screenRatio;
          }
          else {
            wins[i].size.x *= screenRatio;
          }
          break;
        case PlayerPosition.West:
          wins[i].position = Vector2 (wins[i].size.x, wins[i].size.x + tablePile.size.y);
          wins[i].angle = pi / 2.0;
          if (screenRatio > 1.0) {
            wins[i].size.y *= screenRatio;
          }
          else {
            wins[i].size.x /= screenRatio;
          }
          break;
      }
    }

    for (int i = 0; i < players.length; i++) {
      switch (PlayerPosition.values[i]) {
        case PlayerPosition.South:
          players[i].size = Vector2(tablePile.size.x, Card.cardHeight * (1.0 - Card.cardOverlap));
          players[i].position = Vector2(players[i].size.y, players[i].size.y + tablePile.size.y);
          if (screenRatio < 1.0) {
            players[i].size.y /= screenRatio;
          }
          break;
        case PlayerPosition.East:
          players[i].size = Vector2(tablePile.size.y, Card.cardHeight * (1.0 - Card.cardOverlap));
          players[i].position = Vector2 (players[i].size.y + tablePile.size.x, players[i].size.y + tablePile.size.y);
          players[i].angle = -pi / 2.0;
          if (screenRatio > 1.0) {
            players[i].size.y *= screenRatio;
          }
          break;
        case PlayerPosition.North:
          players[i].size = Vector2(tablePile.size.x, Card.cardHeight * (1.0 - Card.cardOverlap));
          players[i].position = Vector2(players[i].size.y + tablePile.size.x, players[i].size.y);
          players[i].angle = pi;
          if (screenRatio < 1.0) {
            players[i].size.y /= screenRatio;
          }
          break;
        case PlayerPosition.West:
          players[i].size = Vector2(tablePile.size.y, Card.cardHeight * (1.0 - Card.cardOverlap));
          players[i].position = Vector2(players[i].size.y, players[i].size.y);
          players[i].angle = pi / 2.0;
          if (screenRatio > 1.0) {
            players[i].size.y *= screenRatio;
          }
          break;
      }
    }

    camera.viewfinder.visibleGameSize = visibleGameSize;
    camera.viewfinder.position = Vector2.copy (camera.viewfinder.visibleGameSize!) / 2.0;
    camera.viewfinder.anchor = Anchor.center;
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    //TODO: resize all piles
  }
}