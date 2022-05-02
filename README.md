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

Despues se necesita inicializar el default.json para la conexion con la base de datos
esta se realiza con los siguientes comandos

$ mkdir config

$ vi config/default.json

en la parte de fluttler en android studio se necesitara actualizar los paquetes y la direccion del
sdk de flutter y dart


si llega haber algun problema con la conexion con mysql workbech ejecutar el siguiente comando en un sql de la base de datos

usuario de la db = 'root'@'localhost'

contraseña de la base de datos  = 'Admin'

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Admin'

