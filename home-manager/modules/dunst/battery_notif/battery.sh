#!/usr/bin/env bash

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

WARNING_LEVEL=20
CRITICAL_LEVEL=10
CHARGED=70

BATTERY_AMOUNT=$(acpi -b | grep -c "Battery")
BATTERY_INDEX=$((BATTERY_AMOUNT - 1))
BATTERY_DISCHARGING=$(acpi -b | grep "Battery $BATTERY_INDEX" | grep -c "Discharging")
BATTERY_CHARGING=$(acpi -b | grep "Battery $BATTERY_INDEX" | grep -c "Charging")
BATTERY_LEVEL=$(acpi -b | grep "Battery $BATTERY_INDEX" | grep -P -o '[0-9]+(?=%)')

if [ "$BATTERY_LEVEL" -gt $CHARGED ] && [ "$BATTERY_CHARGING" -eq 1 ]; then
  dunstify "Battery charged" "You can unplug the charger" -I "/home/iris/.config/notifs/battery-alert-custom.png" -r 2137
elif [ "$BATTERY_LEVEL" -le $WARNING_LEVEL ] && [ "$BATTERY_DISCHARGING" -eq 1 ] && [ "$BATTERY_LEVEL" -gt $CRITICAL_LEVEL ]; then
	dunstify "Low Battery" "${BATTERY_LEVEL}% of battery remaining." -I "/home/iris/.config/notifs/battery-20-custom.png" -u critical -r 2137
elif [ "$BATTERY_LEVEL" -le $CRITICAL_LEVEL ] && [ "$BATTERY_DISCHARGING" -eq 1 ]; then
	dunstify "Battery Critical" "The computer will shutdown soon." -I "/home/iris/.config/notifs/battery-alert-variant-outline-custom.png" -u critical -r 2137
fi
