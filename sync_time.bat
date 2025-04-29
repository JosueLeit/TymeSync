@echo off
echo Sincronizando horario do sistema...
w32tm /resync /force
echo Horario sincronizado com sucesso!
timeout /t 5 