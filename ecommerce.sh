#!/bin/bash

# Variáveis
PROXIMO_ID=0
ARQUIVO="pedidos.csv"

while true; do
    # Solicitar o usuário para digitar o nome do produto
    read -p "Digite o nome do produto: " PRODUTO

    # Validar input do usuário
    if [ -z "${PRODUTO// /}" ]; then # -z verifica se a string é vazia ou somente espaços
        echo "O nome do produto não pode ser vazio. Por favor, tente novamente."
    else
        break
    fi
done
    
# Criar arquivo csv com o cabeçalho se não existir
if [ ! -f $ARQUIVO ]; then
    echo "NUMERO_PEDIDO,NOME_DO_PRODUTO" > $ARQUIVO
fi

# Gravar o NUMERO_PEDIDO,NOME_DO_PRODUTO em um arquivo csv
TOTAL_PRODUTOS_CADASTRADOS=$(($(wc -l < $ARQUIVO) - 1)) # Subtrai 1 para não contar o cabeçalho
PROXIMO_ID=$((TOTAL_PRODUTOS_CADASTRADOS + 1)) # $(()) porque é uma expressão aritmética
echo "$PROXIMO_ID,$PRODUTO" >> $ARQUIVO

# Exibir mensagem de sucesso
echo "Produto '$PRODUTO' registrado com sucesso!"