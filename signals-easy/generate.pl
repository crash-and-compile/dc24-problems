#!/usr/bin/perl

($problem_file, $solution_file) = @ARGV;
open(INFILE,">input/$problem_file");
open(OUTFILE,">output/$solution_file");
my $type = "";
my $string = "";
my $phrase = "";
my $diff = "EASY";
if($diff eq "EASY"){
	$type = "NRZL";
	$string = "0";
	for(my $i = 0; $i < 10; $i++){
		$string .= (int(rand(100)))%2;
	}
}
my @bits = split(//,$string);
if($type eq "NRZL"){
	my $bitref = 0;
	print INFILE "+#     \n";
	foreach my $bit (@bits){
		my $side = 0;
		if($bit eq 0){
			print INFILE "|#     \n";
			print INFILE "|#     \n";
			print INFILE "|#     \n";
			print INFILE "|#     \n";
			print INFILE "|#     \n";
			$side = 0;
		} else {
			print INFILE "|     #\n"; 
			print INFILE "|     #\n"; 
			print INFILE "|     #\n"; 
			print INFILE "|     #\n"; 
			print INFILE "|     #\n"; 
			$side = 1;
		}
		my $nextbit = $bitref + 1;
		if($bits[$bitref] ne $bits[$nextbit]){
			print INFILE "+######\n";
		} else {
			if($side eq 0){
				print INFILE "+#     \n";
			} else {
				print INFILE "+     #\n";
			}
		}
		$bitref++;
	}
	print OUTFILE "$string";	
}
