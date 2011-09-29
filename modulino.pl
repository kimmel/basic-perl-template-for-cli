#!/usr/bin/perl

#-----------------------------------------------------------------------------#
# Copyright (c) 2011 Kirk Kimmel. All rights reserved.
# This program is free software; you can redistribute it and/or modify it
# under the 3-clause BSD license. See LICENSE.txt.
#
# The newest version of this file can be found at:
#   https://github.com/kimmel/basic-perl-template-for-cli
#-----------------------------------------------------------------------------#

use 5.009_001;
use warnings;
use strict;
use English qw( -no_match_vars );
use Getopt::Long qw( GetOptions );
use Pod::Usage qw( pod2usage );

package main;

our $VERSION = 1.0;

#-----------------------------------------------------------------------------

sub main {
    Getopt::Long::Configure('bundling');
    my $cli_options = GetOptions(
        'help|?' => sub { pod2usage( -verbose => 1 ) },
        'man'    => sub { pod2usage( -verbose => 2 ) },
        'usage'  => sub { pod2usage( -verbose => 0 ) },
        'version' => sub { print "version: $VERSION\n"; exit 1; },
    ) or die "Incorrect usage.\n";

    return;
}

main() unless caller;

1;

__END__

#-----------------------------------------------------------------------------

=pod

=head1 NAME

C<cmd_line_example> - Does something really awesome.

=head1 VERSION

=head1 USAGE

  cmd_line_example [ options ]
  cmd_line_example { --help | --man | --usage | --version }

=head1 REQUIRED ARGUMENTS

=head1 ARGUMENTS

=head1 OPTIONS

  These are the application options.

=over

=item C<--help>

  Displays a brief summary of options and exits.

=item C<--man>

  Displays the complete manual and exits.

=item C<--usage>

  Displays the basic application usage.

=item C<--version>

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

=head1 AUTHOR

Name < email address >

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2011 < name here >. All rights reserved.

This program is free software; you can redistribute it and/or modify it under
the 3-clause BSD license. The full text of this license can be found online at
< http://opensource.org/licenses/BSD-3-Clause >

=cut

