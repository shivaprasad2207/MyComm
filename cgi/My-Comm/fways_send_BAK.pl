use strict;
use CGI;
use CGI::Carp qw(fatalsToBrowser);
use POSIX qw/strftime/;
use MIME::Lite;
use MIME::Parser;
use Net::SMTP::SSL;
use MIME::Base64;

     
 
      my $from = 'support@fways.in';
      my $passwd = 'support';   
      my $html_data =  $ARGV[3] ;  
       
      my $msg = MIME::Lite->new( 
                    From => $from, 
                    To => $ARGV[0], 
                    Subject => $ARGV[1], 
                    Type => 'text', 
                    Encoding=> '7bit', 
                    Data => $ARGV[2],
                  );
      $msg->attach (
             Type => 'text/html', 
             Data =>  $ARGV[4],
      );
      $msg->send(
                      'smtp',
                       "mail.fways.in:25",
                       Timeout=>90,
                       AuthUser=>$from,
                       AuthPass=>$passwd
                 );
      
      exit (0);