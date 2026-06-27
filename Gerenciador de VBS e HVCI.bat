@echo off
title Gerenciador de VBS e HVCI - Full AMD
cls

:: Verifica se o script está rodando com privilégios de Administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ====================================================================
    echo ERRO: Por favor, execute como Administrador!
    echo Clique com o botao direito no arquivo e escolha "Executar como Administrador".
    echo ====================================================================
    pause
    exit /b
)

:MENU
cls
echo ========================================================
echo         GERENCIADOR DE VBS E HVCI (FULL AMD)
echo ========================================================

:: --- VERIFICAÇÃO DO STATUS DO VBS ---
set "STATUS_VBS=ATIVADO"
bcdedit | findstr /i "hypervisorlaunchtype" | findstr /i "Off" >nul
if %errorLevel% == 0 set "STATUS_VBS=DESATIVADO"

:: --- VERIFICAÇÃO DO STATUS DO HVCI ---
set "STATUS_HVCI=ATIVADO"
reg query "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled 2>nul | findstr /i "0x0" >nul
if %errorLevel% == 0 set "STATUS_HVCI=DESATIVADO"

:: --- EXIBIÇÃO DO STATUS ATUAL ---
echo  STATUS ATUAL DO SISTEMA:
echo  [-] Motor VBS (Hipervisor):  %STATUS_VBS%
echo  [-] Isolamento HVCI (Memoria): %STATUS_HVCI%
echo ========================================================
echo.
echo  [1] DESATIVAR VBS/HVCI (Melhor desempenho em Jogos)
echo  [2] REATIVAR VBS/HVCI  (Padrao de Seguranca do Windows)
echo  [3] SAIR
echo.
echo ========================================================
echo.
set /p opcao="Escolha uma opcao (1, 2 ou 3): "

if "%opcao%"=="1" goto DESATIVAR
if "%opcao%"=="2" goto REATIVAR
if "%opcao%"=="3" exit
goto MENU

:DESATIVAR
cls
echo [!] Desativando o HVCI (Integridade da Memoria) no Registro...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t REG_DWORD /d 0 /f

echo [!] Desativando o VBS (Seguranca Baseada em Virtualizacao) no Boot...
bcdedit /set hypervisorlaunchtype off
goto PERGUNTA_REINICIAR

:REATIVAR
cls
echo [!] Reativando o HVCI (Integridade da Memoria) no Registro...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t REG_DWORD /d 1 /f

echo [!] Reativando o VBS (Seguranca Baseada em Virtualizacao) no Boot...
bcdedit /set hypervisorlaunchtype auto
goto PERGUNTA_REINICIAR

:PERGUNTA_REINICIAR
echo.
echo ========================================================
echo Configuracoes aplicadas com sucesso!
echo O computador PRECISA ser reiniciado para surtir efeito.
echo ========================================================
echo.
set /p reiniciar="Deseja reiniciar o computador agora? (S/N): "
if /i "%reiniciar%"=="S" (
    shutdown /r /t 0
) else (
    echo.
    echo Modificacoes salvas. Lembre-se de reiniciar manualmente depois!
    pause
    exit
)
