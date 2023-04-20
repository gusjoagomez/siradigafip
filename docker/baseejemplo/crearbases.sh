#!/bin/bash
# Antes de ejecutar este script asegurese
# que está corriendo el contenedor con la base de datos

# dropea base existente
docker exec -it siradig-postgres dropdb -U admin rrhh 
docker exec -it siradig-postgres dropdb -U admin legajos 

# crea nuevamente las base 
docker exec -it siradig-postgres createdb -Uadmin rrhh
docker exec -it siradig-postgres createdb -Uadmin legajos

#levanta los datos
cat rrhh.sql    | docker exec -i siradig-postgres psql -U admin rrhh
cat legajos.sql | docker exec -i siradig-postgres psql -U admin legajos

