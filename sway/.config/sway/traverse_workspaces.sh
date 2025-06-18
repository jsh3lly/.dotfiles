#!/bin/bash

# Remember, workspace in waybar != actual workspace number!!
# Workspace in waybar = actual workspace + 1
CUR_WORKSPACE=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused)' | jq -r '.current_workspace')
OUTPUT_INDEX=$(expr $CUR_WORKSPACE / 10)
CUR_WORKSPACE=$(expr $CUR_WORKSPACE % 10)

if [ $1 == "prev" ]; then
    TO_WORKSPACE=$(expr $CUR_WORKSPACE - 1)
elif [ $1 == "next" ]; then
    TO_WORKSPACE=$(expr $CUR_WORKSPACE + 1)
fi

if [[ $CUR_WORKSPACE -eq 0 && $TO_WORKSPACE -eq -1 ]]; then
    TO_WORKSPACE=$(expr 8 + $(expr $OUTPUT_INDEX \* 10))
elif [[ $CUR_WORKSPACE -eq 8 && $TO_WORKSPACE -eq 9 ]]; then
    TO_WORKSPACE=$(expr 0 + $(expr $OUTPUT_INDEX \* 10))
fi


# if [[ $TO_WORKSPACE -eq 9 && $CUR_WORKSPACE -eq 0 ]]; then
#     TO_WORKSPACE=9
# elif [[ $TO_WORKSPACE -eq 9 && $CUR_WORKSPACE -eq 8 ]]; then
#     TO_WORKSPACE=0
# elif [[ $TO_WORKSPACE -eq 19 && $CUR_WORKSPACE -eq 10 ]]; then
#     TO_WORKSPACE=19
# elif [[ $TO_WORKSPACE -eq 19 && $CUR_WORKSPACE -eq 18 ]]; then
#     TO_WORKSPACE=10
#     echo "hello"
# elif [[ $TO_WORKSPACE -eq 29 && $CUR_WORKSPACE -eq 20 ]]; then
#     TO_WORKSPACE=29
# elif [[ $TO_WORKSPACE -eq 29 && $CUR_WORKSPACE -eq 28 ]]; then
#     TO_WORKSPACE=20
# fi

/bin/swaysome focus $(expr $TO_WORKSPACE \% 10)
#swaymsg workspace number $TO_WORKSPACE
