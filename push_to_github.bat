@echo off
title Push KDE Defense Project to GitHub
echo ========================================================
echo  Pushing KDE-Federated-Learning-Defense to GitHub
echo  Remote: https://github.com/syedmoazam02/KDE-Federated-Learning-Defense.git
echo  Branch: main
echo ========================================================
git push -u origin main
echo.
if %ERRORLEVEL% EQU 0 (
    echo [SUCCESS] Repository pushed to GitHub successfully!
) else (
    echo [NOTICE] If the repository was not found, make sure you created
    echo an empty repository named 'KDE-Federated-Learning-Defense' at:
    echo https://github.com/new
)
pause
