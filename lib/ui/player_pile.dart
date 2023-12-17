import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';

import 'card.dart';
import 'pile.dart';
import '../game_logic/deck.dart';

class PlayerPile extends Pile with TapCallbacks {
  PlayerPile()
  {}

  arrangeDeck () {
    removeAll(children);
    double dx = (size.x - 2 * Card.cardWidth * (1.0 - Card.cardOverlap)) / (deck.length - 1);
    for (int i = 0; i < deck.length; i++) {
      deck[i].angle = Random ().nextInt(2) * pi + 0.2 - Random ().nextDouble() * 0.4;
      deck[i].position = Vector2(Card.cardWidth * (1.0 - Card.cardOverlap) + dx * i, Card.cardHeight * 0.5);
      add (deck[i]);
    }
  }
}