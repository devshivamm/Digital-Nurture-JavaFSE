public class StripAdapter implements PaymentProcessor{
    private StripGateway stripGateway;

    public StripAdapter(StripGateway stripGateway){
        this.stripGateway = stripGateway;
    }
    @Override
    public void processPayment(double amount){
        stripGateway.payAmount(amount);
    }
}
