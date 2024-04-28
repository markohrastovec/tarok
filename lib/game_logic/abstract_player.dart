import 'base_rules.dart';
import 'deck.dart';

abstract class AbstractPlayer
{
  late Deck hand, won;
  GameBid myBid;

  AbstractPlayer ()
  : myBid = GameBid(GameBidValue.none, TalonPortion.none);

  void emptyHand() {
    hand.clear ();
  }

  /*Card Move (Deck onTable);
  GameBid Bid (Game game);
  void EmptyHand ();*/
}
