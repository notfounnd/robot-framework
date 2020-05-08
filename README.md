## Robot Framework
Projeto exemplo de automação de testes desenvolvido com [Robot Framework](https://robotframework.org/).

O objetivo principal desse projeto foi desenvolver de forma didática uma introdução à ferramenta Robot Framework para uso prático em um projeto voltado para automação de testes. Para uma melhor fixação dos conceitos desenvolvidos, todos os [arquivos de testes](https://github.com/notfounnd/robot-framework/tree/master/robot) possuem comentários explicativos dos comandos utilizados.

#### Pré-requisitos para uso
Para utilização é necessário possuir em sua estação de trabalho:

> [Python 3 (versão estável)](https://www.python.org/downloads/)

> [Chromedriver](https://chromedriver.storage.googleapis.com/index.html)

#### Iniciando o ambiente do projeto
Para iniciar o ambiente do projeto, você deve efetuar a instalação do Python e configurar o chromedriver.exe no path de variáveis de ambiente do seu sistema operacional.

Após realizar essas configurações, efetue o download/clone do projeto em seu ambiente de trabalho.

Via terminal, acessa a pasta 'robot' do projeto e execute os seguintes comando:

```
pip install robotframework
pip install robotframework-seleniumlibrary
```

Após o término da execução dos comandos, você poderá executar os testes desenvolvidos no projeto através da ferramenta Robot Framework.

#### Exemplos de comandos para execução dos testes
A execução dos testes pode ser feita via terminal utilizando comandos como os listados nos exemplos abaixo. Para executá-los, acesse a pasta do projeto ([hello](https://github.com/notfounnd/robot-framework/tree/master/robot/hello) ou [web](https://github.com/notfounnd/robot-framework/tree/master/robot/web)) em seu terminal.

**Pasta 'Hello'**
> Execução por arquivo:
> ```
> robot -d ./log hello.robot
> ```
>
> Execução por tag:
> ```
> robot -d ./log -i smoke hello.robot
> ```

**Pasta 'Web'**
> Todos os testes:
> ```
> robot -d ./log tests\
> ```
>
> Execução por tag:
> ```
> robot -d ./log -i smoke tests\
> ```
> Execução por arquivo:
> ```
> robot -d ./log tests\title.robot
> ```
>
> Execução por arquivo + tag:
> ```
> robot -d ./log -i smoke tests\title.robot
> ```

_Você pode encontrar uma explicação sobre tags no arquivo [hello.robot](https://github.com/notfounnd/robot-framework/blob/master/robot/hello/hello.robot)._
