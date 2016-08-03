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
	my $diff = "HARD";
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


	if($diff eq "HARD"){
		my $imagewidth = 200;
		my $imageheight = 200;
		my $word = $ascii[int(rand(52))] . $ascii[int(rand(52))] . $ascii[int(rand(52))] . $ascii[int(rand(52))];
		print OUTFILE "$word\n";
		$img = GD::Image->new($imagewidth,$imageheight);
		$white = $img->colorAllocate(255,255,255);
		$black = $img->colorAllocate(0,0,0);
		$red = $img->colorAllocate(255,0,0);
		$img->setThickness(3);
		my $ewidth = 200; 
		for(my $i=0;$i<6;$i++){
			$img->ellipse(100,100,$ewidth,$ewidth,$black);
			$ewidth -= 40;
		}
		my @chars = split(//,$word);
		$img->line(0,100,200,100,$black);
		$img->line(100,0,100,200,$black);
		$img->line(30,30,170,170,$black);
		$img->line(30,170,170,30,$black);
		$img->line(100,100,200,100,$red);
		my $ring = 0;
		foreach my $char (@chars){
			my $bits =  $bin2grey{$ascii2bin{$char}};
			#print "$char -> $ascii2bin{$char} -> $bits\n";
			my @bits = split(//,$bits);
			my $bitcnt = 0;
			foreach my $bit (@bits){
				if($ring == 0){
					#contact 1 bit 1
					if(($bitcnt == 0)&&($bit == 1)){
						$img->fill(122,90,$black);
					}
					#contact 1 bit 2
					if(($bitcnt == 1)&&($bit == 1)){
						$img->fill(110,70,$black);
					}
					#contact 1 bit 3
					if(($bitcnt == 2)&&($bit == 1)){
						$img->fill(90,70,$black);
					}
					#contact 1 bit 4
					if(($bitcnt == 3)&&($bit == 1)){
						$img->fill(70,90,$black);
					}
					#contact 1 bit 5
					if(($bitcnt == 4)&&($bit == 1)){
						$img->fill(70,110,$black);
					}
					#contact 1 bit 6
					if(($bitcnt == 5)&&($bit == 1)){
						$img->fill(90,130,$black);
					}
					#contact 1 bit 7
					if(($bitcnt == 6)&&($bit == 1)){
						$img->fill(110,125,$black);
					}
					#contact 1 bit 8
					if(($bitcnt == 7)&&($bit == 1)){
						$img->fill(122,110,$black);
					}

				} elsif($ring == 1){
					#contact 2 bit 1
					if(($bitcnt == 0)&&($bit == 1)){
						$img->fill(150,90,$black);
					}
					#contact 2 bit 2
					if(($bitcnt == 1)&&($bit == 1)){
						$img->fill(110,50,$black);
					}
					#contact 2 bit 3
					if(($bitcnt == 2)&&($bit == 1)){
						$img->fill(90,50,$black);
					}
					#contact 2 bit 4
					if(($bitcnt == 3)&&($bit == 1)){
						$img->fill(50,90,$black);
					}
					#contact 2 bit 5
					if(($bitcnt == 4)&&($bit == 1)){
						$img->fill(50,110,$black);
					}
					#contact 2 bit 6
					if(($bitcnt == 5)&&($bit == 1)){
						$img->fill(90,150,$black);
					}
					#contact 2 bit 7
					if(($bitcnt == 6)&&($bit == 1)){
						$img->fill(110,150,$black);
					}
					#contact 2 bit 8
					if(($bitcnt == 7)&&($bit == 1)){
						$img->fill(150,110,$black);
					}
				} elsif($ring == 2){
					#contact 3 bit 1
					if(($bitcnt == 0)&&($bit == 1)){
						$img->fill(170,90,$black);
					}
					#contact 3 bit 2
					if(($bitcnt == 1)&&($bit == 1)){
						$img->fill(110,30,$black);
					}
					#contact 3 bit 3
					if(($bitcnt == 2)&&($bit == 1)){
						$img->fill(90,30,$black);
					}
					#contact 3 bit 4
					if(($bitcnt == 3)&&($bit == 1)){
						$img->fill(30,90,$black);
					}
					#contact 3 bit 5
					if(($bitcnt == 4)&&($bit == 1)){
						$img->fill(30,110,$black);
					}
					#contact 3 bit 6
					if(($bitcnt == 5)&&($bit == 1)){
						$img->fill(90,170,$black);
					}
					#contact 3 bit 7
					if(($bitcnt == 6)&&($bit == 1)){
						$img->fill(110,170,$black);
					}
					#contact 3 bit 8
					if(($bitcnt == 7)&&($bit == 1)){
						$img->fill(170,110,$black);
					}
				} elsif($ring == 3){
					#contact 4 bit 1
					if(($bitcnt == 0)&&($bit == 1)){
						$img->fill(190,90,$black);
					}
					#contact 4 bit 2
					if(($bitcnt == 1)&&($bit == 1)){
						$img->fill(110,10,$black);
					}
					#contact 4 bit 3
					if(($bitcnt == 2)&&($bit == 1)){
						$img->fill(90,10,$black);
					}
					#contact 4 bit 4
					if(($bitcnt == 3)&&($bit == 1)){
						$img->fill(10,90,$black);
					}
					#contact 4 bit 5
					if(($bitcnt == 4)&&($bit == 1)){
						$img->fill(10,110,$black);
					}
					#contact 4 bit 6
					if(($bitcnt == 5)&&($bit == 1)){
						$img->fill(90,190,$black);
					}
					#contact 4 bit 7
					if(($bitcnt == 6)&&($bit == 1)){
						$img->fill(110,190,$black);
					}
					#contact 4 bit 8
					if(($bitcnt == 7)&&($bit == 1)){
						$img->fill(190,110,$black);
					}
				}
				$bitcnt++;
			}
			$ring++;

		}





		my $tmpfile = "tmp.png";
		open my $out, '>', $tmpfile or die;
		binmode $out;
		print $out $img->png;
		close $out;
		my $base64 = `base64 tmp.png`;
		print INFILE $base64;
		#`cat input/$problem_file | base64 -d > debug/$debug.png`;
		unlink("tmp.png");}

	print INFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
	print OUTFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
}
