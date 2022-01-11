#> fluidcontainer:fluidbucket/private/_used_bucket
# @within function fluidcontainer:fluidbucket/private/used_bucket

## Get Current FluidType
    scoreboard players set $FluidType Temporary 0
    execute if data storage api: {Trigger:{Item:{id:"minecraft:bucket"}}} run scoreboard players set $FluidType Temporary 0
    execute if data storage api: {Trigger:{Item:{id:"minecraft:water_bucket"}}} run scoreboard players set $FluidType Temporary 1
    execute if data storage api: {Trigger:{Item:{id:"minecraft:lava_bucket"}}} run scoreboard players set $FluidType Temporary 2
    execute if data storage api: {Trigger:{Item:{id:"minecraft:powder_snow_bucket"}}} run scoreboard players set $FluidType Temporary 3

## Get Prev FluidType
    scoreboard players set $PrevFluidType Temporary 0
    execute if data storage api: {Trigger:{PrevItem:{tag:{FluidContainer:{FluidType:"empty"}}}}} run scoreboard players set $PrevFluidType Temporary 0
    execute if data storage api: {Trigger:{PrevItem:{tag:{FluidContainer:{FluidType:"water"}}}}} run scoreboard players set $PrevFluidType Temporary 1
    execute if data storage api: {Trigger:{PrevItem:{tag:{FluidContainer:{FluidType:"lava"}}}}} run scoreboard players set $PrevFluidType Temporary 2
    execute if data storage api: {Trigger:{PrevItem:{tag:{FluidContainer:{FluidType:"snow"}}}}} run scoreboard players set $PrevFluidType Temporary 3

## Fluid Amounts
    execute store result score $Water Temporary run data get storage api: Trigger.PrevItem.tag.FluidContainer.Amounts.water 1
    execute store result score $Lava Temporary run data get storage api: Trigger.PrevItem.tag.FluidContainer.Amounts.lava 1
    execute store result score $Snow Temporary run data get storage api: Trigger.PrevItem.tag.FluidContainer.Amounts.snow 1

## Replace
    execute if score $PrevFluidType Temporary matches 0 run function fluidcontainer:fluidbucket/private/used_empty
    execute if score $PrevFluidType Temporary matches 1 run function fluidcontainer:fluidbucket/private/used_water
    execute if score $PrevFluidType Temporary matches 2 run function fluidcontainer:fluidbucket/private/used_lava
    execute if score $PrevFluidType Temporary matches 3 run function fluidcontainer:fluidbucket/private/used_snow

## Reset
    scoreboard players reset $FluidType Temporary
    scoreboard players reset $PrevFluidType Temporary
    scoreboard players reset $Water Temporary
    scoreboard players reset $Lava Temporary
    scoreboard players reset $Snow Temporary
