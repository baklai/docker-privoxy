@echo off

:: REMOVE TOR SERVICE
ECHO Stop Tor service 
sc stop tor
ECHO Remove Tor service 
sc delete tor

:: REMOVE PRIVOXY SERVICE
ECHO Stop Privoxy service 
sc stop privoxy
ECHO Remove Privoxy service 
sc delete privoxy

pause