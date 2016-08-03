<!-- RATING: EASY -->
<!-- NAME: GENETICS -->
<!-- GENERATOR: generate.pl -->
# GENETICS

The AI has been developing biological vectors to target portions of the human genome. When successful, these modifications allow the AI to 
influence human behavior at a genetic level, which could undermine human resistance forces.

Our scientists are working on a method to detect some of these attacks, and identify individuals that may be susceptible to attack. Unfortunately, 
they are experiencing some issues with the samples they are working on. A string of DNA contains Adenine, Thymine, Guanine and Cytosine 
nucleotides. Guanine is always paired with Cytosine, and Adenine is always paired with Thymine. Each DNA strand also has a primary and 
complimentary strand that, together, form a double-helix structure. The scientists have determined that some of the samples they are working are 
missing some of the nucleotides that are needed for analysis. Your job is to help reconstruct the DNA strands so that they have complete data to 
work with.

## INPUT
You will be given a representation of the DNA structure with the primary strand using capital letters for the nucleotides (A=Adenine, C=Cytosine, etc.) and with the complimentary strand using lowercase letters to represent nucleotides (a=adenine, c=cytosine, etc.). A ? indicates a missing nucleotide.

NOTE: Multiple input case are seperated by a line of percent signs

## OUTPUT
Output the same DNA strand, with the correct nucleotides instead of question marks.

NOTE: Solutions to test cases should be seperated by a line of percent signs just like the input

## SAMPLE INPUT
      At      
      T=a     
     C====g   
    A======?  
   G========? 
 T==========a 
C============g
T============a
 C==========g 
 A========t   
  C======g    
   T====a     
     T==a     
      c?      
     c--G     
    g----C    
   ?------A   
  a--------T  
 g----------C 
 ?----------A 
 g--------C   
  g------C    
   a----T     
    a--T      
      Cg      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      At      
      T=a     
     C====g   
    A======?  
   G========? 
 T==========a 
C============g
T============a
 C==========g 
 A========t   
  C======g    
   T====a     
     T==a     
      c?      
     c--G     
    g----C    
   ?------A   
  a--------T  
 g----------C 
 ?----------A 
 g--------C   
  g------C    
   a----T     
    a--T      
      Cg      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

## SAMPLE OUTPUT
      At      
      T=a     
     C====g   
    A======t  
   G========c 
 T==========a 
C============g
T============a
 C==========g 
 A========t   
  C======g    
   T====a     
     T==a     
      cG      
     c--G     
    g----C    
   t------A   
  a--------T  
 g----------C 
 t----------A 
 g--------C   
  g------C    
   a----T     
    a--T      
      Cg      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      At      
      T=a     
     C====g   
    A======t  
   G========c 
 T==========a 
C============g
T============a
 C==========g 
 A========t   
  C======g    
   T====a     
     T==a     
      cG      
     c--G     
    g----C    
   t------A   
  a--------T  
 g----------C 
 t----------A 
 g--------C   
  g------C    
   a----T     
    a--T      
      Cg      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
