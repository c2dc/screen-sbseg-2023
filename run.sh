#!/bin/bash

# Ler os comandos do arquivo docker-run-check-vulns.txt
commands=()
while IFS= read -r cmd
do
    commands+=("$cmd")
done < docker-run-check-vulns.txt

# Loop para executar os comandos em sessões separadas do screen
for cmd in "${commands[@]}"
do
  echo $cmd
  sleep 60;sudo  screen -dmS docker_session bash -c "$cmd"
done

