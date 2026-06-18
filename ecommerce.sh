#!/bin/bash

# Variáveis
PROXIMO_ID=0

# Solicitar o usuário para digitar o nome do produto
read -p "Digite o nome do produto: " PRODUTO

# Criar arquivo csv com o cabeçalho se não existir
if [ ! -f produtos.csv ]; then
    echo "id_prod,desc_prod" > produtos.csv
fi

# Gravar o id e descrição do produto em um arquivo csv
TOTAL_PRODUTOS_CADASTRADOS=$(($(wc -l < produtos.csv) - 1)) # Subtrai 1 para não contar o cabeçalho
PROXIMO_ID=$((TOTAL_PRODUTOS_CADASTRADOS + 1)) # $(()) porque é uma expressão aritmética
echo "$PROXIMO_ID,$PRODUTO" >> produtos.csv

# Exibir mensagem de sucesso
echo "Produto '$PRODUTO' registrado com sucesso!"