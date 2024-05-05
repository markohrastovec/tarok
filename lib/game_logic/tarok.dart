import 'abstract_player.dart';
import 'tarok_rules.dart';
import 'basic_player.dart';
import 'deck.dart';

class Tarok {
  late Deck onTable;
  late List<AbstractPlayer> player;
  late Deck talon, fullDeck;
  late int startingPlayer;
  late PlayersMode playersMode;
  late TarokRules gameRules;
  late Map<int, GameBid> currentBids;

  Tarok(int whoStarts) {
    onTable = Deck();
    gameRules = TarokRules();
    startingPlayer = whoStarts;

    fullDeck = Deck();
    fullDeck.setFullDeck();
    fullDeck.shuffle(ShuffleMethod.random);

    for (int i = 0; i < gameRules.noOfPlayers.mode; i++) {
      player.add(BasicPlayer());
    }
  }

  void deal() {
    for (int i = 0; i < gameRules.noOfPlayers.mode; i++) {
      player[i].emptyHand();
    }

    talon = Deck();
    for (int i = 0; i < 6; i++) {
      talon.add(card: fullDeck[i]);
    }

    int batchSize = 6;
    if (gameRules.noOfPlayers.mode == PlayersMode.three) {
      batchSize = 8;
    }
    else if (gameRules.noOfPlayers == PlayersMode.four) {
      batchSize = 6;
    }
    // else TODO: add for two players if that mode will be added
    for (int i = 0; i < 2 * gameRules.noOfPlayers.mode; i++) {
      for (int j = 0; j < batchSize; j++) {
        player[(i + startingPlayer) % gameRules.noOfPlayers.mode].hand.add(card: fullDeck[6 + i * batchSize + j]);
      }
    }
  }

  void bid() {
    for (int i = 0; i < gameRules.noOfPlayers.mode; i++) {
      GameBid bid = player[(i + startingPlayer) % gameRules.noOfPlayers.mode].bid;
      currentBids[(i + startingPlayer) % gameRules.noOfPlayers.mode] = bid;
    }
  }

  void dealTalon() {
    /*// Find out who has the highest bid
  GameBid highestBid = gameRules.possibleBids[gameRules.noOfPlayers.mode]![0];
  int winningBidPlayer = -1;
  foreach (KeyValuePair<int, BaseRules.GameBid> bid in currentBids) {
    if (bid.Value > highestBid) {
      highestBid = bid.Value;
      winningBidPlayer = bid.Key;
    }
  }
  switch (highestBid) {
    case BaseRules.GameBid.bidValue.None:
      // If it is tick mode Talon remains undealt
      gameRules.Mode = BaseRules.PlayingMode.Tick;
      break;
    case GameBidValue.Begger:
      // Begger does not deal talon, too and it plays differently.
      gameRules.Mode = BaseRules.PlayingMode.Begger;
      break;
    default:
      // notify the highest bidder about the talon, let her/him choose, and put away extra cards
      // solo without does not deal talon, but it is a "regular" play, player just gets 0 cards from Talon
      gameRules.Mode = BaseRules.PlayingMode.Regular;
      break;
  }*/
  }

  void announecements() {
    // for all players ask for their announecements
  }

  void counterAnnounecements() {
    // for all players ask for their counter-announcements
  }

  void actualPlay() {
    /*while (Player[0].Hand.Count > 0) {
    OnTable.Clear ();
    for (int i = 0; i < (int)PlayersMode; i++) {
      OnTable.Add (Player[i].Move (OnTable));
    }
    int w = GameRules.WinnerIndex (OnTable);
    // notify players about winner and card on the table
    NotifyPlayersAboutTake (OnTable, w);
    OnTake (this, w);
    OnTable.AddTo (Player[w].Won);*/
  }

  void finishAndCount() {
    // count the points
    // finish the game and notify players about the end results
  }

  void play() {
    deal();
    bid();
    dealTalon();
    announecements();
    counterAnnounecements();
    actualPlay();
    finishAndCount();
  }

  void NotifyPlayersAboutTake(Deck take, int winner) {
    /*for (int i = 0; i < (int)PlayersMode; i++) {
    Player[i].NotifyAboutTake (take, winner);*/
  }

  void NotifyPlayersAboutBid() {
    /*for (int i = 0; i < (int)PlayersMode; i++) {
    Player[i].NotifyAboutBid ();*/
  }
}