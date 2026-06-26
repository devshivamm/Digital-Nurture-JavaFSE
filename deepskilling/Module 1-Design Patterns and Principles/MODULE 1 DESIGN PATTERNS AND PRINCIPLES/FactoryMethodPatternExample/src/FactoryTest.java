public class FactoryTest {
    public static void main(String[] args) {
        DocumentFactory wordFactory = new WordFactory();
        Document wordDocument = wordFactory.createDocument();
        wordDocument.open();

        DocumentFactory pdfFactory = new PdfFactory();
        Document pdfDocument = pdfFactory.createDocument();
        pdfDocument.open();


        DocumentFactory excelFactory = new ExcelFactory();
        Document excelDocument = excelFactory.createDocument();
        excelDocument.open();
    }
}
