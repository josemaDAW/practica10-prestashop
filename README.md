# practica10-prestashop
Principalmente en AWS creamos dos grupos de seguridad, uno para la máquina que hará de FrontEnd (Servidor Web) y otro para la máquina de BackEnd (Servidor de Base de Datos). El grupo de seguridad del FrontEnd debe permitir el acceso a los puertos 22 (SSH), 80 (HTTP) y 443 (HTTPS). El grupo de seguridad del BackEnd debe permitir el acceso a los puertos 22 (SSH) y 3306 (MySQL).

Creo dos instancias EC2 en AWS que tengan al menos 2GB de memoria RAM. Una de las instancias será el FrontEnd y la otra el BacekEnd. asignandole el grupo de seguridad correspondiente a cada una de las instancias.

Crea una dirección IP elástica y asígnala a la instancia EC2 que hará de FrontEnd (Servidor Web).

Registra un nombre de dominio en NO-IP con un correo temporal (https://correotemporal.org/)

una vez dentro del NO-IP configuramos la IP del frontend

Nos vamos al Backend y desplegamos el script de backend.sh para dejarlo listo y una vez lo tengamos desplegado

Y nos conectamos a la maquina del frontend y comenzamos la instalación de la fronted.sh y el despliegue de prestashop.

cuando tengamos el despliegue de la pila LAMP y el despliegue de prestashop instalamos(wp_prestashop_raiz.sh) y configuramos el cliente ACME lanzamos nuestros scripts (config_https.sh) para añadirle la seguridad

ya cuando nos metamos con el nombre de dominio nos saldra la instalación de prestashop y una vez dentro configuramos las URL amigables y dejar todo condifurado correctamente
