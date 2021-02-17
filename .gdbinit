# Load .gdbinit also from working directory
set auto-load safe-path *
set auto-load local-gdbinit

# Unknown memory addresses will be treated as RAM
set mem inaccessible-by-default off

# Helper for hard faults
define armv7m_break
    echo Created HardFault_Handler() breakpoint\n
    break z_arm_hard_fault
    commands
        printf "=== Hard fault location: ===\n"
        # Check CONTROL.SPSEL bit to figure calling stack (Thread vs Process)
        if ($lr & 0x4)
            list **((uint32_t*)($psp+6*sizeof($psp)))
        else
            list **((uint32_t*)($msp+6*sizeof($msp)))
        end
        if (*0xE000ED29 & 0x4)
            printf "IMPRECISERR=1, Asyncronous fault, PC is not precise\n"
        end
    end
end

# When PC location is not accurate, you can try disabling write buffering
define disable_writebuf
    # Set DISDEFWBUF bit(1) in Auxiliary Control Register
    # http://infocenter.arm.com/help/topic/com.arm.doc.dui0552a/CHDCBHEE.html
    set *0xE000E008 = *0xE000E008|2
end

# Helper to run to main
define main
    tbreak main
    monitor reset
    continue
end
document main
Syntax: main
| Run program and break on main().
end

# Reset the board
define reset
    monitor reset
end
document reset
Syntax: reset
| Reset the remote target
end

# Load Dashboard extension
# https://github.com/cyrus-and/gdb-dashboard
source ~/.gdbinit.dashboard
dashboard -layout assembly breakpoints registers source stack variables !expressions !history !memory !threads
dashboard source -style height 20
# Disable dashboard by default to allow other GDB UI's to work
dashboard -enabled off

