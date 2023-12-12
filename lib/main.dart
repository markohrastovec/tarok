import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';

import 'ui/tarok_game.dart';

void main() {
  final game = TarokGame ();
  runApp (GameWidget (game: game));
}