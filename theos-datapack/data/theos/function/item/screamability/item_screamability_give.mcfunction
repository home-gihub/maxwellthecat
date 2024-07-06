# give the scream ability
advancement revoke @s only theos:craft/craft_item_screamability
clear @s knowledge_book
give @s music_disc_chirp[item_name='{"bold":true,"color":"red","text":"Scream"}',lore=['"Use this on the players you don\'t like"'],custom_data={theos:1b,item:"screamability"},attribute_modifiers=[{id:"block_interaction_range",type:"player.block_interaction_range",amount:-5,operation:"add_value",slot:"hand"}],food={nutrition:0,saturation:0,can_always_eat:true,eat_seconds:10000000}] 1