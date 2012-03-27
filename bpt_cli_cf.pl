#!/usr/bin/perl

# Copyright (c) 2011-2012 Kirk Kimmel. All rights reserved.
# This program is free software; you can redistribute it and/or modify it
# under the 3-clause BSD license. See LICENSE.txt.
#
# The newest version of this file can be found at:
#   https://github.com/kimmel/basic-perl-template-for-cli

use utf8;
use warnings;
use strict;
use English qw( -no_match_vars );
use Getopt::Long;
use Pod::Usage qw( pod2usage );

# from CPAN
use Config::General qw( ParseConfig );

sub read_config_file {
    my $file = shift;

    if ( -r -s $file ) {
        return ParseConfig($file);
    }
    else {
        if ( !-r $file ) {
            die "Error '$file' is not accessable.\n";
        }
        die "Error processing configuration file: $file\n$ERRNO\n";
    }
}

#-----------------------------------------------------------------------------#
our $VERSION = 1.0;
my $config_file = './test.config';

my $parser = Getopt::Long::Parser->new();
$parser->configure( 'bundling', 'no_ignore_case', );

my $cli_options = {
    'config|c=s' => \$config_file,
    'help|?'     => sub { pod2usage( -verbose => 1 ) },
    'man'        => sub { pod2usage( -verbose => 2 ) },
    'usage'      => sub { pod2usage( -verbose => 0 ) },
    'version'    => sub { print "version: $VERSION\n"; exit 1; },
};

$parser->getoptions( %{$cli_options} ) or die "Incorrect usage.\n";

my %settings = read_config_file($config_file);

1;

__END__

#-----------------------------------------------------------------------------

=pod

=encoding utf8

=head1 NAME

B<cmd_line_example> - Does something really awesome.

=head1 VERSION

=head1 USAGE

cmd_line_example [ options ]

=head1 REQUIRED ARGUMENTS

=head1 ARGUMENTS

=head1 OPTIONS

These are the application options.

=over

=item B<-c, --config>

Specify the configuration file to use.

=item B<-?, --help>

Displays a brief summary of options and exits.

=item B<--man>

Displays the complete manual and exits.

=item B<--usage>

Displays the basic application usage.

=item B<--version>

Displays the version number and exits.

=back

=head1 DESCRIPTION

This application can do < x, y, and z >.

=head1 DIAGNOSTICS

=head1 EXIT STATUS

 0 - Sucessful program execution.
 1 - Program exited normally. --help, --man, and --version return 1.
 2 - Program exited normally. --usage returns 2.

=head1 CONFIGURATION

=head1 DEPENDENCIES

=head1 INCOMPATIBILITIES

=head1 BUGS AND LIMITATIONS

=head1 HOMEPAGE

http://

=head1 AUTHOR

Name < email_address >

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2012 < name_here >. All rights reserved.

This program is free software; you can redistribute it and/or modify it under
the 3-clause BSD license. The full text of this license can be found online at
< http://opensource.org/licenses/BSD-3-Clause >

=cut

