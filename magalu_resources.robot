*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.magazineluiza.com.br/
${MENU_CELULARES}    //*[@id="__next"]/div/main/section[1]/div[3]/header/div/div[3]/nav/ul/li[3]/div[1]/a    
${TEXTO_CELULARES_SMARTPHONES}    Celulares e Smartphones
${BREADCRUMB_CELULARES_SMARTPHONES}    //*[@id="__next"]/div/main/section[2]/div/div/div/div/div[2]/a/span
${CATEGORIA_IPHONE}    //*[@id="__next"]/div/main/section[3]/div[2]/div[1]/div[2]/ul/li[1]/a/p
${PRODUTO}    Xbox Series S

*** Keywords ***

Abrir o navegador
    Open Browser   browser=chrome
    Maximize Browser Window
   
Acessar a home page do site magazineluiza.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_CELULARES}

Entrar no menu "Celulares"
    Click Element    locator=${MENU_CELULARES}

Verificar se aparece a frase "Celulares e Smartphones"
    Wait Until Element Is Visible    locator=${BREADCRUMB_CELULARES_SMARTPHONES}
    Wait Until Page Contains    text=${TEXTO_CELULARES_SMARTPHONES}
    Sleep    5s
    
Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${CATEGORIA_IPHONE}"
    Element Should Be Visible    locator=//*[@id="__next"]/div/main/section[3]/div[2]/div[1]/div[2]/ul/li[1]/a/p

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=input-search    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=css:[data-testid="search-submit"]

Verificar se o resultado da pesquisa está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    xpath=//h2[contains(text(),'${PRODUTO}')]
    Capture Page Screenshot