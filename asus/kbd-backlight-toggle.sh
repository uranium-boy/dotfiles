#!/bin/sh

# Read hardware status
echo "\_SB.PC00.LPCB.EC0.RRAM 0x9042" > /proc/acpi/call
CURRENT_STATE=$(tr -d '\0' < /proc/acpi/call)

# Toggle state (off=0, on=0x83)
if [ "$CURRENT_STATE" = "0x0" ]; then
	echo "\_SB.ATKD.SLKB 0x83" > /proc/acpi/call
else
	echo "\_SB.ATKD.SLKB 0" > /proc/acpi/call
fi
