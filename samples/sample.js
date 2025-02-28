// Crear matrices 100x100 llenas de valores aleatorios
const size = 100;
let A = Array.from({ length: size }, () => Array.from({ length: size }, () => Math.floor(Math.random() * 10)));
let B = Array.from({ length: size }, () => Array.from({ length: size }, () => Math.floor(Math.random() * 10)));
let C = Array.from({ length: size }, () => Array(size).fill(0));

// Multiplicación de matrices
for (let i = 0; i < size; i++) {
    for (let j = 0; j < size; j++) {
        for (let k = 0; k < size; k++) {
            C[i][j] += A[i][k] * B[k][j];
        }
    }
}

// Imprimir parte del resultado
console.log("✅ Producto de matrices (primeros 5 elementos de la primera fila):", C[0].slice(0, 5));
