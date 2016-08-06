<!-- RATING: HARD -->
<!-- NAME: PASSWORDS -->
<!-- GENERATOR: generate.py -->
# GET CRACKING! - Hard

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

NOTE: Solutions to test cases should *not* be separated by a line of percent signs.

## SAMPLE INPUT
	TABC 1
	DEEF 1
	GHSI 1
	JKLT 1
	TEMN 2
	OPQT 1
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	SLN_WQXMJ 1
	GLORXAJGP 0
	HUHKNFCC_ 1
	XUSEFAPNK 0
	YNWGK_HER 0
	OUEQEDPJW 2
	JHKXJWDER 1
	YGHHTUVAE 2
	FYIREWBBN 2
	LOTEVBWFR 1
	VFQHQQHCT 0
	URLYKY_BH 1
	ASVWLQDEK 1
	FQYBVPKKV 0
	DDNYHKIOB 1
	MHHOOCDCU 0
	DMKDZGDJB 0
	B_VQEQKTD 1
	BWMHHYITR 0
	FNVXDWTVA 0
	NKEQGXJXI 0
	YMJAJTHHH 2
	CZVCPVPDF 1
	KPMVVBORY 1
	TXATLKJLE 3
	X_GZFQ_ZL 1
	UTTMQTGJN 0
	_RAXNCVDU 0
	NNADKITEE 3
	XFOJQOVNZ 0
	FVJY_ZLWV 0
	TSIDFVCGF 0
	_JAHOMORY 1
	_WJQFNKAS 0
	EAPFGGC_K 1
	KI__ZVCWZ 0
	QOXUNANWX 1
	RSGWSNBSG 0
	IVWJUIZXS 0
	XVAOHPBNT 0
	SCPTPOD_K 0
	BBEMBSJNE 0
	XUOKRZOCQ 0
	EDGVPOYXZ 0
	KQKPAGNN_ 0
	UQWYPLPWE 2
	NRSRZTUVE 2
	IXZWSCDME 2
	BOQURJAQR 1
	ZDHTVQIBC 2
	CGFIVPAAB 0
	VLROFLTRL 0
	PSBUOYOGT 2
	ZDPOBGCME 1
	QLBUCJJHZ 1
	MCHW_MZON 0
	XAVARRPFR 0
	DIGIFAWOO 1
	DODTJENWT 0
	JDHDEJDII 1
	DETQHLQVP 1
	YGIOLDQPH 0
	LCEMPQDIH 1
	UUYHCMRYZ 0
	QWXHPMHGE 0
	_MJRHYCPC 0
	REUYOBKPS 1
	CO_QDJLXN 1
	_QJDTRJCB 0
	SMSJZNKQU 0
	KIOXWINRW 0
	HNSODN_SU 0
	AM_QMDGUW 0
	RTNQLOFIE 1
	CPFQMBMJX 0
	CTREZIVET 1
	BBPJGDKIG 1
	HFVSFGKHM 0
	TFQYFGWNX 0
	FSINSHALT 0
	QLLEAHAOC 0
	YNIIWVCEB 0
	_NFWAHLRA 1
	LFCMNAAZI 0
	_YBLUIDXN 0
	VAUVNZOGC 0
	RNO_FBNHR 0
	IMQUZWDWE 1
	RLYQHVAQQ 1
	TZCRELJJF 0
	JYQPE_WJI 0
	NESHPIBNN 0
	WKN_VRMHJ 0
	VLMKUREZS 0
	VUCKNLPGX 0
	QDRAJJDLD 0
	RKULNJQAL 0
	BDOFKZBTH 0
	MMYBYBJ_A 0
	OMWR_ZG_A 1
	HLMBYLQGE 0
	WUIIIJMCU 1
	PWDQKALC_ 1
	SY_KXRJY_ 0
	OWHBGASUX 0
	SBSVFPNSN 0
	LLXQJKPRI 0
	QVGFJXHVX 0
	CIIOSNDDJ 0
	LLPLNHQIR 0
	HKRQPENAX 1
	PQIN_JNKU 1
	OSFANFKEL 1
	XDRPEOULW 1
	AJEVVAQZQ 0
	XKOSBNO_S 0
	TTYAET_TC 2
	RHTMEZVNA 0
	UKCJBEEZ_ 0
	SRGUF_EKI 1
	FGZVSCKFG 0
	GAYWTDEYQ 0
	VOJAG_B_F 1
	CZPUPWCWU 1
	QHFQZSCVO 0
	JINTJPLMA 1
	BXKOOPLFG 0
	BNRSGV_GD 1
	NWEYAUMKI 0
	JB_JRLFUJ 0
	RERVIHCZW 2
	XXYEYGTCW 0
	MXFFBRHFQ 0
	DMUEOSRRW 1
	YTHYSPCGP 0
	IBNUDKKCX 1
	ZKDKSXKJ_ 0
	OL_HKHDSK 0
	BVAOFHWJC 0
	VWNTDCDAH 1
	SZMOISSME 1
	BA_KRPGGB 1
	JJWLWBCLM 1
	OYZOHCIFW 1
	XEYUNBHBX 2
	LOYCBKJ_N 2
	UQW_CTCPP 0
	IEGCDXLSA 2
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

## SAMPLE OUTPUT
	TEST
	PEACETIME

