@echo off

:: START TOR SERVICE
ECHO Start Tor service 
sc start tor

:: START PRIVOXY SERVICE
ECHO Start Privoxy service 
sc start privoxy

pause