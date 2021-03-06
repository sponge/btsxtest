@echo off

REM ============================[ VARIABLES ]================================
SETLOCAL
SET JAVAEXE=
SET JAVAOPTS=-Xms64M -Xmx784M
SET JAVAJAR=jar\doomtools-2020.07.26.030547434.jar
SET MAINCLASS=net.mtrop.doom.tools.WADTexMain
REM =========================================================================

REM ===== Java Scan

if exist "%~dp0\jre\bin\java.exe" SET JAVAEXE=%~dp0\jre\bin\java.exe
if not "%JAVAEXE%"=="" goto _calljava

where java > nul
if ERRORLEVEL == 0 SET JAVAEXE=java
if not "%JAVAEXE%"=="" goto _calljava

if not %JAVA_HOME%=="" SET JAVAEXE=%JAVA_HOME%\bin\java.exe
if not "%JAVAEXE%"=="" goto _calljava

if not %JDK_HOME%=="" SET JAVAEXE=%JDK_HOME%\bin\java.exe
if not "%JAVAEXE%"=="" goto _calljava

if not %JRE_HOME%=="" SET JAVAEXE=%JRE_HOME%\java.exe
if not "%JAVAEXE%"=="" goto _calljava

REM ===== No Java.

echo Java 8 or higher could not be detected. To use these tools, a JRE must be 
echo installed.
echo.
echo The enviroment variables JAVA_HOME, JRE_HOME, or JDK_HOME are not set to 
echo your JRE or JDK directories, nor were Java binaries detected on your PATH.
echo.
echo For help, visit https://www.java.com/.

goto _end

REM =========================

:_calljava
"%JAVAEXE%" -cp "%~dp0\%JAVAJAR%" %JAVAOPTS% %MAINCLASS% %*

:_end
ENDLOCAL
