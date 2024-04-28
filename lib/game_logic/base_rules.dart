import 'dart:core';

import 'card.dart';
import 'deck.dart';

enum GameBidValue
{
  none (0),
  three (10),
  two (20),
  one (30),
  soloThree (40),
  soloTwo (50),
  soloOne (60),
  beggar (70),
  soloWithout (80),
  openBeggar (90),
  colorValat (125),
  regularValat (250);

  final int points;
  const GameBidValue (this.points);

  bool operator < (GameBidValue gbv) => points < gbv.points;
  bool operator > (GameBidValue gbv) => points > gbv.points;
}

enum TalonPortion
{
  none (0),
  one (1),
  two (2),
  three (3);

  final int portion;
  const TalonPortion (this.portion);
}

class GameBid
{
  GameBidValue bidValue;
  TalonPortion talonPortion;

  GameBid (this.bidValue, this.talonPortion);
}

enum PlayersMode
{
  //two (2),
  three (3),
  four (4);

  final int mode;
  const PlayersMode (this.mode);
}

enum PlayingMode
{
  regular,
  tick,
  beggar,
  colorValat
}

abstract class BaseRules
{
  static GameBid bidNone = GameBid (GameBidValue.none, TalonPortion.none);
  static GameBid bidThree = GameBid (GameBidValue.three, TalonPortion.three);
  static GameBid bidTwo = GameBid (GameBidValue.two, TalonPortion.two);
  static GameBid bidOne = GameBid (GameBidValue.one, TalonPortion.one);
  static GameBid bidSoloThree = GameBid (GameBidValue.soloThree, TalonPortion.three);
  static GameBid bidSoloTwo = GameBid (GameBidValue.soloTwo, TalonPortion.two);
  static GameBid bidSoloOne = GameBid (GameBidValue.soloOne, TalonPortion.one);
  static GameBid bidBeggar = GameBid (GameBidValue.beggar, TalonPortion.none);
  static GameBid bidSoloWithout = GameBid (GameBidValue.soloWithout, TalonPortion.none);
  static GameBid bidOpenBeggar = GameBid (GameBidValue.openBeggar, TalonPortion.none);
  static GameBid bidColorValat = GameBid (GameBidValue.colorValat, TalonPortion.none);
  static GameBid bidRegularValat = GameBid (GameBidValue.regularValat, TalonPortion.none);

  late PlayersMode noOfPlayers;
  late PlayingMode playingMode;
  late Map<PlayersMode, List<GameBid>> possibleBids;

  BaseRules ()
  {
    //possibleBids = Map<PlayersMode, List<GameBid>> ();
    possibleBids[PlayersMode.three] = [bidNone, bidThree, bidTwo, bidOne, bidBeggar, bidSoloWithout, bidOpenBeggar, bidColorValat, bidRegularValat];
    possibleBids[PlayersMode.four] = [bidNone, bidThree, bidTwo, bidOne, bidSoloThree, bidSoloTwo, bidSoloOne, bidBeggar, bidSoloWithout, bidOpenBeggar, bidColorValat, bidRegularValat];
  }

  Card? winnerCard (Deck onTable)
  {
    Card? max;
    Suit firstSuit;
    int pagatMayWin = 0;

    if (onTable.cards.isNotEmpty) {
      firstSuit = onTable[0].suit;
    }
    else {
      return null;
    }

    for (int i = 0; i < onTable.cards.length; i++) {
      // only if pagat is not the winner over XXI and Skus
      if (pagatMayWin != 3) {
        // first card is always a winner, until higher is found
        max ??= onTable[i];
        // if first card is tarock only order determined higher, as other colors have lower order
        if (firstSuit == Suit.tarock && onTable[i].order > max!.order) {
          max = onTable[i];
        }
        // if first card is not tarock, same color of higher order wins or tarock of higher order in case it is not ColorValat mode
        if (firstSuit != Suit.tarock && (onTable[i].suit == firstSuit || (onTable[i].suit == Suit.tarock && playingMode != PlayingMode.colorValat)) && onTable[i].order > max!.order) {
          max = onTable[i];
        }
      }
      // See if XXI, Skus and I (pagat) are laid in this order. In that case pagat wins, but only if the first card is not other color in ColorValat mode.
      // max is compared here because in ColorValat XXI may not be max and in that case pagat cannot win
      if (pagatMayWin == 0 && max!.value == Deck.XXI) {
        pagatMayWin = 1;
      }
      // max is compared here because in ColorValat Skus may not be max and in that case pagat cannot win
      if (pagatMayWin == 1 && max!.value == Deck.skis) {
        pagatMayWin = 2;
      }
      // onTable[i] is compared here because pagat will not be max, and may become max
      if (pagatMayWin == 2 && onTable[i].value == Deck.I) {
        pagatMayWin = 3;
        max = onTable[i];
      }
    }
    return max;
  }

  int winnerIndex (Deck onTable)
  {
    Card? c = winnerCard (onTable);
    if (c != null) {
      return onTable.cards.indexOf(c);
    }
    else {
      return -1;
    }
  }
}

Deck getPlayableCards (Deck playersDeck, Deck onTable)
{
  Suit firstSuit;
  Deck playableDeck = Deck ();

  if (onTable.cards.isNotEmpty) {
    firstSuit = onTable[0].suit;
    playableDeck = playersDeck.sameKind (firstSuit);
    if (playableDeck.cards.isEmpty) {
      if (firstSuit == Suit.tarock) {
        playersDeck.copyTo(playableDeck);
      }
      else {
        playableDeck = playersDeck.tarocks ();
        if (playableDeck.cards.isEmpty) {
          playersDeck.copyTo(playableDeck);
        }
      }
    }
  }
  else {
    playersDeck.copyTo(playableDeck);
  }
  return playableDeck;
}
