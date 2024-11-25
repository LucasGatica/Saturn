package org.example.pdf;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import java.util.Map;

public class PdfGenerator {
    public static void createPdf(String outputFilePath, Map<String, Object> data) throws Exception {
        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, new FileOutputStream(outputFilePath));
        document.open();

        // Estilos de fonte
        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);
        Font contentFont = FontFactory.getFont(FontFactory.HELVETICA, 12);

        // Preenchendo dados
        String titulo = (String) data.get("titulo");
        String autor = (String) data.get("autor");
        String conteudo = (String) data.get("conteudo");

        // Adicionando elementos ao PDF
        Paragraph title = new Paragraph(titulo, titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        document.add(title);

        Paragraph author = new Paragraph("Autor: " + autor, contentFont);
        author.setAlignment(Element.ALIGN_CENTER);
        document.add(author);

        document.add(new Paragraph(" ")); // Espaçamento

        Paragraph content = new Paragraph(conteudo, contentFont);
        content.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(content);

        document.close();
    }
}