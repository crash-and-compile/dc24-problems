<!-- RATING: HARD -->
<!-- NAME:  CROSSING LINES -->
<!-- GENERATOR: generate.pl -->
# CROSSING LINES - Hard

Our agents have infiltrated a compromised facility where AI operatives have rewired the cables. The agents have the original connection diagrams on site, but are having difficulty establishing which connections have been rewired. Some idiot used the same color for all the networking cables. They need your assistance deciphering which cables are plugged into to which ports. If they disconnect the wrong cables, the AI will know it has been discovered. It is critical that this not happen.

## INPUT
Agents have sent along a Base64-encoded string. When decoded, this string contains a JPG image showing the current layout of the cables:

<img src='/include/crossed-hard-sample.jpg'>

At the top, cables are labeled A,B,C, and D. The ports are labelled 1,2,3, and 4 at the bottom.

NOTE: Multiple input case are seperated by a line of percent signs

## OUTPUT
You must output the cables and the ports they are plugged into, starting with A and ending with D, as shown below.

NOTE: Solutions to test cases should be seperated by a line of percent signs just like the input

## SAMPLE INPUT
<a target=new href='/include/crossed-hard-input.txt'>Sample Input File</a>
## SAMPLE OUTPUT
<a target=new href='/include/crossed-hard-output.txt'>Sample Output File</a>
