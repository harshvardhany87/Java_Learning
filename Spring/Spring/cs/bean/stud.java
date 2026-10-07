package cs.bean;

public class stud {
    private int RollNo;
    private String Name;
    private String City;

    public int getRollNo() {
        return RollNo;
    }

    public void setRollNo(int rollNo) {
        RollNo = rollNo;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getgetCity() {
        return City;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public void display() {
        System.out.println("Roll Number = " + RollNo);
        System.out.println("Name of the person = " + Name);
        System.out.println("City = " + City);
    }

}
