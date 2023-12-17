import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';

import 'card.dart';
import 'pile.dart';
import '../game_logic/deck.dart';

class PlayerPile extends Pile with TapCallbacks, DragCallbacks {
  static const double enlarge = 1.5;
  static const double enlargeMin = 1 / enlarge;
  double _dx = 1.0;

  PlayerPile()
  {}

  @override
  void onDragStart(DragStartEvent event) {
    super.onDragStart(event);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    final cards = children.whereType<Card>();

    for (final card in cards) {
      //TODO: See which will be used. The enlargeFactor with only _dx is unambiguous, because only one card is enlarged/selected.
      //double enlargeFactor = (_dx - (event.localEndPosition.x - card.position.x).abs()) / (_dx);
      //double enlargeFactor = (4.0 * _dx - (event.localEndPosition.x - card.position.x).abs()) / (4.0 * _dx);
      double enlargeFactor = 1.0;
      if (card.sprite != null) {
        enlargeFactor = (card.sprite!.originalSize.x * 1.5 - (event.localEndPosition.x - card.position.x).abs()) / (card.sprite!.originalSize.x * 1.5);
      }
      if (enlargeFactor > enlargeMin) {
        card.size = Vector2(Card.cardWidth, Card.cardHeight) * enlargeFactor * enlarge;
      }
      else {
        card.size = Vector2(Card.cardWidth, Card.cardHeight);
      }
    }
  }

  @override
  void onDragEnd(DragEndEvent event) {
    super.onDragEnd(event);
  }

  arrangeDeck () {
    removeAll(children);
    _dx = (size.x - 2 * Card.cardWidth * (1.0 - Card.cardOverlap)) / (deck.length - 1);
    for (int i = 0; i < deck.length; i++) {
      deck[i].angle = Random ().nextInt(2) * pi + 0.2 - Random ().nextDouble() * 0.4;
      deck[i].position = Vector2(Card.cardWidth * (1.0 - Card.cardOverlap) + _dx * i, Card.cardHeight * 0.5);
      deck[i].size = Vector2(Card.cardWidth, Card.cardHeight);
      add (deck[i]);
    }
  }
}