Scriptname DM_WizC_Spells extends Quest 
{Container for all spells that can be applied to the player on selecting a class}

Actor Property Player Auto


; #########################################################
; ###                  MCM SELECTABLE                   ###
; #########################################################

Spell Property Acrobatics Auto
Spell Property AtkSpd Auto
Spell Property BareHands Auto
Spell Property InstaKill Auto


; #########################################################
; ###                     SYNERGY                       ###
; #########################################################

Spell Property AtkSpdBareHandsSyn Auto


; #########################################################
; ###                       AUX                         ###
; #########################################################

Spell Property ForceUnarmed Auto


; #########################################################
; ###                 REGISTRY FUNCTIONS                ###
; #########################################################

Function Register(Spell aSpell)
    Player.AddSpell(aSpell, False)
EndFunction

;
;    if Player.AddSpell(InstaKillSpell, False)
;        Debug.Notification("Instakill added")
;    EndIf