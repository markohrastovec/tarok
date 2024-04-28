import 'dart:core';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:tarok/ui/player_pile.dart';

import '../game_logic/card.dart';
import '../globals.dart' as globals;

class CardSprite extends SpriteComponent with TapCallbacks
{
  static const double cardWidth = 900;
  static const double cardHeight = 1600;
  static const double cardOverlap = 0.5;
  final int points, order;
  final Face value;
  final Suit suit;
  final String resourceId;
  bool faceUp = true;
  bool tapped = false;

  // operators <, > tell which card wins when played
  // TODO:
  //   - here are special cases when this operators do not apply (suit valat; "XXI" then "skus" then "I" played in that order I wins)
  //   - comparison of same cards is not covered, but it should never come in such situation
  //   - in suit valat suits are higher than tarocks
  bool operator < (Card other)
  {
    if (suit == other.suit) return (order < other.order) ? true : false;
    if (suit == Suit.tarock && other.suit != Suit.tarock) return true;
    if (suit != Suit.tarock && other.suit == Suit.tarock) return false;
    // should not come here
    return false;
  }

  // this can be done, because same cards should bot be compared and two different card cannot be equal
  bool operator > (Card b) { return !(this < b); }

  CardSprite (int _p, int _o, Face _v, Suit _s, String _resId, {bool faceUp = true})
  : points = _p,
    order = _o,
    value = _v,
    suit = _s,
    resourceId = _resId,
    super.fromImage (faceUp ? Flame.images.fromCache("${globals.cardFace}$_resId.png") : Flame.images.fromCache("${globals.cardBackFace}backside.png"), anchor: Anchor.center);

  void turnAround () {
    faceUp = !faceUp;
    super.sprite!.image = faceUp ? Flame.images.fromCache("${globals.cardFace}$resourceId.png") : Flame.images.fromCache("${globals.cardBackFace}backside.png");
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
