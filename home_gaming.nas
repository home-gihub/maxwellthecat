
// --- STEVE'S LAVA CHICKEN --- //


#SteveLavaChickenYes
    reply clear
    item get LAVACHICKEN
    msg Type "/in CHICKEN" in the chat to eat the chicken!
    unfreeze
quit

#SteveLavaChickenNo
    reply clear
    unfreeze
    msg Jack Black (as Steve): Ok. I'll be here if you need anything.
quit

#SteveLavaChickenDontHave
    msg *You don't have any lava chicken to eat*
quit

#SteveLavaChickenEat
    ifnot item LAVACHICKEN jump #SteveLavaChickenDontHave
    item take LAVACHICKEN
    msg *You eat the lava chicken*
    motd horspeed=90
    delay 10000
    motd ignore
quit

#SteveLavaChicken
    freeze
    msg Jack Black (as Steve): Would you like some lava chicken?
    reply 1|Yes|#SteveLavaChickenYes
    reply 2|No|#SteveLavaChickenNo
    
    unfreeze
quit

// --- STEVE'S LAVA CHICKEN END --- //

// --- Eye open/close --- //
#EyeClose
    gui barColor 000000 1
    gui barSize 0
    delay 500
    gui barSize 0.25
    delay 500
    gui barSize 0.50
    delay 500
    gui barSize 0.75
    delay 500
    gui barSize 1
quit

#EyeOpen
    gui barColor 000000 1
    gui barSize 1
    delay 500
    gui barSize 0.75
    delay 500
    gui barSize 0.50
    delay 500
    gui barSize 0.25
    delay 500
    gui barSize 0
quit

#Blink
    call #EyeClose
    call #EyeOpen
quit
// --- Eye open/close END --- //


// --- Beer --- //
#FindBeer
    freeze
    item get BEER
    msg Type "/in BEER" in the chat to drink the beer!
    unfreeze
quit

#BeerDontHave
    msg *You don't have any beer*
quit

#DrinkBeer
    ifnot item BEER jump #BeerDontHave
    item take Beer
    msg *You drink the beer*
    motd horspeed=0.9
    call #Blink
    call #Blink
    call #Blink
    call #Blink
    call #Blink
    call #Blink
    call #Blink
    call #Blink
    call #Blink
    call #Blink
    gui reset
    motd ignore
quit
// --- Beer END --- //

// --- Rocket jump --- //
#FindRocket
    item give ROCKETLAUNCHER
    set rocketHave true
    msg Type "/in rocket enable" in the chat to enable it or "/in rocket disable" to disable it
quit

#RocketDontHave
    msg *You don't have a rocket launcher*
quit

#RocketShoot
    set rbf {click.pitch}
    setmul rbf 10
    boost 0 click.pitch 0 0 0 0
quit

#RocketEnable 
    ifnot rocketHave|=|true jump #RocketDontHave
    clickevent async register #RocketShoot
quit

#RocketDisable 
    ifnot rocketHave|=|true jump #RocketDontHave
    clickevent async unregister
quit

// --- Rocket jump END --- //


// --- UnStuck --- //
#UnStuck
    unfreeze
quit
// --- UnStuck END --- //

// --- Uranium --- //
#Uranium
    msg Hazmat suit guy: This is uranium.
    delay 5000
    kill Died of uranium poisoning
quit
// --- Uranium END ---//

// --- Rainbow block --- //
#RB.Cycle
    // i love oss
    // bruh 1
    set 34 34
    // bruh 2
    set 1 1
    // bruh 3
    set RB.{runArg5}.Count {runArg1}
    
    if RB.{runArg5}.Count|>=|34 set a 20
    setadd RB.{runArg5}.Count 1
    tempblock {RB.{runArg5}.Count} {runArg2} {runArg3} {runArg4} false
    delay 300
    jump #RB.Cycle|{RB.{runArg5}.Count}|{runArg2}|{runArg3}|{runArg4}|{runArg5}
quit 

#RB.FromMB
    set runArg1 20
    set runArg2 {MBX}
    set runArg3 {MBY}
    setadd runArg3 1
    set runArg4 {MBZ}
    setadd RB.numInstances 1
    set runArg5 {RB.numInstances}
    jump #RB.Cycle|{runArg1}|{runArg2}|{runArg3}|{runArg4}|{runArg5}
quit 
// --- Rainbow block END ---//

// --- firework --- //
#FW.Cycle
    // i love oss
    // bruh 1
    set expllvl 130
    if {runArg1}|=|expllvl effect explosion {runArg2} {runArg3} {runArg4} {runArg2}|{runArg3}|{runArg4}|
    setadd expllvl 1
    setadd runArg3 1

    jump #RB.Cycle|{runArg1}|{runArg2}|{runArg3}|{runArg4}|
quit 

#FW.FromMB
    set runArg1 0
    set runArg2 {MBX}
    set runArg3 {MBY}
    setadd runArg3 1
    set runArg4 {MBZ}
    jump #FW.Cycle|{runArg1}|{runArg2}|{runArg3}|{runArg4}|
quit 
// --- firework END ---//

// --- mobs --- //
#Mobs.attack
    set runArg1 {runArg1}
    setsplit runArg1 .
    setsub runArg1[2] 2
    if {runArg1[2]}|<|0 cmd /bot remove {runArg1}
    set botnm {runArg1[0]}.{runArg1[1]}.{runArg1[2]}.mob
    cmd /bot rename {runArg1} {botnm}
    
quit 

#Mobs.addbot
    // runarg1 - mob model
    // runarg2 - mob initial health
    // runarg3 - bot ai
    // runarg4 - bot name

    // [name].[model].[health].mob
    set botnm {runArg4}.{runArg1}.{runArg2}.mob
    cmd /bot add {botnm}
    cmd /bot text {botnm} /oss #Mobs.attack|{botnm}
    cmd /model bot {botnm} {runArg1}
    cmd /botset {botnm} {runArg3}
quit
// --- mobs end --- //

// --- INPUT HOOK --- //
#input
    // --- food/drinks --- //
    if runArg1|=|chicken jump #SteveLavaChickenEat
    if runArg1|=|beer jump #DrinkBeer
    // --- food/drinks END --- //
quit
// --- INPUT HOOK END --- //

// --- JOIN HOOK --- //
#onJoin
    set beer BEER
    set chicken CHICKEN
    set rocketHave false
quit
// -- JOIN HOOK END --- //
