#> fluidcontainer:fluidbucket/private/used_empty
# @within function fluidcontainer:fluidbucket/private/used_bucket

## Increase Amount
    execute if score $FluidType Temporary matches 1 run scoreboard players add $Water Temporary 1000
    execute if score $FluidType Temporary matches 2 run scoreboard players add $Lava Temporary 1000
    execute if score $FluidType Temporary matches 3 run scoreboard players add $Snow Temporary 1000

## Replace Item
    data modify storage api: Item set from storage api: Trigger.PrevItem
### Fluid Amount
    execute store result storage api: Item.tag.FluidContainer.Amounts.water int 1 run scoreboard players get $Water Temporary
    execute store result storage api: Item.tag.FluidContainer.Amounts.lava int 1 run scoreboard players get $Lava Temporary
    execute store result storage api: Item.tag.FluidContainer.Amounts.snow int 1 run scoreboard players get $Snow Temporary
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
