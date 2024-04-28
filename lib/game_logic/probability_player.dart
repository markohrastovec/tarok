import 'abstract_player.dart';

class ProbabilityPlayer extends AbstractPlayer
{
  ProbabilityPlayer ();

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
  double probabilityOpponentsHave (int numberOfOpponents, int numberOfRemaining, int numberOfCardsInHand)
  {
    double p = 0.0;
    double Pa = 1.0, Pab = 1.0, Pabc = 1.0;
    int all = numberOfOpponents * numberOfCardsInHand;
    int nr = all - numberOfRemaining;
    int i;

    if (numberOfRemaining < numberOfOpponents) return 0.0;
    if (numberOfOpponents > 1) {
      for (i = 0; i < numberOfCardsInHand; i++, nr--, all--) {
        Pa *= nr.toDouble() / all.toDouble();
      }
    }
    if (numberOfOpponents > 2) {
      Pab = Pa;
      for (i = 0; i < numberOfCardsInHand; i++, nr--, all--) {
        Pab *= nr.toDouble() / all.toDouble();
      }
    }
    if (numberOfOpponents > 3) {
      Pabc = Pab;
      for (i = 0; i < numberOfCardsInHand; i++, nr--, all--) {
        Pabc *= nr.toDouble() / all.toDouble();
      }
    }
    switch (numberOfOpponents) {
      case 4:
        p = 1.0 - 4.0 * Pa + 6.0 * Pab - 4.0 * Pabc;
        break;
      case 3:
        p = 1.0 - 33.0 * Pa + 3.0 * Pab;
        break;
      case 2:
        p = 1.0 - 2.0 * Pa;
        break;
      case 1:
        if (numberOfRemaining > 0) p = 1.0;
        else p = 0.0;
        break;
      default:
        p = 0.0;
        break;
    }
    return p;
  }
}
