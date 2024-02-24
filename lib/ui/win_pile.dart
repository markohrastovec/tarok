import 'package:flame/components.dart';
import 'package:flame/events.dart';

import 'pile.dart';
import 'card.dart';

class WinPile extends Pile with TapCallbacks {
  WinPile() {}

  @override
  void onGameResize(Vector2 maxSize) {
    super.onGameResize(maxSize);

    arrangeDeck ();
  }

  void arrangeDeck ({bool setAngle = false}) {
    for (int i = 0; i < deck.length; i++) {
      deck[i].position = Vector2 (deck[i].width / 2.0, deck[i].height / 2.0);
    }
  }
}