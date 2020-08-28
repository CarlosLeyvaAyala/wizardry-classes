; https://github.com/schlangster/skyui/wiki/MCM-State-Options
Scriptname DM_WizC_MCM extends SKI_ConfigBase

DM_WizC_Core Property Core Auto

; #########################################################
; ###               PRIVATE VARIABLES                   ###
; #########################################################


; #########################################################
; ###                   MAINTENANCE                     ###
; #########################################################


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
    ;    PageProfiles()
    ;ElseIf aPage == _ppWidget
    ;    PageWidget()
    ;ElseIf aPage == _ppSkills
    ;    PageSkills()
    ;Else
    ;    PageMain()
    ;EndIf
endEvent

Event OnGameReload()
    parent.OnGameReload()
    Core.OnGameReload()
EndEvent
