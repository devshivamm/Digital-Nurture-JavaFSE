public class PayPalPayment implements PaymentStrategy{
    @Override
    public void pay(double amount){
        System.out.println("Paid RS. " + amount + "using Paypal");
    }
}
