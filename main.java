import java.util.concurrent.Semaphore;

public class main {

    public static void main(String[] args) {

        char[] caGP = new char[10];
        char[] caPC = new char[10];

        Semaphore sinalGP0 = new Semaphore(1);
        Semaphore sinalGP1 = new Semaphore(0);

        Semaphore sinalPC0 = new Semaphore(1);
        Semaphore sinalPC1 = new Semaphore(0);

        Gerador gerador = new Gerador(sinalGP0, sinalGP1, caGP);
        Padronizador padronizador = new Padronizador(sinalGP0, sinalGP1, sinalPC0, sinalPC1, caGP, caPC);
        Contador contador = new Contador(sinalPC0, sinalPC1, caPC);

        System.out.println("Starting...");

        gerador.start();
        padronizador.start();
        contador.start();
    }
}
