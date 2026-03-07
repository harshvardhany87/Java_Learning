package MultiThreading;

class Process1 extends Thread {
    public void run() {
        for (int i = 0; i <= 10; i++) {
            System.out.println("V1: " + i);
        }
    }
}

class Process2 extends Thread {
    public void run() {
        for (int i = 0; i <= 10; i++) {
            System.out.println("V2: " + i);

        }
    }
}

class Multi2 {
    public static void main(String args[]) {
        Process1 newObject1 = new Process1();
        Process2 newObject2 = new Process2();

        newObject1.start();
        newObject2.start();

    }

}