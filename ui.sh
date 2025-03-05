#!/bin/bash

# UI functions for selecting music

# Select a song using Rofi or FZF
select_song() {
    if [ "$USE_FZF" = true ]; then
        SONG=$(find "$MUSIC_DIR" -type f -iname "*.mp3" -o -iname "*.flac" | fzf --preview "mpv --no-audio-display {}")
    else
        SONG=$(find "$MUSIC_DIR" -type f -iname "*.mp3" -o -iname "*.flac" | rofi -dmenu -p "🎵 Select Song")
    fi

    if [ -n "$SONG" ]; then
        play_song "$SONG"
    fi
}

# Show the main menu
main_menu() {
    OPTIONS="🎵 Play Music\n🛑 Stop Music\n🔄 Refresh Library\n🚪 Exit"
    
    if [ "$USE_FZF" = true ]; then
        CHOICE=$(echo -e "$OPTIONS" | fzf)
    else
        CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -p "🎶 RofiTunes")
    fi

    case "$CHOICE" in
        "🎵 Play Music") select_song ;;
        "🛑 Stop Music") stop_song ;;
        "🔄 Refresh Library") notify-send "✅ Library Updated" ;;
        "🚪 Exit") exit ;;
    esac
}
