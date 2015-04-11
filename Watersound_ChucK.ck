SerialIO.list() @=> string list[];
Gain master =>  dac;

SinOsc s1 => LPF low  => master;


Rhodey piano => master;
[54, 56, 54, 80, 52, 25, 61] @=> int x[];

0.07 => master.gain;



for(int i; i < list.cap(); i++)
{
    chout <= i <= ": " <= list[i] <= IO.newline();
}

0 => int device;
if(me.args()) me.arg(0) => Std.atoi => device;

SerialIO cereal;
cereal.open(device, SerialIO.B9600, SerialIO.ASCII);

while(true)
{
    cereal.onInts(4) => now;
    cereal.getInts() @=> int ints[];
    chout <= "ints: ";
   for(int i; i < ints.cap(); i++)
    {
        chout <= ints[i] <= " ";
  
        [ints[0], ints[1], ints[2], ints[3]] @=> int A[];
        for( 0 => int b; b < A.cap(); b++) // if i is less than the max No of A[]
    
{
       
  Std.ftom(A[b]*10) => s1.freq;
    50 => low.freq;
    0.4 => s1.gain;


    for( 0 => int z; z < x.cap(); z++)
    {
    
 x[z]   => piano.freq;
    }
        0.4 => piano.gain;
 
   Math.sin(A[b]*2) => piano.noteOn;

0.01::ms => now;
    }
}
    chout <= IO.newline();
    
 

  
}
