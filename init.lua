minetest.register_node("grasspaths:grasspath", {
    description = "Grass Path",
    tiles = {
        "grasspaths_grasspathtop.png",
        "grasspaths_grasspathbottom.png",
        "grasspaths_grasspathside.png",

    },
    is_ground_content = true,
    groups = {crumbly=3},
    drops="default:Dirt",
    
    on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        print"Hello"
    end

})


