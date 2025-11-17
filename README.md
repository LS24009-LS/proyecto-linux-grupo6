
# 🚀 Proyecto Final: Servidor Linux Automatizado (Grupo 6)

Este proyecto implementa y automatiza un entorno de servidor Linux completo, utilizando las mejores prácticas de administración de sistemas, automatización (Cron), y contenerización (Docker).

El objetivo es demostrar la capacidad de desplegar un servicio web robusto y seguro a partir de una infraestructura de código.

## 👥 Autores y Colaboración

El código fuente y la documentación de este repositorio representan el trabajo colaborativo del **Grupo 6**.

  * El historial de *commits* demuestra la autoría individual a través del flujo de **Ramas de Feature Individuales** y la revisión mediante Pull Requests (PRs), asegurando un control de versiones de nivel profesional.

-----

## 1\. PREPARACIÓN DEL ENTORNO SERVIDOR ⚙️

### 1.1. Administración Básica del Sistema

Se establecieron las bases de la infraestructura con una jerarquía de usuarios y permisos definida (PoLP).

  * **Nombre del Host:** Configurado como `servidor-grupo6` para fácil identificación en la red.
  * **Usuarios Creados:** `adminsys`, `técnico`, `visitante`.
  * **Grupos Creados:** `soporte`, `web`.
  * **Asignación de Privilegios:**
      * `adminsys` tiene privilegios de `sudo`.
      * `técnico` pertenece al grupo `soporte`.
      * `visitante` pertenece al grupo `web`.
      * Ambos `adminsys` y `técnico` fueron agregados al grupo **`docker`**.

### 1.2. Estructura de Directorios y Permisos

Se creó la estructura de directorios bajo `/proyecto/` y se aplicaron permisos de herencia de grupo.

  * **Estructura Creada:**
      * `datos/` (Perteneciente al grupo `soporte`)
      * `web/` (Perteneciente al grupo `web`)
      * `scripts/`, `capturas/`
  * **Permisos de Herencia (`sgid`):** Los directorios `datos/` y `web/` fueron configurados con el *bit* **`sgid`** (`chmod g+s`). Esto garantiza que cualquier archivo creado dentro de ellos herede automáticamente el grupo propietario del directorio (`soporte` o `web`), simplificando la gestión de accesos.

-----

## 2\. AUTOMATIZACIÓN Y MONITOREO ⏱️

### 2.1. Script de Monitoreo del Sistema

Se creó el script `reporte_sistema.sh` en `/proyecto/scripts/` para el diagnóstico de salud del servidor.

  * **Permisos:** El script tiene permisos de ejecución.
  * **Información Recopilada:** Incluye fecha, nombre del host, usuarios conectados, espacio en disco, RAM disponible y número de contenedores Docker activos.

### 2.2. Automatización con Cron

  * **Tarea Programada:** Se configuró una tarea programada mediante `crontab` (ejecutada por el usuario `root`) para ejecutar el `reporte_sistema.sh` **cada 30 minutos**.
  * **Redirección de Salida:** La salida del *script* se redirige y se acumula en el archivo de registro `/var/log/proyecto/reporte_sistema.log`, asegurando una auditoría continua del estado del servidor.

-----

## 3\. CONTROL DE VERSIONES 📦

  * **Inicialización:** Se inicializó el repositorio Git en `/proyecto/`.
  * **Repositorio Remoto:** Se sincronizó el repositorio local con el repositorio remoto en GitHub llamado `proyecto-linux-grupo6`.
  * **Documentación:** Se creó este archivo `README.md` documentando el proyecto.
  * **Historial de Commits:** El historial demuestra la colaboración de todos los integrantes del grupo, utilizando **Ramas de Feature Individuales** para la integración del código.

-----

## 4\. DOCKER 🐳

### 4.1. Instalación y Configuración

  * **Instalación:** Docker Engine, CLI y Containerd fueron instalados y habilitados. Se resolvió la incompatibilidad de repositorio forzando la distribución base (`jammy`).
  * **Permisos de Docker:** Los usuarios `adminsys` y `técnico` fueron agregados al grupo `docker`, permitiéndoles ejecutar comandos Docker (ej. `docker ps`) **sin utilizar `sudo`**, cumpliendo con el PoLP.

### 4.2. Verificación Inicial

  * **Prueba Exitosa:** Se ejecutó el contenedor de prueba `docker run hello-world`, confirmando que el *daemon* de Docker está operativo y que el sistema puede descargar y ejecutar imágenes correctamente.

-----

## 5\. SERVIDOR WEB CONTAINERIZADO 🌐

### 5.1. Contenedor Nginx Básico y Persistencia

Se lanzó el servidor web Nginx dentro de un contenedor, garantizando alta disponibilidad y seguridad en el montaje del código.

  * **Archivos Creados:** `index.html` y `style.css` (para diseño personalizado) se crearon en `/proyecto/web/`.
  * **Comando de Despliegue Clave:** El contenedor fue lanzado con la siguiente configuración:
    ```bash
    docker run -d --name servidor-web-nginx -p 8080:80 \
        -v /proyecto/web:/usr/share/nginx/html:ro \
        --restart unless-stopped nginx:latest
    ```
  * **Persistencia:** El *flag* **`--restart unless-stopped`** asegura que el contenedor se reinicie automáticamente ante cualquier fallo o reinicio de la VM.
  * **Seguridad:** El montaje de volumen **`:ro` (solo lectura)** previene que el contenedor pueda escribir o modificar el código fuente del sitio web en el sistema operativo Host.

### 5.2. Verificación del Servicio Web

  * **Acceso en Navegador:** Se accedió exitosamente al servidor web en la URL **`http://localhost:8080`**. El contenido HTML personalizado se cargó junto con los estilos CSS.
  * **Revisión de Logs:** La revisión de los logs del contenedor (`docker logs servidor-web-nginx`) confirmó la recepción de peticiones con el código de estado **200 (OK)**, validando que el servicio está funcionando sin errores y sirviendo el contenido desde el volumen montado.

-----

## 📂 Archivos y Evidencias

  * **`Dockerfile`:** Documenta la imagen base de Nginx utilizada.
  * **`scripts/reporte_sistema.sh`:** Código fuente del script de monitoreo.
  * **`web/index.html` y `web/style.css`:** Contenido web con diseño personalizado.
  * **`capturas/ServidorLinux.docx`:** Documento que contiene las capturas de pantalla que verifican la ejecución exitosa de los comandos de instalación y configuración de cada fase.

