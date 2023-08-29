# README

- Render: https://vinylswapp.onrender.com/
- Dashboard Admin : https://vinylswapp.onrender.com/admin/login

### Sobre la aplicación

Esta es una aplicación de trueque de vinilos con dos niveles de usuarios

- administrador
- colleccionista

Los trueques se llevan a cabo por medio del envío de solicitudes junto con una propuesta para el intercambio, propuestas que el owner puede rechazar o aceptar:

- Los usuarios pueden buscar vinilos por medio de un buscador simple y otros con filtros y visitar los perfiles de los owners desde el show del vinilo y la lista de coleccionistas que está en el navbar.
- Cada coleccionista tiene un sistema de evaluación por likes para mostrar publicamente cuál ha sido su desempeño en la plataforma.
- Aún no se implementa la forma de contacto entre los usuarios para concretar un trueque, por lo que se establecerá de manera interna por medio de los mails expuestos en sus perfiles.


### Deployment

1. Requisitos: ruby '2.6.6' y 'rails', '~> 5.2.7'
2. Clonar la aplicación
3. bundle install
4. rails db:create
5. rails db:migrate
6. Cargar el seed para crear usuarios y vinilos (rails db:seed)
7. Hay 2 credenciales disponibles:

- usuario: adminuser@example.com
- contraseña: password


- Los usuarios nuevos tienen acceso como coleccionistas y se les crea de forma automática un perfil para subir su colección de vinilos al registrarse, pero el usuario admin puede dar más permisos desde su dashboard de Active Admin ('localhost:3000/admin/login')

### Integración

La aplicación cuenta con un un dashboard para los coleccionistas con chartkick, donde pueden ver indicadores de las ofertas que han recibido y los trueques que han concretado.
- Los usuarios pueden loguearse con su correo de gmail (google_oauth2)

### Niveles de usuario

#### Administrador

El administrador tiene acceso especial a un dashboard completo con información de usuarios con Active Admin. En la vista tiene acceso a eliminar y editar todos los perfiles y vinilos y tiene una vista especial con la lista de ofertas que se han hecho en sus estados pendiente, aceptado y rechazado.

#### Colleccionista

El coleccionista, luego de registrarse, puede subir vinilos a su perfil y editar sus datos. Tiene acceso a revisar otros perfiles solo para hacer ofertas y calificar a los usuarios con los que ha concretado trueques.



