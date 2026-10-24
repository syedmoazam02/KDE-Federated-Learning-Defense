@echo off
title LoMar KDE Defense Desktop GUI
echo ===================================================
echo  Starting LoMar Federated Learning Defense GUI
echo  Author: Syed Moazam (160923748131)
echo  Dept of CSE (AIML) - 6th Semester Mini Project
echo ===================================================
cd Lomar
start python Server.py
timeout /t 2 /nobreak > nul
python Main.py
pause
