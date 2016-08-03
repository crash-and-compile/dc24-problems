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
	my $diff = "MEDIUM";
	if($diff eq "MEDIUM"){
		my @words = ('This was a test, and you passed so try something harder now!','Good job, keep up the good work!','You should really challenge yourself.','You should try a harder problem, recruit.','Well done, you are showing some promise.','You may have some potential, after all.','Not bad at all, not bad at all.');
		my $choice = $words[int(rand(@words))];	
		print OUTFILE "$choice\n";
		my $width = int(rand(3)) + 2;
		#print "$width\n";
		my @chars = split(//,$choice);
		my @cipher = ();
		my $current = 0;
		foreach my $char (@chars){
			$cipher[$current] .= "$char";
			$current = ($current + 1) % $width;
		}
		my $length = length($cipher[0]);
		foreach my $row (@cipher){
			if(length($row) < $length){
				$row .= "X";
			}
		}
		my $cipher = "";
		foreach my $row (reverse @cipher){
			#print "$row\n";
			$row =~ s/ /X/g;
			$cipher .= $row;
		}
		print INFILE "$cipher\n";

	}

	print INFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
	print OUTFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
}
