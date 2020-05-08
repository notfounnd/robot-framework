
*** Settings ***
# Import do arquivo 'base.robot' para execução dos testes
Resource            base.robot

# Hooks before/after
Test Setup          Iniciar Sessão
Test Teardown       Encerrar Sessão

# Definindo variáveis para o teste
*** Variables ***
${checkbox_id}          id:thor
${checkbox_css}         css:input[value='iron-man']
${checkbox_xpath}       xpath://*[@id='checkboxes']/input[7]
${checkbox_unselect}    css:input[value='guardians']

*** Test Cases ***
Marcar checkbox - Opção 'ID'
    [tags]      checkbox        id
    # Comando 'Go To' utilizado para navegar até uma página web
    Go To                           ${url}/checkboxes
    # Comando 'Select Checkbox' utilizado para marcar uma opção checkbox
    Select Checkbox                 ${checkbox_id}
    # Comando 'Checkbox Should Be Selected' utilizado para verificar se checkbox está marcado
    Checkbox Should Be Selected     ${checkbox_id}

Marcar checkbox - Opção 'CSS Selector'
    [tags]      checkbox        css         smoke
    Go To                           ${url}/checkboxes
    Select Checkbox                 ${checkbox_css}
    Checkbox Should Be Selected     ${checkbox_css}

Marcar checkbox - Opção 'XPath'
    [tags]      checkbox        xpath
    Go To                           ${url}/checkboxes
    Select Checkbox                 ${checkbox_xpath}
    Checkbox Should Be Selected     ${checkbox_xpath}

Desmarcar checkbox
    [tags]      checkbox        css         smoke
    Go To                               ${url}/checkboxes
    # Comando 'Unselect Checkbox' utilizado para desmarcar uma opção checkbox
    Unselect Checkbox                   ${checkbox_unselect}
    # Comando 'Checkbox Should Not Be Selected' utilizado para verificar se checkbox está desmarcado
    Checkbox Should Not Be Selected     ${checkbox_unselect}
