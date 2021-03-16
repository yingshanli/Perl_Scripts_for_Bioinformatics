#!/usr/bin/perl

## Select sequence from Fasta file based on location


## Usage: perl get_sequence.pl file_name chr start end


use warnings;
use Bio::Seq;
use Bio::SeqIO;
use Bio::DB::Fasta;
my $outfile_gene = Bio::SeqIO->new( -format => 'fasta', -file => ">sequence.txt" );

my $file_fasta = $ARGV[0];
$chr = $ARGV[1];
my $gene_start = $ARGV[2];
my $gene_end = $ARGV[3];
my $db = Bio::DB::Fasta->new($file_fasta);
print ("Genome fasta parsed\n");

my $gene_seq = $db->seq($chr, $gene_start, $gene_end );
$output_gene = Bio::Seq->new(
	-seq        => $gene_seq,
    -alphabet   => 'dna',
);

#$output_gene = $output_gene->revcom();
$outfile_gene->write_seq($output_gene);