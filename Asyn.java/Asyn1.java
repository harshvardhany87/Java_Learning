class USA {
    void f1() {
        System.out.println("Parent F1: "); // Early Binding
    }
}

class India {
    USA I1 = new USA() {
        public void f1() {
            System.out.println("Child F1: "); // Late Binding
        }
    };
}

public class Asyn1 {
    public static void main(String args[]) {

        India U1 = new India();
        U1.I1.f1();

    }

}
