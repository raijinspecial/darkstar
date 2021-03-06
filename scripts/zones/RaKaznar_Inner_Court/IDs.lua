-----------------------------------
-- Area: RaKaznar_Inner_Court
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.RAKAZNAR_INNER_COURT] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        HOMEPOINT_SET           = 7681, -- Home point set!
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.RAKAZNAR_INNER_COURT]