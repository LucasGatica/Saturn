<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8"/>
    <title>${titulo}</title>
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }
        .title-page {
            width: 100%;
            height: 100vh;
            display: table;
            text-align: center;
        }
        .title-content {
            display: table-cell;
            vertical-align: middle;
        }
        h1 {
            font-size: 36pt;
            margin: 0;
            padding: 0;
        }
        h2 {
            font-size: 24pt;
            margin-top: 20px;
            color: #555;
        }
        p {
            text-align: justify;
            font-size: 12pt;
            line-height: 1.5;
            margin: 50px;
        }
        .page-break {
            page-break-after: always;
        }
        .content-page {
            margin: 50px;
        }
        h3 {
            font-size: 20pt;
            margin-top: 30px;
            margin-bottom: 10px;
            color: #333;
            text-align: center;
        }
        h4 {
            font-size: 16pt;
            margin-top: 20px;
            margin-bottom: 5px;
            color: #555;
        }
        .difficulty {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 10px 0;
        }
        .difficulty-text {
            font-size: 12pt;
            font-weight: bold;
        }
        .difficulty-balls {
            display: flex;
            gap: 5px;
        }
        .difficulty-balls span {
            display: inline-block;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background-color: #ccc; /* Cinza para bolinhas padrão */
        }
        .difficulty-balls .filled {
            background-color: #007BFF; /* Azul para bolinhas preenchidas */
        }
        ul {
            margin: 10px 0;
            padding-left: 20px;
        }
    </style>
</head>
<body>
<!-- Primeira página: Título e Autor -->
<div class="title-page">
    <div class="title-content">
        <h1>${titulo}</h1>
        <h2>Por ${autor}</h2>
    </div>
</div>

<!-- Quebra de página após a primeira página -->
<div class="page-break"></div>

<!-- Segunda página: Sumário -->
<div class="content-page">
    <h2>Sumário</h2>
    <ul>
        <#list conteudo.sumario as capituloTitulo>
            <li>${capituloTitulo}</li>
        </#list>
    </ul>
</div>

<!-- Quebra de página após o sumário -->
<div class="page-break"></div>

<!-- Página seguinte: Sobre o Livro -->
<div class="content-page">
    <h2>Sobre o Livro</h2>
    <p>${conteudo.descricao}</p>
</div>

<!-- Quebra de página após "Sobre o Livro" -->
<div class="page-break"></div>

<!-- Páginas seguintes: Capitulos e Receitas -->
<#if capitulos?exists>
    <div class="content-page">
        <#list capitulos as capitulo>
            <h3>Capítulo ${capitulo.numero}: ${capitulo.titulo}</h3>
            <p class="chapter-description">${capitulo.descricao}</p>

            <#if capitulo.receitas?exists>
                <#list capitulo.receitas as receita>
                    <h4 class="recipe-title">${receita.titulo}</h4>
                    <p class="recipe-info">
                        Tempo de preparo: ${receita.tempo_preparo} | Porções: ${receita.porcoes}
                    </p>

                    <!-- Exibir a dificuldade -->
                    <div class="difficulty">
                        <span class="difficulty-text">Dificuldade:</span>
                        <div class="difficulty-balls">
                            <#list 1..5 as i>
                                <#if i <= receita.dificuldade>
                                    <span class="filled"></span>
                                <#else>
                                    <span></span>
                                </#if>
                            </#list>
                        </div>
                    </div>

                    <div class="ingredients">
                        <p class="section-title">Ingredientes:</p>
                        <ul>
                            <#list receita.ingredientes as ingrediente>
                                <li>${ingrediente}</li>
                            </#list>
                        </ul>
                    </div>

                    <div class="preparation">
                        <p class="section-title">Modo de Preparo:</p>
                        <p>${receita.modo_preparo}</p>
                    </div>
                </#list>
            </#if>
        </#list>
    </div>
</#if>
</body>
</html>