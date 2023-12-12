/*
using System;
using System.Collections.Generic;

namespace GameLogic
{
/// <summary>
/// BasicPlayer is a player who only knows basic rules and does no advanced processing or keeping record about played cards, opponents, etc.
/// </summary>
public class BasicPlayer : AbstractPlayer
{
Random rand;
public BasicPlayer (Game _g = null, Deck _d = null) : base (_g, _d)
{
rand = new Random ();
}

public override Card Move (Deck onTable)
{
if (onTable.Count > 0) {
int i;
Card winner = game.GameRules.WinnerCard (onTable);
Deck playableCards = game.GameRules.GetPlayableCards (hand, onTable);
playableCards.Sort ();
// find first card higher than current winner
for (i = 0; i < playableCards.Count && playableCards[i].Order <= winner.Order; i++);
// if cannot win, use lowest card
if (i == playableCards.Count) i = 0;
hand.Remove (playableCards[i]);
OnMove (playableCards[i]);
return playableCards[i];
}
else {
// select a card randomly
Card card = hand[rand.Next (hand.Count)];
hand.Remove (card);
OnMove (card);
return card;
}
}

public override void EmptyHand ()
{
hand.Clear ();
won.Clear ();
}

/// <summary>
/// BasicPlayer does not take any record, which cards were already played.
/// </summary>
/// <param name="take"></param>
/// <param name="winner"></param>
public override void NotifyAboutTake (Deck take, int winner)
{
//throw new NotImplementedException ();
}

public override BaseRules.GameBid Bid (Game game)
{
//TODO: make a bid after bid data are put in player class
myBid = game.GameRules.PossibleBids[game.PlayersMode][0].Item1;
BaseRules.GameBid highestBid = game.GameRules.PossibleBids[game.GameRules.NoOfPlayers][0];
foreach (KeyValuePair<int, BaseRules.GameBid> bid in game.currentBids) {
if (bid.Value.bidValue > highestBid) highestBid = bid.Value.bidValue;
}
int i;
for (i = 0; highestBid < game.GameRules.PossibleBids[game.PlayersMode][i].Item1 && i < Game.PossibleBids[game.PlayersMode].Length; i++);
if (i < Game.PossibleBids[game.PlayersMode].Length) myBid = Game.PossibleBids[game.PlayersMode][i].Item1;
return myBid;
}

public override void NotifyAboutBid ()
{
throw new NotImplementedException ();
}
}
}
*/