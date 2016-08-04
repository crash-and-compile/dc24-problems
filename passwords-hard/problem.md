<!-- RATING: HARD -->
<!-- NAME: PASSWORDS -->
<!-- GENERATOR: generate.py -->
# GET CRACKING!

Thanks to a successful infiltration by Ms. Y, we have discovered that AI had a
backdoor password installed before turning evil. (It's always good to plan for
disaster.) The AI, however, found out and Ms. Y is now Ms. ex-Y, if you catch
my meaning. It's now up to you to save our species.

Despite the quantum encryption used by the AI, the Lightman Password "Recovery"
Tool was able to discover some information that may be helpful. Due to an
opportune early return from the password checker, we are able to determine the
number of correct characters in the attempt.

Mostly.

Timing attacks are imprecise and the number of "correct" characters may be
slightly off. We're sure this won't be a problem for you, though, since your
work is generally pretty sloppy. Just muddle through it like you always do, and
I'm sure you'll get it on the first try.

## INPUT

The input consists of one password attempt per line followed by the approximate
number of matching characters in that attempt.

## OUTPUT

Output is the password matching the conditions of the input.

## SAMPLE INPUT
TABC 1
DEEF 1
GHSI 1
JKLT 1
TEMN 2
OPQT 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TABC 1
DEEF 1
GHSI 1
JKLT 1
TEMN 2
OPQT 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

## SAMPLE OUTPUT
TEST
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TEST
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

