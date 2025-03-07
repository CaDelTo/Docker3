#include <iostream>
#include <cstdlib>
#include <ctime>
#include <chrono>

using namespace std;
using namespace std::chrono;

int main() {
    const int num_iter = 1000000;
    int inside_circle = 0;

    srand(time(0));
    
    // Inicio de medición de tiempo
    auto start = high_resolution_clock::now();

    for (int i = 0; i < num_iter; i++) {
        double x = (double)rand() / RAND_MAX;
        double y = (double)rand() / RAND_MAX;
        if (x * x + y * y <= 1) {
            inside_circle++;
        }
    }

    // Fin de medición de tiempo
    auto end = high_resolution_clock::now();
    auto duration = duration_cast<milliseconds>(end - start);

    double pi = 4.0 * inside_circle / num_iter;
    cout << "Estimación de Pi: " << pi << endl;
    cout << "Tiempo de ejecución: " << duration.count() << " ms" << endl;

    return 0;
}
