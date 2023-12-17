import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';

import 'pile.dart';
import '../game_logic/deck.dart';

enum PlayerPosition {
  South,
  East,
  North,
  West
}

class PlayerPile extends Pile with TapCallbacks {
  PlayerPosition playerPosition;

  // TODO: Position and size will be calculated differently.
  // TODO: Size should always be the same, and card always put from left to right. Rotation of pile, and position should put the in the right place.
  PlayerPile(PlayerPosition pp)
  : playerPosition = pp {
    switch (pp) {
      case PlayerPosition.South:
        position = Vector2(900, 8100);
        size = Vector2(7200, 900);
        break;
      case PlayerPosition.East:
        position = Vector2(8100, 8100);
        size = Vector2(7200, 900);
        angle = -pi / 2.0;
        break;
      case PlayerPosition.North:
        position = Vector2(8100, 900);
        size = Vector2(7200, 900);
        angle = pi;
        break;
      case PlayerPosition.West:
        position = Vector2(0, 900);
        size = Vector2(7200, 900);
        angle = pi / 2.0;
        break;
    }
  }
}