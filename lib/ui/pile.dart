import 'package:flame/components.dart';

import '../game_logic/deck.dart';

class Pile extends PositionComponent {
  Deck deck = Deck ();

  @override
  bool get debugMode => true;
}