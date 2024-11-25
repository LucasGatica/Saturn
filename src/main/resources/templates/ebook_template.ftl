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
            /* Dimensões da página */
            width: 100%;
            height: 100vh;
            /* Centralização vertical e horizontal */
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
        /* Resto dos estilos */
        p {
            text-align: justify;
            font-size: 12pt;
            line-height: 1.5;
            margin: 50px;
        }
        /* Estilos para controlar as quebras de página */
        .page-break {
            page-break-after: always;
        }
        /* Estilos para o conteúdo e capítulos */
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
        /* Outros estilos conforme necessário */
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

<!-- Segunda página: Conteúdo -->
<div class="content-page">
    <p>${conteudo}</p>
</div>

<!-- Quebra de página após o conteúdo -->
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