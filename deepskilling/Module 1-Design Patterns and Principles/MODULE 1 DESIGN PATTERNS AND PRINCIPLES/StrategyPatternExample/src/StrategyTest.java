public class StrategyTest {
    public static void main(String[] args) {
        PaymentContext context;
        context = new PaymentContext(new CreditCardPayment());
        context.executePayment(5000);
        context = new PaymentContext(new PayPalPayment());
         context.executePayment(8000);
    }
}
