*** Settings ***
Documentation    Essa suite testa o site da Magazine Luiza
Resource         magalu_resources.robot
Test Setup       Abrir o navegador
# Test Teardown    Fechar o navegador

*** Test Cases ***

Caso de Teste 01 - Acesso ao menu "Celulares"
    [Documentation]    Esse teste verifica o menu Celulares do site da magazineluiza.com.br
    ...                e a categoria iPhone
    [Tags]    menus    categorias
    Acessar a home page do site magazineluiza.com.br
    Verificar se o título da página fica "Magazine Luiza | Pra você é Magalu!"
    Entrar no menu "Celulares"
    Verificar se aparece a frase "Celulares e Smartphones"
    Verificar se o título da página fica "Celular: iPhone, Samsung, Xiaomi e mais | Magalu"
    Verificar se aparece a categoria "iPhone"

Caso de Teste 02 - Pesquisa de um produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]    busca_produtos
    Acessar a home page do site magazineluiza.com.br
    Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar se o resultado da pesquisa está listando o produto "${PRODUTO}"