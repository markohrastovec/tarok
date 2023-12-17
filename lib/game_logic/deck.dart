import 'dart:core';

import '../ui/card.dart';

enum ShuffleMethod { Random }

class Deck {
  static final Card hearts4 = Card(1, 0, Face.no4, Suit.Hearts, "hearts_4");
  static final Card hearts3 = Card(1, 1, Face.no3, Suit.Hearts, "hearts_3");
  static final Card hearts2 = Card(1, 2, Face.no2, Suit.Hearts, "hearts_2");
  static final Card hearts1 = Card(1, 3, Face.no1, Suit.Hearts, "hearts_1");
  static final Card heartsJack = Card(2, 4, Face.Jack, Suit.Hearts, "hearts_jack");
  static final Card heartsKnight = Card(3, 5, Face.Knight, Suit.Hearts, "hearts_knight");
  static final Card heartsQueen = Card(4, 6, Face.Queen, Suit.Hearts, "hearts_queen");
  static final Card heartsKing = Card(5, 7, Face.King, Suit.Hearts, "hearts_king");
  static final Card diamonds4 = Card(1, 0, Face.no4, Suit.Diamonds, "diamonds_4");
  static final Card diamonds3 = Card(1, 1, Face.no3, Suit.Diamonds, "diamonds_3");
  static final Card diamonds2 = Card(1, 2, Face.no2, Suit.Diamonds, "diamonds_2");
  static final Card diamonds1 = Card(1, 3, Face.no1, Suit.Diamonds, "diamonds_1");
  static final Card diamondsJack = Card(2, 4, Face.Jack, Suit.Diamonds, "diamonds_jack");
  static final Card diamondsKnight = Card(3, 5, Face.Knight, Suit.Diamonds, "diamonds_knight");
  static final Card diamondsQueen = Card(4, 6, Face.Queen, Suit.Diamonds, "diamonds_queen");
  static final Card diamondsKing = Card(5, 7, Face.King, Suit.Diamonds, "diamonds_king");
  static final Card clubs7 = Card(1, 0, Face.no7, Suit.Clubs, "clubs_7");
  static final Card clubs8 = Card(1, 1, Face.no8, Suit.Clubs, "clubs_8");
  static final Card clubs9 = Card(1, 2, Face.no9, Suit.Clubs, "clubs_9");
  static final Card clubs10 = Card(1, 3, Face.no10, Suit.Clubs, "clubs_10");
  static final Card clubsJack = Card(2, 4, Face.Jack, Suit.Clubs, "clubs_jack");
  static final Card clubsKnight = Card(3, 5, Face.Knight, Suit.Clubs, "clubs_knight");
  static final Card clubsQueen = Card(4, 6, Face.Queen, Suit.Clubs, "clubs_queen");
  static final Card clubsKing = Card(5, 7, Face.King, Suit.Clubs, "clubs_king");
  static final Card spades7 = Card(1, 0, Face.no7, Suit.Spades, "spades_7");
  static final Card spades8 = Card(1, 1, Face.no8, Suit.Spades, "spades_8");
  static final Card spades9 = Card(1, 2, Face.no9, Suit.Spades, "spades_9");
  static final Card spades10 = Card(1, 3, Face.no10, Suit.Spades, "spades_10");
  static final Card spadesJack = Card(2, 4, Face.Jack, Suit.Spades, "spades_jack");
  static final Card spadesKnight = Card(3, 5, Face.Knight, Suit.Spades, "spades_knight");
  static final Card spadesQueen = Card(4, 6, Face.Queen, Suit.Spades, "spades_queen");
  static final Card spadesKing = Card(5, 7, Face.King, Suit.Spades, "spades_king");
  static final Card I = Card(5, 1, Face.I, Suit.Tarock, "I");
  static final Card II = Card(1, 2, Face.II, Suit.Tarock, "II");
  static final Card III = Card(1, 3, Face.III, Suit.Tarock, "III");
  static final Card IIII = Card(1, 4, Face.IIII, Suit.Tarock, "IIII");
  static final Card V = Card(1, 5, Face.V, Suit.Tarock, "V");
  static final Card VI = Card(1, 6, Face.VI, Suit.Tarock, "VI");
  static final Card VII = Card(1, 7, Face.VII, Suit.Tarock, "VII");
  static final Card VIII = Card(1, 8, Face.VIII, Suit.Tarock, "VIII");
  static final Card IX = Card(1, 9, Face.IX, Suit.Tarock, "IX");
  static final Card X = Card(1, 10, Face.X, Suit.Tarock, "X");
  static final Card XI = Card(1, 11, Face.XI, Suit.Tarock, "XI");
  static final Card XII = Card(1, 12, Face.XII, Suit.Tarock, "XII");
  static final Card XIII = Card(1, 13, Face.XIII, Suit.Tarock, "XIII");
  static final Card XIV = Card(1, 14, Face.XIV, Suit.Tarock, "XIV");
  static final Card XV = Card(1, 15, Face.XV, Suit.Tarock, "XV");
  static final Card XVI = Card(1, 16, Face.XVI, Suit.Tarock, "XVI");
  static final Card XVII = Card(1, 17, Face.XVII, Suit.Tarock, "XVII");
  static final Card XVIII = Card(1, 18, Face.XVIII, Suit.Tarock, "XVIII");
  static final Card XIX = Card(1, 19, Face.XIX, Suit.Tarock, "XIX");
  static final Card XX = Card(1, 20, Face.XX, Suit.Tarock, "XX");
  static final Card XXI = Card(5, 21, Face.XXI, Suit.Tarock, "XXI");
  static final Card skis = Card(5, 22, Face.skis, Suit.Tarock, "skis");

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

