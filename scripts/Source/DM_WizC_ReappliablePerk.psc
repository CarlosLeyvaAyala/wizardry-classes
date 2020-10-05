Scriptname DM_WizC_ReappliablePerk extends Perk Hidden
{Common interface for perks that need to be reapplied at game reload}

; Apply values from this perk.
Function Apply()
EndFunction

; Restore values to before the perk was active.
Function Restore()
EndFunction

Event OnInit()
    Apply()
EndEvent

bool Function CanReapply()
    Return PlayerHasThisPerk()
EndFunction

bool Function PlayerHasThisPerk()
    return Game.GetPlayer().HasPerk(Self)
EndFunction

int Function PlayerLvl()
    return Game.GetPlayer().GetLevel()
EndFunction

float Function PlayerAV(string AV)
    ; Debug.MessageBox(AV + " base = " + Game.GetPlayer().GetBaseActorValue(AV))
    return Game.GetPlayer().GetActorValue(AV)
EndFunction
