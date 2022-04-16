# TPM-Turismo
Repositorio para el proyecto escolar de agencia de turismo, de la materia de Tecnologías de Programación para Móviles

Se necesita inicializar el default.json para la conexion con la base de datos
esta se realiza con los siguientes comandos

$ mkdir config
$ vi config/default.json

si llega haber algun problema con la conexion con mysql workbech ejecutar el siguiente comando en un sql de la base de datos
usuario de la db = 'root'@'localhost'
contraseña de la base de datos  = 'Admin'
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Admin'

