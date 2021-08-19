import java.util.Arrays;
import java.util.Locale;
import java.util.Random;
import java.util.concurrent.Semaphore;

public class Padronizador extends Thread {

    private Semaphore sinalGP0;
    private Semaphore sinalGP1;
    private Semaphore sinalPC0;
    private Semaphore sinalPC1;
    private char[] caGP;
    private char[] caPC;

    public Padronizador(Semaphore sinalGP0, Semaphore sinalGP1, Semaphore sinalPC0, Semaphore sinalPC1, char[] caGP, char[] caPC) {
        this.sinalGP0 = sinalGP0;
        this.sinalGP1 = sinalGP1;
        this.sinalPC0 = sinalPC0;
        this.sinalPC1 = sinalPC1;
        this.caGP = caGP;
        this.caPC = caPC;
    }

    public void run() {
        try {
            while (true) {
                sinalPC0.acquire();

                System.out.println("padronizador acquired PC0");
                Thread.sleep(1000);

                sinalGP1.acquire();
                System.out.println("padronizador acquired GP1");
                Thread.sleep(1000);

                System.out.println("padronizador recebeu: " + Arrays.toString(caGP));

                gerarTextoMaiusculo(caGP, caPC);

                System.out.println("padronizador converteu: " + Arrays.toString(caPC));

                System.out.println("padronizador releasing GP0");
                Thread.sleep(1000);
                sinalGP0.release();

                System.out.println("padronizador releasing PC1");
                Thread.sleep(1000);
                sinalPC1.release();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void gerarTextoMaiusculo(char[] input, char[] output) {

        for (int i = 0; i < input.length; i++) {

            output[i] = Character.toUpperCase(input[i]);
        }
    }
}
