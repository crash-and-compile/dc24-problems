#!/usr/bin/perl
use File::Path;
use File::Basename;

($problem_file, $solution_file) = @ARGV;
my $basepath = "./";
my($filename, $dirs, $suffix) = fileparse($problem_file);
unless(-d $dirs){ make_path($dirs); }
my($filename, $dirs, $suffix) = fileparse($solution_file);
unless(-d $dirs){ make_path($dirs); }
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");
my $testcases = 50;
for(my $n = 0; $n < $testcases; $n++){
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
		print OUTFILE "$string\n";	
	}

	print INFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
	#print OUTFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
}
