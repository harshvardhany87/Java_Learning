package cs.bean;

public class student {

    private int setRollNo;
    private String Name;
    private String Mobile;

    public int getsetRollNo() {
        return setRollNo;
    }

    public void setsetRollNo(int setRollNo) {
        this.setRollNo = setRollNo;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getMobile() {
        return Mobile;
    }

    public void setMobile(String mobile) {
        Mobile = mobile;
    }

    public void display() {
        System.out.println("Roll Number is: " + setRollNo);
        System.out.println("Name is: " + Name);
        System.out.println("Mobile number is: " + Mobile);
    }

}
