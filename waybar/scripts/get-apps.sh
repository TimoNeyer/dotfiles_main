#!/bin/bash

if [[ -z "$1" ]]; then

  APPS=$(swaymsg -t get_tree | jq -c '..|try  select(.window_properties !=null)| {id: .id, class: .window_properties.class, title: .window_properties.title}')

  for APP in "$APPS"; do
    CLASS=$(echo "$APP" | jq -c '.class')
    TITLE=$(echo "$APP" | jq -c '.title')
    ID=$()
  done
else
  APP=$(swaymsg -t get_tree | jq -c '..|try  select(.window_properties !=null)| select(.id = $1) {id: .id, class: .window_properties.class, title: .window_properties.title}')
