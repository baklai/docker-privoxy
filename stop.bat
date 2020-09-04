@echo off

:: STOP TOR SERVICE
ECHO Stop Tor service 
sc stop tor

:: STOP PRIVOXY SERVICE
ECHO Stop Privoxy service 
sc stop privoxy

pause