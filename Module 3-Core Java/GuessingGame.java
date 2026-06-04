import java.util.Random;
import java.util.Scanner;

public class GuessingGame {
    public static void main(String[] args) {

        Random rand = new Random();
        int number = rand.nextInt(100) + 1;

        Scanner sc = new Scanner(System.in);
        int guess;

        do {
            System.out.print("Guess a number (1-100): ");
            guess = sc.nextInt();

            if(guess > number)
                System.out.println("Too High!");
            else if(guess < number)
                System.out.println("Too Low!");
            else
                System.out.println("Correct!");
        } while(guess != number);
    }
}
