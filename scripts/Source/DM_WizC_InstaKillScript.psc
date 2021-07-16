Scriptname DM_WizC_InstaKillScript extends ActiveMagicEffect
import MiscUtil
import DM_Utils

Sound Property KillSound Auto
Actor Property Player Auto
PerkCounter Property KillCount Auto
Perk Property PerkAcrobatics Auto
Perk Property PerkAtkSpd Auto
GlobalVariable Property DisableInstaKill Auto
; Idle Property Decap1H Auto

; Randomly kill a target.
Event OnEffectStart(Actor akTarget, Actor akCaster)
    If !_CanBeKilled(akTarget)
        Dispel()
        Return
    EndIf
    ; _KillCam(akTarget)
    akTarget.Kill(Player)
    KillSound.Play(Player)
    KillCount.Count += 1
    Debug.Notification("Instant Kill! (" + KillCount.Count + ")")
EndEvent

Function _Debug(Actor akTarget, string msg)
    string c = DM_Utils.GetActorName(Player)
    string t = DM_Utils.GetActorName(akTarget)
    PrintConsole(c + " -> " + t + ": " + msg)
EndFunction

; Returns whether an actor can be instantly killed.
; Don't change the IFs. It's an optimization.
bool Function _CanBeKilled(Actor akTarget)
    ; Using relationship instead of factions is more reliable because
    ; some custom followers (ie. Vilja, Sofia) seem to use custom factions.
    If akTarget.GetRelationshipRank(Player) >= 1
        ; Don't kill friends and above.
        PrintConsole(GetActorName(akTarget) + " was prevented from being instantly killed.")
        return false
    EndIf
    ; It's easier to deactivate instant killing than reliably getting if
    ; the player is brawling.
    If DisableInstaKill.GetValue() as int
        return false
    EndIf
    ; Activating this on dead people will mess with the kill count.
    If akTarget.IsDead()
        return false
    EndIf
    ; Last step is testing for chance.
    If Utility.RandomFloat() <= _Chance()
        _Debug(akTarget, "Instant kill, motherfucker!")
        return true
    EndIf
    return false
EndFunction

Function _KillCam(Actor akTarget)
    ; Player.PlayIdleWithTarget(Decap1H, akTarget)
EndFunction

; Chance to instantly kill an actor.
; 2.5% contributed by level. 2.5% by kill count. Max 5%. Min 0.1%
float Function _Chance()
    float lvl = 0.025 * DM_Utils.MinF(Player.GetLevel() / 50.0, 1.0)
    float kill = 0.025 * DM_Utils.MinF(KillCount.Count / 1000.0, 1.0)
    float result = _GetSynergy(lvl + kill)
    Return DM_Utils.MaxF(result, 0.001)
EndFunction

; Changes instakill chance if player has other perks.
; For ninja max is 15%. For samurai is 5%
float Function _GetSynergy(float x)
    ; If Player.HasPerk(PerkAcrobatics)
    ;     x *= 2
    ; EndIf
    If Player.HasPerk(PerkAtkSpd)
        x *= 3
    EndIf
    Return x
EndFunction
