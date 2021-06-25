package _4_lop_va_doi_tuong_trong_java.bai_tap;

public class Fan {
    static final int SLOW = 1;
    static final int MEDIUM = 2;
    static final int FAST = 3;
    private int speed;
    private boolean on;
    private double radius;
    private String color;

    public int getSpeed() {
        return speed;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }

    public boolean isOn() {
        return on;
    }

    public void setOn(boolean on) {
        this.on = on;
    }

    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Fan(){
        speed = SLOW;
        on = false;
        radius = 5;
        color = "blue";
    }

    public Fan(int speed, double radius, String color, boolean on) {
        this.speed = speed;
        this.on = on;
        this.radius = radius;
        this.color = color;
    }

    public String toString(){
        return "Fan{"+speed+","+color+","+radius+","+(isOn()?"Fan is on":"Fan is off")+"}";

    }
    public static void main(String[] args) {
        Fan Fan1 = new Fan(FAST,10,"yellow",true);
        Fan Fan2 = new Fan(MEDIUM,5,"blue",false);
        System.out.println(Fan1);
        System.out.println(Fan2);
    }
}
