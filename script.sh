#!/bin/bash

# Definir las imágenes necesarias
imagenes=("python" "openjdk" "gcc" "node" "ruby")

echo "Verificando e instalando imágenes de Docker..."

# Verificar e instalar imágenes si no existen
for imagen in "${imagenes[@]}"; do
    if [[ "$(docker images -q $imagen 2>/dev/null)" == "" ]]; then
        echo "Descargando imagen: $imagen"
        docker pull $imagen
    else
        echo "Imagen $imagen ya está disponible."
    fi
done

read -p "Ingrese la ruta o nombre del archivo: " archivo

# Verificar si el archivo existe
if [[ ! -f "$archivo" ]]; then
    echo "Error: El archivo no existe."
    exit 1
fi

# Obtener la extensión del archivo
extension="${archivo##*.}"

# Detectar el lenguaje y configurar el contenedor
case "$extension" in
    py) imagen="python" cmd="pip install numpy && python" ;;
    java) imagen="openjdk" cmd="javac && java" ;;
    cpp|cc) imagen="gcc" cmd="g++ -o output && ./output" ;;
    js) imagen="node" cmd="node" ;;
    rb) imagen="ruby" cmd="ruby" ;;
    *)
        echo "❌ Error: Extensión no soportada."
        exit 1
        ;;
esac

echo "Lenguaje detectado: $imagen"

# Medir tiempo de ejecución
echo "Ejecutando"
start_time=$(date +%s%N)

docker run --rm -v "$(pwd):/app" -w /app "$imagen" sh -c "$cmd $archivo"

end_time=$(date +%s%N)
elapsed_time=$(( (end_time - start_time) / 1000000 ))

echo "Tiempo de ejecución: $elapsed_time ms"
