public class MobileApp implements Observer {
    @Override
    public void update(double stockPrice){
        System.out.println(
            "Mobile App: Stock Price Updated to " + stockPrice);
        
    }
    
}
