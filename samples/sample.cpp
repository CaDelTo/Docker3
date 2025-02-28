#include <iostream>
#include <vector>
#include <cstdlib>

using namespace std;

int main() {
    int size = 100;
    vector<vector<int>> A(size, vector<int>(size));
    vector<vector<int>> B(size, vector<int>(size));
    vector<vector<int>> C(size, vector<int>(size, 0));

    // Llenar matrices con valores aleatorios
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            A[i][j] = rand() % 10;
            B[i][j] = rand() % 10;
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
    cout << "✅ Producto de matrices (primeros 5 elementos de la primera fila): ";
    for (int i = 0; i < 5; i++) {
        cout << C[0][i] << " ";
    }
    cout << endl;

    return 0;
}
