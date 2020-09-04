@echo off

:: INSTALL TOR SERVICE

:: Install Tor service and configuration
ECHO Install Tor service and configuration
%~dp0tor\tor.exe --service install -options -f %~dp0tor\Data\torrc

:: Set Tor service start auto
ECHO Set Tor service start auto
sc config tor start=auto

:: Start Tor service
ECHO Start Tor service 
sc start tor

:: INSTALL PRIVOXY SERVICE

:: Install Privoxy service and configuration
ECHO Install Privoxy service and configuration
sc create privoxy displayname="Privoxy Win32 Service" binpath="%~dp0privoxy\privoxy.exe --service" 

:: Set Privoxy service description
ECHO Set Privoxy service description
sc description privoxy "Privoxy is a non-caching web proxy with advanced filtering capabilities for enhancing privacy"

:: Set Privoxy service start auto
ECHO Set Privoxy service start auto
sc config privoxy start=auto

:: Start Privoxy service
ECHO Start Privoxy service 
sc start privoxy

pause