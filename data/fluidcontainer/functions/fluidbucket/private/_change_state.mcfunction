#> fluidcontainer:fluidbucket/private/_change_state
# @within function fluidcontainer:fluidbucket/private/change_state

## Get Current FluidType
    scoreboard players set $FluidType Temporary 0
    execute if data storage api: {Trigger:{Item:{tag:{FluidContainer:{FluidType:"empty"}}}}} run scoreboard players set $FluidType Temporary 0
    execute if data storage api: {Trigger:{Item:{tag:{FluidContainer:{FluidType:"water"}}}}} run scoreboard players set $FluidType Temporary 1
    execute if data storage api: {Trigger:{Item:{tag:{FluidContainer:{FluidType:"lava"}}}}} run scoreboard players set $FluidType Temporary 2
    execute if data storage api: {Trigger:{Item:{tag:{FluidContainer:{FluidType:"snow"}}}}} run scoreboard players set $FluidType Temporary 3

## Next Fluid Type
    scoreboard players set $NextFluidType Temporary 0

    execute store result score $Water Temporary run data get storage api: Trigger.Item.tag.FluidContainer.Amounts.water 1
    execute store result score $Lava Temporary run data get storage api: Trigger.Item.tag.FluidContainer.Amounts.lava 1
    execute store result score $Snow Temporary run data get storage api: Trigger.Item.tag.FluidContainer.Amounts.snow 1

    execute if score $FluidType Temporary matches 0 if score $Water Temporary matches 1000.. run scoreboard players set $NextFluidType Temporary 1
    execute if score $FluidType Temporary matches 0 if score $Water Temporary matches ..0999 run scoreboard players add $FluidType Temporary 1

    execute if score $FluidType Temporary matches 1 if score $Lava Temporary matches 1000.. run scoreboard players set $NextFluidType Temporary 2
    execute if score $FluidType Temporary matches 1 if score $Lava Temporary matches ..0999 run scoreboard players add $FluidType Temporary 1

    execute if score $FluidType Temporary matches 2 if score $Snow Temporary matches 1000.. run scoreboard players set $NextFluidType Temporary 3
    execute if score $FluidType Temporary matches 2 if score $Snow Temporary matches ..0999 run scoreboard players add $FluidType Temporary 1

    execute if score $FluidType Temporary matches 3 run scoreboard players set $NextFluidType Temporary 0

## Replace Item
    data modify storage api: Item set from storage api: Trigger.Item
### Item ID
    execute if score $NextFluidType Temporary matches 0 run data modify storage api: Item.id set value "minecraft:bucket"
    execute if score $NextFluidType Temporary matches 1 run data modify storage api: Item.id set value "minecraft:water_bucket"
    execute if score $NextFluidType Temporary matches 2 run data modify storage api: Item.id set value "minecraft:lava_bucket"
    execute if score $NextFluidType Temporary matches 3 run data modify storage api: Item.id set value "minecraft:powder_snow_bucket"
### Item Name
    execute if score $NextFluidType Temporary matches 0 run data modify storage api: Item.tag.display.Name set value '[{"text":"FluidBucket [ ","color":"reset","italic":false},{"text":"Empty","color":"white","italic":false},{"text":" ]","color":"reset","italic":false}]'
    execute if score $NextFluidType Temporary matches 1 run data modify storage api: Item.tag.display.Name set value '[{"text":"FluidBucket [ ","color":"reset","italic":false},{"text":"Water","color":"blue","italic":false},{"text":" ]","color":"reset","italic":false}]'
    execute if score $NextFluidType Temporary matches 2 run data modify storage api: Item.tag.display.Name set value '[{"text":"FluidBucket [ ","color":"reset","italic":false},{"text":"Lava","color":"#FF5500","italic":false},{"text":" ]","color":"reset","italic":false}]'
    execute if score $NextFluidType Temporary matches 3 run data modify storage api: Item.tag.display.Name set value '[{"text":"FluidBucket [ ","color":"reset","italic":false},{"text":"Snow","color":"white","italic":false},{"text":" ]","color":"reset","italic":false}]'
### FluidType
    execute if score $NextFluidType Temporary matches 0 run data modify storage api: Item.tag.FluidContainer.FluidType set value "empty"
    execute if score $NextFluidType Temporary matches 1 run data modify storage api: Item.tag.FluidContainer.FluidType set value "water"
    execute if score $NextFluidType Temporary matches 2 run data modify storage api: Item.tag.FluidContainer.FluidType set value "lava"
    execute if score $NextFluidType Temporary matches 3 run data modify storage api: Item.tag.FluidContainer.FluidType set value "snow"
### Replace
    execute unless entity @s[gamemode=creative] run function api:nbtbuffer/replace_player_item

## Reset
    scoreboard players reset $FluidType Temporary
    scoreboard players reset $NextFluidType Temporary
    scoreboard players reset $Water Temporary
    scoreboard players reset $Lava Temporary
    scoreboard players reset $Snow Temporary
    