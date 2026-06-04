import java.util.List;

record Person(String name, int age) {}

public class RecordDemo {
    public static void main(String[] args) {

        List<Person> people = List.of(
                new Person("Madhu", 22),
                new Person("Ravi", 17),
                new Person("Kiran", 25)
        );

        people.stream()
                .filter(p -> p.age() >= 18)
                .forEach(System.out::println);
    }
}