#!/bin/bash

# URL do arquivo remoto
REMOTE_URL="https://raw.githubusercontent.com/DragonSCRIPTS/ssh.lua/refs/heads/main/playloads.generato.lua"

# Função para baixar o conteúdo do arquivo remoto
fetch_payloads() {
    echo "Baixando configurações de payload do arquivo remoto..."
    payload_data=$(curl -s "$REMOTE_URL")
    
    if [[ -z "$payload_data" ]]; then
        echo "Erro ao baixar o conteúdo remoto. Verifique o link ou sua conexão."
        exit 1
    fi

    # Parse do JSON para extrair os payloads
    payloads=($(echo "$payload_data" | grep -oP '(?<="Gerador": ")[^"]+'))
    if [[ ${#payloads[@]} -eq 0 ]]; then
        echo "Nenhum payload encontrado no arquivo remoto."
        exit 1
    fi
}

# Função para conexão SSH
ssh_connect() {
    echo "Tentando conectar ao servidor SSH..."
    sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no "$USER@$SERVER" -p 22
}

# Função para configurar a conexão Proxy
setup_proxy() {
    echo "Escolha a operadora:"
    echo "1 - Claro"
    echo "2 - Vivo"
    echo "3 - TIM"
    read -p "Escolha a operadora (1/2/3): " operadora

    case $operadora in
        1)
            echo "Você escolheu Claro."
            proxy="revive.timrecompensas.com.br"
            port="80"
            ;;
        2)
            echo "Você escolheu Vivo."
            proxy="portal.vivo.com.br"
            port="8080"
            ;;
        3)
            echo "Você escolheu TIM."
            proxy="portal.tim.com.br"
            port="8080"
            ;;
        *)
            echo "Operadora inválida!"
            exit 1
            ;;
    esac

    # Configuração personalizada de Payload
    read -p "Deseja fornecer uma configuração personalizada de Payload? (s/n): " custom_payload
    if [[ "$custom_payload" == "s" || "$custom_payload" == "S" ]]; then
        read -p "Digite sua configuração de Payload: " payload
    else
        # Selecionar um payload aleatório do arquivo remoto
        random_index=$((RANDOM % ${#payloads[@]}))
        payload="${payloads[$random_index]}"
    fi

    echo "Proxy configurado: $proxy"
    echo "Payload configurado: $payload"
    echo "Conectando ao proxy... (em modo SSH)"
    ssh_connect
}

# Função para gerar payloads aleatórios usando o conteúdo do arquivo remoto
generate_random_payloads() {
    echo "Escolha a quantidade de payloads aleatórios a serem gerados:"
    read -p "Quantos payloads você deseja gerar? " num_payloads
    echo "Gerando $num_payloads payloads aleatórios..."

    > payloads.txt
    for ((i = 1; i <= num_payloads; i++)); do
        random_index=$((RANDOM % ${#payloads[@]}))
        random_payload="${payloads[$random_index]}"
        echo "$random_payload" >> payloads.txt
    done

    echo "Payloads gerados com sucesso! Aqui estão os payloads gerados:"
    cat payloads.txt
}

# Função para configurar o tipo de conexão
setup_connection_type() {
    echo "Escolha o modo de conexão:"
    echo "1 - Direct"
    echo "2 - SSL"
    read -p "Escolha o tipo de conexão (1/2): " connection_type

    case $connection_type in
        1)
            echo "Modo de conexão: Direct"
            ssh_connect
            ;;
        2)
            echo "Modo de conexão: SSL"
            echo "Configurando SSL..."
            ssh_connect
            ;;
        *)
            echo "Opção inválida!"
            exit 1
            ;;
    esac
}

# Função principal do script
main() {
    fetch_payloads  # Baixar configurações de payloads do arquivo remoto
    echo "Bem-vindo ao script de teste de proxy e geração de payloads!"
    echo "Escolha uma opção:"
    echo "1 - Testar Proxy"
    echo "2 - Gerar Payloads Aleatórios"
    read -p "Escolha a opção (1/2): " option

    case $option in
        1)
            setup_connection_type
            ;;
        2)
            generate_random_payloads
            ;;
        *)
            echo "Opção inválida!"
            exit 1
            ;;
    esac
}

# Executando o script
main
