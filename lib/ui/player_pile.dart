import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';

import 'card.dart';
import 'pile.dart';

class PlayerPile extends Pile with TapCallbacks, DragCallbacks
{
  static const double enlarge = 1.5;
  static const double enlargeMin = 1 / enlarge;
  static const double maxRotation = 0.2;
  double _dx = 0.0;
  double _dy = 0.0;

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

  @override
  void onGameResize(Vector2 maxSize) {
    super.onGameResize(maxSize);
    //TODO: re-arrange on resize
  }

  //TODO: If there is not enough space for two rows, see if more cards would be seen in two rows, because in one row the space is too narrow.
  arrangeDeck ({bool setAngle = false}) {
    removeAll(children);

    int rows = 1;
    if (size.x < Card.cardWidth * deck.length) {
      rows = max ((size.y / (Card.cardHeight * Card.cardOverlap)).floor(), 1);
    }
    int columns = ((deck.length + (rows - 1)) / rows).floor();

    if (deck.length > 1) {
      _dx = (size.x - 2 * Card.cardWidth * (1.0 - Card.cardOverlap)) / (columns - 1);
    }
    else {
      _dx = 0.0;
    }
    if (rows > 0) {
      _dy = size.y / rows;
    }
    else {
      _dy = 0.0;
    }
    for (int i = 0; i < deck.length; i++) {
      int row = (i / columns).floor ();
      int column = i % columns;
      if (setAngle) {
        deck[i].angle = Random ().nextInt (2) * pi + maxRotation - Random ().nextDouble () * maxRotation * 2.0;
      }
      if (deck.length == 1) {
        deck[i].position = Vector2 (size.x / 2.0, Card.cardHeight * 0.5);
      }
      else {
        deck[i].position = Vector2 (Card.cardWidth * (1.0 - Card.cardOverlap) + _dx * column, Card.cardHeight * (1 - Card.cardOverlap) + _dy * row);
      }
      deck[i].size = Vector2 (Card.cardWidth, Card.cardHeight);
      deck[i].priority = i;
      add (deck[i]);
    }
  }
}