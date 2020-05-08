
*** Settings ***
# Import do arquivo 'base.robot' para execução dos testes
Resource            base.robot

# Hooks before/after
Test Setup          Iniciar Sessão
Test Teardown       Encerrar Sessão

*** Test Cases ***
Selecionar item da lista - Opção 'Texto'
    [tags]      dropdown        texto       smoke
    Go To                           ${url}/dropdown
    # Comando 'Select From List By Label' utilizado para selecionar uma opção dropdown através do texto
    Select From List By Label       class:avenger-list              Scott Lang
    # Comando 'Get Selected List Value' utilizado para recuperar o value do elemento selecionado
    ${selected}=                    Get Selected List Value         id:dropdown
    Should Be Equal                 ${selected}                     7

Selecionar item da lista - Opção 'Value'
    [tags]      dropdown        texto
    Go To                           ${url}/dropdown
    # Comando 'Select From List By Value' utilizado para selecionar uma opção dropdown através do value
    Select From List By Value       id:dropdown                     6
    # Comando 'Get Selected List Label' utilizado para recuperar o texto do elemento selecionado
    ${selected}=                    Get Selected List Label         class:avenger-list
    Should Be Equal                 ${selected}                     Loki
