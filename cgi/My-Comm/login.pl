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


use DBI;
use CGI;
use CGI::Carp qw(fatalsToBrowser);
use warnings;
use CGI::Session;
use strict;
use Template;

my $LoginHeader = {
                        
                        -title => 'My Community',
                        -style=>[ 
                                       { -type =>'text/css', -src=>'/static/styles/My-Comm/body.css'},
                                       { -type =>'text/css', -src=>'/static/styles/My-Comm/bootstrap.css'},
                                       { -type =>'text/css', -src=>'/static/styles/My-Comm/bootstrap-responsive.css'},
                                       { -type =>'text/css', -src=>'/static/styles/My-Comm/jquery-ui-1.8.18.custom.css'},
                                      
                                    ],  
                         -script=>[
                                        { -type => 'text/javascript', -src => '/static/js/My-Blog/jquery.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Blog/jquery.min.js' },
                                        { -type => 'text/javascript', -src => '/static/js/My-Blog/pre_logout.js' },
                                        { -type => 'text/javascript', -src => '/static/js/My-Blog/bootstrap.js'},
                                     ],
                    };




my $cgi = new CGI;
$cgi->autoEscape(undef);
print $cgi->header(-type=>"text/html", -charset=>"UTF-8");

print $cgi->start_html($LoginHeader); 

if ($cgi->param('status') eq 'error'){
    print '<p style="position:relative;top:200px;left:20%;background-color:red;border-radius: 10px; width:400px;margin:2px;padding:2px" border="1"><font size="5">Authontication ..ERROR:</font></p>';
}
if ($cgi->param('status') eq 'logout'){
    
    print '<p style="position:relative;top:200px;left:20%;background-color:yellow;border-radius: 10px; width:400px;margin:2px;padding:2px" border="1"><font size="5">Logout Successfully</font></p>';
}
if ($cgi->param('status') eq 'Alogout'){
    print '<p style="position:relative;top:200px;left:20%;background-color:orange;border-radius: 10px; width:400px;margin:2px;padding:2px" border="1"><font size="5">You have Logout Previously</font></p>';
}
if ($cgi->param('status') eq 'no_such_userexist'){
    print '<p style="position:relative;top:200px;left:20%;background-color:red;border-radius: 10px; width:400px;margin:2px;padding:2px" border="1"><font size="5">No such user exist ..ERROR:</font></p>';
}

if ($cgi->param('status') eq 'accnt_lockd'){
    print '<p style="position:relative;top:200px;left:20%;background-color:pink;border-radius: 10px; width:400px;margin:2px;padding:2px" border="1"><font size="5">Your account Locked ..</font></p>';
}

if ($cgi->param('status') eq 'accnt_deleted'){
    print '<p style="position:relative;top:200px;left:20%;background-color:pink;border-radius: 10px; width:400px;margin:2px;padding:2px" border="1"><font size="5">Your account Deleted ..</font></p>';
}

if ($cgi->param('status') eq 'jslogout'){
    my $sid = $cgi->param('sid');
    my $cookie = $cgi->cookie(
                            -name=>'CGISESSID',
                            -value=>$sid,
                            -expires=>'-1d',
                        );
     $cgi->redirect(-cookie=>$cookie,-location=>"login.pl?status=logout"); 
}

my $out;
     my $tt = Template->new;
     $tt->process('login.html', undef, \$out)
        || die $tt->error; 

print $out;


print '<div style="bottom:0px;float:center">
						<SMALL style="bottom:0px;float:inherit;color:#BC8F8F">
						       <a href="www.shivaprasad.co.in" target="_blank"> Copyright © Author</a> 
						</SMALL>
          </div>'; 
   
print $cgi->end_html;