
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

// --- INPUT HOOK --- //
#input
    // --- food/drinks --- //
    set chicken CHICKEN
    if runArg1|=|chicken jump #SteveLavaChickenEat
    set beer BEER
    if runArg1|=|beer jump #DrinkBeer
    // --- food/drinks END --- //
quit
// --- INPUT HOOK END --- //


