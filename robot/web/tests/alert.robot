
*** Settings ***
# Import do arquivo 'base.robot' para execução dos testes
Resource            base.robot

# Hooks before/after
Test Setup          Iniciar Sessão
Test Teardown       Encerrar Sessão

*** Test Cases ***
Verificar mensagem de alerta - Opção 'Alerta'
    [tags]      alert       smoke
    Go To               ${url}/javascript_alerts
    Click Element       class:btn-success

    # Inserir log da mensagem do alerta
    Log Alert Message To Report
    # Comando 'Alert Should Be Present' utilizando para validar mensagem de alerta do navegador
    Alert Should Be Present         Isto é uma mensagem de alerta

Verificar mensagem de alerta - Opção 'Confirmar'
    [tags]      confirm     smoke
    Go To               ${url}/javascript_alerts
    Click Element       class:btn-primary
    
    # Comando 'Alert Should Be Present' utilizando para validar mensagem de alerta do navegador
    Alert Should Be Present         E ai confirma?
    Should Contain Option Alert     Mensagem confirmada

Verificar mensagem de alerta - Opção 'Não Confirmar'
    [tags]      dismiss     smoke
    Go To               ${url}/javascript_alerts
    Click Element       class:btn-primary
    
    Alert Should Be Present         E ai confirma?      DISMISS
    Should Contain Option Alert     Mensagem não confirmada

Verificar mensagem de alerta - Opção 'Preencher Alerta'
    [tags]      message     smoke
    Go To               ${url}/javascript_alerts
    Click Element       class:btn-info
    
    Log Alert Message To Report
    # Comando 'Input Text Into Alert' utilizando para preencher informação em alerta do navegador
    Input Text Into Alert           R2-D2
    Should Contain Option Alert     Olá, R2-D2

*** Keywords ***
Log Alert Message To Report
    # Comando 'Handle Alert' utiliando para manipular mensagem de alerta do navegador
    ${message}=     Handle Alert        LEAVE
    Log             ${message}

Should Contain Option Alert
    [Arguments]     ${expect_message}

    ${message}=             Get WebElement                  css:p[id='result']
    Should Contain          ${message.text}                 ${expect_message}
