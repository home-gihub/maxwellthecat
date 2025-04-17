
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
    boost 0 10 0
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
    if runArg1|=|chicken jump #SteveLavaChickenEat
quit
// --- INPUT HOOK END --- //


