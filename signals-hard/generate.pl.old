#!/usr/bin/perl

($problem_file, $solution_file) = @ARGV;
open(INFILE,">input/$problem_file");
open(OUTFILE,">output/$solution_file");
my $type = "";
my $string = "";
my $phrase = "";
my $diff = "HARD";
if($diff eq "HARD"){
	$type = "MANCHESTER";
	$phrase = int(rand(1000)) . " DETECTING TARGET NEAR NODE " . int(rand(100));
	my @chars = split(//,$phrase);
	foreach my $char (@chars){
		my $bin = unpack("B*", $char);
		$binsev = substr($bin,1,7);
		$string .= $binsev;
	}
}
my @bits = split(//,$string);
if($type eq "MANCHESTER"){
	my $side = 0;
	my $bitcnt = 0;
	foreach my $bit (@bits){
		if($bitcnt == 0){
			if($bit == 1){
				print INFILE "#     \n"; 
				print INFILE "#     \n"; 
				print INFILE "#     \n"; 
				print INFILE "######\n"; 
				print INFILE "     #\n"; 
				print INFILE "     #\n";
			} else {
				print INFILE "     #\n"; 
				print INFILE "     #\n"; 
				print INFILE "     #\n"; 
				print INFILE "######\n"; 
				print INFILE "#     \n"; 
				print INFILE "#     \n";
			}
		} else {
			if($bit == 1){
				if($bits[$bitcnt - 1] == 1){
					print INFILE "######\n"; 
					print INFILE "#     \n"; 
					print INFILE "#     \n"; 
					print INFILE "######\n"; 
					print INFILE "     #\n"; 
					print INFILE "     #\n";				
				} else {
					print INFILE "#     \n"; 
					print INFILE "#     \n"; 
					print INFILE "#     \n"; 
					print INFILE "######\n"; 
					print INFILE "     #\n"; 
					print INFILE "     #\n";				
				
				}
			} else {
				if($bits[$bitcnt - 1] == 0){
					print INFILE "######\n"; 
					print INFILE "     #\n"; 
					print INFILE "     #\n"; 
					print INFILE "######\n"; 
					print INFILE "#     \n"; 
					print INFILE "#     \n";
				} else {
					print INFILE "     #\n"; 
					print INFILE "     #\n"; 
					print INFILE "     #\n"; 
					print INFILE "######\n"; 
					print INFILE "#     \n"; 
					print INFILE "#     \n";
				}
			}
			
		}
		$bitcnt++;		
	}
	print OUTFILE "$phrase";	

}
