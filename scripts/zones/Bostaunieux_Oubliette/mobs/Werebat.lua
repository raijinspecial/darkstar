-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Werebat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 611, 2, dsp.regime.type.GROUNDS)
end;
