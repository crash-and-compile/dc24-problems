#!/usr/bin/perl

($problem_file, $solution_file) = @ARGV;
open(INFILE,">input/$problem_file");
open(OUTFILE,">output/$solution_file");
my $type = "";
my $string = "";
my $phrase = "";
my $diff = "MEDIUM";
if($diff eq "MEDIUM"){
	$type = "NRZI";
	$phrase = int(rand(1000)) . " REPORTING IN STATUS " . int(rand(50));
	my @chars = split(//,$phrase);
	foreach my $char (@chars){
		my $bin = unpack("B*", $char);
		$string .= $bin;
	}
}
my @bits = split(//,$string);
if($type eq "NRZI"){
	my $side = 0;
	foreach my $bit (@bits){
		if($bit == 1){
			print INFILE "######\n";
			$side = (($side + 1)%2);
			if($side == 0){
				print INFILE "#     \n";
				print INFILE "#     \n";
				print INFILE "#     \n";
				print INFILE "#     \n";
				print INFILE "#     \n";
			} else {
				print INFILE "     #\n"; 
				print INFILE "     #\n"; 
				print INFILE "     #\n"; 
				print INFILE "     #\n"; 
				print INFILE "     #\n";
			} 
		} else {
			if($side == 0){
				print INFILE "#     \n";
				print INFILE "#     \n";
				print INFILE "#     \n";
				print INFILE "#     \n";
				print INFILE "#     \n";
				print INFILE "#     \n";
			} else {
				print INFILE "     #\n"; 
				print INFILE "     #\n"; 
				print INFILE "     #\n"; 
				print INFILE "     #\n"; 
				print INFILE "     #\n"; 
				print INFILE "     #\n";
			} 
		}
	}
	print OUTFILE "$phrase";	
}
