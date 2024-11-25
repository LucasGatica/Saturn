package org.example.pdf;

import com.lowagie.text.pdf.BaseFont;
import org.xhtmlrenderer.pdf.ITextFontResolver;
import org.xhtmlrenderer.pdf.ITextRenderer;

import java.io.FileOutputStream;
import java.io.OutputStream;

public class HtmlToPdfConverter {
    public static void convertHtmlToPdf(String htmlContent, String outputPdfPath) throws Exception {
        OutputStream outputStream = new FileOutputStream(outputPdfPath);

        ITextRenderer renderer = new ITextRenderer();

        // Resolver fontes para suportar caracteres especiais
        ITextFontResolver fontResolver = renderer.getFontResolver();
        fontResolver.addFont("fonts/freefont/FreeMono.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

        renderer.setDocumentFromString(htmlContent);
        renderer.layout();
        renderer.createPDF(outputStream);
        outputStream.close();
    }
}