const start = performance.now();

const numIter = 1000000;
let insideCircle = 0;

for (let i = 0; i < numIter; i++) {
    let x = Math.random();
    let y = Math.random();
    if (x * x + y * y <= 1) {
        insideCircle++;
    }
}

const end = performance.now();
const timeElapsed = end - start;

const pi = 4.0 * insideCircle / numIter;
console.log(`Estimación de Pi: ${pi}`);
console.log(`Tiempo de ejecución: ${timeElapsed} ms`);
