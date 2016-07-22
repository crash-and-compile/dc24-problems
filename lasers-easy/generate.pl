#!/usr/bin/perl

($problem_file, $solution_file) = @ARGV;
open(INFILE,">input/$problem_file");
open(OUTFILE,">output/$solution_file");
my $debug = "$solution_file";
open(DEBUG,">debug/$debug");
my $type = "";
my $string = "";
my $diff = "EASY";
if($diff eq "EASY"){
	my $width = 20;
	my $height = 20;
	my $lw = $width + 5;
	my $lh = $heigth + 5;
	my $color = 0;
	my $alt = 0;
	my @board = ();
	$board[0][0] = " ";
	$board[1][0] = " ";
	$board[2][0] = " ";
	$board[0][1] = " ";
	$board[1][1] = " ";
	$board[2][1] = " ";
	$board[0][2] = " ";
	$board[1][2] = " ";
	$board[2][2] = " ";
	for(my $h = 0; $h < $height; $h++){
		for(my $w = 0; $w < $width; $w++){
			$board[$h][$w] = " ";
		}
	}

	for(my $h = 0; $h < $height; $h++){
			if(($h == 0)||($h == ($height - 1))){
				for(my $w = 0; $w < $width; $w++){
					$board[$h][$w] = "+";
				}
			}
			$board[$h][0] = "+";
			$board[$h][$width - 1] = "+";
	}
	my $mcnt = 40;
	while($mcnt > 0){
		my $mx = int(rand($width-1));
		my $my = int(rand($height-1));
		if($board[$my][$mx] eq " "){
			my $mdir = int(rand(10))%2;
			if($mdir > 0){
				$board[$my][$mx] = "/";
				$mcnt--;
			} else {
				$board[$my][$mx] = "\\";
				$mcnt--;
			}
		}
	}
	my $side = int(rand(100))%4;
	$startx = "";
	$starty = "";
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
	$board[$posy][$posx] = "S";
	
	for(my $h = 0; $h < $height; $h++){
		for(my $w = 0; $w < $width; $w++){
			print INFILE $board[$h][$w];
		}
		print  INFILE "\n";
		$rowcnt++;
	}

	
	
	$startx = $posx;
	$starty = $posy;
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
		if($direction eq "L"){
			if($board[$posy][$posx] eq "/"){
				$direction = "D";
			} elsif($board[$posy][$posx] eq "\\"){
				$direction = "U";
			}
		} elsif($direction eq "R"){
			if($board[$posy][$posx] eq "/"){
				$direction = "U";
			} elsif($board[$posy][$posx] eq "\\"){
				$direction = "D";			
			}
		} elsif($direction eq "U"){
			if($board[$posy][$posx] eq "/"){
				$direction = "R";
			} elsif($board[$posy][$posx] eq "\\"){
				$direction = "L";
			}
		} elsif($direction eq "D"){
			if($board[$posy][$posx] eq "/"){
				$direction = "L";
			} elsif($board[$posy][$posx] eq "\\"){
				$direction = "R";
			}
		}


		if($direction eq "L"){
			$posx -= 1;
			if($board[$posy][$posx] eq " "){
				$board[$posy][$posx] = "<";
			}
		} elsif($direction eq "R"){
			$posx += 1;
			if($board[$posy][$posx] eq " "){
				$board[$posy][$posx] = ">";
			}
		} elsif($direction eq "U"){
			$posy -= 1;
			if($board[$posy][$posx] eq " "){
				$board[$posy][$posx] = "|";
			}
		} elsif($direction eq "D"){
			$posy += 1;
			if($board[$posy][$posx] eq " "){
				$board[$posy][$posx] = "|";
			}
		}
	}
	$board[$posy][$posx] = "E";
	if($posx == 0){
		print OUTFILE "L$posy\n";
		print DEBUG "L$posy\n";
	}elsif ($posx == ($width - 1)){
		print OUTFILE "R$posy\n";
		print DEBUG "R$posy\n";
	}elsif ($posy == 0){
		print OUTFILE "U$posx\n";
		print DEBUG "U$posx\n";
	}elsif ($posy == ($height - 1)){
		print OUTFILE "D$posx\n";
		print DEBUG "D$posx\n";
	}
		my $rowcnt = 0;
		my $colcnt = 0;
		for(my $h = 0; $h < $height; $h++){
			for(my $w = 0; $w < $width; $w++){
				print DEBUG $board[$h][$w];
			}
			if(($rowcnt < $height - 1)&&($rowcnt != 0)){
				print DEBUG " $rowcnt\n";
			}else{
				print DEBUG "\n";
			}
			$rowcnt++;
		}
		print DEBUG " ";
		for(my $w = 1; $w < $width-1; $w++){
			if(length($colcnt) == 1){
				print DEBUG "$colcnt";
			} else {
				print DEBUG substr($colcnt,0,1);
			}
			$colcnt++;
		}
		print DEBUG "\n";
		print DEBUG " ";
		my $colcnt = 0;
		for(my $w = 1; $w < $width-1; $w++){
			if(length($colcnt) == 1){
				print DEBUG " ";
			} else {
				print DEBUG substr($colcnt,1,1);
			}
			$colcnt++;
		}
		print DEBUG "\n";
	



}
