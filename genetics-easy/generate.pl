#!/usr/bin/perl

($problem_file, $solution_file) = @ARGV;
open(INFILE,">input/$problem_file");
open(OUTFILE,">output/$solution_file");
my $debug = "$solution_file";
open(DEBUG,">debug/$debug");
my $diff = "EASY";
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
if($diff eq "EASY"){
#	print "$strand\n";
	my $indna = "";
	my $outdna = "";
	my @outpairs = split(/\n/,$strand);
	my @inpairs = split(/\n/,$strand);
	foreach my $pair (@outpairs){
		if($pair eq ""){ next; }
		$pair =~ s/ [AGCTagct?] [AGCTagct?]$//;
		$pair =~ s/^... //;
		$outdna .= "$pair\n";
	}
	foreach my $pair (@inpairs){
		if($pair eq ""){ next; }
		$pair =~ s/ [AGCTagct?] [AGCTagct?]$//;
		$pair =~ s/^... //;
		my $mutate = int(rand(10))%13;
		if($mutate == 0){
			$pair =~ tr/G/\?/;
		} elsif($mutate == 1){
			$pair =~ tr/C/\?/;
		} elsif($mutate == 2){
			$pair =~ tr/T/\?/;
		} elsif($mutate == 3){
			$pair =~ tr/A/\?/;
		} elsif($mutate == 4){
			$pair =~ tr/g/\?/;
		} elsif($mutate == 5){
			$pair =~ tr/t/\?/;
		} elsif($mutate == 6){
			$pair =~ tr/c/\?/;
		} elsif($mutate == 7){
			$pair =~ tr/a/\?/;
		}
		$indna .= "$pair\n";
	}
	print INFILE "$indna";
	
	print OUTFILE "$outdna";
}
