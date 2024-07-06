# detect arrows fired from tnt launcher
execute at @a[nbt={SelectedItem:{id:"minecraft:bow",components:{"minecraft:custom_data":{"theos":1b,item:"rocket"}}}}] run tag @e[type=arrow,distance=..3] add rocket
# when they land summon explosion
execute at @e[tag=rocket,nbt={inGround:1b}] run summon tnt ~ ~1 ~
