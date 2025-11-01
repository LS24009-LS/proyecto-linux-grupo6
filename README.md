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

### 3. Control de Versiones
* Repositorio Git local inicializado y sincronizado con el repositorio remoto de GitHub.

## Próximos Pasos
Instalación y configuración de Docker para la contenerización del servidor web Nginx.
