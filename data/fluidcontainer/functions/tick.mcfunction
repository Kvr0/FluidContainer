#> fluidcontainer:tick
# @within tag/function core:tick

#> Callback: Tick
    # Check Installed
    execute if data storage core: Installed.FluidContainer run function fluidcontainer:main
