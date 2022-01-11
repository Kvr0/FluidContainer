#> fluidcontainer:fluidbucket/private/craft
# @within advancement fluidcontainer:craft/craft_fluidbucket

function fluidcontainer:fluidbucket/give

clear @s chest 1

recipe take @s fluidcontainer:fluidbucket
advancement revoke @s only fluidcontainer:craft/craft_fluidbucket
