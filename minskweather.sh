#!/bin/bash

source ./config.ini

while true; do
	tmp=`wget -q -O - www.gismeteo.by/weather-minsk-4248 | grep -o '.*<span class="tab-weather__value_m">.*'`
	min=`echo "${tmp}" |   grep -o '.*<s' |  sed -e 's/&minus/-/g' | sed -e 's/[^-0-9]//g'`
	max=`echo "${tmp}" |   grep -o '>.*' |  sed -e 's/&minus/-/g' | sed -e 's/[^-0-9]//g'`

	echo "Погода в Минске от ${min} до ${max} градусов"  

	sleep "${update_interval}"
done
