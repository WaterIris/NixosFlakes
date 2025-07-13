is_pavucontrol_on=$(hyprctl clients | grep -c "org.pulseaudio.pavucontrol")


if [ "$is_pavucontrol_on" -gt 0 ]; then
    pkill pavucontrol
else
    hyprctl dispatch exec pavucontrol
fi
