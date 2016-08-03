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
		print OUTFILE "$phrase\n";	
	}

	print INFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
	print OUTFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
}
