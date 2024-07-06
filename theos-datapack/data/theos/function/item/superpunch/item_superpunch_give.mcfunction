# gives the super punch ability 
advancement revoke @s only theos:craft/craft_item_superpunch
clear @s minecraft:knowledge_book
give @s music_disc_cat[item_name='{"bold":true,"color":"aqua","text":"Super punch ability"}',lore=['"That\'s one big punch!"'],custom_data={"theos":1b,"item":"superpunch"},attribute_modifiers=[{id:"block_interaction_range",type:"player.block_interaction_range",amount:-5,operation:"add_value",slot:"hand"},{id:"attack_knockback",type:"generic.attack_knockback",amount:50,operation:"add_value",slot:"hand"}]] 1