import 'dart:core';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';

import '../globals.dart' as globals;

enum Suit {
  Hearts,
  Diamonds,
  Clubs,
  Spades,
  Tarock
}

enum Face
{
  no1,
  no2,
  no3,
  no4,
  no7,
  no8,
  no9,
  no10,
  Jack,
  Knight,
  Queen,
  King,
  I,
  II,
  III,
  IIII,
  IV,
  V,
  VI,
  VII,
  VIII,
  IX,
  X,
  XI,
  XII,
  XIII,
  XIV,
  XV,
  XVI,
  XVII,
  XVIII,
  XIX,
  XX,
  XXI,
  skis
}

class Card extends SpriteComponent
{
  static const double cardWidth = 900;
  static const double cardHeight = 1600;
  static const double cardOverlap = 0.5;
  final int points, order;
  final Face value;
  final Suit suit;
  final String resourceId;

  // operators <, > tell which card wins when played
  // TODO:
  //   - here are special cases when this operators do not apply (suit valat; "XXI" then "skus" then "I" played in that order I wins)
  //   - comparison of same cards is not covered, but it should neven come in such situation
  //   - in suit valat suits are higher than tarocks
  bool operator < (Card other)
  {
    if (suit == other.suit) return (order < other.order) ? true : false;
    if (suit == Suit.Tarock && other.suit != Suit.Tarock) return true;
    if (suit != Suit.Tarock && other.suit == Suit.Tarock) return false;
    // should not come here
    return false;
  }

  // this can be done, because same cards should bot be compared and two different card cannot be equal
  bool operator > (Card b) { return !(this < b); }

  Card (int _p, int _o, Face _v, Suit _s, String _resId)
  : points = _p,
    order = _o,
    value = _v,
    suit = _s,
    resourceId = _resId,
    super.fromImage (Flame.images.fromCache(globals.cardFace + _resId + ".png"), anchor: Anchor.center);
}
