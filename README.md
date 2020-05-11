## Robot Framework
Projeto exemplo de automação de testes desenvolvido com [Robot Framework](https://robotframework.org/) e integrado com a ferramenta [ReportPortal](https://reportportal.io/).

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

#### Integração com ReportPortal
Opcionalmente, você pode [instalar](https://reportportal.io/installation) a ferramenta ReportPortal para integrar um painel de controle ao seu ambiente.

Para isso, após configurar a ferramenta, você deve instalar o pacote ReportPortal para Robot Framework através do seguinte comando:

```
pip install robotframework-reportportal
```

Após a instalação do pacote, o projeto já astará apto a ter suas execuções integradas ao painel de controle RP. Conforme a [documentação](https://github.com/reportportal/agent-Python-RobotFramework#reportportal-robotframework-agent) do agente Robot Framework para ReportPortal, você deve possuir em mãos as seguintes informações de usuário para configurar uma execução integrada:

> --variable RP_UUID:"**your_user_uuid**"
>
> --variable RP_ENDPOINT:"**your_reportportal_url**"
>
> --variable RP_LAUNCH:"**launch_name**"
>
> --variable RP_PROJECT:"**reportportal_project_name**"

Essas informações podem ser facilmente encontradas dentro do perfil de usuário de cada projeto do ReportPortal.

Utilizando integração com ReportPortal:

As configurações apresentadas anteriormente compõe um grupo de parâmetros de execução obrigatório para que seu painel de controle RP receba as informações de execução dos testes. Dessa maneira, construa seu comando de execução dos testes adicionando as seguintes configurações conforme o exemplo: 
```
robot -d ./log -i smoke --listener robotframework_reportportal.listener --variable RP_UUID:"your_user_uuid" --variable RP_ENDPOINT:"your_reportportal_url" --variable RP_LAUNCH:"launch_name" --variable RP_PROJECT:"reportportal_project_name" tests\
```
_Não se esqueça de adicionar o parâmentro **--listener** em sua string de execução._

Outros parâmentros de execução podem ser verificados na [seção de uso](https://github.com/reportportal/agent-Python-RobotFramework#usage) do agente Robot Framework para ReportPortal.
