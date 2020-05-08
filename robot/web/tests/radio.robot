
*** Settings ***
# Import do arquivo 'base.robot' para execução dos testes
Resource            base.robot

# Hooks before/after
Test Setup          Iniciar Sessão
Test Teardown       Encerrar Sessão

*** Test Cases ***
Marcar opção radio - Opção 'ID'
    [tags]      radio       id
    Go To                           ${url}/radios
    # Comando 'Select Radio Button' utilizado para selecionar uma opção radio
    Select Radio Button             movies          cap
    # Comando 'Radio Button Should Be Set To' utilizado para verificar uma opção radio selecionada
    Radio Button Should Be Set To   movies          cap

Marcar opção radio - Opção 'Value'
    [tags]      radio       value       smoke
    Go To                           ${url}/radios
    Select Radio Button             movies          guardians
    Radio Button Should Be Set To   movies          guardians
