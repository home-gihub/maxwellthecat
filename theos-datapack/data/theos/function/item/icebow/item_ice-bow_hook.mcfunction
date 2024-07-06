# detect arrows fired from tnt launcher
execute at @a[nbt={SelectedItem:{id:"minecraft:crossbow",components:{"minecraft:custom_data":{"theos":1b,item:"icebow"}}}}] run tag @e[type=arrow,distance=..3] add icerocket
# when they land summon explosion
execute at @e[tag=icerocket,nbt={inGround:1b}] run function theos:item/icebow/item_ice-bow_trap
