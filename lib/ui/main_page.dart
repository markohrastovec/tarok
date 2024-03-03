import 'dart:math';

import 'package:flame/components.dart';

import 'tarok_game.dart';
import 'card.dart';
import '../game_logic/deck.dart';
import 'player_pile.dart';
import 'win_pile.dart';
import 'table_pile.dart';

enum PlayerPosition {
  south,
  east,
  north,
  west
}

class MainPage extends Component with HasGameReference<TarokGame> {
  TablePile tablePile = TablePile ();
  List<WinPile> wins = <WinPile>[];
  List<PlayerPile> players = <PlayerPile>[];

  @override
  void onLoad () {
    super.onLoad ();

    game.world.add (tablePile);

    wins = List.generate (PlayerPosition.values.length, (i) {
      WinPile winPile = WinPile ();
      return winPile;
    });
    game.world.addAll (wins);

    players = List.generate (PlayerPosition.values.length, (i) {
      PlayerPile playerPile = PlayerPile ();
      return playerPile;
    });
    game.world.addAll (players);

    arrangePiles ();

    for (int i = 0; i < PlayerPosition.values.length; i++) {
      wins[i].arrangeDeck();
    }

    Deck playingDeck = Deck ();
    playingDeck.setFullDeck ();
    playingDeck.shuffle (ShuffleMethod.random);

    for (int i = 0; i < PlayerPosition.values.length; i++) {
      for (int j = 0; j < 12; j++) {
        playingDeck.moveTo (players[i].deck, card: playingDeck[0]);
      }
      players[i].deck.sort ([Suit.hearts, Suit.clubs, Suit.tarock, Suit.spades, Suit.diamonds]);
      players[i].addCards ();
      players[i].arrangeDeck (setAngle: true);
    }
  }

  void arrangePiles () {
    double screenRatio = game.camera.visibleWorldRect.width / game.camera.visibleWorldRect.height;

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
        case PlayerPosition.south:
          wins[i].position = Vector2 (wins[i].size.x + tablePile.size.x, wins[i].size.y + tablePile.size.y);
          if (screenRatio < 1.0) {
            wins[i].size.y /= screenRatio;
          }
          else {
            wins[i].size.x *= screenRatio;
          }
          break;
        case PlayerPosition.east:
          wins[i].position = Vector2 (wins[i].size.x + tablePile.size.x, wins[i].size.y);
          wins[i].angle = -pi / 2.0;
          if (screenRatio > 1.0) {
            wins[i].size.y *= screenRatio;
          }
          else {
            wins[i].size.x /= screenRatio;
          }
          break;
        case PlayerPosition.north:
          wins[i].position = Vector2 (wins[i].size.x, wins[i].size.y);
          wins[i].angle = pi;
          if (screenRatio < 1.0) {
            wins[i].size.y /= screenRatio;
          }
          else {
            wins[i].size.x *= screenRatio;
          }
          break;
        case PlayerPosition.west:
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
        case PlayerPosition.south:
          players[i].size = Vector2(tablePile.size.x, Card.cardHeight * (1.0 - Card.cardOverlap));
          players[i].position = Vector2(players[i].size.y, players[i].size.y + tablePile.size.y);
          if (screenRatio < 1.0) {
            players[i].size.y /= screenRatio;
          }
          break;
        case PlayerPosition.east:
          players[i].size = Vector2(tablePile.size.y, Card.cardHeight * (1.0 - Card.cardOverlap));
          players[i].position = Vector2 (players[i].size.y + tablePile.size.x, players[i].size.y + tablePile.size.y);
          players[i].angle = -pi / 2.0;
          if (screenRatio > 1.0) {
            players[i].size.y *= screenRatio;
          }
          break;
        case PlayerPosition.north:
          players[i].size = Vector2(tablePile.size.x, Card.cardHeight * (1.0 - Card.cardOverlap));
          players[i].position = Vector2(players[i].size.y + tablePile.size.x, players[i].size.y);
          players[i].angle = pi;
          if (screenRatio < 1.0) {
            players[i].size.y /= screenRatio;
          }
          break;
        case PlayerPosition.west:
          players[i].size = Vector2(tablePile.size.y, Card.cardHeight * (1.0 - Card.cardOverlap));
          players[i].position = Vector2(players[i].size.y, players[i].size.y);
          players[i].angle = pi / 2.0;
          if (screenRatio > 1.0) {
            players[i].size.y *= screenRatio;
          }
          break;
      }
    }

    game.camera.viewfinder.visibleGameSize = visibleGameSize;
    game.camera.viewfinder.position = Vector2.copy (game.camera.viewfinder.visibleGameSize!) / 2.0;
    game.camera.viewfinder.anchor = Anchor.center;
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    arrangePiles ();
  }

  bool isGameOver () {
    for (int i = 0; i < players.length; i++) {
      if (players[i].deck.length > 0) return false;
    }
    return true;
  }

  gameOver () {
    if (isGameOver ()) game.router.pushNamed ('start');
  }
}