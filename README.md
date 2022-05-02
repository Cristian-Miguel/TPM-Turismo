# TPM-Turismo
Repositorio para el proyecto escolar de agencia de turismo, de la materia de Tecnologías de Programación para Móviles

para poder correrlo se necesitara tener los siguientes programas
Node.js
Flutter
Dart

para empezar se necesitara clonar le repositorio
una vez clonado, se necesitara entrar con un cmd a la direccion de la carpera NodeTPM
y correr lo siguiente

npm install

Crear un archivo llamado deafult.json en la carpta config con la siguiente informacion
el puerto puede ser el que no cree conflicto como 4000 o 5000 por ejemplo
JWT_Secret pongan cualquier string que quieran
lo demas dependera de su base de datos
{
    "app": {
        "port": ,
        "JWT_SECRET" : ""
    },
    "db": {
        "host"     : "",
        "port"     : "",
        "user"     : "",
        "password" : "",
        "database" : ""        
    }
}

en la parte de fluttler en android studio se necesitara actualizar los paquetes y la direccion del
sdk de flutter y dart


si llega haber algun problema con la conexion con mysql workbech ejecutar el siguiente comando en un sql de la base de datos

usuario de la db = 'root'@'localhost'

contraseña de la base de datos  = 'Admin'

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Admin'

