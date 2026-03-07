package WrapperClass;

class Wrap1 {
    public static void main(String args[]) {
        Double num1 = Double.valueOf("123456");
        Double num2 = num1.doubleValue();
        System.out.println(num2);

        int x = Integer.parseInt("123456789");
        System.out.println(x);
    }

}

// Autoboxing: The process of converting Primitive data type to Wrapper
// class(Non-Primitive)

// Unoboxing: The process of converting Non-Primitive(Wrapper class) type to
// Primitive data type
