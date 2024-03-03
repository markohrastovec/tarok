import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/widgets.dart' hide Route;

import 'tarok_game.dart';

class EndPage extends Component with TapCallbacks, HasGameReference<TarokGame> {
  @override
  Future<void> onLoad() async {
    addAll([
      //Background(const Color(0xff282828)),
      TextBoxComponent(
        text: '[End]',
        textRenderer: TextPaint(
          style: const TextStyle(
            color: Color(0x66ffffff),
            fontSize: 16,
          ),
        ),
        align: Anchor.center,
        size: game.canvasSize,
      ),
    ]);
  }

  @override
  bool containsLocalPoint (Vector2 point) => true;

  @override
  void onTapUp(TapUpEvent event) => game.router.pushNamed ('start');
}
