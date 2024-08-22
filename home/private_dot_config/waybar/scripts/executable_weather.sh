#!/bin/bash

LOC="$1"
echo "$LOC"
LOCATION=${LOC// /%20}
echo "$LOCATION"
content=$(curl -sS "https://thisdavej.azurewebsites.net/api/weather/current?loc=$LOCATION&deg=C")
echo "$content"

TEMP=$(echo "$content" | jq -r '. | "\(.temperature)°\(.degType)"' | sed 's/"//g')
TOOLTIP=$(echo "$content" | jq -r '. | "\(.temperature)°\(.degType)\n\(.skytext)"' | sed 's/"//g')
CLASS=$(echo "$content" | jq .skytext)

echo '{"text": '"$TEMP"', "tooltip": '"$TOOLTIP $LOC"', "class": '"$CLASS"' }'
