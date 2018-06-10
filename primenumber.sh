#!/bin/bash

function PrimeNumber() {
    local LOOP_START_NUMBER=2
    local NO_CHECK_NUMBER=3

    expr $1 + 1 > /dev/null 2>&1
    if [[ ! $? -ne 2 ]]; then
        echo "数値を指定してください。"
        exit 1
    elif [[ "$1" = "" ]]; then
        echo "引数に数値を指定してください。"
        exit 1
    elif [[ $1 -le 1 ]]; then
        echo "0と1は素数ではありません。2以上を指定してください。"
        exit 1
    elif [[ $1 -le $NO_CHECK_NUMBER ]]; then
        return 0
    fi

    for ((i=$LOOP_START_NUMBER; i <= $1 / 2; i++)); do
        num=$(echo $(( $1 % i )))
        if [ $num -eq 0 ]; then
            return 1
        fi
    done

    return 0
}

PrimeNumber $1
if [ $? -eq 0 ]; then
    echo "[$1] は素数です。"
else
    echo "[$1] は素数ではありません。"
fi

