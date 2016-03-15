#!/bin/bash

module_name=$1
camel_module_name="$(tr '[:upper:]' '[:lower:]' <<< ${module_name:0:1})${module_name:1}"

# Make a folder
mkdir $module_name

# Copy templates
cp templates/TEMPLATE* $module_name

# Search/Replace template macros

current_date=$(date +"%d/%m/%Y")

#echo Date $current_date

for f in $module_name/TEMPLATE*; do

	tempfile=$(mktemp -t "$(basename $0).XXXXXXXXXX")

	#echo File $f
	#echo Temp $tempfile

    sed "s/TEMPLATE/$module_name/g" $f > $tempfile && mv $tempfile $f
    sed "s/CAMEL_TEMP_NAME/$camel_module_name/g" $f > $tempfile && mv $tempfile $f
	sed "s:DATE:${current_date}:g" $f > $tempfile && mv $tempfile $f

	mv $f ${f/TEMPLATE/$module_name}

done
