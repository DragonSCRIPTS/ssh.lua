Manual de Instrução: Instalação do Dragon GERADOR Lua

Passo 1: Atualizar o Termux e Instalar Dependências

Antes de começar, certifique-se de que o Termux está atualizado e que o git está instalado. Para isso, execute os seguintes comandos:

# Atualize os pacotes do Termux
pkg update && pkg upgrade -y

# Instale o git para clonar o repositório
pkg install -y git

Passo 2: Clonar o Repositório

Agora, clone o repositório onde o script de instalação e o script principal estão localizados:

# Clone o repositório Dragon GERADOR Lua
git clone https://github.com/DragonSCRIPTS/ssh.lua.git ~/scripts/ssh.lua

Passo 3: Navegar até o Repositório Clonado

Após clonar o repositório, entre no diretório do repositório clonado:

cd ~/scripts/ssh.lua

Passo 4: Executar o Script de Instalação

Agora, execute o script de instalação para configurar tudo automaticamente:

# Torne o script de instalação executável
chmod +x install_script.sh

# Execute o script de instalação
./install_script.sh

Passo 5: Execução do Script Principal

Após a instalação, o script principal será automaticamente baixado e executado. O processo completo será realizado automaticamente pelo script de instalação.


---

Resumo dos Comandos

1. Atualização do Termux e instalação do git:

pkg update && pkg upgrade -y
pkg install -y git


2. Clonagem do repositório:

git clone https://github.com/DragonSCRIPTS/ssh.lua.git ~/scripts/ssh.lua


3. Entrar no diretório do repositório:

cd ~/scripts/ssh.lua


4. Executar o script de instalação:

chmod +x install_script.sh
./install_script.sh



Após seguir esses passos, o Dragon GERADOR Lua estará instalado e pronto para uso.
