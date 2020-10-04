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

; Reapply all perks.
Function ReapplyAll()
    ReapplyLevelSensitive()
EndFunction

; Reapply perks with calculations sensitive to level change.
Function ReapplyLevelSensitive()
    Reapply(Acrobatics)
EndFunction

; Reapply a single perk.
Function Reapply(Perk aPerk)
    DM_WizC_ReappliablePerk pp = aPerk as DM_WizC_ReappliablePerk
    If pp && pp.CanReapply()
        pp.Reapply()
    EndIf
EndFunction
