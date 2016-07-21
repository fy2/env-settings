#!/usr/bin/env perl
use strict;
use warnings;
use lib $ENV{'HOME'} . '/dev/vX/WCN/lib';

use YAML qw/LoadFile DumpFile/;
use WCN::SAN;

use Data::Dumper;

my $file = $ARGV[0];
my $path = $ARGV[1];

my $CONFIG = LoadFile($ENV{'HOME'} .'/dev/vX/WCN/wcn.yml');

my $san = WCN::SAN->new($CONFIG->{'SAN'});

open my $fh, "<", $file or die "Failed to open $file";
my $data ='';
read ($fh, $data, -s $file);
close ($fh);
    $san->upload_file({
      'path'      => $path,
      'data'      => $data,
      'overwrite' => 1,
    });



#./stashUpload ./someFile.doc 'jail/sha/000/032/c/cf/cf8/cf87/cf873/cf87352d288bbdfafb5b6fb308486819c370f1a2'
