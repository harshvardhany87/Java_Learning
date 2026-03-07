package Interface;

interface Samsung {
    void setMic();
}

interface Iphone {
    void setMusic();
}

class Vivo implements Samsung, Iphone {
    public void setMic() {
        System.out.println("Mis set successfully: ");

    }

    public void setMusic() {
        System.out.println("Music set successfully: ");

    }

}

class Interface {
    public static void main(String args[]) {
        Vivo newObject = new Vivo();
        newObject.setMic();
        newObject.setMusic();

    }

}
