public class AdapterTest {
    public static void main(String[] args) {
        PaymentProcessor payPal = new PayPalAdapter(new PayPalGateway());
        PaymentProcessor strip = new StripAdapter(new StripGateway());

        payPal.processPayment(5000);
        strip.processPayment(100000);
    }
}
