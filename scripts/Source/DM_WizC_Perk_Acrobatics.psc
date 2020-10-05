Scriptname DM_WizC_Perk_Acrobatics extends DM_WizC_ReappliablePerk

Import DM_Utils
Import JValue

; Jump height resets when closing the game. Apply again.
Function Apply()
    Game.SetGameSettingFloat("fJumpHeightMin", 76.0 * _JumpMult())
    SetNthEntryValue(0, 0, _FallingDmg())
EndFunction

Function Restore()
    Game.SetGameSettingFloat("fJumpHeightMin", 76.0)
    SetNthEntryValue(0, 0, 1)
EndFunction

; Changes jump height.
; Min 150%. Max 400%.
float Function _JumpMult()
    return evalLuaFlt(0, "return wizc.valByLvl(1.5, 4, " + PlayerLvl() + ")")
EndFunction

; Calculates falling damage.
; Min 50%. Max 10%.
float Function _FallingDmg()
    return evalLuaFlt(0, "return wizc.valByLvl(0.5, 0.1, " + PlayerLvl() + ")")
EndFunction
