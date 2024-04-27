import 'dart:core';

import 'card.dart';

enum ShuffleMethod { random }

class Deck {
  static final Card hearts4 = Card(1, 0, Face.no4, Suit.hearts, "hearts_4");
  static final Card hearts3 = Card(1, 1, Face.no3, Suit.hearts, "hearts_3");
  static final Card hearts2 = Card(1, 2, Face.no2, Suit.hearts, "hearts_2");
  static final Card hearts1 = Card(1, 3, Face.no1, Suit.hearts, "hearts_1");
  static final Card heartsJack = Card(2, 4, Face.jack, Suit.hearts, "hearts_jack");
  static final Card heartsKnight = Card(3, 5, Face.knight, Suit.hearts, "hearts_knight");
  static final Card heartsQueen = Card(4, 6, Face.queen, Suit.hearts, "hearts_queen");
  static final Card heartsKing = Card(5, 7, Face.king, Suit.hearts, "hearts_king");
  static final Card diamonds4 = Card(1, 0, Face.no4, Suit.diamonds, "diamonds_4");
  static final Card diamonds3 = Card(1, 1, Face.no3, Suit.diamonds, "diamonds_3");
  static final Card diamonds2 = Card(1, 2, Face.no2, Suit.diamonds, "diamonds_2");
  static final Card diamonds1 = Card(1, 3, Face.no1, Suit.diamonds, "diamonds_1");
  static final Card diamondsJack = Card(2, 4, Face.jack, Suit.diamonds, "diamonds_jack");
  static final Card diamondsKnight = Card(3, 5, Face.knight, Suit.diamonds, "diamonds_knight");
  static final Card diamondsQueen = Card(4, 6, Face.queen, Suit.diamonds, "diamonds_queen");
  static final Card diamondsKing = Card(5, 7, Face.king, Suit.diamonds, "diamonds_king");
  static final Card clubs7 = Card(1, 0, Face.no7, Suit.clubs, "clubs_7");
  static final Card clubs8 = Card(1, 1, Face.no8, Suit.clubs, "clubs_8");
  static final Card clubs9 = Card(1, 2, Face.no9, Suit.clubs, "clubs_9");
  static final Card clubs10 = Card(1, 3, Face.no10, Suit.clubs, "clubs_10");
  static final Card clubsJack = Card(2, 4, Face.jack, Suit.clubs, "clubs_jack");
  static final Card clubsKnight = Card(3, 5, Face.knight, Suit.clubs, "clubs_knight");
  static final Card clubsQueen = Card(4, 6, Face.queen, Suit.clubs, "clubs_queen");
  static final Card clubsKing = Card(5, 7, Face.king, Suit.clubs, "clubs_king");
  static final Card spades7 = Card(1, 0, Face.no7, Suit.spades, "spades_7");
  static final Card spades8 = Card(1, 1, Face.no8, Suit.spades, "spades_8");
  static final Card spades9 = Card(1, 2, Face.no9, Suit.spades, "spades_9");
  static final Card spades10 = Card(1, 3, Face.no10, Suit.spades, "spades_10");
  static final Card spadesJack = Card(2, 4, Face.jack, Suit.spades, "spades_jack");
  static final Card spadesKnight = Card(3, 5, Face.knight, Suit.spades, "spades_knight");
  static final Card spadesQueen = Card(4, 6, Face.queen, Suit.spades, "spades_queen");
  static final Card spadesKing = Card(5, 7, Face.king, Suit.spades, "spades_king");
  static final Card I = Card(5, 1, Face.I, Suit.tarock, "I");
  static final Card II = Card(1, 2, Face.II, Suit.tarock, "II");
  static final Card III = Card(1, 3, Face.III, Suit.tarock, "III");
  static final Card IIII = Card(1, 4, Face.IIII, Suit.tarock, "IIII");
  static final Card V = Card(1, 5, Face.V, Suit.tarock, "V");
  static final Card VI = Card(1, 6, Face.VI, Suit.tarock, "VI");
  static final Card VII = Card(1, 7, Face.VII, Suit.tarock, "VII");
  static final Card VIII = Card(1, 8, Face.VIII, Suit.tarock, "VIII");
  static final Card IX = Card(1, 9, Face.IX, Suit.tarock, "IX");
  static final Card X = Card(1, 10, Face.X, Suit.tarock, "X");
  static final Card XI = Card(1, 11, Face.XI, Suit.tarock, "XI");
  static final Card XII = Card(1, 12, Face.XII, Suit.tarock, "XII");
  static final Card XIII = Card(1, 13, Face.XIII, Suit.tarock, "XIII");
  static final Card XIV = Card(1, 14, Face.XIV, Suit.tarock, "XIV");
  static final Card XV = Card(1, 15, Face.XV, Suit.tarock, "XV");
  static final Card XVI = Card(1, 16, Face.XVI, Suit.tarock, "XVI");
  static final Card XVII = Card(1, 17, Face.XVII, Suit.tarock, "XVII");
  static final Card XVIII = Card(1, 18, Face.XVIII, Suit.tarock, "XVIII");
  static final Card XIX = Card(1, 19, Face.XIX, Suit.tarock, "XIX");
  static final Card XX = Card(1, 20, Face.XX, Suit.tarock, "XX");
  static final Card XXI = Card(5, 21, Face.XXI, Suit.tarock, "XXI");
  static final Card skis = Card(5, 22, Face.skis, Suit.tarock, "skis");

