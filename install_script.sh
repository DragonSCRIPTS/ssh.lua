#!/bin/bash

# Atualizando o Termux e seus pacotes
echo "Atualizando o Termux e pacotes..."
pkg update && pkg upgrade -y

# Instalar pacotes necessários se ainda não estiverem instalados
echo "Verificando pacotes necessários..."

# Função para instalar pacotes se não estiverem instalados
install_if_needed() {
    if ! dpkg -l | grep -qw $1; then
        echo "Instalando $1..."
        pkg install -y $1
    else
        echo "$1 já está instalado."
    fi
}

# Instalar os pacotes necessários
install_if_needed curl
install_if_needed wget
install_if_needed git
install_if_needed python3
install_if_needed sshpass
install_if_needed unzip
install_if_needed openssh

# Garantir que o diretório de scripts existe
mkdir -p ~/scripts

# Clonando o repositório
echo "Clonando o repositório do Dragon GERADOR Lua..."
git clone https://github.com/DragonSCRIPTS/ssh.lua.git ~/scripts/ssh.lua

# Acessando o diretório do repositório clonado
cd ~/scripts/ssh.lua

# Garantir que o script de instalação tenha permissões de execução
chmod +x install_script.sh

# Perguntar se deseja executar o script de instalação
echo "Deseja executar o script de instalação? (s/n)"
read resposta
if [ "$resposta" == "s" ]; then
    echo "Executando o script de instalação..."
    ./install_script.sh
else
    echo "Pular execução do script de instalação."
fi

# Baixando o script remoto de payload
echo "Deseja baixar o script remoto de payload? (s/n)"
read resposta
if [ "$resposta" == "s" ]; then
    curl -o ~/scripts/playloads.generato.lua https://raw.githubusercontent.com/DragonSCRIPTS/ssh.lua/refs/heads/main/playloads.generato.lua
    chmod +x ~/scripts/playloads.generato.lua
    echo "Deseja executar o script principal? (s/n)"
    read resposta
    if [ "$resposta" == "s" ]; then
        lua ~/scripts/playloads.generato.lua
    else
        echo "Script principal não executado."
    fi
else
    echo "Script remoto de payload não baixado."
fi

echo "Instalação e execução concluídas!"
