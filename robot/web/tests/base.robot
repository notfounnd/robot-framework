# Arquivo base para execução de testes

#
# Exemplos de comando para executar os testes com o Robot Framework:
#
# Sem filtro:       robot -d ./log tests\
# Com tags:         robot -d ./log -i smoke tests\
# Por arquivo:      robot -d ./log tests\title.robot
# Arquivo + tags:   robot -d ./log -i smoke tests\title.robot
#

# Adicionando biblioteca Selenium ao contexto do Robot Framework
# Consulta sobre dúvidas e comados da biblioteca:
#       https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
*** Settings ***
Library                 SeleniumLibrary

# Definindo variáveis para o teste
*** Variables ***
${url}                  https://training-wheels-protocol.herokuapp.com

# Customizando keywords para o Robot Framework
*** Keywords ***
Iniciar Sessão
    # Comando 'Open Browser' utilizado para abrir o navegador
    Open Browser        ${url}      chrome

Encerrar Sessão
    # Comando 'Capture Page Screenshot' utilizado para coletar screenshot da página
    Capture Page Screenshot
    # Comando 'Close Browser' utilizado para fechar o navegador
    Close Browser