  static final Map<String, Card> dictionary = {
    "hearts4": hearts4,
    "hearts3": hearts3,
    "hearts2": hearts2,
    "hearts1": hearts1,
    "heartsJack": heartsJack,
    "heartsKnight": heartsKnight,
    "heartsQueen": heartsQueen,
    "heartsKing": heartsKing,
    "diamonds4": diamonds4,
    "diamonds3": diamonds3,
    "diamonds2": diamonds2,
    "diamonds1": diamonds1,
    "diamondsJack": diamondsJack,
    "diamondsKnight": diamondsKnight,
    "diamondsQueen": diamondsQueen,
    "diamondsKing": diamondsKing,
    "clubs7": clubs7,
    "clubs8": clubs8,
    "clubs9": clubs9,
    "clubs10": clubs10,
    "clubsJack": clubsJack,
    "clubsKnight": clubsKnight,
    "clubsQueen": clubsQueen,
    "clubsKing": clubsKing,
    "spades7": spades7,
    "spades8": spades8,
    "spades9": spades9,
    "spades10": spades10,
    "spadesJack": spadesJack,
    "spadesKnight": spadesKnight,
    "spadesQueen": spadesQueen,
    "spadesKing": spadesKing,
    "I": I,
    "II": II,
    "III": III,
    "IIII": IIII,
    "V": V,
    "VI": VI,
    "VII": VII,
    "VIII": VIII,
    "IX": IX,
    "X": X,
    "XI": XI,
    "XII": XII,
    "XIII": XIII,
    "XIV": XIV,
    "XV": XV,
    "XVI": XVI,
    "XVII": XVII,
    "XVIII": XVIII,
    "XIX": XIX,
    "XX": XX,
    "XXI": XXI,
    "skis": skis,
  };

  List<Card> cards = [];

  Deck({List<String>? cardNames, List<Card>? cards}) {
    setDeck(cardNames: cardNames, cardList: cards);
  }

  int points() {
    int sum = 0;
    for (int i = 0; i < cards.length; i += 3) {
      int sum3 = cards[i].points;
      int j = 0;
      if (i + 1 < cards.length) {
        sum3 += cards[i + 1].points;
        j++;
      }
      if (i + 2 < cards.length) {
        sum3 += cards[i + 2].points;
        j++;
      }
      if (j == 2)
        sum3 -= 2;
      else
        sum3 -= 1;
      sum += sum3;
    }
    return sum;
  }

  bool trull() {
    int t = 0;
    for (int i = 0; i < cards.length && t < 3; i++) {
      if (cards[i].value == Face.I || cards[i].value == Face.XXI ||
          cards[i].value == Face.skis) t++;
    }
    return t == 3;
  }

  bool allKings() {
    int k = 0;
    for (int i = 0; i < cards.length && k < 4; i++) {
      if (cards[i].value == Face.king) k++;
    }
    return k == 4;
  }

