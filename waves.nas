#Rainbow.Cycle
    setadd c[0] 1
    setadd c[1] 2
    setadd c[2] 3
    if c[0]|>|255 set c[0] 0
    if c[1]|>|255 set c[1] 0
    if c[2]|>|255 set c[2] 0
    settohexcolor hexCode c
    env fog {hexCode}
    env cloud {hexCode}
    env sky {hexCode}
    env skybox {hexCode}
    delay 10
    jump #Rainbow.Cycle
quit 

#onJoin 
    set 255 255
    set c[0] 255
    set c[1] 255
    set c[2] 255
    jump #Rainbow.Cycle
quit