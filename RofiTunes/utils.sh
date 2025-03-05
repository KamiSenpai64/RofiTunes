#!/bin/bash

# Utility functions for RofiTunes

# Send a notification
notify() {
    local message=$1
    notify-send "RofiTunes" "$message"
}
