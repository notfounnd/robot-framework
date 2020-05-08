# Hello, Robot!

#
# Exemplos de comando para executar os testes com o Robot Framework:
#
# Por arquivo:      robot -d ./log hello.robot
# Com tags:         robot -d ./log -i smoke hello.robot
#

# Configurações do teste automatizado
*** Settings ***
# Comando 'Library' importa script exemplo 'hello.py' como uma biblioteca para o Robot Framework
Library     hello.py

# Iniciando construção de casos de teste
# Metodos Python são manipulados como palavra-chave pelo Robot Framework
*** Test Cases ***

# Nome do caso de teste
Verificar mensagem de boas vindas
    # Comando '[tags]' utilizado para definir tags de execução
    # Comando '...' utilizando para dar sequencia ao comando em execução numa nova linha
    [tags]      hello       robot       framework
    ...         smoke
    # Comando '${result}' utilizado para criar uma variável no Robot Framework
    # Comando '=' utilizado para atribuir valor à variavel
    # '${result}=' reberá o retorno do metodo correspondente à palavra-chave 'Welcome' + parâmetro 'R2-D2'
    ${result}=          Welcome     R2-D2

    # Comando 'Log To Console' utilizado para imprimir no console o texto da variável '${result}'
    Log To Console      ${result}

    # Comando 'Should Be Equal' utilizado para validar equalidade entre conteúdos
    # Conteúdo 1: ${result}
    # Conteúdo 2: Olá R2-D2, bem vindo ao projeto exemplo de Robot Framework!
    Should Be Equal     ${result}   Olá R2-D2, bem vindo ao projeto exemplo de Robot Framework!
