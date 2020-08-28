Scriptname DM_WizC_DisableInstaKillScript extends ActiveMagicEffect  

;Actor Property Player Auto
GlobalVariable Property DM_WizC_DisableInstaKill  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
    DM_WizC_DisableInstaKill.SetValue(True as float)
    TellPlayer()
    RegisterForSingleUpdate(60.0)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    ;UnregisterForUpdate()
    DM_WizC_DisableInstaKill.SetValue(False as float)
    Debug.Notification("Your real power is no longer contained. You can instantly kill again.")
EndEvent

Function TellPlayer()
    Debug.Notification("Your real power is contained. You can't instantly kill.")
EndFunction

Event OnUpdate()
    TellPlayer()
EndEvent