  List<Card> deck = [];

  Deck({List<String>? cardNames, List<Card>? cards}) {
    setDeck(cardNames: cardNames, cards: cards);
  }

  int points() {
    int sum = 0;
    for (int i = 0; i < deck.length; i += 3) {
      int sum3 = deck[i].points;
      int j = 0;
      if (i + 1 < deck.length) {
        sum3 += deck[i + 1].points;
        j++;
      }
      if (i + 2 < deck.length) {
        sum3 += deck[i + 2].points;
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
    for (int i = 0; i < deck.length && t < 3; i++) {
      if (deck[i].value == Face.I || deck[i].value == Face.XXI ||
          deck[i].value == Face.skis) t++;
    }
    return t == 3;
  }

  bool allKings() {
    int k = 0;
    for (int i = 0; i < deck.length && k < 4; i++) {
      if (deck[i].value == Face.King) k++;
    }
    return k == 4;
  }

  void add({String? cardName, Card? card}) {
    if (cardName != null)
      deck.add(dictionary[cardName]!);
    if (card != null)
      deck.add(card);
  }

  void remove({String? cardName, Card? card}) {
    if (cardName != null && deck.contains (dictionary[cardName])) {
      deck.remove(dictionary[cardName]);
    }
    if (card != null && deck.contains (card)) {
      deck.remove(card);
    }
  }

  Card operator [](int i) => deck[i];

  operator []=(int i, Card value) => deck[i] = value;

  int get length => deck.length;

  void clear() {
    deck.clear();
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

  void setDeck({List<String>? cardNames, List<Card>? cards}) {
    deck.clear();
    if (cardNames != null) {
      for (int i = 0; i < cardNames.length; i++) {
        if (dictionary.containsKey(cardNames[i]))
          deck.add(dictionary[cardNames[i]]!);
      }
    }
    if (cards != null) {
      for (int i = 0; i < cards.length; i++) {
        deck.add(cards[i]);
      }
    }
  }

  void shuffle(ShuffleMethod s) {
    switch (s) {
      case ShuffleMethod.Random:
        randomShuffle();
        break;
      default:
        deck.shuffle ();
        break;
    }
  }

  void randomShuffle () {
    deck.shuffle ();
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
      d.add(card: deck[i]);
    }
  }

  void moveTo (Deck d, {String? cardName, Card? card}) {
    if (cardName != null && deck.contains(dictionary[cardName])) {
      d.add (cardName: cardName);
      deck.remove (dictionary[cardName]);
    }
    if (card != null && deck.contains(card)) {
      d.add (card: card);
      deck.remove (card);
    }
  }

  // Sort cards in the deck.
  // Cards are grouped in suits, then sorted by order in the suit.
  // Suit order is defined by parameter suits.
  void sort (List<Suit> suits) {
    deck.sort((a, b) => (suits.indexOf (a.suit) * 100 + a.order) - (suits.indexOf (b.suit) * 100 + b.order));
  }
}