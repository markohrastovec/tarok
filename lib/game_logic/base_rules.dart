/*
using System;
using System.Collections.Generic;
using System.Text;

namespace GameLogic
{
public abstract class BaseRules
{
  public class GameBid
  {
  public GameBidValue bidValue;
  public TalonPortion talonPortion;

  public GameBid (GameBidValue _v, TalonPortion _tp)
  {
  bidValue = _v;
  talonPortion = _tp;
  }
  }

  public enum PlayersMode
  {
  //Two = 2,
  Three = 3,
  Four = 4
  }
  public abstract PlayersMode[] PossiblePlayers ();
  public PlayersMode NoOfPlayers;

  public enum PlayingMode
  {
  Regular,
  Tick,
  Begger,
  ColorValat
  };
  public abstract PlayingMode[] PossiblePlayingModes ();

  protected PlayingMode mode;
  public PlayingMode Mode { get { return mode; } set { mode = value; } }

  public enum GameBidValue
  {
  None = 0,
  Three = 10,
  Two = 20,
  One = 30,
  SoloThree = 40,
  SoloTwo = 50,
  SoloOne = 60,
  Beggar = 70,
  SoloWithout = 80,
  OpenBeggar = 90,
  ColorValat = 125,
  RegularValat = 250
  }
  public static GameBid bidNone = new GameBid (BaseRules.GameBidValue.None, TalonPortion.None);
  public static GameBid bidThree = new GameBid (GameBidValue.Three, TalonPortion.Three);
  public static GameBid bidTwo = new GameBid (GameBidValue.Two, TalonPortion.Two);
  public static GameBid bidOne = new GameBid (GameBidValue.One, TalonPortion.One);
  public static GameBid bidSoloThree = new GameBid (GameBidValue.SoloThree, TalonPortion.Three);
  public static GameBid bidSoloTwo = new GameBid (GameBidValue.SoloTwo, TalonPortion.Two);
  public static GameBid bidSoloOne = new GameBid (GameBidValue.SoloOne, TalonPortion.One);
  public static GameBid bidBegger = new GameBid (GameBidValue.Begger, TalonPortion.None);
  public static GameBid bidSoloWithout = new GameBid (GameBidValue.SoloWithout, TalonPortion.None);
  public static GameBid bidOpenBegger = new GameBid (GameBidValue.OpenBegger, TalonPortion.None);
  public static GameBid bidColorValat = new GameBid (GameBidValue.ColorValat, TalonPortion.None);
  public static GameBid bidRegularValat = new GameBid (GameBidValue.RegularValat, TalonPortion.None);

  public Dictionary<NoOfPlayers, GameBid[]> PossibleBids;

  public enum TalonPortion
  {
  None = 0,
  One = 1,
  Two = 2,
  Three = 3
  }

  static BaseRules ()
  {
  PossibleBids = new Dictionary<NoOfPlayers, GameBid[]> ();
  PossibleBids.Add (Players.Three, new GameBid[] { bidNone, bidThree, bidTwo, bidOne, bidBegger, bidSoloWithout, bidOpenBegger, bidColorValat, bidRegularValat });
  PossibleBids.Add (Players.Four, new GameBid[] { bidNone, bidThree, bidTwo, bidOne, bidSoloThree, bidSoloTwo, bidSoloOne, bidBegger, bidSoloWithout, bidOpenBegger, bidColorValat, bidRegularValat });
  }

  public Card WinnerCard (Deck onTable)
  {
  Card max = null;
  Card.CardColor firstColor;
  int pagatMayWin = 0;

  if (onTable.Count > 0) firstColor = onTable[0].Color;
  else return null;

  for (int i = 0; i < onTable.Count; i++) {
  // only if pagat is not the winner over XXI and Skus
  if (pagatMayWin != 3) {
  // first card is always a winner, until higher is found
  if (max == null)
  max = onTable[i];
  // if first card is tarock only order determined higher, as other colors have lower order
  if (firstColor == Card.CardColor.Tarock && onTable[i].Order > max.Order)
  max = onTable[i];
  // if first card is not tarock, same color of higher order wins or tarock of higher order in case it is not ColorValat mode
  if (firstColor != Card.CardColor.Tarock && (onTable[i].Color == firstColor || (onTable[i].Color == Card.CardColor.Tarock && mode != PlayingMode.ColorValat)) && onTable[i].Order > max.Order)
  max = onTable[i];
  }
  // See if XXI, Skus and I (pagat) are laid in this order. In that case pagat wins, but only if the first card is not other color in ColorValat mode.
  // max is compared here because in ColorValat XXI may not be max and in that case pagat cannot win
  if (pagatMayWin == 0 && max.Value == Card.CardValue.XXI) {
  pagatMayWin = 1;
  }
  // max is compared here because in ColorValat Skus may not be max and in that case pagat cannot win
  if (pagatMayWin == 1 && max.Value == Card.CardValue.Skus) {
  pagatMayWin = 2;
  }
  // onTable[i] is compared here because pagat will not be max, and may become max
  if (pagatMayWin == 2 && onTable[i].Value == Card.CardValue.I) {
  pagatMayWin = 3;
  max = onTable[i];
  }
  }
  return max;
  }

  public int WinnerIndex (Deck onTable)
  {
  Card c = WinnerCard (onTable);
  return onTable.FindIndex (c.Equals);
  }
}

public Deck GetPlayableCards (Deck playersDeck, Deck onTable)
{
  Card.CardColor firstColor;
  Deck playableDeck = new Deck ();

  if (onTable.Count > 0) {
    firstColor = onTable[0].Color;
    playableDeck = playersDeck.SameKind (firstColor);
    if (playableDeck.Count == 0) {
      if (firstColor == Card.CardColor.Tarock) {
        playersDeck.CopyTo (ref playableDeck);
      }
      else {
        playableDeck = playersDeck.Tarocks;
        if (playableDeck.Count == 0) {
          playersDeck.CopyTo (ref playableDeck);
        }
      }
    }
  }
  else {
    playersDeck.CopyTo (ref playableDeck);
  }
  return playableDeck;
}
}
*/