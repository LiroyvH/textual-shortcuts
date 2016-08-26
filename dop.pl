#!/usr/bin/perl

# this script sends /cs DEOP <channelname> to the server.
# it accepts nickname inputs. If no nickname is provided, it'll execute it for your own nickname and gives you -o.

use Data::Dumper;
$Data::Dumper::Indent = 1;

use strict;
use warnings;

my $debug = 0;

print Dumper( \@ARGV ) if $debug;

my $nick = $ARGV[1] || '';
my $chan = $ARGV[0] || '';

# sanity check the nick
print "nick is too long\n" and exit if length( $nick ) > 20;
print "nick has invalid characters\n" and exit if $nick !~ /^[A-Za-z0-9]*$/;

# sanity check the channel name
print "chan is too long\n" and exit if length( $chan ) > 20;
print "chan has invalid characters\n" and exit if $chan !~ /^\#[-A-Za-z0-9]+$/;

my $out = "/cs DEOP $chan";
$out .= " $nick" if $nick;

print "$out\n";

exit;

__END__
