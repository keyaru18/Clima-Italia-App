#!/bin/bash

#Define el path al entorno virtual si es necesario
source /home/richi20/miniforge3/etc/profile.d/conda.sh
eval "$(conda shell.bash hook)"
conda activate keyaru20
#Define el path al script de Python
SCRIPT_PATH="/home/richi20/ItalianWeather/main.py"

#Ejecuta el script de Python
python3 "$SCRIPT_PATH"

# si no funciona <chmod +x nombre_del_archivo.sh> para dar permisos de ejecucion
