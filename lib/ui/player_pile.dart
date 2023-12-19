import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';

import 'card.dart';
import 'pile.dart';
import '../game_logic/deck.dart';

class PlayerPile extends Pile with TapCallbacks, DragCallbacks
{
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
        enlargeFactor = (card.sprite!.originalSize.x * enlarge - (event.localEndPosition.x - card.position.x).abs()) / (card.sprite!.originalSize.x * enlarge);
      }
      if (enlargeFactor > enlargeMin) {
        card.size = Vector2(Card.cardWidth, Card.cardHeight) * enlargeFactor * enlarge;
        //card.position.y = Card.cardHeight * 0.5 / enlargeFactor;
        card.priority = 100;
      }
      else {
        card.size = Vector2(Card.cardWidth, Card.cardHeight);
        //card.position.y = Card.cardHeight * 0.5;
        card.priority = deck.deck.indexOf (card);
      }
    }
  }

  @override
  void onDragEnd(DragEndEvent event) {
    super.onDragEnd(event);
    final cards = children.whereType<Card>();

    for (final card in cards) {
      card.size = Vector2(Card.cardWidth, Card.cardHeight);
      //card.priority = deck.deck.indexOf (card);
    }
  }

  @override
  void onDragCancel(DragCancelEvent event) {
    super.onDragCancel(event);
    final cards = children.whereType<Card>();

    for (final card in cards) {
      card.size = Vector2(Card.cardWidth, Card.cardHeight);
      //card.priority = deck.deck.indexOf (card);
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    // play selected card = card with highest priority
  }

  arrangeDeck ({bool setAngle = false}) {
    removeAll(children);
    if (deck.length > 1) {
      _dx = (size.x - 2 * Card.cardWidth * (1.0 - Card.cardOverlap)) / (deck.length - 1);
    }
    else {
      _dx = 0.0;
    }
    for (int i = 0; i < deck.length; i++) {
      if (setAngle) {
        deck[i].angle =
            Random().nextInt(2) * pi + 0.2 - Random().nextDouble() * 0.4;
      }
      if (deck.length == 1) {
        deck[i].position = Vector2(size.x / 2.0, Card.cardHeight * 0.5);
      }
      else {
        deck[i].position = Vector2(Card.cardWidth * (1.0 - Card.cardOverlap) + _dx * i, Card.cardHeight * 0.5);
      }
      deck[i].size = Vector2(Card.cardWidth, Card.cardHeight);
      deck[i].priority = i;
      add (deck[i]);
    }
  }
}