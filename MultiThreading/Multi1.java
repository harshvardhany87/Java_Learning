package MultiThreading;

class Process1 implements Runnable {
    public void run() {
        for (int i = 0; i < 10; i++) {
            System.out.println("V1: " + i);
        }
    }
}

class Process2 implements Runnable {
    public void run() {
        for (int i = 0; i < 10; i++) {
            System.out.println("V2: " + i);
        }
    }
}

class Multi1 {
    public static void main(String args[]) {
        Process1 newObject1 = new Process1();
        Process2 newObject2 = new Process2();

        Thread t1 = new Thread(newObject1);
        Thread t2 = new Thread(newObject2);

        t1.start();
        t2.start();
    }

}