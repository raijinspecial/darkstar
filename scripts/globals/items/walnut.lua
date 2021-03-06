-----------------------------------------
-- ID: 5661
-- Item: Walnut
-- Food Effect: 5Min, All Races
-----------------------------------------
-- HP 30
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5661)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 30)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 30)
end
