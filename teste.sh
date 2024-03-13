#!/bin/bash

# Verifica se um diretório foi passado como parâmetro
if [ $# -eq 0 ]; then
    echo "Uso: $0 <diretório>"
    exit 1
fi

# Atribui o primeiro argumento para a variável 'diretorio'
diretorio=$1

# Nome do arquivo de saída que conterá os hashes MD5
saida="hashes_md5.txt"

# Verifica se o diretório existe
if [ -d "$diretorio" ]; then
    # Encontra todos os arquivos no diretório (sem subdiretórios) e calcula seus hashes MD5
    for arquivo in "$diretorio"/*; do
        # Verifica se o item é um arquivo para evitar diretórios
        if [ -f "$arquivo" ]; then
            # Calcula o hash MD5 do arquivo e escreve no arquivo de saída
            md5sum "$arquivo" >> "$saida"
        fi
    done
    echo "Hashes MD5 salvos em $saida."
else
    echo "Diretório não encontrado."
fi
