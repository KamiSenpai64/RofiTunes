#!/bin/bash

# RofiTunes - Main script
# Sources all modules and runs the program

# Source the configuration and modules
source "$(dirname "$0")/config.sh"
source "$(dirname "$0")/playback.sh"
source "$(dirname "$0")/ui.sh"
source "$(dirname "$0")/utils.sh"
source "$(dirname "$0")/cmus_control.sh"

# Show the main menu
main_menu() {
    OPTIONS="🎵 Play Music\n🛑 Stop Music\n🔄 Refresh Library\n🎧 CMUS Controls\n🚪 Exit"
    
    if [ "$USE_FZF" = true ]; then
        CHOICE=$(echo -e "$OPTIONS" | fzf)
    else
        CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -p "🎶 RofiTunes")
    fi

    case "$CHOICE" in
        "🎵 Play Music") select_song ;;
        "🛑 Stop Music") stop_song ;;
        "🔄 Refresh Library") notify-send "✅ Library Updated" ;;
        "🎧 CMUS Controls") cmus_control_menu ;;  # CMUS control option
        "🚪 Exit") exit ;;
    esac
}
# Run the main menu
main_menu
