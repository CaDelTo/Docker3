import numpy as np

# Generar matrices aleatorias de 100x100
A = np.random.randint(0, 10, (100, 100))
B = np.random.randint(0, 10, (100, 100))

# Multiplicación de matrices
C = np.dot(A, B)

# Imprimir una parte del resultado
print("✅ Producto de matrices (primeros 5 elementos de la primera fila):", C[0, :5])
