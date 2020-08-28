Scriptname DM_WizC_Perk_Acrobatics extends DM_WizC_ReappliablePerk

Import DM_Utils

Function Reapply()
    {Jump height resets when closing the game. Apply again.}
    Game.SetGameSettingFloat("fJumpHeightMin", 76.0 * LvlMultiplier())
EndFunction

float Function LvlMultiplier()
    {Changes jump height. Min 150%. Max 400%}
    Actor player = Game.GetPlayer()
    If !player.HasPerk(Self)
        Return 1.0
    EndIf
    float max = 4.0
    float min = 1.5
    ;Return max
    float range = max - min
    float lvlPercent = MinF(player.GetLevel() / 50.0, 1.0)
    Return (range * lvlPercent) + min
EndFunction