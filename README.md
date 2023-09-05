# screen-sbseg-2023

Este repositório contém o código para implementação da metodologia apresentado em nosso artigo no SBSeg 2023

Nossa metodologia é uma abordagem semiautomática capaz de auxiliar na descoberta de vulnerabilidades na interface web por meio da análise dinâmica de roteadores sem-fio em larga escala. A contribuição proposta pelo artigo é a integração da capacidade de emulação de imagens de firmware de roteadores em larga escala por meio do framework FirmAE com a análise de vulnerabilidades usando a técnica de web-fuzzing com templates da ferramenta Nuclei. Além disso, outra contribuição consiste na criação de templates específicos para o contexto de roteadores sem-fio a partir da análise de código-fonte e de vulnerabilidades conhecidas. Além da Metodologia em si, outra contribuição inicial são os templates destinados à ferramenta Nuclei. Esses modelos, construídos com base em Yet Another Markup Language (YAML), têm a finalidade de estabelecer os procedimentos para o envio e processamento das requisições HTTP.


## Organização da pasta

Em construção


## Instruções

A metodologia é divida em 5 fases.

1. Realiza a validação de emulação dos firmwares presentes na pasta firmwares ( devidamente separados por fabricante). 
    * Esse é um processo que demora no máximo 40 min por firmware podem ser executado de forma simultânea com intervalo de início entre firmwares de 60 segundos. 
2. Realiza a extração dos firmwares em pastas separadas por fabricante, para posterior envio ao github a fim de análise do código-fonte pelo SEMGREP. Os indícios de vulnerabilidades do SEMGREP serão utilizados para criação de templates. (Parte dessa fase é manual)
3. Os dados provenientes da NVD API serão inserido na pasta YYYY para posterior criação de templates. (Parte dessa fase é manual)
4. Nesta fase os firmwares emuláveis serão iniciados em paralelo.
5. Análise de vulnerabilidade com o Nuclei e os temaplates.
   
## Fase 0 - Downloading e Instalação

Para executar o protótipo é necessário realizar o download e instalação do framework FirmAE e configurar a imagem docker responsável pela emulação e análise em larga escala. Para fazer isso nós executamos o script abaixo.

```
./prepare.sh
```

## Fase 1 - Verificação de Emulação

Realiza a validação de emulação dos firmwares presentes na pasta firmwares ( devidamente separados por fabricante). Para fazer isso nós executamos o script abaixo.

```
./run.sh
```

## Fase 2 - Extração do sistema de arquivo das imagens de firmware

Realiza a extração dos firmwares em pastas separadas por fabricante, para posterior envio ao github a fim de análise do código-fonte pelo SEMGREP. Para fazer isso nós executamos o script abaixo.

```
./extract_to_semgrep.sh
``` 

## Fase 3 - Requisição a API NVD para criação de templates

Utiliza informações do firmware ou do seu fabricante para gerar templates com  dados provenientes da NVD API com dados relacionados a vulnerabilidades anteriomente reportadas. (Essa é uma subfase manual). Para fazer isso nós executamos o script abaixo.

```
./api_request.sh
``` 

## Fase 4 - Emulação em escala

Nesta fase os firmwares emuláveis serão iniciados em paralelo através de containers via Docker. Para fazer isso nós executamos o script abaixo.

```
./emulation.sh
``` 

## Fase 5 - Análise de vulnerabilidade

Realiza a execução, em cada container, um processo do Nuclei utilizando a base de dados de templates. Para fazer isso nós executamos o script abaixo.
```
./run_vuln_check.sh
``` 
