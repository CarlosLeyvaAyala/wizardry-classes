Scriptname DM_WizC_Perk_Acrobatics extends DM_WizC_ReappliablePerk

Import DM_Utils

; Jump height resets when closing the game. Apply again.
Function Reapply()
    Game.SetGameSettingFloat("fJumpHeightMin", 76.0 * LvlMultiplier())
EndFunction

; Changes jump height.
; Min 150%. Max 400%.
float Function LvlMultiplier()
    If !PlayerHasThisPerk()
        Return 1.0
    EndIf
    float max = 4.0
    float min = 1.5
    ;Return max
    float range = max - min
    float lvlPercent = MinF(PlayerLvl() / 50.0, 1.0)
    Return (range * lvlPercent) + min
EndFunction
