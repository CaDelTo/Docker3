#!/bin/bash

# Definir las imagenes
imagenes=("python:alpine" "openjdk:alpine" "gcc" "node:alpine" "ruby:alpine")

echo "Verificando e instalando imágenes de Docker..."

# Verificar e instalar imagenes si no existen
for imagen in "${imagenes[@]}"; do
    if [[ -z $(docker images -q $imagen 2>/dev/null) ]]; then
        docker pull $imagen
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

# Detectar el lenguaje y seleccionar la imagen
case "$extension" in
    py) imagen="python:alpine" cmd="python" ;;
    java) imagen="openjdk:alpine" class_name=$(basename "$archivo" .java) dir_name=$(dirname "$archivo") cmd="javac $archivo && java -cp $dir_name $class_name";;
    cpp|cc) imagen="gcc" cmd="g++ -o ${archivo%.*} $archivo && ./${archivo%.*}" ;;
    js) imagen="node:alpine" cmd="node" ;;
    rb) imagen="ruby:alpine" cmd="ruby" ;;
    *)
        echo "Error: Extensión no soportada."
        exit 1
        ;;
esac

docker run --rm -v "$(pwd):/app" -w /app "$imagen" sh -c "$cmd $archivo || exit 1"
