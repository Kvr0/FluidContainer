#> fluidcontainer:install
# @within tag/function core:install

function #fluidcontainer:install

#> Install Flag
    execute unless data storage core: Installed.FluidContainer run data modify storage core: Installed.FluidContainer set value {}
    