
*** Settings ***
# Import do arquivo 'base.robot' para execução dos testes
Resource            base.robot

# Hooks before/after
Test Setup          Iniciar Sessão
Test Teardown       Encerrar Sessão

*** Test Cases ***
Verificar informação da tabela - Opção 'Por Linha'
    [tags]      table       linha
    Go To                           ${url}/tables
    # Comando 'Table Row Should Contain' utilizado para verificar conteudo em uma linha da tabela
    Table Row Should Contain        id:actors           2           @vindiesel

Verificar informação da tabela - Opção 'Descobrir Linha'
    [tags]      table       linha       smoke
    Go To               ${url}/tables
    # Comando 'Get WebElement' utilizado para atribuir à uma variável o conteúdo de um elemento web
    ${target}=          Get WebElement      xpath:.//tr[contains(., 'chadwickboseman')]
    # Comando 'Log' utilizado para inserir conteúdo no report gerado pelo Robot Framework
    Log                 ${target.text}
    # Comando 'Should Contain' utilizado para verificar existência de conteúdo
    Should Contain      ${target.text}      $ 700.000
    Should Contain      ${target.text}      Pantera Negra
