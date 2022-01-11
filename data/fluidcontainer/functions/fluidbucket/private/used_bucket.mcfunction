#> fluidcontainer:fluidbucket/private/used_bucket
# @within tag/function api:trigger/consume_item

execute if data storage api: Trigger.PrevItem.tag.FluidContainer unless entity @s[gamemode=creative] run function fluidcontainer:fluidbucket/private/_used_bucket
