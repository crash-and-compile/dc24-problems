<!-- RATING: EASY -->
<!-- NAME:  CROSSING LINES -->
<!-- GENERATOR: generate.pl -->
# CROSSING LINES

Agents in the field have passed along tracking information for potential drones, with a specific drone of interest that is carrying a payload. Unfortunately the lists have been mixed up and the telemetry data is not ordered. Your job is to order the data, and determine the final location of the specified drone so that disposal agents can intercept.

## INPUT
You are given a list of coordinates in the form [x1,y1]->[x2,y2] indicating the drone has moved from x1,y1 to x2,y2. In some cases, the first pair of coordinates is replaced with a designator for the given drone, indicating it's start position. Following a delimiter line of '=' signs, the agents have indicated which drone must be located. 

NOTE: Multiple input case are seperated by a line of percent signs

## OUTPUT
You must fill in the correct coordinates to reflect the correct position of the missing agent. This will be in the form [Designator]->[x,y] .

NOTE: Solutions to test cases should be seperated by a line of percent signs just like the input

## SAMPLE INPUT
[E-2506]->[0,0]
[0,3]->[1,6]
[0,2]->[1,5]
[B-0626]->[0,2]
[D-3032]->[0,3]
[B-1244]->[0,4]
[B-4114]->[0,1]
[0,4]->[1,4]
[E-6872]->[0,7]
[C-8558]->[0,5]
[0,1]->[1,1]
[0,8]->[1,2]
[0,5]->[1,0]
[0,6]->[1,8]
[0,7]->[1,7]
[C-2686]->[0,8]
[0,0]->[1,3]
[D-0864]->[0,6]
====================
[B-0626]->[?]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[E-2506]->[0,0]
[0,3]->[1,6]
[0,2]->[1,5]
[B-0626]->[0,2]
[D-3032]->[0,3]
[B-1244]->[0,4]
[B-4114]->[0,1]
[0,4]->[1,4]
[E-6872]->[0,7]
[C-8558]->[0,5]
[0,1]->[1,1]
[0,8]->[1,2]
[0,5]->[1,0]
[0,6]->[1,8]
[0,7]->[1,7]
[C-2686]->[0,8]
[0,0]->[1,3]
[D-0864]->[0,6]
====================
[B-0626]->[?]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

## SAMPLE OUTPUT
[B-0626]->[1,5]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[B-0626]->[1,5]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

