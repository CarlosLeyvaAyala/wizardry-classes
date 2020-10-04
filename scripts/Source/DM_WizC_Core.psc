Scriptname DM_WizC_Core extends Quest

Actor Property Player Auto
DM_WizC_Perks Property Perks Auto
DM_WizC_Spells Property Spells Auto
; TODO: Translate to JContainers
int Property Sm = 0 AutoReadOnly
int Property HA = 1 AutoReadOnly
int Property Bl = 2 AutoReadOnly
int Property H2 = 3 AutoReadOnly
int Property H1 = 4 AutoReadOnly
int Property Ar = 5 AutoReadOnly
int Property LA = 6 AutoReadOnly
int Property Sn = 7 AutoReadOnly
int Property Lo = 8 AutoReadOnly
int Property Pi = 9 AutoReadOnly
int Property Sp = 10 AutoReadOnly
int Property Ac = 11 AutoReadOnly
int Property Il = 12 AutoReadOnly
int Property Co = 13 AutoReadOnly
int Property De = 14 AutoReadOnly
int Property Re = 15 AutoReadOnly
int Property Al = 16 AutoReadOnly
int Property En = 17 AutoReadOnly
int Property Acr = 18 AutoReadOnly
int Property AtS = 19 AutoReadOnly
int Property BHa = 20 AutoReadOnly
int Property ArE = 21 AutoReadOnly
int Property BlE = 22 AutoReadOnly
int Property ElM = 23 AutoReadOnly
int Property Evs = 24 AutoReadOnly
int Property HRg = 25 AutoReadOnly
int Property HAu = 26 AutoReadOnly
int Property IKl = 27 AutoReadOnly
int Property Knc = 28 AutoReadOnly
int Property MaE = 29 AutoReadOnly
int Property MaR = 30 AutoReadOnly
int Property Mee = 31 AutoReadOnly
int Property Pra = 32 AutoReadOnly
int Property Una = 33 AutoReadOnly

int majorSkN = 0                ; Major skills selected
int minorSkN = 0                ; Minor skills selected
bool[] majorSkills
bool[] minorSkills


; #########################################################
; ###                   MAINTENANCE                     ###
; #########################################################

Event OnInit()
    InitArrays()
EndEvent

Function InitArrays()
    majorSkills = New bool[34]
    minorSkills = New bool[34]
EndFunction

Function OnGameReload()
    Perks.ReapplyAll()
EndFunction


; #########################################################
; ###                  MCM SELECTABLE                   ###
; #########################################################

bool Function CanSelectMajorSkills()
    Return majorSkN < 3
EndFunction

bool Function CanSelectSkills()
    Return (majorSkN + minorSkN) < 10
EndFunction

Function RegisterMajorSk(int idx)
    If CanSelectMajorSkills()
        majorSkills[idx] = True
        majorSkN += 1
    EndIf
EndFunction

Function UnregisterMajorSk(int idx)
    If majorSkN > 0
        majorSkills[idx] = False
        majorSkN -= 1
    EndIf
EndFunction
