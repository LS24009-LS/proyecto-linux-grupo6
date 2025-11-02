# Proyecto Servidor Linux Automatizado (Grupo 6)

Este proyecto tiene como objetivo implementar y automatizar un entorno de servidor Linux utilizando diversas tecnologías clave de la administración de sistemas y DevOps, incluyendo control de versiones (Git), programación de tareas (Cron) y contenerización (Docker).

## Fases Completadas

### 1. Preparación del Entorno Servidor
* **Hostname:** Configurado como `servidor-grupo6`.
* **Usuarios:** Creados `adminsys` (con sudo), `tecnico` (grupo `soporte`), y `visitante` (grupo `web`).
* **Estructura de Directorios:** Creada en `/proyecto/` con subdirectorios y permisos de herencia (`sgid`) para los grupos `soporte` y `web`.

### 2. Automatización y Monitoreo
* **Script:** Creado `reporte_sistema.sh` para recopilar datos clave del servidor (host, usuarios, RAM, disco, Docker).
* **Automatización:** Tarea de Cron configurada para ejecutar `reporte_sistema.sh` cada 30 minutos, guardando la salida en `/var/log/proyecto/reporte_sistema.log`.

### 3. Control de Vers# Proyecto Servidor Linux Automatizado (Grupo 6)

Este proyecto implementa y automatiza un entorno de servidor Linux utilizando diversas tecnologías clave de la administración de sistemas y DevOps, incluyendo control de versiones (Git), programación de tareas (Cron) y contenerización (Docker).

## 1. Preparación del Entorno Servidor
* **Hostname:** Configurado como `servidor-grupo6`.
* **Usuarios:** Creados `adminsys` (con sudo y Docker), `tecnico` (grupo `soporte` y Docker), y `visitante` (grupo `web`).
* **Estructura de Directorios:** Creada en `/proyecto/` con subdirectorios y permisos de herencia (`sgid`) para los grupos `soporte` y `web`.

## 2. Automatización y Monitoreo
* **Script:** Creado `reporte_sistema.sh` para recopilar datos clave del servidor (host, usuarios, RAM, disco, Docker).
* **Automatización:** Tarea de Cron configurada para ejecutar `reporte_sistema.sh` cada 30 minutos, guardando la salida en `/var/log/proyecto/reporte_sistema.log`.

## 3. Control de Versiones
* Repositorio Git local inicializado y sincronizado con el repositorio remoto de GitHub.

***

## 4. Contenerización (Docker)
* **Instalación:** Docker Engine, CLI y Containerd instalados y configurados. Se resolvió la dependencia del repositorio forzando la versión `jammy` de Ubuntu.
* **Permisos:** Los usuarios `adminsys` y `tecnico` fueron añadidos al grupo `docker` para permitir la administración de contenedores sin usar `sudo`.

## 5. Servidor Web Containerizado (Nginx)
* **Contenido:** Creado el archivo `index.html` en el volumen de montaje local `/proyecto/web/`.
* **Ejecución:** Contenedor Nginx (`servidor-web-nginx`) ejecutado de forma persistente (`--restart unless-stopped`).
* **Montaje:** El contenido web se sirve mediante el montaje de volumen (`-v /proyecto/web:/usr/share/nginx/html:ro`).
* **Verificación Final:** Servicio web accesible y funcional en **`http://localhost:8080`**. Los logs del contenedor (`docker logs`) confirmaron peticiones con código de estado **200 (OK)**.
* **Autor del Setup Inicial:** [ls24009] (Verificado por el commit más reciente)
