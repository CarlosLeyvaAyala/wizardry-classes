Scriptname DM_DetectBrawlingScript extends Quest 
Quest Property DGIntimidateQuest Auto
Quest Property C00JorrvaskrFight Auto 
Location Property WhiterunJorrvaskrLocation Auto

bool Function IsBrawling(Actor target)
    Return  (DGIntimidateQuest.IsRunning() && DGIntimidateQuest.GetCurrentStageID() < 100) || \ 
            (target.GetCurrentLocation() == WhiterunJorrvaskrLocation && \ 
            C00JorrvaskrFight.IsRunning() && C00JorrvaskrFight.GetCurrentStageID() < 100)
EndFunction