#WAV.Cycle
    delay 100
    setsplit runArg1 " "
    tempblock PlayerHeldBlock runArg1[0] 1 runArg1[2] false
    newthread #WAV.Cycle|{click.coords}|{runArg2}|{runArg3}|{runArg4}|{runArg5}
    setsplit runArg1 " "
    newthread #WAV.Cycle|{runArg1[0]} {runArg1[1]} {runArg1[2]}|{runArg2}|{runArg3}|{runArg4}|{runArg5}
    setadd runArg1[0] 1
    newthread #WAV.Cycle|{runArg1[0]} {runArg1[1]} {runArg1[2]}|{runArg2}|{runArg3}|{runArg4}|{runArg5}
    setsub runArg1[0] 2
    newthread #WAV.Cycle|{runArg1[0]} {runArg1[1]} {runArg1[2]}|{runArg2}|{runArg3}|{runArg4}|{runArg5}
    setadd runArg1[0] 1
    setadd runArg1[2] 1
    setadd runArg1[0] 1
    newthread #WAV.Cycle|{runArg1[0]} {runArg1[1]} {runArg1[2]}|{runArg2}|{runArg3}|{runArg4}|{runArg5}
    setsub runArg1[0] 2
    newthread #WAV.Cycle|{runArg1[0]} {runArg1[1]} {runArg1[2]}|{runArg2}|{runArg3}|{runArg4}|{runArg5}
    setadd runArg1[0] 1
    setsub runArg1[2] 2
    setadd runArg1[0] 1
    newthread #WAV.Cycle|{runArg1[0]} {runArg1[1]} {runArg1[2]}|{runArg2}|{runArg3}|{runArg4}|{runArg5}
    setsub runArg1[0] 2
    newthread #WAV.Cycle|{runArg1[0]} {runArg1[1]} {runArg1[2]}|{runArg2}|{runArg3}|{runArg4}|{runArg5}
    setadd runArg1[0] 1
quit 

#WAV.FromClick
    setsplit click.coords " "
    newthread #WAV.Cycle|{click.coords[0]} {click.coords[1]} {click.coords[2]}|{runArg2}|{runArg3}|{runArg4}|{runArg5}
    setadd click.coords[0] 1
    newthread #WAV.Cycle|{click.coords[0]} {click.coords[1]} {click.coords[2]}|{runArg2}|{runArg3}|{runArg4}|{runArg5}
    setsub click.coords[0] 2
    newthread #WAV.Cycle|{click.coords[0]} {click.coords[1]} {click.coords[2]}|{runArg2}|{runArg3}|{runArg4}|{runArg5}
    setadd click.coords[0] 1
    setadd click.coords[2] 1
    setadd click.coords[0] 1
    newthread #WAV.Cycle|{click.coords[0]} {click.coords[1]} {click.coords[2]}|{runArg2}|{runArg3}|{runArg4}|{runArg5}
    setsub click.coords[0] 2
    newthread #WAV.Cycle|{click.coords[0]} {click.coords[1]} {click.coords[2]}|{runArg2}|{runArg3}|{runArg4}|{runArg5}
    setadd click.coords[0] 1
    setsub click.coords[2] 2
    setadd click.coords[0] 1
    newthread #WAV.Cycle|{click.coords[0]} {click.coords[1]} {click.coords[2]}|{runArg2}|{runArg3}|{runArg4}|{runArg5}
    setsub click.coords[0] 2
    newthread #WAV.Cycle|{click.coords[0]} {click.coords[1]} {click.coords[2]}|{runArg2}|{runArg3}|{runArg4}|{runArg5}
    setadd click.coords[0] 1
quit 

#onJoin 
    clickevent async register #WAV.FromClick
quit