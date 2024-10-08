#!/bin/bash

speakers='alsa_output.pci-0000_07_00.1.hdmi-stereo'
headphones='alsa_output.usb-Logitech_PRO_000000000000-00.analog-stereo'

function main() {
    # Pipewire
    SINK=$(pactl get-default-sink NAME)

    action=$1
    if [ "${action}" == "swap" ]; then
        if [ ${SINK} == $headphones ]; then
            pactl set-default-sink $speakers 
        else 
            pactl set-default-sink $headphones 
        fi
    else
        if [ ${SINK} == $headphones ]; then
            echo "󰋋"
        else
            echo "󰓃"
        fi
    fi
}

main $@
