Scriptname DM_WizC_ForceUnarmed extends ActiveMagicEffect 
{Forces to use the Unarmed weapon, so fists can apply spells on enemies}

Weapon Property Unarmed Auto
{The Unarmed weapon}

Function OnEffectStart(Actor akTarget, Actor akCaster)
    akTarget.EquipItem(Unarmed, False, True)
EndFunction
