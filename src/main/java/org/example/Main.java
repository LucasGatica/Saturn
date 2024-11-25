package org.example;

import org.example.pdf.HtmlToPdfConverter;
import org.example.pdf.TemplateProcessor;
import org.example.utils.JsonUtils;

import java.util.Map;

public class Main {
    public static void main(String[] args) {
        String jsonFileName = "dados.json"; // Nome do arquivo JSON nos recursos
        String outputPdfPath = "ebooeek.pdf"; // Caminho para o PDF de saída

        try {
            // Ler os dados do JSON
            Map<String, Object> data = JsonUtils.parseJson(jsonFileName);

            // Gerar o HTML a partir do template
            String htmlContent = TemplateProcessor.generateHtml(data);

            // Converter o HTML em PDF
            HtmlToPdfConverter.convertHtmlToPdf(htmlContent, outputPdfPath);

            System.out.println("PDF gerado com sucesso!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}