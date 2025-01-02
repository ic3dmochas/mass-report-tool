#NoEnv
#Persistent
plrnum := "Unset"
isRunning := false
cd := 350

Gui, Add, Tab2, x10 y10 w300 h105, Run|Config

Gui, Tab, Run

Gui, Add, Button, x100 y35 w100 h30 gstart, Start (F1)
Gui, Add, Button, x100 y75 w100 h30 gstop, Stop (F2)

Gui, Tab, Config

Gui, Add, Text, x30 y40, Num:
Gui, Add, Edit, x70 y38 w100 vNumInput
Gui, Add, Button, x200 y35 w80 h30 gsavenum, Save

Gui, Add, Text, x30 y70, CD:
Gui, Add, Edit, x70 y68 w100 vCooldownInput
Gui, Add, Button, x200 y65 w80 h30 gsavetime, Save

Gui, Show, w320 h120, MR'D V1 [mocha !! :3]
Return
        
start:
    startinit()
Return

stop:
    stopinit()
Return

savenum:
    GuiControlGet, NumInput
    savenuminit(NumInput)
Return

savetime:
    GuiControlGet, CooldownInput
    savecdinit(CooldownInput)
Return

F1::
    Gosub, start
Return

F2::
    Gosub, stop
Return

startinit() {
    global plrnum, isRunning
    if (plrnum = "Unset" or "") {
        MsgBox, ERROR: NUM is unset.
        Exit
    }
    isRunning := true
    startrun(plrnum)
}

stopinit() {
    global isRunning
    if (isRunning) {
        isRunning := false
        ExitApp
        MsgBox, stopped reporting :3
    } else {
        MsgBox, ERROR: loop not started.
    }
}

savenuminit(x) {
    global plrnum
    plrnum := x
    if (plrnum = x) {
        MsgBox, Report NUM Set To: %plrnum%, %x%
        Exit
    } else {
        MsgBox, ERROR: Failed to set value.
        Exit
    }
}

savecdinit(x) {
    global cd
    cd := x
    MsgBox, Action CD Set To: %plrnum%, %x%
}

startrun(x) {
    global isRunning
    global cd
    global plrnum
    while (isRunning) {
        tooltip, running
        Sleep, 1000
        Send, {Escape}
        Sleep, cd
        loop, 3 { ; opens report tab
            tooltip, opening report tab
            Send, {Tab}
            Sleep, cd
        }
        Sleep, cd
        Send, {Down}
        Sleep, cd
        Send, {Enter} ; opens type of abuse
        tooltip, opening type of abuse
        Sleep, cd
        loop, 5 { ; select type of abuse
            tooltip, selecting type of abuse
            Send, {Down}
            Sleep, cd
        }
        Send, {Up}
        Sleep, cd
        Send, {Enter}
        Sleep, cd
        loop, 2 { ; scrolls over which person
            tooltip, scrolling over players
            Send, {Down}
            Sleep, cd
        }
        Send, {Enter}
        Sleep, cd
        loop, 8 { ; returns to top
            tooltip, fixing alignment
            Send, {Up} 
            Sleep, cd
        }
        loop, %plrnum% { ; scrolls to which person
            tooltip, scrolling to specific player %plrnum%
            Send, {Down} 
            Sleep, cd
        }
        Sleep, cd
        Send, {Enter} ; selects which person
        tooltip, selecting player
        Sleep, cd
        loop, 3 { ; scrolls to reason
            tooltip, scrolling to reason
            Send, {Down}
            Sleep, cd
        }
        Send, {Enter} ; opens reason
        tooltip, opening reason
        Sleep, cd
        tooltip, selecting reason
        Click, 950 640
        Sleep, cd
        loop, 7 { ; scrolls to exit
            tooltip, scrolling to exit
            Send, {Down}
            Sleep, cd
        }
        loop, 3 { ; exits
            tooltip, exiting
            Send, {Enter}
            Sleep, cd
        }
        tooltip
    }
}

GuiClose:
    ExitApp
Return
