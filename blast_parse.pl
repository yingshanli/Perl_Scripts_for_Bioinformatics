#!/usr/local/bin/perl -w

# Parsing BLAST reports with BioPerl's Bio::SearchIO module
# See help at http://www.bioperl.org/HOWTOs/html/SearchIO.html for all data that can be extracted

use Bio::SearchIO;

# Prompt the user for the file name if it's not an argument
# NOTE: BLAST file must be in text (not html) format
if (! $ARGV[0])
{
   print "What is the BLAST file to parse? ";

   # Get input and remove the newline character at the end
   chomp ($inFile = <STDIN>);
}
else
{
   $inFile = $ARGV[0];
}

$report = new Bio::SearchIO(
         -file=>"$inFile",
              -format => "blast"); 

print "QueryAcc\tHitDesc\tHitSignif\tHSP_rank\t\%ID\teValue\tHSP_length\n";

# Go through BLAST reports one by one              
while($result = $report->next_result) 
{
   # Go through each each matching sequence
   while($hit = $result->next_hit) 
   { 
      # Go through each each HSP for this sequence
        while ($hsp = $hit->next_hsp)
         { 
            # Print some tab-delimited data about this HSP
            
            print $result->query_accession, "\t";
            print $hit->description, "\t";
            print $hit->significance, "\t";
            print $hsp->rank, "\t";
            print $hsp->percent_identity, "\t";
            print $hsp->evalue, "\t";
            print $hsp->hsp_length, "\n";
      } 
   } 
}