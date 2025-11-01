#!/bin/bash

# Nombre del script: reporte_sistema.sh
# Descripción: Genera un reporte básico del estado del sistema.

echo "--- REPORTE DEL SISTEMA ---"

# 1. Fecha y hora actual
echo "Fecha y Hora: $(date)"

# 2. Nombre del host
echo "Host: $(hostname)"

# 3. Número de usuarios conectados
echo "Usuarios Conectados: $(who | wc -l)"

# 4. Espacio libre en el disco principal (usando df -h)
echo "Espacio Libre en Disco: $(df -h / | tail -1 | awk '{print $4}')"

# 5. Memoria RAM disponible (usando free -h)
echo "Memoria RAM Disponible: $(free -h | grep Mem: | awk '{print $7}')"

# 6. Número de contenedores Docker activos (el comando funcionará después de instalar Docker)
echo "Contenedores Docker Activos: $(docker ps -q | wc -l 2>/dev/null || echo 'Docker No Instalado')"

echo "---------------------------"
