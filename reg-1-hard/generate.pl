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
	my $diff = "HARD";
	if($diff eq "HARD"){
		my $pass = 0;
		my $choice = int(rand(1000))%3;
		my $outgood = "";
		my $ingood = "";
		while(!($pass == 1)){
			$pass = 0;
			my $out = int(rand(10)) . int(rand(10)) . int(rand(10)) . int(rand(10)) . int(rand(10)) . int(rand(10));
			my $base64 = encode_base64($out);
			chomp($base64);
			my $base32 = MIME::Base32::encode($out);
			chomp($base32);
			my $ascii84 = Convert::Ascii85::encode($out);
			chomp($ascii84);
			if($choice == 0){
				$ingood = $base64;
				#print "BASE 64\n";
			} elsif($choice == 1){
				#print "BASE 32\n";
				$ingood = $base32;
			} elsif($choice == 2){
				#print "ASCII 84\n";
				$ingood = $ascii84;
			} 
			my $d64 = decode_base64($ingood);
			chomp($d64);
			my $d32 = MIME::Base32::decode($ingood);
			chomp($d32);
			my $d84 = Convert::Ascii85::decode($ingood);
			chomp($d84);
			#print "$d64\n";
			#print "$d32\n";
			#print "$d84\n";
			if($d64 =~ /^\d+$/){ $pass++; }
			if($d32 =~ /^\d+$/){ $pass++; }
			if($d84 =~ /^\d+$/){ $pass++; }
			$outgood = $out;
		}
		print OUTFILE "$outgood\n";
		print INFILE "$ingood\n";
		#print "+++++++++++\n";
		#print  "$outgood\n";
		#print  "$ingood\n";
		#print "+++++++++++\n";
		#my $d64 = decode_base64($ingood);
		#chomp($d64);
		#my $d32 = MIME::Base32::decode($ingood);
		#chomp($d32);
		#my $d84 = Convert::Ascii85::decode($ingood);
		#chomp($d84);
		#print "$d64\n";
		#print "$d32\n";
		#print "$d84\n";
	}

	print INFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
	print OUTFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
}
