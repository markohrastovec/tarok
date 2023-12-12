/*
using System;
using System.Collections.Generic;
using System.Text;

namespace GameLogic
{
/// <summary>
/// AbstractPlayer is an abstract class on which all players have to be based.
/// </summary>
public abstract class AbstractPlayer
{
  protected Game game;
  protected Deck hand, won;
  public delegate void onMove (Card c);
  public onMove OnMove;
  protected BaseRules.GameBid myBid;

  public Deck Hand { get { return hand; } }
public Deck Won { get { return won; } }
public AbstractPlayer (Game _g = null, Deck _d = null)
{
game = _g;
hand = new Deck (_d);
won = new Deck ();
OnMove = delegate {};
}

public abstract Card Move (Deck onTable);
public abstract BaseRules.GameBid Bid (Game game);
public abstract void EmptyHand ();
/// <summary>
/// Notify player about cards on the table and who takes them.
/// Player may want to know this to count colors, tarocks, current points of opponents, etc.
/// </summary>
/// <param name="take">Cards on the table form ont take.</param>
/// <param name="winner">Number of the winner who takes this take.</param>
public abstract void NotifyAboutTake (Deck take, int winner);
/// <summary>
/// Notify player about bid that is currently active.
/// This is just a template. Function parameters and return type have not been considered yet.
/// </summary>
public abstract void NotifyAboutBid ();
}
}
*/