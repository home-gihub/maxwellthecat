// --- INPUT HOOK --- //
#input
    if runArg1|=|CHICKEN jump #SteveLavaChickenEat
quit
// --- INPUT HOOK END --- //



// --- STEVE'S LAVA CHICKEN --- //
#SteveLavaChicken
    freeze
    msg Jack Black (as Steve): Would you like some lava chicken?
    reply 0|Yes|#SteveLavaChickenYes
    reply 1|No|#SteveLavaChickenNo
    
    unfreeze
quit

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

#SteveLavaChickenEat
    motd horspeed=90
    delay 10000
    motd ignore
quit

// --- STEVE'S LAVA CHICKEN END --- //