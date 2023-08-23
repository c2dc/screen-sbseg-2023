# screen-sbseg-2023

Este repositório contém o código para nosso protótipo de implementação da metodologia utilizada em nosso artigo SBSeg 2023.

Nossa metodologia é uma abordagem semiautomática este artigo descreve uma metodologia semiautomatizada capaz de auxiliar na descoberta de vulnerabilidades na interface web por meio da análise dinâmica de roteadores sem-fio em larga escala. A contribuição proposta pelo artigo é a integração da capacidade de emulação de imagens de firmware de roteadores em larga escala por meio do framework FirmAE com a análise de vulnerabilidades usando a técnica de web-fuzzing com templates da ferramenta Nuclei. Além disso, outra contribuição consiste na criação de templates específicos para o contexto de roteadores sem-fio a partir da análise de código-fonte e de vulnerabilidades conhecidas. Além da Metodologia em si, outra contribuição inicial são os templates destinados à ferramenta Nuclei. Esses modelos, construídos com base em Yet Another Markup Language (YAML), têm a finalidade de estabelecer os procedimentos para o envio e processamento das requisições HTTP.


## Organização da pasta

Em construção


## Instruções

A metodologia é divida em 3 fases.

1. Realiza a validação de emulação dos firmwares presentes na pasta firmwares ( devidamente separados por fabricante). 
    * Esse é um processo que demora no máximo 40 min por firmware podem ser executado de forma simultânea com intervalo de início entre firmwares de 60 segundos. 
2. Realiza a extração dos firmwares em pastas separadas por fabricante, para posterior envio ao github a fim de análise do código-fonte pelo SEMGREP.
    2.1 Os dados provenientes da NVD API serão inserido na pasta YYYY para posterior criação de templates. (Essa é uma subfase manual)
    2.1 Os indícios de vulnerabilidades do SEMGREP serão utilizados para criação de templates. (Essa é uma subfase manual)
3. Realiza a emulação em escala dos firmwares emulados e executa a análise de vulnerabilidades com o Nuclei.  
    
