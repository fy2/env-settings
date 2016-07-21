#!/usr/bin/env perl

use strict;
use warnings;
use lib '/home/feyruz/perl5/lib/perl5/x86_64-linux-gnu-thread-multi';
use CGI;
use CGI::Carp qw(fatalsToBrowser);    # Remove this in production
use DBI;

my $db = 'test';
my $dbh = DBI->connect('DBI:mysql:test;host=192.168.56.101;port=3306', 'root', 'root', {RaiseError=>1, AutoCommit=>0}) or die $DBI::err ;
my $q = new CGI;#
main();

sub main {

    print $q->header(),
     $q->start_html(-title=> 'Welkom',
		    -script=> "window.onload = function () {
						var texta =  document.getElementById('mytextarea');
						texta.value = '';
						texta.focus();}",
		   );

    # if param is defined, this must be a submitted form.
    ( $q->param() ) ? display_results($q) : output_form($q);

    # Output footer and end html
    output_end($q);
}




#-------------------------------------------------------------

# Outputs a footer line and end html tags
sub output_end {
    my ($q) = @_;
    print $q->end_html;
}

# Displays the results of the form
sub display_results {
    my ($q) = @_;

    output_form($q);
    print make_table_from_array( get_labels( $q->param('labels') ) );
}

# Outputs a web form
sub output_form {
    my ($q) = @_;
    print $q->start_form(
        -name   => 'main',
        -id   => 'myform',
        -method => 'POST',
    );
    print $q->h1("Search through labels (label_id OR label_text in en-GB)"),
	  $q->br,
	  $q->br,
          $q->p('Paste newline delimited label_ids or label_texts below. Search method = Exact match + case sensitive. No flanking spaces allowed'),
          $q->textarea(-name=>'labels',
			  -default=>"",
			  -rows=>20,
			  -columns=>80,
			  -id=>'mytextarea',
		),
	  $q->br,
	  $q->br,
	  $q->submit(-name=> 'search'),
	  $q->br,
	  $q->br,
	  $q->end_form;
}


sub get_labels {
	my $labelstr = shift;

my @tbs = qw(
vx_global_admin.labels
cf_global_data.labels
cf_global_config.labels_furniture
cf_global_config.labels
cf_client_data_32.labels
cf_client_config_32.merged_labels
cf_client_config_32.labels_furniture
cf_client_config_32.labels
);
#Duplicated:
#vx_global_config.labels_furniture
#vx_global_config.labels
#vx_global_data.labels
#vx_client_data_32.labels
#vx_client_data.labels
#vx_client_config_32.merged_labels
#vx_client_config_32.labels_furniture
#vx_client_config_32.labels
#vx_client_config.merged_labels
#vx_client_config.labels_furniture
#vx_client_config.labels

#Unnecessary:?
#cf_client_config.merged_labels
#cf_client_config.labels_furniture
#cf_client_config.labels
#cf_client_data.labels

  my @label_texts;

  foreach my $tbl (@tbs) {

    my $statement = "select label_id, label_text from $tbl  where (label_id = ? or label_text = ?) and language_id = 'en-GB' ";

    my $sth = $dbh->prepare($statement) or die $DBI::err;

    my @labels = parse_labels($labelstr);

    foreach my $label (@labels) {
      eval {
       $sth->execute($label, $label) or die $DBI::err;
      }; print $tbl if ($@);

        while ( my ($label_id, $label_text) = $sth->fetchrow_array ) {
        if (defined $label_text) {
          push @label_texts, [$label_id, $label_text, $tbl];
        } else {
          push @label_texts, [$label, 'Label does not exist', $tbl];
        }
      }
    }
  }

	return @label_texts;

}

sub parse_labels {

	my $string = shift;
	my @labels = split /\s*\n/, $string;
	my @clean;
	foreach my $lab (@labels) {
		$lab =~ s/^\s+//;
		push @clean, $lab;
	}
	return @clean;
}


sub make_table_from_array {
	my @array = @_;
	my $tablecontent=[$q->th(['label_id', 'label_text (en-GB)', 'table'])];
	foreach my $tuple (@array) {
		my ($label, $text, $tbl) = @$tuple;
		 push @$tablecontent,  $q->td([ $label, $text, $tbl ]) ;
	}
	return $q->table( { border => 1, -width => '100%'},
			$q->Tr( $tablecontent),
			);
}
