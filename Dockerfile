# empezamos con una imagen de debian e instalamos las dependencias
FROM debian:latest
RUN apt-get update && \
    apt-get install -y apache2 nodejs npm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# instalar cli aparte pq da fallos
RUN npm install -g @angular/cli

# directorio de trabajo
WORKDIR /usr/src/app

# copiar los archivos de configuracion de angular
COPY PracLeccionAng/package*.json ./

# instalar dependencias para angular
RUN npm install

# copiar el resto de archivos
COPY PracLeccionAng/ .

# construir angular
RUN ng build

# copia los archivos construidos al directorio de Apache
RUN cp -r /usr/src/app/dist/prac-leccion-ang/browser/* /var/www/html/

# damos servename de apache para evitar advertencia
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# exponemos el puerto 80
EXPOSE 80

# iniciar apache en primer plano para q se mantenga en ejecucion
CMD ["apachectl", "-D", "FOREGROUND"]