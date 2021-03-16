#!/usr/bin/perl

open (IN1, "CR_top100_genes_ID.txt") or die "Can't open iutput: $!\n";
open (IN2, "Creinhardtii_281_v5.5.cds.fa") or die "Can't open output: $!\n";
open (OUT, ">CR_top100_genes_CDS.fa") or die "Can't open output: $!\n";

while ($line = readline(IN1)) {
        next unless $line;
		print $line;
		chomp @line;
		push @ID, $line;
}

while ($line = readline(IN2)) {
        next unless $line;
		
        if ($line =~ />/) {
				$p = 0;
                foreach $n (@ID) {
                        chomp $n;
                        if ($line =~ m/$n/) {
                                $p = 1;
                                last;
                        } else {
                                $p = 0;
                        }
                }
        }
        
        if ($p eq 1) {
                print OUT "$line";
        }
}

close IN1;
close IN2;
close OUT;