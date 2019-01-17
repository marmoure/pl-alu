/*************
   NOT
    _______
    |     |
  A-| NOT |-OUT
    |_____|
*************/
%   A  OUT
not(0,  1 ).
not(1,  0 ).

/*************
   AND Gate
    _______
  A-|     |
    | AND |-OUT
  B-|_____|
*************/
%   A  B  OUT
and(0, 0,  0 ).
and(0, 1,  0 ).
and(1, 0,  0 ).
and(1, 1,  1 ).

/*************
   OR Gate
    ______
  A-|    |
    | OR |-OUT
  B-|____|
*************/
%  A  B  OUT
or(0, 0,  0 ).
or(0, 1,  1 ).
or(1, 0,  1 ).
or(1, 1,  1 ).

/*************
   XOR Gate
    _______
  A-|     |
    | XOR |-OUT
  B-|_____|
*************/
%   A  B  OUT
xor(0, 0,  0 ).
xor(0, 1,  1 ).
xor(1, 0,  1 ).
xor(1, 1,  0 ).

/********
 
     MUX Gate

     SEL
    __|____
  A-|     |
    | MUX |-OUT
  B-|_____|
 ********/
%   A B SEL OUT

mux(A,B,0,   A).
mux(A,B,1,   B).


/********
 
 DMUX Gate

     SEL
    __|____
    |     |-A
 IN-| DMUX|
    |_____|-B
 ********/
%    IN SEL A B

dmux(IN,0,  IN,0).
dmux(IN,1,  0,IN).

/********
 
 AND16 Gate

        _______
  A[16]-|     |
        |AND16|-OUT[16]
  B[16]-|_____|
 ********/
% A[16] B[16] OUT[16]

and16([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16],[B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,B13,B14,B15,B16],[O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,O11,O12,O13,O14,O15,O16]) :-
    and(A1,B1,O1),
    and(A2,B2,O2),
    and(A3,B3,O3),
    and(A4,B4,O4),
    and(A5,B5,O5),
    and(A6,B6,O6),
    and(A7,B7,O7),
    and(A8,B8,O8),
    and(A9,B9,O9),
    and(A10,B10,O10),
    and(A11,B11,O11),
    and(A12,B12,O12),
    and(A13,B13,O13),
    and(A14,B14,O14),
    and(A15,B15,O15),
    and(A16,B16,O16).

/********
 
 OR8WAY Gate
        ________
        |      |
  IN[8]-|OR8WAY|-OUT
        |______|
 ********/
% IN[8] OUT
or8way([0,0,0,0,0,0,0],0).
or8way([_,_,_,_,_,_,_],1).

/************
 * NOT 16
 * 	_________
 	|	|
 IN[16]-| NOT16 | -OUT[16]
 	|_______|

***********/
%IN[16] OUT[16]
not16([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16],[O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,O11,O12,O13,O14,O15,O16]) :-
   not(A1,O1),
   not(A2,O2),
   not(A3,O3),
   not(A4,O4),
   not(A5,O5),
   not(A6,O6),
   not(A7,O7),
   not(A8,O8),
   not(A9,O9),
   not(A10,O10),
   not(A11,O11),
   not(A12,O12),
   not(A13,O13),
   not(A14,O14),
   not(A15,O15),
   not(A16,O16).

/********
 
 MUX16 Gate

	 sel
        __|_____
  A[16]-|     |
        |MUX16|-OUT[16]
  B[16]-|_____|
 ********/
% A[16] B[16] sel OUT[16]

and16([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16],[B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,B13,B14,B15,B16],sel,[O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,O11,O12,O13,O14,O15,O16]) :-
    mux(A1,B1,sel,O1),
    mux(A2,B2,sel,O2),
    mux(A3,B3,sel,O3),
    mux(A4,B4,sel,O4),
    mux(A5,B5,sel,O5),
    mux(A6,B6,sel,O6),
    mux(A7,B7,sel,O7),
    mux(A8,B8,sel,O8),
    mux(A9,B9,sel,O9),
    mux(A10,B10,sel,O10),
    mux(A11,B11,sel,O11),
    mux(A12,B12,sel,O12),
    mux(A13,B13,sel,O13),
    mux(A14,B14,sel,O14),
    mux(A15,B15,sel,O15),
    mux(A16,B16,sel,O16).


% still shit ton of stuff
%
%
% the final step is the ALU 
%
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/02/ALU.hdl

/**
 * The ALU. Computes one of the following functions:
 * x+y, x-y, y-x, 0, 1, -1, x, y, -x, -y, !x, !y,
 * x+1, y+1, x-1, y-1, x&y, x|y on two 16-bit inputs, 
 * according to 6 input bits denoted zx,nx,zy,ny,f,no.
 * The bit-combinations that yield each function are 
 * documented in the book. In addition, the ALU 
 * computes two 1-bit outputs: if the ALU output
 * is 0, zr is set to 1; otherwise zr is set to 0;
 * If out<0, ng is set to 1; otherwise ng is set to 0.

// Implementation: the ALU manipulates the x and y
// inputs and then operates on the resulting values, 
// as follows:
// if (zx==1) set x = 0        // 16-bit constant
// if (nx==1) set x = ~x       // bitwise "not"
// if (zy==1) set y = 0        // 16-bit constant
// if (ny==1) set y = ~y       // bitwise "not"
// if (f==1)  set out = x + y  // integer 2's complement addition
// if (f==0)  set out = x & y  // bitwise "and"
// if (no==1) set out = ~out   // bitwise "not"
// if (out==0) set zr = 1
// if (out<0) set ng = 1

  
CHIP ALU {
    IN  
        x[16], y[16],  // 16-bit inputs        
        zx, // zero the x input?
        nx, // negate the x input?
        zy, // zero the y input?
        ny, // negate the y input?
        f,  // compute  out = x + y (if 1) or out = x & y (if 0)
        no; // negate the out output?

    OUT 
        out[16], // 16-bit output
        zr, // 1 if (out==0), 0 otherwise
        ng; // 1 if (out<0),  0 otherwise

    PARTS:

    ///////////////
    // Starting from the input, then working towards output.

    // selecting whether to set x and y to zeros
    Mux16(a=x, b=false, sel=zx, out=x1);
    Mux16(a=y, b=false, sel=zy, out=y1);

    // now handling nx, ny
    Not16(in=x1, out=notx1);
    Mux16(a=x1, b=notx1, sel=nx, out=x2);
    Not16(in=y1, out=noty1);
    Mux16(a=y1, b=noty1, sel=ny, out=y2);

    // And, combinging them ... handling f
    And16(a=x2, b=y2, out=xandy);
    Add16(a=x2, b=y2, out=xplusy);
    Mux16(a=xandy, b=xplusy, sel=f, out=xy);

    // finally, negate the output
    // if out<0, MSB will be 1, so can set that here
    Not16(in=xy, out=notxy);
    Mux16(a=xy, b=notxy, sel=no, out[15]=ng, out[0..7]=part1, out[8..15]=part2, out=out);

    // if all of out = 0, then Or8Way(out[0..7]) or Or8Way(out[8..15]) is false ... 
    Not(in=nonzero, out=zr); 
    Or(a=or1, b=or2, out=nonzero); // checking if any digits are nonzero
    Or8Way(in=part1, out=or1); // checking each 8-bit chunk for nonzero
    Or8Way(in=part2, out=or2);
    
    
}

**/


%//MUX16 and16 not16 not or or8way
