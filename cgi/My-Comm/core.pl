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
use Data::Dumper;
require ("debug.pl");
use CGI::Carp qw(fatalsToBrowser);
use JSON;
our  $MainPageHeader;
use Time::Local;
use Date::Manip;


my $cgi = CGI::new();
my $flag = $cgi->param('flag');



if ( $flag eq 'GET_BLK_FLOOR_INFO' ){
   
   my ($user_name,$role) = is_valid_user($cgi); 
   my $floor = $cgi->param('floor');
   my $block = $cgi->param('block');
   my $block_floor =  $block . $floor;
   my @unames = get_unames_in_block_floor ( $block_floor );
   my $out = '';
   my $data = {
            uname => \@unames,
   };            
   my $tt = Template->new;
          $tt->process('show_unames_in_block_floor.html', $data, \$out)
            || die $tt->error;
   print "Content-type: text/plain; charset=iso-8859-1\n\n";
   print $out;
}elsif( $flag eq 'GET_PROFILE_BY_UNAME' ){
    my $uname = $cgi->param('uname');  
    my @profiles = get_all_member_profiles( $uname );
    my $data = {
               profiles => \@profiles,
               count => 0,
      };
     if (@profiles){
         $data->{count} = 1;      
     }
     print $cgi->header( );
     my $out = '';
     my $tt = Template->new;
            $tt->process('show_all_member_profile_in_window.html', $data, \$out)
            || die $tt->error;
     print $out;   
}elsif ( $flag eq 'GET_MSG_DATA'){
   my $msg_txt = $cgi->param('msg_txt');
   $msg_txt =~ s/\'/\\'/;$msg_txt =~ s/\@/\\@/;
   my $subject = $cgi->param('subject');
   $subject =~ s/\'/\\'/;$subject =~ s/\@/\\@/;
   my $recipients = $cgi->param('recipient');
   my $from = $cgi->param('from');
  
   my @to_s;
   if ( $recipients ne 'BROADCAST' ){
      @to_s =  split ',' , $recipients;
   }else{
      @to_s = get_all_unames ( );   
   
   }
   my %hash =  (
                 from => $from,
                 recipients => [ ],
                 to_s => $recipients,
                 subject => $subject,
                 msg_txt => $msg_txt
               );
  
   foreach (@to_s){
     push (@{$hash{recipients}}, $_); 
   }
   my $ret = update_message ( %hash );
   print "Content-type: text/plain; charset=iso-8859-1\n\n";
   print '<b><font color="green"> Message Sent Successfully</font></b>'
}elsif ($flag eq 'SHOW_SELECT_SEARCH_MSG'){
   my $uname = $cgi->param('uname');
   my $msg_id = $cgi->param('msg_id');
   my %data = get_message_by_msg_id ( $msg_id, $uname ); 
   my $out = '';
   my $tt = Template->new;
        $tt->process('msg_open_sent_item_in_dialog.html', \%data, \$out)
        || die $tt->error;
   print $out;  
}elsif ($flag eq 'DEL_MSG_MARKED'){
      my $msg_ids = $cgi->param('msg_ids');
      my $uname = $cgi->param('uname');
      $msg_ids =~ s/checkbox_//g;
      my @arr_msg_ids = split ':',$msg_ids;
      foreach my $msg_id (@arr_msg_ids){
         my $ret = delete_message_by_msg_id ( $msg_id, $uname );
      }
      print "Content-type: text/plain; charset=iso-8859-1\n\n";
      print '<b><font color="green"> Message Sent Successfully</font></b>';
}elsif ($flag eq 'SHOW_SENT_MSG'){
   my $uname = $cgi->param('uname');
   my $msg_id = $cgi->param('msg_id');
   my %data = get_sent_message_by_msg_id ( $msg_id, $uname );
   $data{from_s} =~ s/^\s+//; $data{from_s} =~ s/\s+$//;
    
    my $out = '';
    my $tt = Template->new;
        $tt->process('msg_open_sent_item_in_dialog.html', \%data, \$out)
        || die $tt->error;
    print $out;
}elsif ($flag eq 'DEL_SENT_MSG_MARKED'){
      my $msg_ids = $cgi->param('msg_ids');
      my $uname = $cgi->param('uname');
      $msg_ids =~ s/checkbox_//g;
      my @arr_msg_ids = split ':',$msg_ids;
      foreach my $msg_id (@arr_msg_ids){
        my $ret = delete_sent_message_by_msg_id ( $msg_id, $uname );
      }
      print "Content-type: text/plain; charset=iso-8859-1\n\n";
      print '<b><font color="green"> Message Sent Successfully</font></b>';
}
   
   
 
   




1
;