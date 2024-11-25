package org.example.pdf;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.Version;

import java.io.StringWriter;
import java.util.Map;

public class TemplateProcessor {
    public static String generateHtml(Map<String, Object> data) throws Exception {
        Configuration cfg = new Configuration(new Version("2.3.31"));
        cfg.setClassForTemplateLoading(TemplateProcessor.class, "/templates");
        cfg.setDefaultEncoding("UTF-8");

        Template template = cfg.getTemplate("ebook_template.ftl");

        StringWriter writer = new StringWriter();
        template.process(data, writer);
        return writer.toString();
    }
}