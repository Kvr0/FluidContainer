#> fluidcontainer:fluidbucket/private/used_snow
# @within function fluidcontainer:fluidbucket/private/used_bucket

## Decrease Amount
    scoreboard players remove $Snow Temporary 1000

## Replace Item
    data modify storage api: Item set from storage api: Trigger.PrevItem
### Fluid Amount
    execute store result storage api: Item.tag.FluidContainer.Amounts.snow int 1 run scoreboard players get $Snow Temporary
### Empty Check
    execute if score $Snow Temporary matches ..0999 run data modify storage api: Item.id set value "minecraft:bucket"
    execute if score $Snow Temporary matches ..0999 run data modify storage api: Item.tag.display.Name set value '[{"text":"FluidBucket [ ","color":"reset","italic":false},{"text":"Empty","color":"white","italic":false},{"text":" ]","color":"reset","italic":false}]'
    execute if score $Snow Temporary matches ..0999 run data modify storage api: Item.tag.FluidContainer.FluidType set value "empty"
### Item Lore
    data modify storage api: Item.tag.display.Lore set value []
    data modify block -30000000 2 43885 Text1 set value '[{"text":" Water","color":"blue","italic":false},{"text":" : ","color":"white"},{"nbt":"Item.tag.FluidContainer.Amounts.water","storage":"api:","color":"white"},{"text":" mb","color":"white"}]'
    data modify storage api: Item.tag.display.Lore append from block -30000000 2 43885 Text1
    data modify block -30000000 2 43885 Text1 set value '[{"text":"  Lava","color":"#FF5500","italic":false},{"text":" : ","color":"white"},{"nbt":"Item.tag.FluidContainer.Amounts.lava","storage":"api:","color":"white"},{"text":" mb","color":"white"}]'
    data modify storage api: Item.tag.display.Lore append from block -30000000 2 43885 Text1
    data modify block -30000000 2 43885 Text1 set value '[{"text":"  Snow","color":"white","italic":false},{"text":" : ","color":"white"},{"nbt":"Item.tag.FluidContainer.Amounts.snow","storage":"api:","color":"white"},{"text":" mb","color":"white"}]'
    data modify storage api: Item.tag.display.Lore append from block -30000000 2 43885 Text1
### Replace
    function api:nbtbuffer/replace_player_item
