#!/bin/bash

# Variáveis
PROXIMO_ID=1

# Solicitar o usuário para digitar o nome do produto
read -p "Digite o nome do produto: " PRODUTO

# Criar arquivo csv com o cabeçalho se não existir
if [ ! -f produtos.csv ]; then
    echo "id_prod,desc_prod" > produtos.csv
fi

# Gravar o nome do produto em um arquivo csv
echo "$PROXIMO_ID,$PRODUTO" >> produtos.csv
TOTAL_PRODUTOS_CADASTRADOS=$(wc -l < produtos.csv)
PROXIMO_ID=$((TOTAL_PRODUTOS_CADASTRADOS - 1)) # $(()) usado por ser uma expressão aritmética

# Exibir mensagem de sucesso
echo "Produto '$PRODUTO' registrado com sucesso!"