<!-- RATING: EASY -->
<!-- NAME:  SIGNALS -->
<!-- GENERATOR: generate.pl -->
# SIGNALS - Easy

Alpha team has been intercepting transmissions from AI control nodes that need to be deciphered. This first batch of signals were detected coming out of a central facility that we think is being used for supporting encrypted messages between AI control cells. Initial indications are that the signals are some sort of random number generator, but it is unknown how the signals are encoding bits.

Your job is to decipher the encoding scheme and provide our crypto team with the bit stream being used for encryption.


## INPUT
Each line contains an indication of the voltage for the signal at a given time. Additionally, a | or + is provided to help you track the period of time between measurements. The stream can be interpreted as follows:

	Line starts with + : Indicates the end of a bit transmission
	Line starts with | : Indicates the interim period for a single bit
	Line contains '     #' : High voltage measured
	Line contains '######' : Change in voltage
	Line contains '#     ' : Low voltage measured

For this encoding, the first bit being transmitted is always 0.

NOTE: Multiple input case are seperated by a line of percent signs

## OUTPUT
Output the string of bits being transmitted.

NOTE: Solutions to test cases should be seperated by a line of percent signs just like the input

## SAMPLE INPUT
<a target=new href='/include/signals-easy-input.txt'>Sample Input File</a>

## SAMPLE OUTPUT
<a target=new href='/include/signals-easy-output.txt'>Sample Output File</a>
