start_time = Time.now

num_iter = 1_000_000
inside_circle = 0

num_iter.times do
  x = rand
  y = rand
  inside_circle += 1 if x**2 + y**2 <= 1
end

end_time = Time.now
execution_time_ms = (end_time - start_time) * 1000

pi = 4.0 * inside_circle / num_iter
puts "Estimación de Pi: #{pi}"
puts "Tiempo de ejecución: #{execution_time_ms.round(2)} ms"
