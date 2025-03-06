import java.util.concurrent.ThreadLocalRandom;

public class sample {
    public static void main(String[] args) {
        int n = 10_000_000;
        long inicio = System.nanoTime();
        double piAprox = calcularPi(n);
        long fin = System.nanoTime();

        System.out.printf("Valor estimado de π: %.5f%n", piAprox);
        System.out.printf("Tiempo de ejecución: %.5f segundos%n", (fin - inicio) / 1e9);
    }

    public static double calcularPi(int nPuntos) {
        int dentro = 0;
        for (int i = 0; i < nPuntos; i++) {
            double x = ThreadLocalRandom.current().nextDouble();
            double y = ThreadLocalRandom.current().nextDouble();
            if (x * x + y * y <= 1) {
                dentro++;
            }
        }
        return 4.0 * dentro / nPuntos;
    }
}
