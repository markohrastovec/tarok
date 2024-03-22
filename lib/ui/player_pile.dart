import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';

import '../game_logic/deck.dart';
import 'tarok_game.dart';
import 'main_page.dart';
import 'card.dart';
import 'pile.dart';

class PlayerPile extends Pile with TapCallbacks, DragCallbacks, HasGameReference<TarokGame> {
  static const double enlarge = 1.5; // by how much cards enlarge when dragged over
  static const double enlargeMin = 1.0 / enlarge;
  static const double maxRotation = 0.2;
  int rows = 0, columns = 0;
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
      double enlargeFactor = 1.0;
      if (card.sprite != null) {
        enlargeFactor = (card.sprite!.originalSize.x * enlarge - (event.localEndPosition.x - card.position.x).abs()) / (card.sprite!.originalSize.x * enlarge);
      }
      if (enlargeFactor > enlargeMin) { // means combined enlarge is bigger than 1.0
        card.size = Vector2(Card.cardWidth, Card.cardHeight) * enlargeFactor * enlarge;
        card.priority = 100;
      }
      else {
        card.size = Vector2(Card.cardWidth, Card.cardHeight);
        card.priority = deck.cards.indexOf (card);
      }
    }
  }

  @override
  void onDragEnd(DragEndEvent event) {
    super.onDragEnd(event);
    final cards = children.whereType<Card>();

    for (final card in cards) {
      card.size = Vector2(Card.cardWidth, Card.cardHeight);
    }
  }

  @override
  void onDragCancel(DragCancelEvent event) {
    super.onDragCancel(event);
    final cards = children.whereType<Card>();

    for (final card in cards) {
      card.size = Vector2(Card.cardWidth, Card.cardHeight);
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    // play selected card = card with highest priority
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    arrangeDeck ();
  }

  void addCards () {
    removeAll(children);
    for (int i = 0; i < deck.length; i++) {
      add (deck[i]);
    }
  }

  void arrangeDeck ({bool setAngle = false}) {
    if (deck.length == 0) {
      //TODO: Find a way to get MainPage reference, or make gamelogic to take care of that
      /*MainPage mp = game.router.findGame() as MainPage;
      mp.gameOver ();*/
    }
    rows = 0;
    columns = deck.length;
    // determine number of rows and columns
    do {
      rows++;
      columns = ((deck.length + (rows - 1)) / rows).floor();

      if (columns > 1) {
        _dx = (size.x - Card.cardWidth) / (columns - 1);
      }
      else {
        _dx = 0.0;
      }
      _dy = size.y / rows;
    } while (_dx > 0.0 && _dx / Card.cardWidth < _dy / Card.cardHeight);

    // position cards
    for (int i = 0; i < deck.length; i++) {
      int row = (i / columns).floor ();
      int column = i % columns;
      if (setAngle) {
        deck[i].angle = Random ().nextInt (2) * pi + maxRotation - Random ().nextDouble () * maxRotation * 2.0;
      }
      deck[i].position = Vector2 ((columns == 1) ? size.x / 2.0 : Card.cardWidth * (1.0 - Card.cardOverlap) + _dx * column, Card.cardHeight * (1 - Card.cardOverlap) + _dy * row);
      deck[i].size = Vector2 (Card.cardWidth, Card.cardHeight);
      deck[i].priority = i;
    }
  }

  void removeCard({String? cardName, Card? card}) {
    for (int i = 0; i < deck.length; i++) {
      if (cardName != null && Deck.dictionary.containsKey(cardName) && deck[i].value == Deck.dictionary[cardName]!.value && deck[i].suit == Deck.dictionary[cardName]!.suit) {
        remove (deck[i]);
      }
      if (card != null && deck[i] == card) {
        remove (card);
      }
    }
    deck.remove (cardName: cardName, card: card);
  }
}