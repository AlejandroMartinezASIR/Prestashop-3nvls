# Prestashop a 3 niveles

## Este repositorio sirve para la creación de un prestashop a 3 niveles (BACK END - FRONT END - LOAD BALANCER), solo deberas de ejecutar los scripts y seguir los pasos que estan a continuación.

### 1er Paso
Una vez tenemos a disposición nuestro servidor que utilizaremos como base de datos, clonaremos este repsoitorio en la terminal https://github.com/AlejandroMartinezASIR/Prestashop-3nvls.git el cual le daremos permiso de ejecución al script install_lamp_backend.sh entrando en el directorio y utilizando:

```bash
chmod +x install_lamp_backend.sh
```
Una vez dado permisos de ejecución, ejecutaremos el script.

```bash
sudo ./install_lamp_backend.sh
```
Tras terminar el proceso de instalación del Back End tendremos que crear nuestro .env con nuestras variables necesarias para la ejecución correcta de nuestro codigo.
````
# Variables para el certificado de LetsEncript
LE_EMAIL= (email para el certificado)
LE_DOMAIN= (Dominio de la pagina)

#Variables para PRESTASHOP
PRESTASHOP_DB_NAME= (Nombre base de datos)
PRESTASHOP_DB_USER= (Usuario base de datos)
PRESTASHOP_DB_PASSWORD= (Contraseña base de datos)
IP_FRONTEND_1=  (IP privada del front end 1)
IP_FRONTEND_2= (IP privada del front end 2)
FRONTEND_NETWORK= (Rango de ip de nuestra red de frontends)
NFS_SERVER_IP= (IP privada nfs server)
PHP_INI= (direccion de nuestro php.ini)
````




