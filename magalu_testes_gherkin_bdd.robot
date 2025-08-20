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
    Dado que estou na home page magazineluiza.com.br
    Quando acessar o menu "Celulares"
    Então o título da página deve ficar "Celular: iPhone, Samsung, Xiaomi e mais | Magalu"
    E o texto "Celulares e Smartphones" deve ser exibido na página
    E a categoria "iPhone" deve ser exibida na página

Caso de Teste 02 - Pesquisa de um produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]    busca_produtos
    Dado que estou na home page magazineluiza.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Xbox Series S: Console e Jogos | Magalu"
    E um produto da linha "Xbox Series S" deve ser mostrado na página