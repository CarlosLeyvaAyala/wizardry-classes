Scriptname DM_WizC_ReappliablePerk extends Perk Hidden 
{Common interface for perks that need to be reapplied at game reload}

Function Reapply()
EndFunction

Event OnInit()
    Reapply()
EndEvent

bool Function CanReapply()
    Return Game.GetPlayer().HasPerk(Self)
EndFunction