package Synchronization;

import java.util.Scanner;

class Account {

    int Balance;

    Account(int x) {
        Balance = x;
    }

    public boolean isSufficient(int w) {
        if (Balance >= w) {
            return true;
        } else {
            return false;
        }
    }

    public void withdraw(int w) {
        Balance = Balance - w;
        System.out.println("Withdrawl money is: " + w);
        System.out.println("Current Balance is: " + Balance);
    }
}

class Customer implements Runnable {
    String name;
    Account a1;

    Customer(String n, Account b1) {
        name = n;
        a1 = b1;
    }

    public void run() {

        synchronized (a1) {
            Scanner s1 = new Scanner(System.in);
            System.out.println(this.name + " Enter amount to withdraw: ");
            int w = s1.nextInt();
            if (a1.isSufficient(w)) {
                a1.withdraw(w);
            } else {
                System.out.println("Insufiient balance: ");
            }

        }
    }

}

class Sync {
    public static void main(String args[]) {
        Account newObject1 = new Account(50000);
        Customer newObject2 = new Customer("Raj", newObject1);
        Customer newObject3 = new Customer("Simran", newObject1);

        Thread t1 = new Thread(newObject2);
        Thread t2 = new Thread(newObject3);

        t1.start();
        t2.start();

    }

}