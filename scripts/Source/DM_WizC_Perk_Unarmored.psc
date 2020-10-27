Scriptname DM_WizC_Perk_Unarmored extends DM_WizC_ReappliablePerk
{Changes armor rating when unarmored from 35 to 80. From level 1 to 50.}

Import DM_Utils
Import JValue

Spell Property ArmorRating Auto

Function Apply()
    MiscUtil.PrintConsole("*************************************************")
    MiscUtil.PrintConsole(_ArmorRating())
    MiscUtil.PrintConsole(ArmorRating.GetNthEffectMagnitude(0))
    ArmorRating.SetNthEffectMagnitude(0, _ArmorRating())
    MiscUtil.PrintConsole(ArmorRating.GetNthEffectMagnitude(0))
    ; Refresh spell
    ReapplySpell(ArmorRating)
    ;
    ; SetNthEntryValue(0, 0, _ArmorRating())
EndFunction

Function Restore()
    ClearSpell(ArmorRating)
    ; SetNthEntryValue(0, 0, 0)
EndFunction

; Changes armor rating while equipped with only clothes.
; Min 35. Max 80.
float Function _ArmorRating()
    return evalLuaFlt(0, "return wizc.valByLvl(35, 80, " + PlayerLvl() + ")")
EndFunction
