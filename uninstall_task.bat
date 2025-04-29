@echo off
echo Desinstalando tarefa de sincronizacao de horario...

:: Verifica se está rodando como administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Este script precisa ser executado como administrador!
    echo Por favor, clique com o botao direito e selecione "Executar como administrador"
    pause
    exit /b 1
)

:: Remove a tarefa agendada
schtasks /delete /tn "Sincronizar Horario" /f

if %errorLevel% equ 0 (
    echo Tarefa desinstalada com sucesso!
) else (
    echo Erro ao desinstalar a tarefa.
    echo A tarefa pode nao existir ou voce nao tem permissao de administrador.
)

pause 