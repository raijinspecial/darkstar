-----------------------------------
-- Area: Aydeewa Subterrane
--  NPC: Blank (TOAU-20 Cutscene, TOAU-27 Cutscene)
-- !pos -298 36 -38 68
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(TOAU) == TEAHOUSE_TUMULT and player:getVar("AhtUrganStatus") == 1) then
        player:startEvent(11);
    elseif (player:getCurrentMission(TOAU) == MISPLACED_NOBILITY) then
        player:startEvent(12);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 11) then
        player:completeMission(TOAU,TEAHOUSE_TUMULT);
        player:setVar("AhtUrganStatus",0);
        player:addMission(TOAU,FINDERS_KEEPERS);
    elseif (csid == 12) then
        player:completeMission(TOAU,MISPLACED_NOBILITY);
        player:addMission(TOAU,BASTION_OF_KNOWLEDGE);
    end
end;

