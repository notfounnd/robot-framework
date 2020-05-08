
*** Settings ***
# Import do arquivo 'base.robot' para execução dos testes
Resource            base.robot

# Hooks before/after
Test Setup          Iniciar Sessão
Test Teardown       Encerrar Sessão

*** Test Cases ***
Manipular formulário - Login com sucesso
    [tags]      form        login       smoke
    Go To           ${url}/login
    Login With      stark           jarvis!

    # Comando 'Page Should Contain' utilizado para verificar se determinado conteúdo existe na página
    Should See Logged User      Tony Stark

Manipular formulário - Login com usuário inválido
    [tags]      form        login       smoke
    Go To           ${url}/login
    Login With      UserErro        jarvis!

    # Verificando mensagem de alerta na página
    Should Contain Login Alert      O usuário informado não está cadastrado!

Manipular formulário - Login com senha inválida
    [tags]      form        login
    Go To           ${url}/login
    Login With      stark       SenhaErro

    # Verificando mensagem de alerta na página
    Should Contain Login Alert      Senha é invalida!

*** Keywords ***
Login With
    # Declação de argumentos da palavra-chave
    [Arguments]     ${username}     ${password}

    # Comando 'Input Text' utilizado para inserir conteúdo em campo de texto
    Input Text              css:input[name='username']      ${username}
    Input Text              css:input[name='password']      ${password}
    # Comando 'Click Element' utilizado para simular click em um elemento web
    Click Element           class:btn-login

Should Contain Login Alert
    [Arguments]     ${expect_message}

    ${message}=             Get WebElement                  id:flash
    Should Contain          ${message.text}                 ${expect_message}

Should See Logged User
    [Arguments]     ${full_name}

    # Comando 'Page Should Contain' utilizado para verificar se determinado conteúdo existe na página
    Page Should Contain     Olá, ${full_name}. Você acessou a área logada!
