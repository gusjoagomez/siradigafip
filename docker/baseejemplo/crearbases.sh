#!/bin/bash
# Antes de ejecutar este script asegurese
# que está corriendo el contenedor con la base de datos

CONTENEDOR="siradig-postgres"

result=$( docker inspect -f '{{.State.Running}}' $CONTENEDOR   2>/dev/null )
if [[ $result != "true" ]]; then
  echo ""
  echo "NO está corriendo el contenedor de base de datos"
  echo "Primero inicielo desde la carpeta siradig/docker con los comandos:"
  echo "docker-compose build"
  echo "docker-compose up -d"
  echo ""
  exit 1
fi

# dropea base existente
docker exec -it $CONTENEDOR dropdb -U admin rrhh 
docker exec -it $CONTENEDOR dropdb -U admin legajos 

# crea nuevamente las base 
docker exec -it $CONTENEDOR createdb -Uadmin rrhh
docker exec -it $CONTENEDOR createdb -Uadmin legajos

#levanta los datos
cat rrhh.sql    | docker exec -i $CONTENEDOR psql -U admin rrhh
cat legajos.sql | docker exec -i $CONTENEDOR psql -U admin legajos

