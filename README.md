#Nuevos repos para reacer el proyecto
[FrontEnd](https://github.com/Cristian-Miguel/TPM-FrontEnd)
[BackEnd](https://github.com/Cristian-Miguel/TPM-BackEnd)

# TPM-Turismo
Repositorio para el proyecto escolar de agencia de turismo, de la materia de Tecnologías de Programación para Móviles

para poder correrlo se necesitara tener los siguientes programas
- Node.js
- Flutter
- Dart

para empezar se necesitara clonar le repositorio
una vez clonado, se necesitara entrar con un cmd a la direccion de la carpera NodeTPM
y correr lo siguiente

```
npm install
```

Crear un archivo llamado deafult.json en la carpta config con la siguiente informacion:
- El puerto puede ser el que no cree conflicto como 4000 o 5000 por ejemplo.
- JWT_Secret pongan cualquier string que quieran.
- Lo demas dependera de su base de datos.

```json
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
```

en la parte de fluttler en android studio se necesitara actualizar los paquetes y la direccion del
sdk de flutter y dart.

si llega haber algun problema con la conexion con mysql workbech ejecutar el siguiente comando en un sql de la base de datos:
- usuario de la db = 'root'@'localhost'
- contraseña de la base de datos  = 'Admin'

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Admin'
```

Para correr el web server de node se necesita poner el siguiente comando

```
node src/index.js
```

Si Android Studio te da error ve a la barra de navegación de arriba a la izquierda y dale a "run", luego a "Edit configurations"
Se te desplegará una ventana, en "Additional run args" agrega la siguiente linea

```
--no-sound-null-safety
```

Por ultimo solo da click en aplicar y aceptar
