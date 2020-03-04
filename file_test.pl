#! /usr/bin/perl

use strict;
use File::Copy;

my ($fh, $fh2);

open ($fh, '<', 'hosts.test')
or die "ERROR open : $!";

my $filename = "write_" . time . ".txt";

open ($fh2, '>', $filename)
or die "ERROR open : $!";

while (1) {
	my $line;

	unless(defined($line = <$fh>)) {
		if ($!) {
			die "Error file: $!";
		} else {
			last;
		}
	}

	if ($. == 1) {
		$line = "update:" . $line;
	}

	print $fh2 $line
	or die "Error writing: $!";
}

close $fh;
close $fh2 or die "error close: $!";

File::Copy::move($fh2, $fh);	
#or die "cannot move $!";