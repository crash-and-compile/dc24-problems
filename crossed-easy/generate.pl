#!/usr/bin/perl
use List::Util 'shuffle';

($problem_file, $solution_file) = @ARGV;
open(INFILE,">input/$problem_file");
open(OUTFILE,">output/$solution_file");
my $debug = "$solution_file";
open(DEBUG,">debug/$debug");
my $type = "";
my $string = "";
my $diff = "EASY";
if($diff eq "EASY"){
	my @desig = ('A','B','C','D','E','F');
	my @starts = ();
	my $scnt = 0;
	for(my $s = 0; $s < int(rand(10))+5; $s++){
		my $name = $desig[int(rand(@desig))] . "-" . int(rand(9)) . int(rand(9)) . $scnt . int(rand(9));
		push(@starts,$name);
		$scnt++;
	}
	my $track = $starts[int(rand(@starts))];
	
	my @x = ();
	my $cnt = 0;
	my @commands = ();
	my @course = ();
	my $prev = "";
	foreach my $start (@starts){
		push(@commands,"[$start]->[0,$cnt]");
		if($start eq $track){
			$prev = "[0,$cnt]";
			push(@course,$start);
			push(@course,$prev);
			#print "[$start]->[0,$cnt] <--\n";
		} else {
			#print "[$start]->[0,$cnt]\n";
		}
		push(@x,$cnt);
		$cnt++;
	}
	for(my $l = 1; $l < int(rand(50))+10; $l++){
		my @prevx = shuffle(@x);
		my @newx = shuffle(@x);
		for(my $i = 0; $i < @prevx; $i++){
			my $check = "[". ($l - 1) .",".$prevx[$i]."]";
			push(@commands, "[". ($l - 1) .",".$prevx[$i]."]->[".$l.",".$newx[$i]."]");
			#if($check eq $prev){
			#	print "[". ($l - 1) .",".$prevx[$i]."] -> [".$l.",".$newx[$i]."] <--\n";
			#} else {
			#	print "[". ($l - 1) .",".$prevx[$i]."] -> [".$l.",".$newx[$i]."]\n";
			#}
			if($check eq $prev){
				$prev = "[".$l.",".$newx[$i]."]";
				push(@course,$prev);
			}
		}
	}
	@telemetry = shuffle(@commands);
	foreach my $telemetry (@telemetry){
		print INFILE "$telemetry\n";
	}
	print INFILE "====================\n[$track]->[?]\n";	
	my $last = "";
	foreach my $course (@course){
		print DEBUG "$course\n";
		$last = $course;
		$last =~ s/^(.*)\>//;
	}
	print OUTFILE "[$track]->$last\n";

}
