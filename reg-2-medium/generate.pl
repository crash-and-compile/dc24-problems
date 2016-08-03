#!/usr/bin/perl
use List::Util 'shuffle';
use GD;
use GD::Image;
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
	my $diff = "MEDIUM";
	my @prev = qw(
	00
	01
	11
	10
	);
	my %grey2bin = ();
	my %bin2dec = ();
	my %grey2bin = ();
	my %bin2grey = ();
	my $max = 0;
	#open(TRACK,">codelist.txt");
	my @codes = ();
	my %dec2ascii = ();
	my %ascii2bin = ();
	my @ascii = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','.',',','!','?',' ');
	my @asciibin = ('01000001','01000010','01000011','01000100','01000101','01000110','01000111','01001000','01001001','01001010','01001011','01001100','01001101','01001110','01001111','01010000','01010001','01010010','01010011','01010100','01010101','01010110','01010111','01011000','01011001','01011010','01100001','01100010','01100011','01100100','01100101','01100110','01100111','01101000','01101001','01101010','01101011','01101100','01101101','01101110','01101111','01110000','01110001','01110010','01110011','01110100','01110101','01110110','01110111','01111000','01111001','01111010','00101110','00101100','00100001','00111111','00100000');
	my $cnt = 0;
	foreach $ascii (@ascii){
		$ascii2bin{$ascii[$cnt]} = $asciibin[$cnt];
		$bin2ascii{$asciibin[$cnt]} = $ascii[$cnt];
		$cnt++;
	}
	for(my $n = 3; $n < 9; $n++){
		my @new = ();
		foreach my $a (@prev){
			push(@new,"0".$a);
		}
		foreach my $a (reverse @prev){
			push(@new,"1".$a);
		}
		for(my $n = 0; $n < @new; $n++){
			my $nbin = unpack("B32", pack("N", $n));
			$nbin =~ s/^0+(?=\d)//;
			$nbin = "0"x((length($new[$n]))-(length($nbin))) . "$nbin";
			my $gn = unpack("N", pack("B32", substr("0" x 32 . $new[$n], -32)));
			my $val = "$n $nbin $new[$n] $gn";
			#print TRACK "$val\n";
			push(@codes,$val);
			$bin2dec{$nbin} = $n;
			$grey2bin{$new[$n]} = $nbin;
			$bin2grey{$nbin} = $new[$n];
			if($n > $max){ $max = $n;}
		}
		@prev = @new;
	}
	close TRACK;


	if($diff eq "MEDIUM"){
		my @strings = ('Excellent work.','Not such a grey area huh?','Greyt job hahaha.','Solution is satisfactory.','Is this problem greyting on you yet?','What about a silver lining to this cloud?');
		my $choice = $strings[int(rand(@strings))];
		my $random = int(rand($max));
		my @toencode = split(//,$choice);
		my @coded = ();
		foreach my $toencode (@toencode){
			push(@coded,$bin2dec{$bin2grey{$ascii2bin{$toencode}}});
		}
		my $coded = join(" ",@coded);
		print INFILE "$coded\n";
		print OUTFILE "$choice\n";		
	}

	print INFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
	print OUTFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
}
