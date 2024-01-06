import 'package:flame/components.dart';
import 'package:flame/events.dart';

import 'pile.dart';
import 'card.dart';

class WinPile extends Pile with TapCallbacks {
  WinPile()
  {}

  arrangeDeck ({bool setAngle = false}) {
    removeAll(children);

    Card card = Card(5, 22, Face.skis, Suit.Tarock, "skis", faceUp: false);
    card.position = Vector2 (card.width / 2.0, card.height / 2.0);
    add (card);
  }
}