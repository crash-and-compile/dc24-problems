#!/usr/bin/perl
use MIME::Base64;
use MIME::Base32;
use Convert::Ascii85;
use Text::Morse;
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
	my $diff = "EASY";
	if($diff eq "EASY"){
		my @words = ('This was a test','Good job','You should try a harder problem','Well done','Way to go','You may have some potential','Not bad at all','RANDOM');
	#	my @words = ('RANDOM','RANDOM');
		my $choice = $words[int(rand(@words))];	
		if($choice eq "RANDOM"){
			$choice = "RANDOM NUMBER IS " . int(rand(100));
			$choice =~ s/0/5/g;
		}
		#print "$choice\n";
		my $morse = new Text::Morse;
		my $input = scalar($morse->Encode($choice));
		$input =~ s/\n//g;
		my $output = scalar($morse->Decode($input)); 
		#print "$input\n";
		#print "$output\n";
		print INFILE "$input\n";
		print OUTFILE "$output\n";

	}

	print INFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
	print OUTFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
}
