Scriptname DM_WizC_InstaKillScript extends ActiveMagicEffect

Sound Property KillSound Auto
Actor Property Player Auto
DM_DetectBrawlingScript Property Brawl Auto
PerkCounter Property KillCount Auto
Perk Property PerkAcrobatics Auto
Perk Property PerkAtkSpd Auto
Faction Property CurrentFollowerFaction  Auto
{Don't kill}
Faction Property PlayerFaction  Auto
{Don't kill}
GlobalVariable Property DisableInstaKill Auto

; Randomly kill a target.
Event OnEffectStart(Actor akTarget, Actor akCaster)
    If CantKill(akTarget)
        Dispel()
        Return
    EndIf
    KillSound.Play(Player)
    akTarget.Kill(Player)
    KillCount.Count += 1
    Debug.Notification("Instant Kill! (" + KillCount.Count + ")")
EndEvent

bool Function CantKill(Actor akTarget)
    Return akTarget.IsDead() || Chance() <= Utility.RandomFloat(0.0, 0.99999) || DisableInstaKill.GetValue() as int \
         || akTarget.IsInFaction(CurrentFollowerFaction) || akTarget.IsInFaction(PlayerFaction)
         ;Brawl.IsBrawling(akTarget)  \
EndFunction

float Function Chance()
    {2.5% contributed by level. 2.5% by kill count. Max 5%. Min 0.1%}
    ;Return 1.0
    float lvl = 0.025 * DM_Utils.MinF(Player.GetLevel() / 50.0, 1.0)
    float kill = 0.025 * DM_Utils.MinF(KillCount.Count / 1000.0, 1.0)
    float result = GetSynergy(lvl + kill)
    Return DM_Utils.MaxF(result, 0.001)
EndFunction

float Function GetSynergy(float x)
    {Changes instakill chance if player has other perks. Max 20%}
    If Player.HasPerk(PerkAcrobatics)
        x *= 2
    EndIf
    If Player.HasPerk(PerkAtkSpd)
        x *= 2
    EndIf
    Return x
EndFunction

Faction Property PlayerFollowerFaction  Auto
