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
	my $diff = "MEDIUM";
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
	if($diff eq "MEDIUM"){
		#primary down, secondary up, sets of 3 = codon
		my $indna = "";
		my @outpairs = split(/\n/,$strand);
		foreach my $pair (@outpairs){
			$pair =~ s/ [AGCTagct?] [AGCTagct?]$//;
			$pair =~ s/^... //;
			$indna .= "$pair\n";
		}
		my $cnt = 0;
		my %codons = ();
		my $pcodon = "";
		my $scodon = "";
		my @unformattedparse = split(/\n/,$indna);
		my @unformatted = ();
		my $pstrand = "";
		my $sstrand = "";
		foreach my $unformatted (@unformattedparse){
			$unformatted =~ s/ //g;
			$unformatted =~ s/=//g;
			$unformatted =~ s/\-//g;
			my $primary = $unformatted;
			$primary =~ s/[acgt]//g;
			my $secondary = $unformatted;
			$secondary =~ s/[ACGT]//g;
			$sstrand = uc $secondary . $sstrand;
			$pstrand .= $primary;
		}
		my $full = $pstrand . $sstrand;
		my @codons = split(/(...)/,$full);
		my $total = 0;
		foreach my $codon (@codons){
			if($codon eq ""){ next; }
			$codons{$codon} += 1;
			$total++;
		}
		my $unique = 0;
		foreach my $codon (sort keys %codons){
			#print "$codon\n";
			$unique++;
		}
		#print "$total\n";
		print INFILE "$indna";
		my $avg = $unique / $total;
		if($avg >= 0.6){
			print OUTFILE "$total HUMAN\n";
		} else {
			print OUTFILE "$total SYNTHETIC\n";
		}
		#open(TMP,">>ratios");
		#print TMP "$avg\n";
		#close TMP;
	}

	print INFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
	print OUTFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
}
