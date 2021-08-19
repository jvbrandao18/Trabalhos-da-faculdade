import java.util.concurrent.Semaphore;

public class Contador extends Thread {

    private Semaphore sinalPC0;
    private Semaphore sinalPC1;
    private char[] caPC;

    public Contador(Semaphore sinalPC0, Semaphore sinalPC1, char[] caPC) {
        this.sinalPC0 = sinalPC0;
        this.sinalPC1 = sinalPC1;
        this.caPC = caPC;
    }

    public void run() {
        try {
            while (true) {
                sinalPC1.acquire();

                System.out.println("Contador acquired PC1");
                Thread.sleep(1000);

                displayVogais(caPC);

                System.out.println("Contador releasing PC0");
                Thread.sleep(1000);

                sinalPC0.release();
            }

        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void displayVogais(char[] input) {

        int iVogaisCounter = 0;

        for (char c : input) {
            if ("AEIOU".indexOf(c) != -1) {
                iVogaisCounter++;
            }
        }

        System.out.println("Contagem vogais = " + iVogaisCounter);
    }
}
