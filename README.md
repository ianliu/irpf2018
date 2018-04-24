# IRPF 2018

Cria uma imagem docker para declarar o Imposto de Renda de Pessoa Física 2018.

## Dependências

É necessário o serviço do [Docker](https://www.docker.org/) executando em sua
máquina.

## Instalação

Execute os seguintes comandos para instalar na sua área de usuário:

    make
    make install

Se preferir alterar o caminho de instalação, execute

    make prefix=/usr/local/ install

## Configuração

O programa da Receita Federal armazena os arquivos no diretório
`~/ProgramasRFB`. Se preferir armazena-los em outro diretório, edite o arquivo
de configuração `~/.config/irpf.conf`. Você pode atribuir o diretório desejado
à variável `datadir`, por exemplo:

    # Arquivo ~/.config/irpf.conf
    datadir=$HOME/irpf/

## Execução

Procure pelo aplicativo chamado IRPF2018.

## Desinstalação

Execute `irpf2018 uninstall` no terminal.
