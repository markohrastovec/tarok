import 'dart:core';

import 'card.dart';

enum ShuffleMethod { Random }

class Deck {
  static final Card hearts4 = Card(1, 0, CardValue.no4, CardColor.Hearts, "hearts_4");
  static final Card hearts3 = Card(1, 1, CardValue.no3, CardColor.Hearts, "hearts_3");
  static final Card hearts2 = Card(1, 2, CardValue.no2, CardColor.Hearts, "hearts_2");
  static final Card hearts1 = Card(1, 3, CardValue.no1, CardColor.Hearts, "hearts_1");
  static final Card heartsJack = Card(2, 4, CardValue.Jack, CardColor.Hearts, "hearts_jack");
  static final Card heartsKnight = Card(3, 5, CardValue.Knight, CardColor.Hearts, "hearts_knight");
  static final Card heartsQueen = Card(4, 6, CardValue.Queen, CardColor.Hearts, "hearts_queen");
  static final Card heartsKing = Card(5, 7, CardValue.King, CardColor.Hearts, "hearts_king");
  static final Card diamonds4 = Card(1, 0, CardValue.no4, CardColor.Diamonds, "diamonds_4");
  static final Card diamonds3 = Card(1, 1, CardValue.no3, CardColor.Diamonds, "diamonds_3");
  static final Card diamonds2 = Card(1, 2, CardValue.no2, CardColor.Diamonds, "diamonds_2");
  static final Card diamonds1 = Card(1, 3, CardValue.no1, CardColor.Diamonds, "diamonds_1");
  static final Card diamondsJack = Card(2, 4, CardValue.Jack, CardColor.Diamonds, "diamonds_jack");
  static final Card diamondsKnight = Card(3, 5, CardValue.Knight, CardColor.Diamonds, "diamonds_knight");
  static final Card diamondsQueen = Card(4, 6, CardValue.Queen, CardColor.Diamonds, "diamonds_queen");
  static final Card diamondsKing = Card(5, 7, CardValue.King, CardColor.Diamonds, "diamonds_king");
  static final Card clubs7 = Card(1, 0, CardValue.no7, CardColor.Clubs, "clubs_7");
  static final Card clubs8 = Card(1, 1, CardValue.no8, CardColor.Clubs, "clubs_8");
  static final Card clubs9 = Card(1, 2, CardValue.no9, CardColor.Clubs, "clubs_9");
  static final Card clubs10 = Card(1, 3, CardValue.no10, CardColor.Clubs, "clubs_10");
  static final Card clubsJack = Card(2, 4, CardValue.Jack, CardColor.Clubs, "clubs_jack");
  static final Card clubsKnight = Card(3, 5, CardValue.Knight, CardColor.Clubs, "clubs_knight");
  static final Card clubsQueen = Card(4, 6, CardValue.Queen, CardColor.Clubs, "clubs_queen");
  static final Card clubsKing = Card(5, 7, CardValue.King, CardColor.Clubs, "clubs_king");
  static final Card spades7 = Card(1, 0, CardValue.no7, CardColor.Spades, "spades_7");
  static final Card spades8 = Card(1, 1, CardValue.no8, CardColor.Spades, "spades_8");
  static final Card spades9 = Card(1, 2, CardValue.no9, CardColor.Spades, "spades_9");
  static final Card spades10 = Card(1, 3, CardValue.no10, CardColor.Spades, "spades_10");
  static final Card spadesJack = Card(2, 4, CardValue.Jack, CardColor.Spades, "spades_jack");
  static final Card spadesKnight = Card(3, 5, CardValue.Knight, CardColor.Spades, "spades_knight");
  static final Card spadesQueen = Card(4, 6, CardValue.Queen, CardColor.Spades, "spades_queen");
  static final Card spadesKing = Card(5, 7, CardValue.King, CardColor.Spades, "spades_king");
  static final Card I = Card(5, 101, CardValue.I, CardColor.Tarock, "I");
  static final Card II = Card(1, 102, CardValue.II, CardColor.Tarock, "II");
  static final Card III = Card(1, 103, CardValue.III, CardColor.Tarock, "III");
  static final Card IIII = Card(1, 104, CardValue.IIII, CardColor.Tarock, "IIII");
  static final Card V = Card(1, 105, CardValue.V, CardColor.Tarock, "V");
  static final Card VI = Card(1, 106, CardValue.VI, CardColor.Tarock, "VI");
  static final Card VII = Card(1, 107, CardValue.VII, CardColor.Tarock, "VII");
  static final Card VIII = Card(1, 108, CardValue.VIII, CardColor.Tarock, "VIII");
  static final Card IX = Card(1, 109, CardValue.IX, CardColor.Tarock, "IX");
  static final Card X = Card(1, 110, CardValue.X, CardColor.Tarock, "X");
  static final Card XI = Card(1, 111, CardValue.XI, CardColor.Tarock, "XI");
  static final Card XII = Card(1, 112, CardValue.XII, CardColor.Tarock, "XII");
  static final Card XIII = Card(1, 113, CardValue.XIII, CardColor.Tarock, "XIII");
  static final Card XIV = Card(1, 114, CardValue.XIV, CardColor.Tarock, "XIV");
  static final Card XV = Card(1, 115, CardValue.XV, CardColor.Tarock, "XV");
  static final Card XVI = Card(1, 116, CardValue.XVI, CardColor.Tarock, "XVI");
  static final Card XVII = Card(1, 117, CardValue.XVII, CardColor.Tarock, "XVII");
  static final Card XVIII = Card(1, 118, CardValue.XVIII, CardColor.Tarock, "XVIII");
  static final Card XIX = Card(1, 119, CardValue.XIX, CardColor.Tarock, "XIX");
  static final Card XX = Card(1, 120, CardValue.XX, CardColor.Tarock, "XX");
  static final Card XXI = Card(5, 121, CardValue.XXI, CardColor.Tarock, "XXI");
  static final Card skis = Card(5, 122, CardValue.skis, CardColor.Tarock, "skis");

