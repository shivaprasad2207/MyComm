#!/usr/bin/perl
BEGIN {
   push @INC, "./lib";  
   push @INC, '/home/nnsprasad/perl/usr/lib/perl5';
   push @INC, '/home/nnsprasad/perl/usr/lib/perl5/x86_64-linux-thread-multi';
   require '/home/nnsprasad/public_html/cgi-bin/My-Comm/debug.pl';
   binmode(STDIN );  # Form data
   binmode(STDOUT, ':encoding(UTF-8)');  # HTML
   binmode(STDERR, ':encoding(UTF-8)');  # Error messages
}
use warnings;
use strict;
use CGI;
require CGI::Session;
use CGI::Carp qw(fatalsToBrowser);
my $cgi = CGI->new();
my $flag = $cgi->param('flag');

my $sid = $cgi->param('term');
my $session = CGI::Session->new( $sid );
$session->delete();
$session->flush();
my $cookie = $cgi->cookie(
                            -name=>'CGISESSID',
                            -value=>$sid,
                            -expires=>'-1d',
                        );
print $cgi->redirect(-cookie=>$cookie,-location=>"login.pl?status=Alogout"); 