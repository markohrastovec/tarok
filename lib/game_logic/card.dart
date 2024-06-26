import '../globals.dart' as globals;

enum Suit {
  hearts,
  diamonds,
  clubs,
  spades,
  tarock
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
  jack,
  knight,
  queen,
  king,
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

class Card
{
  final int points, order;
  final Face value;
  final Suit suit;
  final String resourceId;

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

  // this can be done, because same cards should bot be compared and two different cards cannot be equal
  bool operator > (Card b) { return !(this < b); }

  Card (this.points, this.order, this.value, this.suit, this.resourceId);
}