#!/usr/bin/perl

# this script sends /mode +q <channelname> <nickname> to the server.
# it forces nickname inputs. If no nickname is provided, it won't execute.

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

my $out = "/mode $chan +q";
$out .= " $nick" if $nick;

die "YOU NEED TO SUPPLY A NICKNAME TO REMOVE...\n" unless $ARGV[1];

print "$out\n";

exit;

__END__

