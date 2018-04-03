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
require 'debug.pl';
use warnings;
use CGI::Session;
use strict;
use POSIX qw/strftime/;
use DBModule;
our $db_exec;

my $cgi = new CGI;
use CGI qw(:all -utf8);
my %params = $cgi->Vars;
my $session = new CGI::Session(undef, $cgi, undef);
my $sid = $session->id;

my $cookie = $cgi->cookie(
                            -name=>'CGISESSID',
                            -value=>$sid,
                            -expires=>'+4h',
                        );

$cgi->autoEscape(undef);
my $uname = $cgi->param('usr_name');
my $passwd = $cgi->param('passwd');

if (is_uname_exist ( $uname )){
    $session->clear;
    $session->delete();
    print $cgi->redirect(-cookie=>$cookie,-location=>"/cgi-bin/My-Comm/login.pl?status=no_such_userexist");   

}
 
my $sql = "SELECT active FROM user_index WHERE uname=?;";
my $qh = $db_exec->prepare ($sql);
$qh->execute($uname);
my $user_active = $qh->fetchrow_array;

if ( $user_active == 0){
    $session->clear;
    $session->delete();
    print $cgi->redirect(-cookie=>$cookie,-location=>"/cgi-bin/My-Comm/login.pl?status=accnt_deleted");  
}

if ( $user_active == -1){
    $session->clear;
    $session->delete();
    print $cgi->redirect(-cookie=>$cookie,-location=>"/cgi-bin/My-Comm/login.pl?status=accnt_lockd");  
}

$sql = "SELECT password FROM user_index WHERE uname=?;";
$qh = $db_exec->prepare ($sql);
$qh->execute($uname);
my $user_passwd = $qh->fetchrow_array;

$sql = "SELECT user_role FROM user_index WHERE uname=?;";
$qh = $db_exec->prepare ($sql);
$qh->execute($uname);
my $user_role = $qh->fetchrow_array;


if ( "$user_passwd" eq "$passwd" ){
   
    $session->param('usr_name',$uname);
    $session->param('role', $user_role);
    if ($user_role == '3' ){
      $session->param('usr_name','ADMIN');  
    }
    $sql = "SELECT uid FROM user_index WHERE uname=?;";
    $qh = $db_exec->prepare ($sql);
    $qh->execute($uname);
    my $uid = $qh->fetchrow_array;
    my $logged_time = strftime('%Y-%m-%d %H:%M:%S',localtime);
    
    $sql = "insert into t_persession (sid , uid ,o_count, logged_time,is_logged_in, is_logged_out)
            values (\'$sid\' ,  \'$uid\'  , '0'   ,    \'$logged_time\',   '1',   '0')";
    $qh = $db_exec->prepare ($sql);
    $qh->execute();
   print $cgi->redirect(-cookie=>$cookie,-location=>"/cgi-bin/My-Comm/index.pl");

}else{
    $session->clear;
    $session->delete();
    print $cgi->redirect(-cookie=>$cookie,-location=>"/cgi-bin/My-Comm/login.pl?status=error");
}

