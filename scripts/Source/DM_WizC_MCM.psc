; https://github.com/schlangster/skyui/wiki/MCM-State-Options
Scriptname DM_WizC_MCM extends SKI_ConfigBase

DM_WizC_Core Property Core Auto

int function GetVersion()
    return 1
endFunction

Event OnConfigInit()
EndEvent

event OnVersionUpdate(int aVersion)
    ;if (aVersion > 1)
    ;    Trace("MCM.OnVersionUpdate(" + aVersion + ")")
    ;    OnConfigInit()
    ;endIf
endEvent

event OnPageReset(string aPage)
    ;if aPage == _ppProfiles
    ;    PageMain()
    ;EndIf
endEvent

Event OnGameReload()
    parent.OnGameReload()
    Core.OnGameReload()
EndEvent
