Scriptname DM_WizC_Perks extends Quest 

Actor Property Player Auto

; #########################################################
; ###                  MCM SELECTABLE                   ###
; #########################################################

Perk Property Acrobatics Auto
Perk Property AtkSpd Auto
Perk Property BareHands Auto
Perk Property InstaKill Auto

; #########################################################
; ###                     SYNERGY                       ###
; #########################################################

Perk Property AtkSpdBareHandsSyn Auto

; #########################################################
; ###                       AUX                         ###
; #########################################################

Function ReapplyAll()
    {Reapply all perks}
    ReapplyLevelSensitive()
EndFunction

Function ReapplyLevelSensitive()
    {Reapply perks with calculations sensitive to level change}
    Reapply(Acrobatics)
EndFunction

Function Reapply(Perk aPerk)
    {Reapply a single perk}
    DM_WizC_ReappliablePerk pp = aPerk as DM_WizC_ReappliablePerk
    If pp && pp.CanReapply()
        pp.Reapply()
    EndIf
EndFunction