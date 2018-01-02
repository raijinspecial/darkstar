-----------------------------------
-- Mandalic Stab
-- Dagger weapon skill
-- Skill Level: N/A
-- Damage Varies with TP. Vajra: Aftermath effect varies with TP.
-- Multiplies attack by 1.66
-- Available only after completing the Unlocking a Myth (Thief) quest.
-- Will stack with Sneak Attack.
-- Aligned with the Shadow Gorget, Flame Gorget & Light Gorget.
-- Aligned with the Shadow Belt, Flame Belt & Light Belt.
-- Element: None
-- Modifiers: DEX:30%
-- 100%TP    200%TP    300%TP
-- 2.00      2.13      2.50
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {};
    params.numHits = 1;
    params.ftp100 = 2; params.ftp200 = 2.13; params.ftp300 = 2.5;
    params.str_wsc = 0.0; params.dex_wsc = 0.3; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; 
    params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1.66;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 4; params.ftp200 = 6.09; params.ftp300 = 8.5;
        params.dex_wsc = 0.6;
        params.atkmulti = 1.75;
    end

    -- Aftermath calculations from : https://www.bg-wiki.com/bg/Vajra_(Level_75)
    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params)
    if (damage > 0) then
        local aftermathParams = initAftermathParams()
        aftermathParams.power = player:getAftermathModPower(false)
        if (shouldApplyAftermath(player, aftermathParams.power, tp, AFTERMATH_MYTHIC)) then
            if (tp == 3000) then
                aftermathParams.type = EFFECT_AFTERMATH_LV3
                aftermathParams.subpower.type = MOD_OCC_ATT_X_TIMES
            elseif (tp >= 2000) then
                aftermathParams.type = EFFECT_AFTERMATH_LV2
                aftermathParams.subpower.type = MOD_ATT
            else
                aftermathParams.type = EFFECT_AFTERMATH_LV1
                aftermathParams.subpower.type = MOD_ACC
            end

            applyMythicAftermath(player, tp, aftermathParams)
        end
    end	

    return tpHits, extraHits, criticalHit, damage
end
