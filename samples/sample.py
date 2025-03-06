import random
import time

def calcular_pi(n_puntos):
    dentro = 0
    for _ in range(n_puntos):
        x, y = random.random(), random.random()
        if x**2 + y**2 <= 1:
            dentro += 1
    return (4 * dentro) / n_puntos

# Prueba con 10 millones de puntos
n = 10_000_000
inicio = time.time()
pi_aprox = calcular_pi(n)
fin = time.time()

print(f"Valor estimado de π: {pi_aprox}")
print(f"Tiempo de ejecución: {fin - inicio:.5f} segundos")
