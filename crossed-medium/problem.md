<!-- RATING: MEDIUM -->
<!-- NAME:  CROSSING LINES -->
<!-- GENERATOR: generate.pl -->
# CROSSING LINES

Multiple explosive devices have been discovered implanted into critical infrastructure. The devices have a complicated wiring structure in the detanator that has multiple trigger lines twisted together. Given the number of devices discovered, this poses a significant threat to national infrastructure, and the agents are exhausted. They have identified the incoming wire that must be disconnected, but they are seeing double and need your assistance. They don't trust their judgement in cutting the right wire. 

## INPUT
Agents have passed along sketches of the wiring in various devices. The first input line lists the wire that must be tracked. The second input line has labels for each of the wires. This is followed by a diagram of how the wires are laid out. Fairly self explanatory:

	X Y
	| |  Indicates X connects to A, Y connects to B
	A B

	X Y
	\ /
	 x   Indicates X crosses over Y, so X connects to B and Y connects to A
	/ \
	A B


NOTE: Multiple input case are seperated by a line of percent signs

## OUTPUT
You must output in all caps (the agents are tired and don't want to mix up letters) where the desinated wire terminates. For example: X IS AT Y

NOTE: Solutions to test cases should be seperated by a line of percent signs just like the input

## SAMPLE INPUT
TRACK H
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 
| | | | | | | | | | | | | | | | | | | | | | | | | | 
| \ / | \ / \ / | \ / \ / | | \ / \ / | | | | | | | 
|  x  |  x   x  |  x   x  | |  x   x  | \ / | | \ / 
| / \ | / \ / \ | / \ / \ \ / / \ / \ |  x  \ /  x  
| | | | | | | | | | | | |  x  | | | | | / \  x  / \ 
\ / | \ / \ / | \ / | \ / / \ | \ / | | | | / \ | | 
 x  |  x   x  |  x  |  x  | | |  x  | | | | | | | | 
/ \ | / \ / \ | / \ | / \ | | | / \ | | | | | | | | 
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TRACK H
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 
| | | | | | | | | | | | | | | | | | | | | | | | | | 
| \ / | \ / \ / | \ / \ / | | \ / \ / | | | | | | | 
|  x  |  x   x  |  x   x  | |  x   x  | \ / | | \ / 
| / \ | / \ / \ | / \ / \ \ / / \ / \ |  x  \ /  x  
| | | | | | | | | | | | |  x  | | | | | / \  x  / \ 
\ / | \ / \ / | \ / | \ / / \ | \ / | | | | / \ | | 
 x  |  x   x  |  x  |  x  | | |  x  | | | | | | | | 
/ \ | / \ / \ | / \ | / \ | | | / \ | | | | | | | | 
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

## SAMPLE OUTPUT
H IS AT F
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
H IS AT F
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
