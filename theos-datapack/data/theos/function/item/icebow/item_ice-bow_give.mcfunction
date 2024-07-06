# gives the player the ice bow.
advancement revoke @s only theos:craft/craft_item_ice-bow
clear @s knowledge_book
give @s crossbow[item_name='{"bold":true,"color":"blue","text":"Ice Crossbow"}',lore=['"Retrieved from the depths of the Arctic."'],custom_data={"theos":1b,"item":"icebow"},charged_projectiles=[{id:"minecraft:arrow",count:1,components:{"minecraft:intangible_projectile":{}}}]] 1