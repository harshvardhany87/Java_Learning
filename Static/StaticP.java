package Static;

class samsung {
    public static void setMic() {
        System.out.println("Mic set successfully");
    }
}

class StaticP {
    public static void main(String args[]) {
        System.out.println("Hello Main");
        samsung.setMic();
    }

}
