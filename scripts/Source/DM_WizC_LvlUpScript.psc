Scriptname DM_WizC_LvlUpScript extends Quest

GlobalVariable Property PlayerLvl Auto
DM_WizC_Core Property Core Auto
Sound Property LvlUpSound Auto

Event OnStoryIncreaseLevel(Int aiNewLevel)
    PlayerLvl.SetValue(aiNewLevel as float)
    Core.Perks.ApplyLevelSensitive()
    ;Debug.Notification(PlayerLvl.getvalue())
    ; TODO: add synergy perks
    Stop()
EndEvent
