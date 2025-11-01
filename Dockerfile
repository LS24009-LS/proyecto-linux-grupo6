# Dockerfile para la imagen base del servidor web
# Utilizamos la imagen oficial de Nginx más reciente
FROM nginx:latest

# Mantenemos los directorios de trabajo predeterminados de Nginx.
# El archivo index.html se montará desde el host usando el comando docker run.
# RUN echo "Contenido inicial" > /usr/share/nginx/html/index.html
# La línea anterior se comenta porque el contenido se monta como volumen (-v).

# Exponemos el puerto 80, que es el puerto predeterminado de Nginx.
EXPOSE 80

# Comando por defecto para iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]
