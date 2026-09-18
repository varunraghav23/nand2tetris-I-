CHIP Xor { 
    IN a, b; 
    OUT out;

    PARTS:
    Nand(a=a, b=b, out=aNandB); 
    Or(a=a, b=b, out=aOrB);
    And(a=aNandB, b=aOrB, out=out);
}

CHIP Mux {
    IN a, b, sel; 
    OUT out; 

    PARTS:
    Not(in=sel, out=nsel);
    And(a=a, b=nsel, out=x);
    And(a=b, b=sel, out=y);
    Or(a=x, b=y, out=out);
}

CHIP Mux4Way16 {
    IN a, b, c, d, sel;
    OUT out;
  
    PARTS:
    Mux16(a=a, b=b, sel=sel[0], out=x);
    Mux16(a=c, b=d, sel=sel[0], out=y);
    Mux16(a=x, b=y, sel=sel[1], out=out);
}

CHIP DMux {
    IN in, sel;
    OUT a, b;

    PARTS:
    Not(in=sel, out=nsel);
    And(a=in, b=nsel, out=a);
    And(a=in, b=sel, out=b);
}
