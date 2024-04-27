class Tarock
{
  Deck onTable;
  List<AbstractPlayer> player;
  Deck talon, fullDeck;
  int startingPlayer;
  BaseRules.NoOfPlayers playersMode;
  BaseRules gameRules;
  Map<int, BaseRules.GameBid> currentBids;

  Tarock (BaseRules _r)
  {
    Rules = _r;
    onTable = new Deck ();
    gameRules = new SlovenianRules ();
    startingPlayer = _s;
    currentBids = new Dictionary<int, BaseRules.GameBid> ();

    fullDeck = new Deck ();
    fullDeck.SetFullDeck ();
    fullDeck.Shuffle (Deck.ShuffleMethod.Random);

    player = new List<AbstractPlayer> ();

    for (int i = 0; i < (int)Rules.NoOfPlayers; i++) {
      player.Add (new BasicPlayer (gameRules));
    }
  }

  void Deal ()
  {
    for (int i = 0; i < (int)Rules.NoOfPlayers; i++) {
      player[i].EmptyHand ();
    }

    talon = new Deck ();
    for (int i = 0; i < 6; i++) {
      talon.Add (fullDeck[i]);
    }

    int batchSize = 6;
    if (Rules.NoOfPlayers == BaseRules.PlayerMode.Three) batchSize = 8;
    else if (Rules.NoOfPlayers == BaseRules.PlayerMode.Four) batchSize = 6;
    // else TODO: add for two players if that mode will be added
    for (int i = 0; i < 2 * (int)Rules.NoOfPlayers.PlayersMode; i++) {
      for (int j = 0; j < batchSize; j++) {
        player[(i + startingPlayer) % (int)Rules.NoOfPlayers].Hand.Add (fullDeck[6 + i * batchSize + j]);
    }
  }

  void Bid ()
  {
    for (int i = 0; i < (int)Rules.NoOfPlayers; i++) {
      BaseRules.GameBid bid = player[(i + startingPlayer) % (int)Rules.NoOfPlayers].Bid (this);
      currentBids.Add ((i + startingPlayer) % (int)Rules.NoOfPlayers, bid);
      NotifyPlayersAboutBid ();
    }
  }

  void DealTalon ()
  {
    // Find out who has the highest bid
    BaseRules.GameBid highestBid = BaseRules.PossibleBids[Rules.NoOfPlayers][0].Item1;
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
    }
  }

  void Announecements ()
  {
    // for all players ask for their announecements
  }

  void CounterAnnounecements ()
  {
    // for all players ask for their counter-announcements
  }

  void ActualPlay ()
  {
    while (Player[0].Hand.Count > 0) {
      OnTable.Clear ();
      for (int i = 0; i < (int)PlayersMode; i++) {
        OnTable.Add (Player[i].Move (OnTable));
      }
      int w = GameRules.WinnerIndex (OnTable);
      // notify players about winner and card on the table
      NotifyPlayersAboutTake (OnTable, w);
      OnTake (this, w);
      OnTable.AddTo (Player[w].Won);
    }
  }

  void FinishAndCount ()
  {
    // count the points
    // finish the game and notify players about the end results
  }

  void Play ()
  {
    Deal ();
    Bid ();
    DealTalon ();
    Announecements ();
    CounterAnnounecements ();
    ActualPlay ();
    FinishAndCount ();
  }

  void NotifyPlayersAboutTake (Deck take, int winner)
  {
    for (int i = 0; i < (int)PlayersMode; i++) {
      Player[i].NotifyAboutTake (take, winner);
    }
  }

  void NotifyPlayersAboutBid ()
  {
    for (int i = 0; i < (int)PlayersMode; i++) {
      Player[i].NotifyAboutBid ();
    }
  }
}