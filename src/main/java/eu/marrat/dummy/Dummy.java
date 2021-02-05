package eu.marrat.dummy;

public class Dummy {

    public void work() {
        System.out.println(System.getProperty("java.version"));
    }

    public static void main(String[] args) {
        new Dummy().work();
    }

}
