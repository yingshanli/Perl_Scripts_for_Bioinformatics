#!/usr/bin/perl

# Count the number of counts of each read and sort

@base = ("my_file1", "my_file2);

foreach my $base(@base) {
	open (IN, "$base" . "_tRFs.sam") or die "Can't open $base input: $!\n";
	open (OUT, ">$base"."_tRFs_summarize.txt") or die "Can't open $base input: $!\n";

	while (my $line = readline(IN)) {
		next unless $line;
		next if ($line =~ /@/);
		@info = split /\t/, $line;
		
		$tRNA = $info[2];
		$counts{$tRNA} = $counts{$tRNA} + 1;
	}
	foreach $id (reverse sort { $counts{$a} <=> $counts{$b} } keys %counts) {
		print OUT "$id\t$counts{$id}\n";
	}
	
	close IN;
	close OUT;

}