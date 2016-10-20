#!/usr/bin/perl -w

use strict;


open(IN,"rt.rename.fa");

my $id="";
my $seq="";
my $n=0;

while(<IN>){
    chomp($_);
#    print "$_\n";


    if($_ =~ />(.*)/){
	if($n>0){
	    print "$id\n";
	    print "$seq\n";
	}
	$seq ="";
	$id =$1;
	$n++;
    }
    else{

#print "original ".$_."\n";	
	$seq.=$_;
#print "appended ".$seq."\n\n";


    }

}


close(IN);


