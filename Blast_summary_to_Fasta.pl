#!/usr/bin/perl


# Extract fasta sequences from blast summary results



open (IN1, "APL_DNA_K61_blastn_algae-15_summary.txt") or die "Can't open input: 1 $!\n";
open (IN2, "APL_DNA_K61_blastn_plants-15_summary.txt") or die "Can't open input: 3$!\n";
open (IN3, "APL_DNA_K61.fa") or die "Can't open input: 2$!\n";
open (ALGAE, ">APL_DNA_K61_blastn_algae-15_hits.txt") or die "Can't open output: $!\n";
open (PLANTS, ">APL_DNA_K61_blastn_plants-15_hits.txt") or die "Can't open output: $!\n";

while (my $line1 = readline(IN1)) {
	next unless $line1;
	
	my @info = split /\t/, $line1;
	push @query_list1, $info[0];
	
}

print "query_list1 done\n";

while (my $line2 = readline(IN2)) {
	next unless $line2;
	
	my @info = split /\t/, $line2;
	push @query_list2, $info[0];
	
}
print "query_list2 done\n";

while (my $line3 = readline(IN3)) {
	next unless $line3;
	
	if ($line3 =~ />/) {
		foreach $n (@query_list1) {
			chomp $n;
			if ($line3 =~ m/$n/) {
				$p_1 = 1;
				last;
			} else {
				$p_1 = 0;
			}
		}
		foreach $n (@query_list2) {
			chomp $n;
			if ($line3 =~ m/$n/) {
				$p_2 = 1;
				last;
			} else {
				$p_2 = 0;
			}
		}
	}
	
	if ($p_1 eq 1) {
		print "$line3";
		print ALGAE "$line3";
	}
	if ($p_2 eq 1) {
		print PLANTS "$line3";
	}
	
}

close IN1;
close IN2;
close IN3;
close ALGAE;
close PLANTS;