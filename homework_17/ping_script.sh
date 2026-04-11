#!/bin/bash

read -r -p "Введите адрес: " host
failed=0

while true; do
    if result=$(ping -c 1 -W 1 "$host" 2>/dev/null); then
        failed=0

        time_ms=$(echo "$result" | grep "time=" | sed -E 's/.*time=([0-9.]+).*/\1/')
        if [ -n "$time_ms" ]; then
            if awk -v t="$time_ms" 'BEGIN { exit !(t > 100) }'; then
                echo "Пинг больше 100 мс: $time_ms мс"
            else
                echo "Пинг: $time_ms мс"
            fi
        fi
    else
        failed=$((failed + 1))
        echo "Пинг не прошел"
        if [ "$failed" -ge 3 ]; then
            echo "3 раза подряд пинг не удался"
        fi
    fi
    sleep 1
done
