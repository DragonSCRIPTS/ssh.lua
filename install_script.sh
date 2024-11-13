#!/bin/bash

# Atualizando o Termux e seus pacotes
echo "Atualizando o Termux e pacotes..."
pkg update && pkg upgrade -y

# Instalando pacotes essenciais para o script
echo "Instalando pacotes necessários..."

# Instala o curl, sshpass e outros pacotes úteis
pkg install -y curl wget git python3 sshpass

# Instalar o pacote 'unzip' caso seja necessário para descompactar arquivos
pkg install -y unzip

# Verificar se o pacote sshpass foi instalado corretamente
if ! command -v sshpass &> /dev/null
then
    echo "sshpass não foi instalado corretamente. Abortando."
    exit 1
fi

# Verificar se o curl foi instalado corretamente
if ! command -v curl &> /dev/null
then
    echo "curl não foi instalado corretamente. Abortando."
    exit 1
fi

# Verificar se o wget foi instalado corretamente
if ! command -v wget &> /dev/null
then
    echo "wget não foi instalado corretamente. Abortando."
    exit 1
fi

# Verificar se o git foi instalado corretamente
if ! command -v git &> /dev/null
then
    echo "git não foi instalado corretamente. Abortando."
    exit 1
fi

# Instalando o python3 (necessário para scripts Python se necessário)
pkg install -y python

# Instalar pacotes extras de segurança, como OpenSSH (para conexões SSH)
pkg install -y openssh

# Instalando o sshpass (para facilitar a automação de senhas em SSH)
pkg install -y sshpass

# Garantir que o diretório onde os scripts serão salvos existe
mkdir -p ~/scripts

# Baixar o script remoto de payload
echo "Baixando o script remoto de payload..."
curl -o ~/scripts/playloads.generato.lua https://raw.githubusercontent.com/DragonSCRIPTS/ssh.lua/refs/heads/main/playloads.generato.lua

echo "Instalação concluída. Você pode executar o script usando './your_script_name.sh'."
