<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8"/>
    <title>${titulo}</title>
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            margin: 50px;
        }
        h1, h2, h3, h4 {
            text-align: center;
        }
        h1 {
            font-size: 24pt;
            margin-bottom: 0;
        }
        h2 {
            font-size: 16pt;
            margin-top: 5px;
            color: #555;
        }
        h3 {
            font-size: 20pt;
            margin-top: 30px;
            margin-bottom: 10px;
            color: #333;
        }
        h4 {
            font-size: 16pt;
            margin-top: 20px;
            margin-bottom: 5px;
            color: #555;
        }
        p {
            text-align: justify;
            font-size: 12pt;
            line-height: 1.5;
        }
        ul {
            list-style-type: disc;
            margin-left: 40px;
        }
        .chapter-description {
            font-style: italic;
            margin-bottom: 20px;
        }
        .recipe-title {
            font-size: 18pt;
            margin-top: 20px;
            margin-bottom: 10px;
        }
        .recipe-info {
            font-size: 12pt;
            margin-bottom: 10px;
        }
        .ingredients, .preparation {
            margin-bottom: 15px;
        }
        .section-title {
            font-size: 14pt;
            margin-bottom: 5px;
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h1>${titulo}</h1>
<h2>Por ${autor}</h2>
<p>${conteudo}</p>

<#if capitulos?exists>
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
</#if>
</body>
</html>