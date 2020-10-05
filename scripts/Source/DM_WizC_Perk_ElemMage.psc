; Bonuses and penalties are based on max magicka. Max Magicka [100, 300]
Scriptname DM_WizC_Perk_ElemMage extends DM_WizC_ReappliablePerk
{Controls bonuses and penalties values.}

Import DM_Utils
Import JValue

Function Apply()
    ; Bonus
    SetNthEntryValue(0, 0, _MagUp())
    SetNthEntryValue(2, 0, _CostDown())
    ; Penalties
    SetNthEntryValue(1, 0, _MagDown())
    SetNthEntryValue(3, 0, _CostUp())
EndFunction

; Magnitude bonus.
; Min 110%. Max 130%.
float Function _MagUp()
    PlayerAV("Magicka")
    return evalLuaFlt(0, "return wizc.valByLvl(1.1, 1.3, " + PlayerLvl() + ")")
EndFunction

; Magnitude penalty.
; Min 90%. Max 70%.
float Function _MagDown()
    return evalLuaFlt(0, "return wizc.valByLvl(0.9, 0.7, " + PlayerLvl() + ")")
EndFunction

; Magicka cost bonus.
; Min 90%. Max 70%.
float Function _CostDown()
    return evalLuaFlt(0, "return wizc.valByLvl(0.9, 0.7, " + PlayerLvl() + ")")
EndFunction

; Magicka cost penalty.
; Min 110%. Max 130%.
float Function _CostUp()
    return evalLuaFlt(0, "return wizc.valByLvl(1.1, 1.3, " + PlayerLvl() + ")")
EndFunction
