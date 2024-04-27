import 'base_rules.dart';
import 'deck.dart';

abstract class AbstractPlayer
{
  late Deck hand, won;
  GameBid myBid;

  AbstractPlayer (this.hand, this.win);

  /*Card Move (Deck onTable);
  GameBid Bid (Game game);
  void EmptyHand ();*/
}
