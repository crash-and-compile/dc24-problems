<!-- RATING: MEDIUM -->
<!-- NAME: GENETICS -->
<!-- GENERATOR: generate.pl -->
# GENETICS

As you may know, DNA consists of nucleotide pairs (A with T, and C with G). A set of three nucleotides is called a codon, and depending on the nucleotides it will create different proteins. For example, TTT will generate one protein, while TGC will create a different one. This is ultimately accomplished using a process called transcription, where the DNA helix is pulled apart by RNA-polymerase and used to build strands of RNA. The important thing to note here is that RNA-polymerase works in different "directions" on the two seperate strands. For example, the in the following sample, the primary strand uses A,T,G, and C to represent nucleotides, while the complimentary strand uses a,t,g and c:

	    G======c  
	   T========a 
	 A==========t 
	T============a
	A============t
	 G==========c 
	 T========a   
	  A======t    
	   G====c    
   
While being transcribed, RNA will process the primary strand and see the GTA,TAG and TAG codons (in order), while the complimentary strand is processed the other direction and will see CTA,CTA, and TAC.

We have discovered that the AI's biological agents cause certain proteins to be disabled in the body by modifying specific nucleotide sequences. Our scientists have established a method for detecting DNA samples of individuals that have been targeted by the AI using their biological attacks, but so far their efforts are tedious and time consuming. Once modified by the AI agents, the synthetic DNA strands contain a much lower variance in the number of proteins created, vis a vis a much smaller set of unique codons. In general, a human strand with have 6 unique codons for every 10 total identified codons (or 30 nucleotides), essentially a diversity rating of 60%. Anything below that, we have to consider the sample as synthetic. For the sample above, we have the following unique codons present:

	GTA
	TAG
	CTA
	TAC

That's 4 unique codons out of 6, or a 66.7% diversity rating, so this sample is human.

Your job is to provide automated detection software that can quickly determine the number of unique codons, and whether a sample is human or synthetic. 

## INPUT
You will be given a representation of the DNA structure with the primary strand using capital letters for the nucleotides (A=Adenine, C=Cytosine, etc.) and with the complimentary strand using lowercase letters to represent nucleotides (a=adenine, c=cytosine, etc.). You must analyze this sample to determine the number of codons represented in the strand.

NOTE: Multiple input case are seperated by a line of percent signs

## OUTPUT
You must output the number of unique codons and whether the same is HUMAN or SYNTHETIC.

NOTE: Solutions to test cases should be seperated by a line of percent signs just like the input

## SAMPLE INPUT
<a target=new href='/include/genetics-medium-input.txt'>Sample Input File</a>
## SAMPLE OUTPUT
<a target=new href='/include/genetics-medium-output.txt'>Sample Output File</a>
