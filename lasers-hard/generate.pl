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
	my $diff = "HARD";
	if($diff eq "HARD"){
		my $width = 20;
		my $height = 20;
		my $depth = 8;
		my $lw = $width + 5;
		my $lh = $heigth + 5;
		my $color = 0;
		my $alt = 0;
		my @board = ();
		for(my $d = 0; $d < $depth; $d++){
			for(my $h = 0; $h < $height; $h++){
				for(my $w = 0; $w < $width; $w++){
					$board[$d][$h][$w] = " ";
				}
			}
		}
		for(my $d = 0; $d < $depth; $d++){
			for(my $h = 0; $h < $height; $h++){
				if(($h == 0)||($h == ($height - 1))){
					for(my $w = 0; $w < $width; $w++){
						$board[$d][$h][$w] = "#";
					}
				}
				$board[$d][$h][0] = "#";
				$board[$d][$h][$width - 1] = "#";
				$board[$d][0][0] = $d + 1;
			}
		}

		for(my $d = 0; $d < $depth; $d++){
			my $mcnt = 40;
			while($mcnt > 0){
				my $mx = int(rand($width-1));
				my $my = int(rand($height-1));
				if($board[$d][$my][$mx] eq " "){
					my $mdir = int(rand(10))%2;
					if($mdir > 0){
						$board[$d][$my][$mx] = "/";
						$mcnt--;
					} else {
						$board[$d][$my][$mx] = "\\";
						$mcnt--;
					}
				}
			}
		}
		my $dref = 0;
			my $ucnt = 10;
			while($ucnt > 0){
				my $ux = int(rand($width-1));
				my $uy = int(rand($height-1));
				if($board[$dref][$uy][$ux] eq " "){
						if(($board[$dref+1][$uy][$ux] ne "-")&&($board[$dref+1][$uy][$ux] ne "/")&&($board[$dref+1][$uy][$ux] ne "\\")){
							$board[$dref][$uy][$ux] = "+";
							$ucnt--;
						}
				}
			}

		for(my $d = 1; $d < $depth - 1; $d++){
			my $ucnt = 10;
			while($ucnt > 0){
				my $ux = int(rand($width-1));
				my $uy = int(rand($height-1));
				if($board[$d][$uy][$ux] eq " "){
					my $udir = int(rand(10))%2;
					if($udir > 0){
						if(($board[$d+1][$uy][$ux] ne "-")&&($board[$d+1][$uy][$ux] ne "/")&&($board[$d+1][$uy][$ux] ne "\\")){
							$board[$d][$uy][$ux] = "+";
							$ucnt--;
						}
					} else {
						if(($board[$d-1][$uy][$ux] ne "+")&&($board[$d-1][$uy][$ux] ne "/")&&($board[$d-1][$uy][$ux] ne "\\")){
							$board[$d][$uy][$ux] = "-";
							$ucnt--;
						}
					}
				}
			}
		}
		my $dref = $depth - 1;
			my $ucnt = 10;
			while($ucnt > 0){
				my $ux = int(rand($width-1));
				my $uy = int(rand($height-1));
				if($board[$dref][$uy][$ux] eq " "){
						if(($board[$dref-1][$uy][$ux] ne "+")&&($board[$dref-1][$uy][$ux] ne "/")&&($board[$dref-1][$uy][$ux] ne "\\")){
							$board[$dref][$uy][$ux] = "-";
							$ucnt--;
						}
				}
			}


		my $side = int(rand(100))%4;
		$startx = "";
		$starty = "";
		$startz =  int(rand(100))%$depth;
		my $direction = "";
		if($side == 0){
			$direction = "R";
			$starty = int(rand($heigth - 2)) + 1;
			$startx = 0;
		} elsif($side == 1){
			$direction = "D";
			$startx = int(rand($width - 2)) + 1;
			$starty = 0;
		} elsif($side == 2){
			$direction = "U";
			$startx = int(rand($width - 2)) + 1;
			$starty = $height - 1;
		} elsif($side == 3){
			$direction = "L";
			$starty = int(rand($heigth - 2)) + 1;
			$startx = $width - 1;
		}
		my $posx = $startx;
		my $posy = $starty;
		my $posz = $startz;
		if(
		(($posx == 0)&&($posy == 0))||
		(($posx == 0)&&($posy == ($height - 1)))||
		(($posx == ($width - 1))&&($posy == 0))||
		(($posx == ($width - 1))&&($posy == ($height - 1)))){
			$posx = int(($width / 2));
			$posy = 0;
			$direction = "D";
			$side = "1";
		}
		$board[$posz][$posy][$posx] = "S";

		for(my $d = 0; $d < $depth; $d++){
			for(my $h = 0; $h < $height; $h++){
				for(my $w = 0; $w < $width; $w++){
					print INFILE $board[$d][$h][$w];
				}
				print  INFILE "\n";
			}
		}


		$startx = $posx;
		$starty = $posy;
		$startz = $posz;
		my $stop = 0;
		my $step = 0;
		my $wmax = $width - 1;
		my $hmax = $height - 1;
		while($stop != 1){
			if(($posx == 0)||
			   ($posx == ($width - 1))||
			   ($posy == 0)||
			   ($posy == ($height - 1))){
				if($step != 0){ 
					$stop = 1;
					last;
				}
			}
			$step++;
			#print  "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
			#print  "Step $step\n";
			#print  "Start at ".($posz+1)." $posy $posx\n";

			if($direction eq "L"){
				$posx -= 1;
				if($board[$posz][$posy][$posx] eq " "){
					$board[$posz][$posy][$posx] = "<";
				}
			} elsif($direction eq "R"){
				$posx += 1;
				if($board[$posz][$posy][$posx] eq " "){
					$board[$posz][$posy][$posx] = ">";
				}
			} elsif($direction eq "U"){
				$posy -= 1;
				if($board[$posz][$posy][$posx] eq " "){
					$board[$posz][$posy][$posx] = "|";
				}
			} elsif($direction eq "D"){
				$posy += 1;
				if($board[$posz][$posy][$posx] eq " "){
					$board[$posz][$posy][$posx] = "|";
				}
			}
			#print "Move to ".($posz+1)." $posy $posx\n";


			for(my $d = 0; $d < $depth; $d++){
				for(my $h = 0; $h < $height; $h++){
					for(my $w = 0; $w < $width; $w++){
						if($d == $posz){
							#print $board[$d][$h][$w];
						}
					}
					if($d == $posz){
						#print "\n";
					}
				}
			}
			if($direction eq "L"){
				if($board[$posz][$posy][$posx] eq "/"){
					$direction = "D";
					$board[$posz][$posy][$posx] = "\\";
				} elsif($board[$posz][$posy][$posx] eq "\\"){
					$direction = "U";
					$board[$posz][$posy][$posx] = "/";
				} elsif($board[$posz][$posy][$posx] eq "+"){
					$posz++;
				} elsif($board[$posz][$posy][$posx] eq "-"){
					$posz--;
				}
			} elsif($direction eq "R"){
				if($board[$posz][$posy][$posx] eq "/"){
					$direction = "U";
					$board[$posz][$posy][$posx] = "\\";
				} elsif($board[$posz][$posy][$posx] eq "\\"){
					$direction = "D";			
					$board[$posz][$posy][$posx] = "/";
				} elsif($board[$posz][$posy][$posx] eq "+"){
					$posz++;
				} elsif($board[$posz][$posy][$posx] eq "-"){
					$posz--;
				}
			} elsif($direction eq "U"){
				if($board[$posz][$posy][$posx] eq "/"){
					$direction = "R";
					$board[$posz][$posy][$posx] = "\\";
				} elsif($board[$posz][$posy][$posx] eq "\\"){
					$direction = "L";
					$board[$posz][$posy][$posx] = "/";
				} elsif($board[$posz][$posy][$posx] eq "+"){
					$posz++;
				} elsif($board[$posz][$posy][$posx] eq "-"){
					$posz--;
				}
			} elsif($direction eq "D"){
				if($board[$posz][$posy][$posx] eq "/"){
					$direction = "L";
					$board[$posz][$posy][$posx] = "\\";
				} elsif($board[$posz][$posy][$posx] eq "\\"){
					$direction = "R";
					$board[$posz][$posy][$posx] = "/";
				} elsif($board[$posz][$posy][$posx] eq "+"){
					$posz++;
				} elsif($board[$posz][$posy][$posx] eq "-"){
					$posz--;
				}
			}


		}
		$board[$posz][$posy][$posx] = "E";
		$level = $posz + 1;
		for(my $d = 0; $d < $depth; $d++){
			for(my $h = 0; $h < $height; $h++){
				for(my $w = 0; $w < $width; $w++){
					if($d == $posz){
						#print $board[$d][$h][$w];
					}
				}
				if($d == $posz){
					#print "\n";
				}
			}
		}

		if($posx == 0){
			print OUTFILE $level . "L" . $posy . "\n";
			#print $level . "L" . $posy . "\n";

		}elsif ($posx == ($width - 1)){
			print OUTFILE $level . "R" . $posy . "\n";
			#print  $level . "R" . $posy . "\n";
		}elsif ($posy == 0){
			print OUTFILE $level . "U" . $posx . "\n";
			#print  $level . "U" . $posx . "\n";
		}elsif ($posy == ($height - 1)){
			print OUTFILE $level . "D" . $posx . "\n";
			#print  $level . "D" . $posx . "\n";
		}


	}

	print INFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
	#print OUTFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
}
