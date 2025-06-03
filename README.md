# Siradigafip
  El siguiente es un aplicativo realizado en go para importar a esquema de tablas los datos descargados periodicamente en formato .zip desde la AFIP y representan datos del sistema Siradig.

### Requisitos previos.

Este aplicativo accede a 2 bases de datos.

 * rrhh:  Es la base donde se encuentran las tablas de liquidacion. Dentro de esta base existe un esquema llamado "siradig" con las tablas que soportaran la importacion de dichos archivos .zip.

 * legajos: es la base de datos de donde se consultan los empleados y los legajos de las personas representadas en los archivos .zip.
 
 En este proyecto se incluyen estas 2 bases (de ejemplo) para que pueda correr el aplicativo.
 
### **Pasos para deploy base de datos**
 
 Para instalar el entorno de base de datos debera tener instalado docker y docker-compose.
 
Ir a la carpeta de docker:

cd siradigafip/docker/

docker-compose build

docker-compose up -d

Luego de esto deberá restaurar la base de ejemplo con el siguiente script:

cd siradigafip/docker/baseejemplo

./crearbases.sh

### Pasos generar un archivo binario (EJECUTABLE)

Simplemente debará compilarlo con la sentencia de go llamada build:

   go build siradigafip.go

Luego de esto encontrará un archivo ejecutable en el raiz del proyecto.

### **Pasos para deploy aplicativo**

1.- Descargarse este proyecto con el comando:

     git clone  https://github.com/gusjoagomez/siradigafip.git
     
 
2.- El ultimo paso creará un directorio. Ingresar al mismo con:

   cd siradigafip
   
   
2.1.-  Configuracion de base de datos
       DEBERÁ configurar las conexiones a las bases de datos de rrhh y legajos en el archivo ubicado en
       config/config.conf
 
      [db]
      # ---- Base de tablas del F572
      rrhh="postgres://admin:passwordadmin@localhost:35432/rrhh"

      # ---- Base Legajos
      legajos="postgres://admin:passwordadmin@localhost:35432/legajos"


3.- Para la version web, ejecutar:
   
     * Para ejecutar desde el archivo binario
     ./siradigafip -web
     
     * Para ejecutar desde el codigo fuente
     go run siradigafip.go -web
     
     
     Luego de ejecutar el comando para interface web se mostrara por consola una mensaje como este:
     ---------------------------------------------
     Ejecute el aplicativo en un navegador/browser
     Escuchando en:  http://localhost:4500
    ---------------------------------------------
    
    Es en este momento donde podrá visualizar la interface desde un browser/navegador

     
     
 4.- Para version de linea de comandos. Importar los archivos .zip descargados de AFIP

     * Para ejecutar desde el archivo binario
     ./importaxml -procesar /home/usuario1/resultadosXML.zip
     
     * Para ejecutar desde el codigo fuente
     go run importaxml.go -procesar /home/usuario1/resultadosXML.zip




 Existen una serie de scripts en  /siradigafip/docker/baseejemplo/

sql_limpiaProceso.sql : (sentencias sql) sql para limpiar las tablas de siradig y probar nuevamente el proceso de importación.


     
     
     
     
