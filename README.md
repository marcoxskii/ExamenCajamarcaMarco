# ExamenCajamarcaMarco
En este repositorio damos solucion al Exámen Interciclo de Sistemas Distribuidos.
El proyecto incluye un Dockerfile en la raíz del repositorio, esta imagen de Docker ejecuta una aplicación *Angular* servida por *Apache* en un contenedor basado en *Debian*.

## Instrucciones para construir y ejecutar la imagen
Primero, clonamos este repositorio usando 
```sh
sudo git clone https://github.com/marcoxskii/ExamenCajamarcaMarco.git
```
### Construir la imagen
Una vez clonado el repositorio, abrimos el terminal y en el directorio raíz de este proyecto ejecutamos el siguiente comando para construir la imagen de Docker:
```sh
sudo docker build -t examencajamarcam .
```

### Ejecutar la Imagen
Una vez la imagen haya sido construida con el comando anterior, vamos a ejecutarla en un contenedor usando el puerto 80 con el siguiente comando:
```sh
sudo docker run -d -p 80:80 examencajamarcam
```

Para comprobar nos vamos a http://localhost:80, y si vemos "¡Bienvenido a mi servidor Docker con Angular!" al abrir la pagina, es que todo ha salido bien.
