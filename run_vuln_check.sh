#!/bin/bash

containers=$(docker ps --format "{{.Names}}")  # Lista de nomes dos contêineres em execução

echo "Contêineres em execução:"

for container in $containers; do

  # Extrair o numero_do_id do nome do contêiner
  numero_do_id=$(echo "$container" | cut -d '_' -f 2-)

  # Ler o conteúdo do arquivo ip
  ip=$(cat "/home/rehosting/screen-sbseg-2023/FirmAE/scratch/$numero_do_id/ip")

  # Executar o comando substituindo o IP
  echo "$container" | tee -a check_result_vulns.txt

  docker exec "$container" /bin/bash -c "/root/go/bin/nuclei -timeout 2 -duc -t "/work/FirmAE/templates/" -u 'http://$ip' -v" | tee -a check_result_vulns.txt
done

