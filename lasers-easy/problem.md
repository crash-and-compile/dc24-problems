<!-- RATING: EASY -->
<!-- NAME: LASERS -->
<!-- GENERATOR: generate.pl -->
# LASERS

Alpha team has infiltrated an AI facility used to manufacture chip components. However, they are currently exposed in a hallway with a complicated security system barring further progress. They have identified the system as a laser grid, and the lasers operate outside of the 400nm ~ 700nm range so are invisible. There is a series of mirrors used to reflect the laser across segments of the hallway, but they have no way of knowing where to place reflectors to disable detection.

Your job is to analyze the grid, and determine where the laser exits the grid. The teams have provided an ASCII representation of the mirror layout. The grid has boundaries represented by a + character, and mirrors represented by either / or \. The entry point is marked by an S. For orientation, the top side is UP, the bottom is DOWN, the left side is LEFT, the right side is RIGHT. If the S is on the LEFT wall, the laser starts moving from left to right, if it is on the UP wall, it starts moving from up to down, and so on. If moving left and the laser hits a /, it will change direction to move down. If the laser is moving up and hits a / mirror, it will change direction to go right. Basically, a mirror indicates a 90 degree change in direction.

## INPUT
The input consists of an ascii representation of the walls and mirrors, plus a start point S. The grid is 20x20 characters. The exit points are referred to using the side reference and numbers 1 through 18 as follows: 

	     UUUUUUUUUUUUUUUUUU
	     123456789111111111
	              012345678
	    ++++++++++++++++++++
	 L1 +                  + R1
	 L2 +                  + R2
	 L3 +                  + R3
	 L4 +                  + R4
	 L5 +                  + R5
	 L6 +                  + R6
	 L7 +                  + R7
	 L8 +                  + R8
	 L9 +                  + R9
	L10 +                  + R10
	L11 +                  + R11
	L12 +                  + R12
	L13 +                  + R13
	L14 +                  + R14
	L15 +                  + R15
	L16 +                  + R16
	L17 +                  + R17
	L18 +                  + R18
	    ++++++++++++++++++++
	     DDDDDDDDDDDDDDDDDD
	     123456789111111111
	              012345678

NOTE: Multiple input case are seperated by a line of percent signs

## OUTPUT
Output the exit point for the laser.

NOTE: Solutions to test cases should be seperated by a line of percent signs just like the input

## SAMPLE INPUT
++++++++++++++++++++
+/      \          +
+  /   \/      \   +
+    \/   \     /  +
+                  +
+      \     \    \+
+     \    //  /   +
+/                 +
+                  +
+    \             +
+  \  /\  \ /    / +
+       \\ /    // +
+/   \ /           +
+        \         +
+                  +
+                  +
+   /  \/     /\   +
+                  +
+ \                +
++++++++S+++++++++++
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
++++++++++++++++++++
+/      \          +
+  /   \/      \   +
+    \/   \     /  +
+                  +
+      \     \    \+
+     \    //  /   +
+/                 +
+                  +
+    \             +
+  \  /\  \ /    / +
+       \\ /    // +
+/   \ /           +
+        \         +
+                  +
+                  +
+   /  \/     /\   +
+                  +
+ \                +
++++++++S+++++++++++
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

## SAMPLE OUTPUT
U14
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
U14
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
