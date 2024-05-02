import 'dart:core';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:tarok/ui/player_pile.dart';

import '../game_logic/card.dart';
import '../globals.dart' as globals;

class CardSprite extends SpriteComponent with TapCallbacks
{
  Card card;
  static const double cardWidth = 900;
  static const double cardHeight = 1600;
  static const double cardOverlap = 0.5;
  bool faceUp = true;
  bool tapped = false;

  bool operator < (CardSprite b) => card < b.card;
  bool operator > (CardSprite b) => card > b.card;

  CardSprite (int p, int o, Face f, Suit s, String resId, {bool faceUp = true})
  : card = Card (p, o, f, s, resId),
    super.fromImage (faceUp ? Flame.images.fromCache("${globals.cardFace}$resId.png") : Flame.images.fromCache("${globals.cardBackFace}backside.png"), anchor: Anchor.center);

  void turnAround () {
    faceUp = !faceUp;
    super.sprite!.image = faceUp ? Flame.images.fromCache("${globals.cardFace}$card.resourceId.png") : Flame.images.fromCache("${globals.cardBackFace}backside.png");
  }

  @override
  void onTapDown(TapDownEvent event) {
    tapped = true;
  }

  @override
  void onTapUp(TapUpEvent event) {
    if (tapped == true && parent.runtimeType == PlayerPile) {
      tapped = false;
      PlayerPile pp = parent as PlayerPile;
      pp.removeCard (card: this);
      //pp.deck.remove (card: this);
      pp.arrangeDeck();
    }
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    tapped = false;
  }
}
