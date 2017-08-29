minetest.register_node("grasspaths:grasspath", {
    description = "Grass Path",
    tiles = {
        "grasspaths_grasspath_top.png",
        "grasspaths_grasspath_bottom.png",
        "grasspaths_grasspath_side.png",

    },
    is_ground_content = true,
    groups = {crumbly=3},
    drop = "default:dirt",
    
--    on_rightclick = function(pos, node, player, itemstack, pointed_thing)
--    end

})

minetest.register_node("grasspaths:rake", {
    description = "Rake",
    inventory_image = "grasspaths_rake.png",
    wield_image = "grasspaths_rake.png^[transformR180",
    tool_capabilities = {
        full_punch_interval = 1.2,
        max_drop_level = 0,
        groupcaps = {
            crumbly = {
                times = {
                    [1] = 3.00,
                    [2] = 1.60,
                    [3] = 0.60
                },
                uses = 10,
                maxlevel = 1
            },
        },
        groupcaps = {
            fleshy = 2
        },
    },
    sound = {
        breaks = "default_tool_breaks"
    },
    on_place = function(itemstack, placer, pointed_thing)
        local pointedThing = pointed_thing
        if not pointedThing or pointedThing.type ~= "node" then
            return
        end

        local underNode = minetest.get_node(pointedThing.under)
        local pointedName = underNode.name
        if pointedName == "default:dirt" or pointedName == "default:dirt_with_grass" then
            minetest.set_node(pointedThing.under, {name = "grasspaths:grasspath"})

            local wear = 1
            itemstack:add_wear(wear)
        end

        return itemstack

    end
})

minetest.register_craft({
    output = "grasspaths:rake",
    recipe = {
        {"", "default:stick", ""},
        {"", "default:stick", ""},
        {"default:tin_ingot", "default:tin_ingot", "default:tin_ingot"},
    }
})