  static final Map<String, Card> dictionary = {
    "hearts_4": hearts4,
    "hearts_3": hearts3,
    "hearts_2": hearts2,
    "hearts_1": hearts1,
    "hearts_Jack": heartsJack,
    "hearts_Knight": heartsKnight,
    "hearts_queen": heartsQueen,
    "hearts_king": heartsKing,
    "diamonds_4": diamonds4,
    "diamonds_3": diamonds3,
    "diamonds_2": diamonds2,
    "diamonds_1": diamonds1,
    "diamonds_Jack": diamondsJack,
    "diamonds_Knight": diamondsKnight,
    "diamonds_queen": diamondsQueen,
    "diamonds_king": diamondsKing,
    "clubs_7": clubs7,
    "clubs_8": clubs8,
    "clubs_9": clubs9,
    "clubs_10": clubs10,
    "clubs_Jack": clubsJack,
    "clubs_Knight": clubsKnight,
    "clubs_queen": clubsQueen,
    "clubs_king": clubsKing,
    "spades_7": spades7,
    "spades_8": spades8,
    "spades_9": spades9,
    "spades_10": spades10,
    "spades_Jack": spadesJack,
    "spades_Knight": spadesKnight,
    "spades_queen": spadesQueen,
    "spades_king": spadesKing,
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
      if (deck[i].value == CardValue.I || deck[i].value == CardValue.XXI ||
          deck[i].value == CardValue.skis) t++;
    }
    return t == 3;
  }

  bool allKings() {
    int k = 0;
    for (int i = 0; i < deck.length && k < 4; i++) {
      if (deck[i].value == CardValue.King) k++;
    }
    return k == 4;
  }

  void add({String? cardName, Card? card}) {
    if (cardName != null)
      deck.add(dictionary[cardName]!);
    if (card != null)
      deck.add(card);
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
    /*Random rnd = new Random ();
    for (int i = deck.length - 1; i > 0; i--) {
      int j = rnd.nextInt(i + 1);

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
}