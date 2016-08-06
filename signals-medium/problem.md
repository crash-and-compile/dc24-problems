<!-- RATING: MEDIUM -->
<!-- NAME:  SIGNALS -->
<!-- GENERATOR: generate.pl -->
# SIGNALS - Medium

Bravo team has been intercepting transmissions from AI-controlled monitoring stations near major cities. These transmissions appear to assist the AI agents in determining appropriate targets for their attacks, although our cryptanalysts have not been able to determine how. 

Your job is to decipher the encoding scheme and provide our crypto team with the messages being passed.


## INPUT
Each line contains an indication of the voltage for the signal at a given time. No indicators are provided to help you track the period of time between bits. The stream can be interpreted as follows:

	Line contains '     #' : High voltage measured
	Line contains '######' : Change in voltage
	Line contains '#     ' : Low voltage measured


NOTE: Multiple input case are separated by a line of percent signs

## OUTPUT
Output the message encoded in the signal.

NOTE: Solutions to test cases should *not* be separated by a line of percent signs.

## SAMPLE INPUT
<a target=new href='/include/signals-medium-input.txt'>Sample Input File</a>

## SAMPLE OUTPUT
<a target=new href='/include/signals-medium-output.txt'>Sample Output File</a>
