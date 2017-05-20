// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.


@i
M=0

(LOOP)
	@i
	D=M
	@8192 // 32 x 256
	D=D-A
	@RESET
	D;JEQ

	@KBD
	D=M
	@ON
	D;JGT

	@OFF
	0;JMP

(INCR)
	@i
	M=M+1
	
	@LOOP
	0;JMP

(RESET)
	@i
	M=0
	@LOOP
	0;JMP

	
(ON)
	@i
	D=M
	@SCREEN
	A=D+A
	M=-1
	@INCR
	0;JMP

(OFF)	
	@i
	D=M
	@SCREEN
	A=D+A
	M=0
	@INCR
	0;JMP
