import java.lang.reflect.Method;

public class ReflectionDemo {

    public void display() {
        System.out.println("Hello Reflection");
    }

    public static void main(String[] args)
            throws Exception {

        Class<?> cls =
                Class.forName("ReflectionDemo");

        Object obj =
                cls.getDeclaredConstructor()
                        .newInstance();

        Method method =
                cls.getMethod("display");

        method.invoke(obj);
    }
}
