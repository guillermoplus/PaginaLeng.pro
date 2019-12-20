@echo off

echo.
echo ---- Realizando Pio-Copia de Seguridad de la Base de Datos... 
echo.

cd BASE_DE_DATOS
del *.txt_backup
copy BASE_DE_DATOS_SQL.sql COPIA_ANTERIOR.txt_backup
del *.sql
cd ..

echo.
cd dependencias/mysql/bin
echo Ingrese la pio-contrasena de su base de datos (si no tiene, dejar sin llenar y presionar Enter).
echo.
mysqldump.exe -u root -p skatebicy > ../../../BASE_DE_DATOS/BASE_DE_DATOS_SQL.sql

echo.
echo ---- Pio-Copia de Seguridad Finalizada :)
echo.
pause

exit