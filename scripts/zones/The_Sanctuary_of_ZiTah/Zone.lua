-----------------------------------
--
-- Zone: The_Sanctuary_of_ZiTah (121)
--
-----------------------------------
local ID = require("scripts/zones/The_Sanctuary_of_ZiTah/IDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");
require("scripts/globals/conquest");
require("scripts/globals/missions");
require("scripts/globals/zone");
-----------------------------------

-----------------------------------
-- Chocobo Digging vars
-----------------------------------
local itemMap =
{
    -- itemid, abundance, requirement
    { 688, 117, DIGREQ_NONE },
    { 17296, 150, DIGREQ_NONE },
    { 880, 100, DIGREQ_NONE },
    { 833, 83, DIGREQ_NONE },
    { 696, 100, DIGREQ_NONE },
    { 690, 33, DIGREQ_NONE },
    { 772, 17, DIGREQ_NONE },
    { 773, 33, DIGREQ_NONE },
    { 4386, 9, DIGREQ_NONE },
    { 703, 7, DIGREQ_NONE },
    { 4096, 100, DIGREQ_NONE },  -- all crystals
    { 1255, 10, DIGREQ_NONE }, -- all ores
    { 656, 117, DIGREQ_BURROW },
    { 750, 133, DIGREQ_BURROW },
    { 749, 117, DIGREQ_BURROW },
    { 748, 8, DIGREQ_BURROW },
    { 751, 14, DIGREQ_BURROW },
    { 720, 1, DIGREQ_BURROW },
    { 699, 9, DIGREQ_BORE },
    { 720, 1, DIGREQ_BORE },
    { 4570, 10, DIGREQ_MODIFIER },
    { 4487, 11, DIGREQ_MODIFIER },
    { 4409, 12, DIGREQ_MODIFIER },
    { 1188, 10, DIGREQ_MODIFIER },
    { 4532, 12, DIGREQ_MODIFIER },
};
local messageArray = { ID.text.DIG_THROW_AWAY, ID.text.FIND_NOTHING, ID.text.ITEM_OBTAINED };

function onChocoboDig(player, precheck)
    return chocoboDig(player, itemMap, precheck, messageArray);
end;

function onInitialize(zone)
    GetMobByID(ID.mob.NOBLE_MOLD):setLocalVar("pop",os.time() + math.random(43200, 57600)); -- 12 to 16 hr

    dsp.conq.setRegionalConquestOverseers(zone:getRegionID())
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(539.901, 3.379, -580.218, 126);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 2;
    elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        cs = 4;
    end

    return cs;
end;

function onRegionEnter( player, region)
end;

function onEventUpdate( player, csid, option)
    if (csid == 2) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 4) then
        if (player:getPreviousZone() == 153) then
            player:updateEvent(0,0,0,0,0,7);
        elseif (player:getPreviousZone() == 119) then
            player:updateEvent(0,0,0,0,0,1);
        end
    end
end;

function onEventFinish( player, csid, option)
    if (csid == 2) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;
