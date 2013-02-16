// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/06/rect/Rect.asm

// Draws a rectangle at the top-left corner of the screen.
// The rectangle is 16 pixels wide and R0 pixels high.

(KBDLOOP)
   @KBD			// loop until key pressed
   D=M
   @KBDLOOP
   D;JEQ

   @50			// setup: rect will be 50 high
   D=A
   @R0
   M=D
   @15			// horiz offset will be 15 (middle of screen)
   D=A
   @R1
   M=D
   @100			// vert offset will be 100 (mid-screen)
   D=A
   @R2
   M=D
   
   @R0			// see if we need to do the loop at all (rect is 0 lines high)
   D=M			// D = contents of R0
   @INFINITE_LOOP
   D;JLE 		// if contents of R0 <= 0, finished
   
   
   @counter		// count down the number of lines to be drawn
   M=D			// counter = contents of R0
   
   @R2			// calculate starting address: SCREEN + 32*R2 + R1
   D=M
   @i
   M=D			// put contents of R2 into i, the loop counter
   @R13			// R13 will be the accumulator for the multiplication
   M=0
(MULT)
   @i
   D=M
   @CONTINUE	// done multiplying?
   D;JLE
   @32
   D=A
   @R13
   M=M+D
   @i
   M=M-1
   @MULT
   0;JMP
(CONTINUE)		// R13 holds the vert offset * 32
   @SCREEN
   D=A			// D = address of screen
   @R13
   D=D+M
   @R1			// R1 holds the horiz offset
   D=D+M		// D = address of screen +vert offset + horiz offset
   @address
   M=D			// var address = address of screen (pointer to screen)


(LOOP)
   @address
   A=M			// A = contents of var address
   M=-1			// fill address (screen) with black
   
   
   @address		
   D=M			// D gets contents of var address
   @32
   D=D+A		// add 32 to contents of var address
   @address
   M=D			// put that into address (have incremented address by 32, or 1 line)
   @counter
   MD=M-1		// decrement counter (originally was contents of R0)
   @LOOP
   D;JGT		// loop if counter > 0
(INFINITE_LOOP)
   @INFINITE_LOOP
   0;JMP
