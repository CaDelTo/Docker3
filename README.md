# EC2 | Actividad 3 Contenedores

## 🚀 Instructivo para ejecucion

### 1️⃣ **Acceder a Play with Docker**  
   - Ir a [Play with Docker](https://labs.play-with-docker.com/)  
   - Iniciar sesión con Docker Hub  
   - Crear una nueva instancia  

### 2️⃣ **Clonar repositorio en Play with Docker**  
   ```bash
   git clone https://github.com/CaDelTo/Docker3.git
   ```

### 3️⃣ **Levantar los contenedores mediante docker-compose**
   ```bash
   cd Docker3
   ```
   ```bash
   docker-compose up --build   
   ```
   Esto descargará las imágenes necesarias y las mantendrá listas para su ejecución.

### 4️⃣ **Ejecutar el script**
   ```bash
   bash script.sh
   ```
   El script solicitará el nombre del archivo que deseas ejecutar y determinará el contenedor adecuado para su ejecución.

### 📜 **Estructura del Proyecto**
   ```bash
    /
    ├── script.sh           # Script Bash
    ├── docker-compose.yml  # Configuración de imágenes de Docker
    ├── README.md           # Documentación del proyecto
    └── samples/            # Carpeta con ejemplos de código
   ```
## 🧪 **Ejemplos de uso**
### **Ejemplo 1: Ejecutar un archivo de Python**
   ```bash
   bash script.sh
   Ingrese la ruta o nombre del archivo: samples/sample.py
   ```
### **Ejemplo 2: Ejecutar un archivo de C++**
   ```bash
   bash script.sh
   Ingrese la ruta o nombre del archivo: samples/sample.cpp
   ```

   Salida esperada en ambos casos: 
   ```bash
   Valor estimado de π: X
   Tiempo de ejecución: X ms
   ```



## 🧙 **Integrantes del grupo**

- [Camilo Andres Del Toro Trillos](https://github.com/CaDelTo)
- [Anghely Andrea Ramos Estevez](https://github.com/Angeramos)
