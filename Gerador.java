import java.util.Arrays;
import java.util.Random;
import java.util.concurrent.Semaphore;

public class Gerador extends Thread {

    private Semaphore sinalGP0;
    private Semaphore sinalGP1;
    private char[] caGP;

    public Gerador(Semaphore sinalGP0, Semaphore sinalGP1, char[] caGP) {
        this.sinalGP0 = sinalGP0;
        this.sinalGP1 = sinalGP1;
        this.caGP = caGP;
    }

    public void run() {
        try {
            while (true) {
                sinalGP0.acquire();

                System.out.println("gerador acquired GP0");
                Thread.sleep(1000);

                getRandomString(10, caGP);
                System.out.println("gerador gerou: " + Arrays.toString(caGP));

                System.out.println("gerador releasing GP1");
                Thread.sleep(1000);

                sinalGP1.release();
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void getRandomString(int i, char[] string) {
        String sAlphaNumerics = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

        //create the StringBuffer

        Random r = new Random();

        int iRandomInt = 0;

        for (int j = 0; j < i; j++) {
            string[j] = sAlphaNumerics.charAt(r.nextInt(52));
        }
    }
}