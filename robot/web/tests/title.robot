
*** Settings ***
# Import do arquivo 'base.robot' para execução dos testes
Resource            base.robot

# Hooks before/after
Test Setup          Iniciar Sessão
Test Teardown       Encerrar Sessão

*** Test Cases ***
Verificar propriedade 'Título' na página inicial
    [tags]          title       smoke
    # Comando 'Title Should Be' utilizado para validar o título da página
    Title Should Be     Training Wheels Protocol
    # Comando 'Sleep' utilizado para gerar uma espera explícita durante a execução do código
    Sleep               5
