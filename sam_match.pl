#!/usr/bin/perl
use strict;

# Filtering sam files for matched reads and unmatched reads



my @base = ("rRNA", "snoRNAs", "transposons", "tRNAs", "chlo", "mito");

foreach my $base(@base) {
	open (IN, "$base" . ".sam") or die "Can't open $base input: $!\n";
	open (OUT, ">$base" . "_match.txt") or die "Can't open $base input: $!\n";
	
	print "searching for mapped reads\n";
	
	while (my $line = readline(IN)) {
		next unless $line;
		
		my @info = split /\t/, $line;
		next if ($info[0] =~ /\@/);
		next if ($info[1] == 4);
		
		# my $good =1;
		# for (my $i = 10; $i < @info; $i++) {
		# 	my @notes = split /:/, $info[$i];
		# 	if ($notes[0] eq "XM" or $notes[0] eq "XO" or $notes[0] eq "XG" or $notes[0] eq "NM") {
		# 		 if ($notes[2] != 0) {
		# 			$good = 0;
		# 			last;
		# 		}
		# 	}
		# }
		print OUT $line;
	}
	
	close IN;
	close OUT;

}