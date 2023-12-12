/*
using System;
using System.Collections.Generic;
using System.Text;

namespace GameLogic
{
/// <summary>
/// Advanced player, who keeps record of all card played (seen), opponents, etc.
/// Probability calculations allow the player to predict how high are the chances to win a particular take or the whole game.
/// Keeping records about played cards allows to predict, which cards are in opponents hands.
/// </summary>
public class ProbabilityPlayer : AbstractPlayer
{
public ProbabilityPlayer (BaseRules _r, Deck _d) : base (_r, _d)
{ }

public override Game.GameBidValue Bid (Game game)
{
  throw new NotImplementedException ();
}

public override void EmptyHand ()
{
  throw new NotImplementedException ();
}

public override Card Move (Deck onTable)
{
  throw new NotImplementedException ();
}

public override void NotifyAboutBid ()
{
  throw new NotImplementedException ();
}

public override void NotifyAboutTake (Deck take, int winner)
{
  throw new NotImplementedException ();
}

/// <summary>
/// Function returns probability that every opponent has at least one card of the kind.
/// Comes useful when one wants to figure out probability that king will not be taken by tarock.
/// That function would return probability for each player having a least one heart, diamond, spade or club.
/// To calculate, we need to know how many of the kind are still in the game and how many cards the opponents
/// have in their hands.
/// Works only up to 4 opponents/players because this is the max for a game.
/// Look here for math background:
/// https://math.stackexchange.com/questions/1236710/probability-that-every-player-is-dealt-a-heart
/// https://math.stackexchange.com/questions/2521017/probability-of-deck-of-cards-such-that-each-person-receives-one-ace
/// </summary>
/// <param name="numberOfOpponents">The number of opponents, which are playing.</param>
/// <param name="numberOfRemaining">The number of remaining cards still in opponents decks.</param>
/// <param name="numberOfCardsInHand">The number of cards each opponent has in her hand.</param>
/// <returns>Return the probability between 0.0 and 1.0.</returns>
private double ProbabilityOpponentsHave (int numberOfOpponents, int numberOfRemaining, int numberOfCardsInHand)
{
  double p = 0.0d;
  double Pa = 1.0d, Pab = 1.0d, Pabc = 1.0d;
int all = numberOfOpponents * numberOfCardsInHand;
int nr = all - numberOfRemaining;
int i;

if (numberOfRemaining < numberOfOpponents) return 0.0d;
if (numberOfOpponents > 1) {
for (i = 0; i < numberOfCardsInHand; i++, nr--, all--) {
Pa *= (double)nr / (double)all;
}
}
if (numberOfOpponents > 2) {
Pab = Pa;
for (i = 0; i < numberOfCardsInHand; i++, nr--, all--) {
Pab *= (double)nr / (double)all;
}
}
if (numberOfOpponents > 3) {
Pabc = Pab;
for (i = 0; i < numberOfCardsInHand; i++, nr--, all--) {
Pabc *= (double)nr / (double)all;
}
}
  switch (numberOfOpponents) {
case 4:
p = 1d - 4d * Pa + 6d * Pab - 4d * Pabc;
break;
case 3:
p = 1d - 3d * Pa + 3d * Pab;
break;
case 2:
p = 1d - 2d * Pa;
break;
case 1:
if (numberOfRemaining > 0) p = 1.0d;
else p = 0.0d;
break;
default:
p = 0.0d;
break;
}
  return p;
}
}
}
*/
