-----------------------------------
-- Area: Windurst_Woods
--  NPC: Millerovieunet
-- Only sells when Windurst controlls Qufim Region
-- Confirmed shop stock, August 2013
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs");
require("scripts/globals/events/harvest_festivals")
require("scripts/globals/conquest");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
    onHalloweenTrade(player,trade,npc);
end;

function onTrigger(player,npc)
    if (GetRegionOwner(dsp.region.QUFIMISLAND) ~= dsp.nation.WINDURST) then
        player:showText(npc,ID.text.MILLEROVIEUNET_CLOSED_DIALOG);
    else
        player:showText(npc,ID.text.MILLEROVIEUNET_OPEN_DIALOG);

        local stock =
        {
            954,  4032  -- Magic Pot Shard
        }
        dsp.shop.general(player, stock, WINDURST);

    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
