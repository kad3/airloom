#!/usr/bin/perl
#basic perl IP checking script
use CGI;
print "Content-type: text/plain; charset=UTF-8\n\n";
my $foo = new CGI;
print $foo->remote_host();