  void add({String? cardName, Card? card}) {
    if (cardName != null) {
      cards.add(dictionary[cardName]!);
    }
    if (card != null) {
      cards.add(card);
    }
  }

  void remove({String? cardName, Card? card}) {
    if (cardName != null && cards.contains (dictionary[cardName])) {
      cards.remove(dictionary[cardName]);
    }
    if (card != null && cards.contains (card)) {
      cards.remove(card);
    }
  }

  Card operator [](int i) => cards[i];
  operator []=(int i, Card value) => cards[i] = value;

  int get length => cards.length;

  void clear() {
    cards.clear();
  }

  void setFullDeck() {
    clear();
    add(card: hearts4);
    add(card: hearts3);
    add(card: hearts2);
    add(card: hearts1);
    add(card: heartsJack);
    add(card: heartsKnight);
    add(card: heartsQueen);
    add(card: heartsKing);
    add(card: diamonds4);
    add(card: diamonds3);
    add(card: diamonds2);
    add(card: diamonds1);
    add(card: diamondsJack);
    add(card: diamondsKnight);
    add(card: diamondsQueen);
    add(card: diamondsKing);
    add(card: clubs7);
    add(card: clubs8);
    add(card: clubs9);
    add(card: clubs10);
    add(card: clubsJack);
    add(card: clubsKnight);
    add(card: clubsQueen);
    add(card: clubsKing);
    add(card: spades7);
    add(card: spades8);
    add(card: spades9);
    add(card: spades10);
    add(card: spadesJack);
    add(card: spadesKnight);
    add(card: spadesQueen);
    add(card: spadesKing);
    add(card: I);
    add(card: II);
    add(card: III);
    add(card: IIII);
    add(card: V);
    add(card: VI);
    add(card: VII);
    add(card: VIII);
    add(card: IX);
    add(card: X);
    add(card: XI);
    add(card: XII);
    add(card: XIII);
    add(card: XIV);
    add(card: XV);
    add(card: XVI);
    add(card: XVII);
    add(card: XVIII);
    add(card: XIX);
    add(card: XX);
    add(card: XXI);
    add(card: skis);
  }

  void setDeck({List<String>? cardNames, List<Card>? cardList}) {
    cards.clear();
    if (cardNames != null) {
      for (int i = 0; i < cardNames.length; i++) {
        if (dictionary.containsKey(cardNames[i])) {
          cards.add(dictionary[cardNames[i]]!);
        }
      }
    }
    if (cardList != null) {
      for (int i = 0; i < cardList.length; i++) {
        cards.add(cardList[i]);
      }
    }
  }

  void shuffle(ShuffleMethod s) {
    switch (s) {
      case ShuffleMethod.random:
        randomShuffle();
        break;
      default:
        cards.shuffle ();
        break;
    }
  }

  void randomShuffle () {
    cards.shuffle ();
    /*for (int i = deck.length - 1; i > 0; i--) {
      int j = Random ().nextInt(i + 1);

      Card temp = deck[i];
      deck[i] = deck[j];
      deck[j] = temp;
    }*/
  }

  void copyTo (Deck d) {
    d.clear();
    addTo(d);
  }

  void addTo (Deck d) {
    for (int i = 0; i < d.length; i++) {
      d.add(card: cards[i]);
    }
  }

  void moveTo (Deck d, {String? cardName, Card? card}) {
    if (cardName != null && cards.contains(dictionary[cardName])) {
      d.add (cardName: cardName);
      cards.remove (dictionary[cardName]);
    }
    if (card != null && cards.contains(card)) {
      d.add (card: card);
      cards.remove (card);
    }
  }

  // Sort cards in the deck.
  // Cards are grouped in suits, then sorted by order in the suit.
  // Suit order is defined by parameter list suits.
  void sort (List<Suit> suits) {
    cards.sort((a, b) => (suits.indexOf (a.suit) * 100 + a.order) - (suits.indexOf (b.suit) * 100 + b.order));
  }

  Deck sameKind (Suit s)
  {
    Deck d = Deck ();
    for(Card c in cards) {
      d.cards.add (c);
    }
    return d;
  }
}