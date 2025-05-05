
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
    // bruh 2
    set 34 34
    setadd runArg1 1
    if runArg1|>=|34 set runArg1 21
    msg tempblock {runArg1} {runArg2} {runArg3} {runArg4} false
    tempblock {runArg1} {runArg2} {runArg3} {runArg4} false
    delay 700
    jump #RB.Cycle|{runArg1}|{runArg2}|{runArg3}|{runArg4}
quit 

#RB.FromMB
    set runArg1 21
    set runArg2 {MBX}
    set runArg3 {MBY}
    setadd runArg3 1
    set runArg4 {MBZ}
    jump #RB.Cycle|{runArg1}|{runArg2}|{runArg3}|{runArg4}
quit 
// --- Rainbow block END ---//

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
