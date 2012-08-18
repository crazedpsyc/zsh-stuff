#!/usr/bin/env perl
use ExtUtils::Installed;
my @local_lib;
for (@INC) { push( @local_lib, $_ ) if $_ =~ qr|^/home/mike|; }
my ($inst) = ExtUtils::Installed->new(inc_override=>\@local_lib);
my (@modules) = $inst->modules();
print "$_ " for @modules; print "\n";
