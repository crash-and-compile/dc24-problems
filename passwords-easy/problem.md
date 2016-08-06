<!-- RATING: EASY -->
<!-- NAME: PASSWORDS -->
<!-- GENERATOR: generate.py -->
# GET CRACKING! - Easy

Thanks to a successful infiltration by Lyle, we have been able to gain valuable
information about the Alliance's Facebook password.  Unfortunately, he clicked
on a pop-up ad and is now busy disinfecting his computer. Lyle was attempting
to exploit a side-channel attack wherein the compression algorithm leaks
valualble information if the attempt is a prefix or suffix of the real
password.

There's only one more password attempt left before the account is locked. We
know you have it in you to get into that site and post embarrassing content,
further weakening the Alliance cause.

Good luck, recruit!

## INPUT

The input consists of one password attempt per line followed by the number of
matching characters. The matching characters are always a prefix or a suffix of
the input password, and they will match either a prefix or a suffix of the
target password. Note that it doesn't matter which end is matching; a prefix of
the input password may match the suffix of the target password. If both a
prefix and a suffix of the password attempt match the the target password, the
longer of the two matches is returned.

## OUTPUT

Output is the password that will definitely make you a Twitter star!

NOTE: Solutions to test cases should *not* be separated by a line of percent signs.

## SAMPLE INPUT
	TABC 1
	DEEF 1
	GHSI 1
	JKLT 1
	TEMN 2
	OPQT 1
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	LANDQVJXCB 4
	ESLA 2
	ZENQNE 0
	XVGYLA 2
	QN 0
	EHFJYGTLAND 4
	LMUNPZ 1
	ARKSZGDXPD 4
	RNWEDKS 2
	LANJGOUZRB 3
	FOKS 2
	LWCH 1
	MARKSEEFLFBJG 5
	LVGZPPJQFMARKS 5
	LAUROKQWJ 2
	DTUULAN 3
	KSTIJYAOP 2
	YCWLAN 3
	PMPXPFHIFL 1
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

## SAMPLE OUTPUT
	TEST
	LANDMARKS

