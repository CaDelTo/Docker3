size = 100

# Generar matrices aleatorias
A = Array.new(size) { Array.new(size) { rand(10) } }
B = Array.new(size) { Array.new(size) { rand(10) } }
C = Array.new(size) { Array.new(size, 0) }

# Multiplicación de matrices
size.times do |i|
  size.times do |j|
    size.times do |k|
      C[i][j] += A[i][k] * B[k][j]
    end
  end
end

# Imprimir parte del resultado
print "✅ Producto de matrices (primeros 5 elementos de la primera fila): ", C[0][0..4], "\n"
