-----------------------------------
-- Area: Morimar Basalt Fields
--  NPC: HomePoint#1
-- !pos -415 -63.2 409 265
-----------------------------------
require("scripts/globals/settings");
local ID = require("scripts/zones/Morimar_Basalt_Fields/IDs");
require("scripts/globals/homepoint");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8700, 48);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 8700) then

        if (option == 1) then
            player:setHomePoint();
            player:messageSpecial(ID.text.HOMEPOINT_SET);
        else
            hpTeleport(player, option);
        end
    end
end;