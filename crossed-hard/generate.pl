#!/usr/bin/perl
use List::Util 'shuffle';
use GD;
use GD::Simple;
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
		my @desig = ('A','B','C','D');
		my @starts = ();
		my $scnt = 0;
		for(my $s = 0; $s < 4; $s++){
			my $name = $desig[$scnt];
			push(@starts,$name);
			$scnt++;
		}
		my $sep = 40;
		my $imagewidth = $scnt*$sep;
		my $track = $starts[int(rand(@starts))];

		my @x = ();
		my $cnt = 0;
		my @commands = ();
		my @course = ();
		my $prev = "";
		my %start = ();
		my %current = ();
		my %endval = ();
		my $endval = 1;
		foreach my $start (@starts){
			push(@commands,"[$start]->[0,$cnt]");
			push(@commands,"[0,$cnt]->[20,$cnt]");
			$endval{$cnt} = $endval; $endval++;
			$current{$start} = "[20,$cnt]";
			push(@x,$cnt);
			$cnt += $sep;
		}
		my $imageheight = 20;
		my $rowy = 40;
		my @prevx = @x;
		for(my $i = 0; $i < 10; $i++){
			my @rand = shuffle(@prevx);
			my @newx = ();
			foreach my $rand (@prevx){
				my $selection = pop(@rand);
				push(@commands,"[".($rowy - 20). "," . $rand . "]->[$rowy,$selection]");
				foreach my $key (keys %current){
					my $check = "[".($rowy - 20). "," . $rand . "]";
					#print "Finding $check...\n";
					if($current{$key} eq $check){
						$current{$key} = "[$rowy,$selection]";
					}
				}
				push(@newx,$selection);
			}
			@prevx = @newx;
			$rowy += 20;
			$imageheight += 20;

		}
		my @rand = @prevx;
		my @newx = ();
		foreach my $prevx (@prevx){
			push(@commands,"[".($rowy - 20). "," . $prevx . "]->[$rowy,$prevx]");
			foreach my $key (keys %current){
				my $check = "[".($rowy - 20). "," . $rand . "]";
				if($current{$key} eq $check){
					$current{$key} = "[$rowy,$selection]";
				}
			}
		}
		@prevx = @newx;
		$rowy += 20;
		$imageheight += 20;
		$imagewidth += 20;
		#<STDIN>;
		$imageheight += 20;
		$imageheight += 30;
		$img = GD::Simple->new($imagewidth,$imageheight);
		$img->bgcolor('black');
		$img->fgcolor('black');
 		$img->penSize(5);

		my $correct = 20;
		my $val = 1;
		foreach my $telemetry (@commands){
			if($telemetry =~ /^\[[A-Z]\]/){
				$telemetry =~ s/\[//g;
				$telemetry =~ s/\]//g;
				my ($label,$coords) = split(/\->/,$telemetry);
				my ($yref,$xref) = split(/,/,$coords);
				$xref += 15;
				$yref += 20;
				$img->moveTo($xref+3, $yref);
				$img->string($label);
				$img->moveTo($xref+3, $rowy + 15);
				$img->string($val);
				$val++;
			} else {
				$telemetry =~ s/\[//g;
				$telemetry =~ s/\]//g;
				my ($acoords,$bcoords) = split(/\->/,$telemetry);
				my ($ayref,$axref) = split(/,/,$acoords);
				my ($byref,$bxref) = split(/,/,$bcoords);
				$ayref += 20;
				$axref += 20;
				$byref += 20;
				$bxref += 20;
				$img->moveTo($axref, $ayref);
				$img->lineTo($bxref, $byref);


			}	
		}
		my $last = "";
		foreach my $course (@course){
			$last = $course;
			$last =~ s/^(.*)\>//;
		}

		my $tmpfile = "tmp.jpg";
		open my $out, '>', $tmpfile or die;
		binmode $out;
		print $out $img->jpeg;
		close $out;
		my $base64 = `base64 tmp.jpg`;
		print INFILE $base64;
		my @outputs = ();
		foreach my $key (keys %current){
			my $ref = $current{$key};
			$ref =~ s/(.*),//;
			$ref =~ s/\]//g;
			$val = "$key$endval{$ref}";
			push(@outputs, $val);
		}
		foreach my $output (sort @outputs){
			print OUTFILE "$output";
		}
		#`cat input/$problem_file | base64 -d > debug/$debug.jpg`;
		unlink("tmp.jpg");
	}
	print OUTFILE "\n";

	print INFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
	#print OUTFILE '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'."\n";
}
