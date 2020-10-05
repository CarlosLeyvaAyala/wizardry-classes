Scriptname DM_WizC_Perks extends Quest

Actor Property Player Auto

;>========================================================
;>===                  PERKS - MAIN                  ===<;
;>========================================================

Perk Property Acrobatics Auto
Perk Property AtkSpd Auto
Perk Property BareHands Auto
Perk Property ElemMage Auto
Perk Property InstaKill Auto

;>========================================================
;>===                PERKS - SYNERGY                 ===<;
;>========================================================

Perk Property AtkSpdBareHandsSyn Auto

;>========================================================
;>===                   FUNCTIONS                    ===<;
;>========================================================

; Reapply all perks.
Function ApplyAll()
    ApplyLevelSensitive()
EndFunction

; Reapply perks with calculations sensitive to level change.
Function ApplyLevelSensitive()
    _Apply(Acrobatics)
    _Apply(ElemMage)
EndFunction

; Reapply a single perk.
Function _Apply(Perk aPerk)
    DM_WizC_ReappliablePerk pp = aPerk as DM_WizC_ReappliablePerk
    If pp
        If pp.CanReapply()
            pp.Apply()
        Else
            pp.Restore()
        Endif
    EndIf
EndFunction
