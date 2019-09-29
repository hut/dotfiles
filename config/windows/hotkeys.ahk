#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

!+Enter::Run cmd

#PgUp::Send {Volume_Up 3}
#PgDn::Send {Volume_Down 3}
!-::Send {Volume_Down 3}
!=::Send {Volume_Up 3}
!c::Send {Media_Play_Pause}
!Backspace::Send {Media_Play_Pause}
CapsLock::Esc