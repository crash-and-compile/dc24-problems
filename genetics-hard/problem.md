<!-- RATING: HARD -->
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

RNA-polymerase builds the RNA strand by matching an appropriate nucleotide with the one read from the DNA strand. Instead of Thymine, though, RNA uses Uracil. So while processing the primary strand GTATAGTAG above, the resulting RNA strand would be CAUAUCAUC (with T=Thymine being replaced by U=Uracil).

Our scientists have identified some critical genetic markers that indicate whether a person is immune, susceptible, or already compromised by the AI biological agents, but so far their efforts are tedious and time consuming. They have determined that an RNA strand with AUG followed at some point down the strand by GUC indicates the sample is from a compromised human. Presence of either the AUG or GUC sections indicates susceptibility. No such sequences represents immunity.

Your job is to provide automated detection software that can quickly determine whether the genetic markers are present in a sample, and determine whether the sample indicates immunity, susceptibility, or compromise. 

## INPUT
You will be given a representation of the DNA structure with the primary strand using capital letters for the nucleotides (A=Adenine, C=Cytosine, etc.) and with the complimentary strand using lowercase letters to represent nucleotides (a=adenine, c=cytosine, etc.). You must analyze this sample to determine the corresponding RNA sequences, and determine whether the genetic markers are present and in the right order.

## OUTPUT
You must output whether the sample represents IMMUNE, SUSCEPTIBLE, or COMPROMISED .

## SAMPLE INPUT
	    G======c  
	   T========a 
	 A==========t 
	T============a
	A============t
	 G==========c 
	 T========a   
	  A======t    
	   G====c    

## SAMPLE OUTPUT
	SUSCEPTIBLE

