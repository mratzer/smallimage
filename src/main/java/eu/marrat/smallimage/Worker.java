package eu.marrat.smallimage;

public class Worker {

    public void work() {
        System.out.println(System.getProperty("java.version"));
    }

    public static void main(String[] args) {
        new Worker().work();
    }

}
