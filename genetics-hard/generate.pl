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
	my $diff = "HARD";
	my $lref = 0;
	my $rref = 7;
	my $ldir = "r";
	my $rdir = "l";
	my %rtol = qw(
	A	t
	T	a
	G	c
	C	g
	);
	my @nuc = ("A","T","G","C");
	my $result = "";
	my @strand = ();
	my $max = 3 * (int(rand(50)) + 4);
	my $codoncnt = 0;
	for(my $i = 0; $i < $max; $i++){
		push(@strand,$nuc[int(rand(@nuc))]);
	}
	my $cnt = 0;
	my $new = 0;
	my $shift = 0;
	my $strand = "";
	my $line = 1;
	my $big = 0;
	my @unformatted = ();
	foreach my $pair (@strand){
		my $right = $pair;
		my $left = $rtol{$right};
		my $unformatted = "";
		if($shift == 0){
			$right = lc $right;
			$left = uc $left;
			$unformatted = "$right $left";
		} else {
			$unformatted = "$left $right";
		}
		push(@unformatted,"$unformatted");
		if($new == 0){ 
			$cnt = 0;
			$big = $big%2;
		}
		if($big == 0){
			$new = 1;
			$draw = $cnt % 13;
			if($draw == 0){
				$strand .= sprintf("%3d       %s%s       %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 1){
				$strand .= sprintf("%3d       %s=%s      %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 2){
				$strand .= sprintf("%3d      %s====%s    %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 3){
				$strand .= sprintf("%3d     %s======%s   %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 4){
				$strand .= sprintf("%3d    %s========%s  %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 5){
				$strand .= sprintf("%3d  %s==========%s  %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 6){
				$strand .= sprintf("%3d %s============%s %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 7){
				$strand .= sprintf("%3d %s============%s %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 8){
				$strand .= sprintf("%3d  %s==========%s  %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 9){
				$strand .= sprintf("%3d  %s========%s    %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 10){
				$strand .= sprintf("%3d   %s======%s     %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 11){
				$strand .= sprintf("%3d    %s====%s      %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 12){
				$strand .= sprintf("%3d      %s==%s      %s\n",$line,$left,$right,$unformatted);	
				$new = 0;
				$big++;
				$shift = ($shift + 1)%2;
			}

			$cnt++;
			$line++;
		} elsif($big == 1){
			$new = 1;
			$draw = $cnt % 11;
			if($draw == 0){
				$strand .= sprintf("%3d       %s%s       %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 1){
				$strand .= sprintf("%3d      %s--%s      %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 2){
				$strand .= sprintf("%3d     %s----%s     %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 3){
				$strand .= sprintf("%3d    %s------%s    %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 4){
				$strand .= sprintf("%3d   %s--------%s   %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 5){
				$strand .= sprintf("%3d  %s----------%s  %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 6){
				$strand .= sprintf("%3d  %s----------%s  %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 7){
				$strand .= sprintf("%3d  %s--------%s    %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 8){
				$strand .= sprintf("%3d   %s------%s     %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 9){
				$strand .= sprintf("%3d    %s----%s      %s\n",$line,$left,$right,$unformatted);	
			} elsif($draw == 10){
				$strand .= sprintf("%3d     %s--%s       %s\n",$line,$left,$right,$unformatted);	
				$new = 0;
				$big++;
				$shift = ($shift + 1)%2;
			}
			$cnt++;
			$line++;	
		}
	}
	if($diff eq "HARD"){
		#primary down, secondary up, sets of 3 = codon
		my $indna = "";
		my @outpairs = split(/\n/,$strand);
		foreach my $pair (@outpairs){
			$pair =~ s/ [AGCTagct?] [AGCTagct?]$//;
			$pair =~ s/^... //;
			$indna .= "$pair\n";
		}
		my @splice = split(/\n/,$indna);
		my $cnt = 0;
		my @spliced = ();
		my @tosplice = ();
		my $pstart = 0;
		my $pend = 0;
		my $sstart = 0;
		my $send = 0;
		foreach my $pair (@splice){
			$tosplice[$cnt%3] = $pair;
			if(($cnt != 0)&&(($cnt%3)==2)){
				if((int(rand(50))%50) >70){
					my $insert = int(rand(100))%4;
					if(($insert == 0)&&($pstart == 0)){
						#print "INSERTING START INTO PRIMARY...\n";
						#print "$tosplice[0]\n";
						#print "$tosplice[1]\n";
						#print "$tosplice[2]\n";
						$tosplice[0] =~ s/[TGCA]/T/;
						$tosplice[1] =~ s/[TGCA]/A/;
						$tosplice[2] =~ s/[TGCA]/C/;
						$tosplice[0] =~ s/[tgca]/a/;
						$tosplice[1] =~ s/[tgca]/t/;
						$tosplice[2] =~ s/[tgca]/g/;
						#print "____________\n";
						#print "$tosplice[0]\n";
						#print "$tosplice[1]\n";
						#print "$tosplice[2]\n";
						$pstart = 1;
					} elsif(($insert == 1)&&($pstart == 1)){
						#print "INSERTING END INTO PRIMARY...\n";
						#print "$tosplice[0]\n";
						#print "$tosplice[1]\n";
						#print "$tosplice[2]\n";
						$tosplice[0] =~ s/[TGCA]/C/;
						$tosplice[1] =~ s/[TGCA]/A/;
						$tosplice[2] =~ s/[TGCA]/G/;
						$tosplice[0] =~ s/[tgca]/g/;
						$tosplice[1] =~ s/[tgca]/t/;
						$tosplice[2] =~ s/[tgca]/c/;
						#print "____________\n";
						#print "$tosplice[0]\n";
						#print "$tosplice[1]\n";
						#print "$tosplice[2]\n";
						$pstart = 2;
					} elsif(($insert == 2)&&($send == 0)){
						#print "INSERTING END INTO SECONDARY...\n";
						#print "$tosplice[0]\n";
						#print "$tosplice[1]\n";
						#print "$tosplice[2]\n";
						$tosplice[0] =~ s/[TGCA]/C/;
						$tosplice[1] =~ s/[TGCA]/T/;
						$tosplice[2] =~ s/[TGCA]/G/;
						$tosplice[0] =~ s/[tgca]/g/;
						$tosplice[1] =~ s/[tgca]/a/;
						$tosplice[2] =~ s/[tgca]/c/;
						#print "____________\n";
						#print "$tosplice[0]\n";
						#print "$tosplice[1]\n";
						#print "$tosplice[2]\n";
						$send = 1;
					} elsif(($insert == 3)&&($send == 1)){
						#print "INSERTING START INTO SECONDARY...\n";
						#print "$tosplice[0]\n";
						#print "$tosplice[1]\n";
						#print "$tosplice[2]\n";
						$tosplice[0] =~ s/[TGCA]/G/;
						$tosplice[1] =~ s/[TGCA]/T/;
						$tosplice[2] =~ s/[TGCA]/A/;
						$tosplice[0] =~ s/[tgca]/c/;
						$tosplice[1] =~ s/[tgca]/a/;
						$tosplice[2] =~ s/[tgca]/t/;
						#print "____________\n";
						#print "$tosplice[0]\n";
						#print "$tosplice[1]\n";
						#print "$tosplice[2]\n";
						$send = 2;
					}
				}				
				push(@spliced,$tosplice[0]);
				push(@spliced,$tosplice[1]);
				push(@spliced,$tosplice[2]);
			}
			$cnt++;
		}
		my $spliceddna = "";
		foreach my $pair (@spliced){
			#print "$pair\n";
			$spliceddna .= "$pair\n";
		}
		my @unformattedparsea = split(/\n/,$spliceddna);
		my @unformattedparseb = split(/\n/,$spliceddna);
		my @unformattedparsec = reverse @unformattedparseb;
		my @unformatted = ();
		my $pstrand = "";
		my $sstrand = "";

		foreach my $unformatted (@unformattedparsea){
			#print "$unformatted\n";
			$unformatted =~ s/ //g;
			$unformatted =~ s/=//g;
			$unformatted =~ s/\-//g;
			my $primary = $unformatted;
			$primary =~ s/\[*[acgt]\]*//g;
			$pstrand .= $primary;
		}
		#print "PRIMARY: $pstrand\n";
		$pstrand =~ s/\[//g;
		$pstrand =~ s/\]//g;
		foreach my $unformatted (@unformattedparsec){
			#print "$unformatted\n";
			$unformatted =~ s/ //g;
			$unformatted =~ s/=//g;
			$unformatted =~ s/\-//g;
			my $secondary = $unformatted;
			$secondary =~ s/\[*[ACGT]\]*//g;
			$sstrand .= uc $secondary;
		}
		#print "SECONDARY: $sstrand\n";
		$sstrand =~ s/\[//g;
		$sstrand =~ s/\]//g;
		my @pcodons = split(/(...)/,$pstrand);
		my @scodons = split(/(...)/,$sstrand);
	#INDICATOR IS mRNA AUG followed by a GUC sequence
	#DNA: TAC....CAG
	#SEC: atg....gtc
	#RNA1: AUG...GUC	<-POSITIVE
	#RNA2: gac...cau (sec in reverse)

	#DNA: CTG...GTA
	#SEC: gac...cat
	#RNA1: GAC...CAU
	#RNA2: AUG...GUC	(sec in reverse) <-POSITIVE
		my $start = 0;
		my $end = 0;
		my $status = "IMMUNE";
		foreach my $scodon (@scodons){
			if($scodon eq ""){ next; }
			my $mrna = $scodon;
			$mrna =~ tr/ATGC/UACG/;
			if($mrna eq "AUG"){
				$status = "SUSCEPTIBLE"; 
				$start=1;
			}
			if($mrna eq "GUC"){ 
				$status = "SUSCEPTIBLE";
				if($start == 1){
					$status	= "COMPROMISED";
				}
			}
		}
		#print "$status\n";
		$start = 0;
		$end = 0;
		foreach my $pcodon (@pcodons){
			if($pcodon eq ""){ next; }
			my $mrna = $pcodon;
			$mrna =~ tr/ATGC/UACG/;
			if($mrna eq "AUG"){
				$status = "SUSCEPTIBLE"; 
				$start=1;
			}
			if($mrna eq "GUC"){ 
				$status = "SUSCEPTIBLE";
				if($start == 1){
					$status	= "COMPROMISED";
				}
			}
		}
		print OUTFILE "$status\n";
		print INFILE "$spliceddna";
	}

	print INFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
	print OUTFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
}
