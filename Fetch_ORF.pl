#!/usr/bin/perl

# Extract ORF sequences


open (IN1, "APL_RNA_contigs_500_RdRP_15_summary.txt") or die "Can't open input: 1 $!\n";


if (-e "APL_RNA_contigs_500_RdRP_15_ORFs.txt") {
	unlink "APL_RNA_contigs_500_RdRP_15_ORFs.txt";
}

while (my $line1 = readline(IN1)) {
	next unless $line1;

	@info = split /\t/, $line1;
	$ID = @info[0];


	if ($info[3] > $info[4]) {
	
		$Hash_rc1{$ID}{num} = $Hash_rc1{$ID}{num} + 1;
		if ($Hash_rc1{$ID}{num} == 1) {
			$Hash_rc1{$ID}{leftmost} = 100000;
			$Hash_rc1{$ID}{rightmost} = 0;
		} 
		if ($info[4] < $Hash_rc1{$ID}{leftmost}) {
			$Hash_rc1{$ID}{leftmost} = $info[4];
		}

		if ($info[3] > $Hash_rc1{$ID}{rightmost}) {
			$Hash_rc1{$ID}{rightmost} = $info[3];
		}

	} else {
		$Hash1{$ID}{num} = $Hash1{$ID}{num} + 1;
		if ($Hash1{$ID}{num} == 1) {
			$Hash1{$ID}{leftmost} = 100000;
			$Hash1{$ID}{rightmost} = 0;
		}
		if ($info[3] < $Hash1{$ID}{leftmost}) {
			$Hash1{$ID}{leftmost} = $info[3];
		}

		if ($info[4] > $Hash1{$ID}{rightmost}) {
			$Hash1{$ID}{rightmost} = $info[4];
		}
	
	}
}

foreach $id (keys %Hash_rc1) {
	print "$id\n$Hash_rc1{$id}{leftmost}\n$Hash_rc1{$id}{rightmost}\n";
	`samtools faidx -i APL_RNA_contigs_500_RdRP_15_fasta.txt $id:$Hash_rc1{$id}{leftmost}-$Hash_rc1{$id}{rightmost} >> APL_RNA_contigs_500_RdRP_15_ORFs.txt`
}

foreach $id (keys %Hash1) {
	print "$id\n$Hash1{$id}{leftmost}\n$Hash1{$id}{rightmost}\n";
	`samtools faidx APL_RNA_contigs_500_RdRP_15_fasta.txt $id:$Hash1{$id}{leftmost}-$Hash1{$id}{rightmost} >> APL_RNA_contigs_500_RdRP_15_ORFs.txt`
}

open (IN2, "APL_RNA_contigs_500_RT_15_summary.txt") or die "Can't open input: 1 $!\n";

if (-e "APL_RNA_contigs_500_RT_15_ORFs.txt") {
	unlink "APL_RNA_contigs_500_RT_15_ORFs.txt";
}

while (my $line2 = readline(IN2)) {
	next unless $line2;

	@info = split /\t/, $line2;
	$ID = @info[0];


	if ($info[3] > $info[4]) {
	
		$Hash_rc2{$ID}{num} = $Hash_rc2{$ID}{num} + 1;
		if ($Hash_rc2{$ID}{num} == 1) {
			$Hash_rc2{$ID}{leftmost} = 100000;
			$Hash_rc2{$ID}{rightmost} = 0;
		} 
		if ($info[4] < $Hash_rc2{$ID}{leftmost}) {
			$Hash_rc2{$ID}{leftmost} = $info[4];
		}

		if ($info[3] > $Hash_rc2{$ID}{rightmost}) {
			$Hash_rc2{$ID}{rightmost} = $info[3];
		}

	} else {
		$Hash2{$ID}{num} = $Hash2{$ID}{num} + 1;
		if ($Hash2{$ID}{num} == 1) {
			$Hash2{$ID}{leftmost} = 100000;
			$Hash2{$ID}{rightmost} = 0;
		}
		if ($info[3] < $Hash2{$ID}{leftmost}) {
			$Hash2{$ID}{leftmost} = $info[3];
		}

		if ($info[4] > $Hash2{$ID}{rightmost}) {
			$Hash2{$ID}{rightmost} = $info[4];
		}
	
	}
}

foreach $id (keys %Hash_rc2) {
	print "$id\n$Hash_rc2{$id}{leftmost}\n$Hash_rc2{$id}{rightmost}\n";
	`samtools faidx -i APL_RNA_contigs_500_RT_15_fasta.txt $id:$Hash_rc2{$id}{leftmost}-$Hash_rc2{$id}{rightmost} >> APL_RNA_contigs_500_RT_15_ORFs.txt`
}

foreach $id (keys %Hash2) {
	print "$id\n$Hash2{$id}{leftmost}\n$Hash2{$id}{rightmost}\n";
	`samtools faidx APL_RNA_contigs_500_RT_15_fasta.txt $id:$Hash2{$id}{leftmost}-$Hash2{$id}{rightmost} >> APL_RNA_contigs_500_RT_15_ORFs.txt`
}

close IN1;
close IN2;
