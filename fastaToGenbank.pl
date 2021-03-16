#!/usr/local/bin/perl -w


# Use BioPerl to convert between sequence formats
# Sequence formats to choose: Fasta, EMBL. GenBank, Swissprot, PIR and GCG
# WI Biocomputing course - Bioinformatics for Biologists - October 2003

use Bio::SeqIO;

$inFile = "BMP7.tfa";
$outFile = "BMP7_gb.txt";

$in  = Bio::SeqIO->new(-file => "$inFile" , '-format' => 'Fasta');
$out = Bio::SeqIO->new(-file => ">$outFile" , '-format' => 'Genbank');

while ( $seq = $in->next_seq() )
{
   $out->write_seq($seq);
}