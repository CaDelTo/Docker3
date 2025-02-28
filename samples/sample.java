import java.util.Random;

public class sample {
    public static void main(String[] args) {
        int size = 100;
        int[][] A = new int[size][size];
        int[][] B = new int[size][size];
        int[][] C = new int[size][size];
        Random rand = new Random();

        // Llenar matrices con valores aleatorios
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                A[i][j] = rand.nextInt(10);
                B[i][j] = rand.nextInt(10);
            }
        }

        // Multiplicación de matrices
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                for (int k = 0; k < size; k++) {
                    C[i][j] += A[i][k] * B[k][j];
                }
            }
        }

        // Imprimir parte del resultado
        System.out.print("✅ Producto de matrices (primeros 5 elementos de la primera fila): ");
        for (int i = 0; i < 5; i++) {
            System.out.print(C[0][i] + " ");
        }
        System.out.println();
    }
}
