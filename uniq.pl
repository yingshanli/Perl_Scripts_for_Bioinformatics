#!/usr/bin/perl

# Remove redundant items from perl arrays

open (IN1, "RNA_contigs_500_cap_Known_Viruses_prot.fa") or die "Can't open input: 1 $!\n";

sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}

while (my $line = readline(IN1)) {
        next unless $line;
        
		if ($line =~ /\[(.*)\]/x) {
			$virus_name = $1;
		}
        push @viruses, $virus_name;
}
print "virus_name done\n";
@viruses_uniq = uniq(@viruses);