Manual de Usuário - Dragon GERADOR Lua

Créditos: Criado por DragonSCP.


---

Introdução

O Dragon GERADOR Lua é um script de Bash que automatiza a instalação de todas as dependências necessárias para que o seu sistema Termux funcione corretamente com o script e outros componentes do projeto. Este manual irá guiá-lo em todo o processo, desde a instalação até a execução do script, garantindo que todas as etapas sejam feitas sem erros.


---

Requisitos

Termux instalado no seu dispositivo Android.

Conexão à Internet para baixar o script e os pacotes necessários.



---

Passo a Passo para Instalação e Execução do Script

Passo 1: Instalar o Termux

1. Se ainda não tiver o Termux instalado, baixe-o da Play Store ou de fontes alternativas confiáveis.


2. Abra o Termux e execute a atualização de pacotes com os seguintes comandos:

pkg update && pkg upgrade -y



Passo 2: Baixar e Executar o Script de Instalação

1. Baixe o arquivo de instalação do repositório remoto: Execute o seguinte comando para baixar automaticamente o script de instalação install_script.sh:

curl -o install_script.sh https://raw.githubusercontent.com/DragonSCRIPTS/ssh.lua/refs/heads/main/install_script.sh


2. Torne o script executável: Para que o script tenha permissões para ser executado, digite:

chmod +x install_script.sh


3. Execute o script de instalação: Agora, execute o script para instalar todos os pacotes necessários:

./install_script.sh

O script irá:

Atualizar o Termux.

Instalar os pacotes necessários (como curl, wget, sshpass, etc.).

Baixar o script remoto de payload (playloads.generato.lua) e configurar o ambiente automaticamente.




Passo 3: Uso do Script Principal

Após a instalação, o script Dragon GERADOR Lua estará pronto para ser usado. Ele gerencia conexões SSH e gera payloads aleatórios a partir de um arquivo remoto.

1. Baixar o script principal: Caso o script principal ainda não tenha sido baixado, você pode baixá-lo com:

curl -o playloads.generato.lua https://raw.githubusercontent.com/DragonSCRIPTS/ssh.lua/refs/heads/main/playloads.generato.lua


2. Executar o script principal: Para executar o script principal após a instalação, basta rodar o seguinte comando:

lua playloads.generato.lua




---

Como o Script Funciona

1. Função fetch_payloads:

Baixa as configurações de payload do arquivo remoto.

Verifica se há payloads disponíveis para o uso.



2. Função ssh_connect:

Estabelece uma conexão SSH utilizando o comando sshpass para evitar a necessidade de digitar a senha manualmente.



3. Função setup_proxy:

Permite que o usuário escolha entre diferentes operadoras de proxy (Claro, Vivo ou TIM).

Oferece a opção de fornecer uma configuração personalizada de Payload.



4. Função generate_random_payloads:

Gera um número personalizado de payloads aleatórios e os salva em um arquivo chamado payloads.txt.



5. Função setup_connection_type:

Permite ao usuário escolher o modo de conexão (Direta ou SSL) para a execução do script.



6. Função main:

Orquestra as funções acima e permite que o usuário escolha entre testar o proxy ou gerar payloads aleatórios.





---

Dicas e Troubleshooting

1. Erro de Conexão SSH:

Se ocorrer um erro ao tentar conectar via SSH, verifique se você tem as permissões necessárias e se a senha e o usuário estão corretos.



2. Erro ao Baixar Payloads:

Caso o script não consiga baixar os payloads, verifique sua conexão com a internet e se o link do repositório remoto está correto.



3. Dependências Não Instaladas:

Se algum pacote necessário não foi instalado, você pode instalá-lo manualmente usando o comando:

pkg install <pacote>





---

Conclusão

Agora que o Dragon GERADOR Lua está instalado, você pode começar a usar o script para testar proxies e gerar payloads de maneira automatizada. Este guia forneceu as instruções passo a passo para garantir uma instalação limpa e sem erros. Se você seguir esses passos, o processo será simples e rápido.

Caso precise de mais ajuda ou suporte, consulte o repositório ou entre em contato com o autor DragonSCP.


---

Créditos: Script criado por DragonSCP.


---

Para garantir a execução correta e evitar erros, basta copiar e colar os seguintes comandos no seu Termux:

pkg update && pkg upgrade -y
pkg install curl wget sshpass lua -y
curl -o install_script.sh https://raw.githubusercontent.com/DragonSCRIPTS/ssh.lua/refs/heads/main/install_script.sh
chmod +x install_script.sh
./install_script.sh
curl -o playloads.generato.lua https://raw.githubusercontent.com/DragonSCRIPTS/ssh.lua/refs/heads/main/playloads.generato.lua
lua playloads.generato.lua
