#!/bin/bash
# Solicitar al usuario el archivo o ruta completa
read -p "Ingrese la ruta o nombre del archivo: " archivo

# Verificar si el archivo existe
if [[ ! -f "$archivo" ]]; then
    echo "❌ Error: El archivo no existe."
    exit 1
fi

# Obtener la extensión del archivo
extension="${archivo##*.}"

# Detectar el lenguaje según la extensión
case "$extension" in
    py) imagen="python" cmd="python" ;;
    java) imagen="openjdk" cmd="javac && java" ;;
    cpp|cc) imagen="gcc" cmd="g++ -o output && ./output" ;;
    js) imagen="node" cmd="node" ;;
    rb) imagen="ruby" cmd="ruby" ;;
    *)
        echo "❌ Error: Extensión no soportada."
        exit 1
        ;;
esac

echo "✅ Lenguaje detectado: $imagen"

# Medir tiempo de ejecución
echo "🚀 Ejecutando en contenedor Docker..."
start_time=$(date +%s%N)  # Tiempo en nanosegundos

docker run --rm -v "$(pwd):/app" -w /app "$imagen" sh -c "$cmd $archivo"

end_time=$(date +%s%N)
elapsed_time=$(( (end_time - start_time) / 1000000 ))  # Convertir a milisegundos

echo "⏱️ Tiempo de ejecución: $elapsed_time ms"
