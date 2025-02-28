read -p "Ingrese el nombre o ruta del archivo: " archivo

if [[ ! -f $archivo ]]; then
    echo "El archivo no existe"
    exit 1
fi

extension="${archivo##*.}"
case "$extension" in
    py) lenguaje="Python" ;;
    java) lenguaje="Java" ;;
    cpp|cc) lenguaje="C++" ;;
    js) lenguaje="JavaScript" ;;
    rb) lenguaje="Ruby" ;;
    *)
        echo "❌ Error: Extensión no soportada."
        exit 1
        ;;
esac

echo "✅ Lenguaje detectado: $lenguaje"