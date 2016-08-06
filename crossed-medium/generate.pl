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
	my $diff = "MEDIUM";
	if($diff eq "MEDIUM"){
		my @start = ();
		my @end = ();
		my $ref = "A";
		my %loc = ();
		my %cols = ();
		my @board = ();
		my $row = 0;
		my $tracknum = int(rand(10)) + 10;
		if(($tracknum%2)==1){ $tracknum++;}
		my $track = "";
		for(my $i = 0; $i < 52; $i++){
			if($board[$row][$i] ne ""){ next; }
			$board[$row][$i] = $ref;
			$cols{$i} = $ref;
			$board[$row][$i+1] = " ";
			$loc{$ref} = $i;
			if($i == $tracknum){
				$track = $ref;
			}
			$ref++;
		}
		$row++;
		my $min = 2;
		my $max = 0;
		for(my $r = $row; $r < (int(rand(50))+50); $r++){
			for(my $i = 0; $i < 52; $i++){
				if($board[$row][$i] ne ""){
					next;
				}
				$board[$row][$i] = "|";
				$board[$row][$i+1] = " ";

			}
			$max = $row;
			$row++;
		}

		for(my $i = 0; $i < 52; $i++){
			if($board[$row][$i] ne ""){
				next;
			}
			$board[$row][$i] = "|";
			$board[$row][$i+1] = " ";
		}
		$row++;
		$ref = "A";
		for(my $i = 0; $i < 52; $i++){
			if($board[$row][$i] ne ""){ next; }
			$board[$row][$i] = $ref;
			$board[$row][$i+1] = " ";
			$ref++;
		}
		$row++;
		#my $switchy = int(rand(($max-1)));
		#if($switchy < $min){ $switchy = $min;}
		#my $switchx = int(rand(50));
		#if(($switchx % 2) == 1){
		#	$switchx -= 1;
		#}
		for (my $r = $min;$r < $max;$r++){
			for(my $i = 0; $i < 52; $i++){
				if(($i%2)==1){next;}
				my $cross = int(rand(100))%2;
				if($cross == 0){
					my $switchy = $r;
					my $switchx = $i;
					#print "CHECKING FOR CROSS AT $switchy,$switchx...\n";
					unless(($board[$switchy][$switchx] eq "|")&&
					       ($board[$switchy][$switchx+2] eq "|")){
							next;
					}
					if(($board[$switchy-1][$switchx] ne "|")||($board[$switchy-1][$switchx+2] ne "|")){
						next;
					}
					if($loc{$track} == $switchx){
						$loc{$track} = $switchx+2;
					} elsif($loc{$track} == ($switchx+2)){
						$loc{$track} = $switchx;
					}
					$board[$switchy][$switchx] = "\\";
					$board[$switchy][$switchx+2] = "/";
					$board[$switchy+1][$switchx+1] = "x";
					$board[$switchy+2][$switchx] = "/";
					$board[$switchy+2][$switchx+2] = "\\";
					$board[$switchy+1][$switchx] = " ";
					$board[$switchy+1][$switchx+2] = " ";
				}
			}

		}

		my $rowp = 0;
		print INFILE "TRACK $track\n";
		for(my $i = 0; $i < $row; $i++){
			#printf("%2s  ",$rowp);
			for(my $j = 0; $j < 52; $j++){
				print INFILE $board[$i][$j];
			}
			print INFILE "\n";
			$rowp++;
		}
		print OUTFILE "$track IS AT $cols{$loc{$track}}\n";


	}

	print INFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
	#print OUTFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
}
