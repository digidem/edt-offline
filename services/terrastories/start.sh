#!/usr/bin/env bash

file=firstboot

if [ ! -e "$file" ] ; then
    echo "First run!"
    echo "================================"
    echo "Running migration"
    bin/rails db:migrate db:seed
    touch "$file"
fi

if [ ! -w "$file" ] ; then
    echo "Migration already happened!"
    exit 1
fi
scripts/server