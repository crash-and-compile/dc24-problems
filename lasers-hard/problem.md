<!-- RATING: HARD -->
<!-- NAME: LASERS -->
<!-- GENERATOR: generate.pl -->
# LASERS

Charlie team has infiltrated an AI facility used to manufacture autonomous drones. However, they are currently exposed in a warehouse with a complicated security system barring further progress. They have identified the system as a multi-level laser grid, and the lasers operate outside of the 400nm ~ 700nm range so are invisible. There is a series of mirrors used to reflect the laser across segments of the warehouse, but they have no way of knowing where to place reflectors to disable detection.

Your job is to analyze the grid, and determine where the laser exits the grid. The teams have provided an ASCII representation of the mirror layout. The grid has boundaries represented by a + character, and mirrors represented by either / or \. The entry point is marked by an S. For orientation, the top side is UP, the bottom is DOWN, the left side is LEFT, the right side is RIGHT. Each layer of the grid is labelled with a number. If the S is on the LEFT wall, the laser starts moving from left to right on the same level, if it is on the UP wall, it starts moving from up to down on the same level, and so on. If moving left and the laser hits a /, it will change direction to move up. If the laser is moving up and hits a / mirror, it will change direction to go right. Basically, a mirror indicates a 90 degree change in direction.

Similar to Bravo teams findings, mirrors appear to switch directions after being hit, changing from \ to / and vice versus. However, ONLY the mirror that was hit switches directions.

Charlie team has also identified unique + and - mirror configurations. If the laser encounters a + mirror, the laser is shifted up 1 level and continues on its original path. If it encounters a - mirror, it shifts down a level. These mirror configurations do not shift after being hit.

## INPUT
The input consists of an ascii representation of the walls and mirrors for each of the eight levels, plus a start point S. The grid for each level is 20x20 characters, with the level number in the upper left corner for that level. The exit points are referred to using the side reference and numbers 1 through 18 as follows (showing level 4 as an example): 
     UUUUUUUUUUUUUUUUUU
     123456789111111111
              012345678
    4###################
 L1 #                  # R1
 L2 #                  # R2
 L3 #                  # R3
 L4 #                  # R4
 L5 #                  # R5
 L6 #                  # R6
 L7 #                  # R7
 L8 #                  # R8
 L9 #                  # R9
L10 #                  # R10
L11 #                  # R11
L12 #                  # R12
L13 #                  # R13
L14 #                  # R14
L15 #                  # R15
L16 #                  # R16
L17 #                  # R17
L18 #                  # R18
    ####################
     DDDDDDDDDDDDDDDDDD
     123456789111111111
              012345678
	      
## OUTPUT
Output the exit point for the laser, indicating level,side,and row/column.

## SAMPLE INPUT
1###################
#      /    \     \#
# /           /    #
#          /       #
#/          \/  +  #
#    /   ++        #
#            \ /\  #
#    \     \       #
#  \             /\#
#   /            /+#
#\  \       \      #
#   //  / \      \ #
#  \       \      /#
#      + /        +#
#       /        / #
#  \    +        + #
#    \             #
#\     / +         #
#+          \   \  #
####################
.
.(levels 2-7 ommitted for brevity)
.
8###################
#/  \/     /-      #
#                  #
#        / /  - /  #
#   \              #
#  \     \         #
#    \\   /     /  #
#\\                #
#     -         \  #
#     \\    /   -  #
#                  #
# -   / /        -/#
#    /          \ \#
#               / /#
#/   / /         / #
#     /   \   -    #
#      -       \\  #
#    \     /  -    #
#  \       -\      #
####################

## SAMPLE OUTPUT
4R11
