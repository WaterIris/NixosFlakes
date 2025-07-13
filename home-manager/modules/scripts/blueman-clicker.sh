is_blueman_on=$(hyprctl clients | grep -c ".blueman-manager-wrapped")


if [ "$is_blueman_on" -gt 0 ]; then
    pkill blueman
else
    hyprctl dispatch exec blueman-manager
fi
