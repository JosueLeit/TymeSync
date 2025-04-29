@echo off
setlocal enabledelayedexpansion

echo Verificando requisitos de seguranca...

:: Verifica se está rodando como administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERRO] Este script precisa ser executado como administrador!
    echo Por favor, clique com o botao direito e selecione "Executar como administrador"
    pause
    exit /b 1
)

:: Verifica se o Windows Time está em execução
sc query w32time | find "RUNNING" >nul
if %errorLevel% neq 0 (
    echo [ERRO] O servico Windows Time nao esta em execucao!
    echo Iniciando o servico...
    net start w32time
    if !errorLevel! neq 0 (
        echo [ERRO] Nao foi possivel iniciar o servico Windows Time.
        echo Por favor, inicie o servico manualmente e tente novamente.
        pause
        exit /b 1
    )
)

:: Verifica se o arquivo sync_time.bat existe
if not exist "%~dp0sync_time.bat" (
    echo [ERRO] Arquivo sync_time.bat nao encontrado!
    echo Certifique-se de que o arquivo esta no mesmo diretorio.
    pause
    exit /b 1
)

:: Verifica se a tarefa já existe
schtasks /query /tn "Sincronizar Horario" >nul 2>&1
if %errorLevel% equ 0 (
    echo [AVISO] A tarefa ja existe. Deseja reinstalar? (S/N)
    set /p resposta=
    if /i "!resposta!" neq "S" (
        echo Instalacao cancelada.
        pause
        exit /b 0
    )
    echo Removendo tarefa existente...
    schtasks /delete /tn "Sincronizar Horario" /f
)

:: Obtém o caminho completo do diretório atual
set "SCRIPT_DIR=%~dp0"
set "BAT_PATH=%SCRIPT_DIR%sync_time.bat"

:: Verifica se o caminho contém caracteres especiais
echo !BAT_PATH! | findstr /r "[<>|&]" >nul
if %errorLevel% equ 0 (
    echo [ERRO] O caminho contem caracteres especiais que podem causar problemas.
    echo Por favor, mova os arquivos para um diretorio sem caracteres especiais.
    pause
    exit /b 1
)

:: Cria a tarefa agendada
echo Instalando tarefa de sincronizacao de horario...
schtasks /create /tn "Sincronizar Horario" /tr "%BAT_PATH%" /sc hourly /ru SYSTEM /f

if %errorLevel% equ 0 (
    echo [SUCESSO] Tarefa instalada com sucesso!
    echo A sincronizacao de horario sera executada a cada hora.
) else (
    echo [ERRO] Erro ao instalar a tarefa.
    echo Por favor, verifique se voce tem permissao de administrador.
)

pause 