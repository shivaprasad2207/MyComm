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
use lib::Headers;
use lib::html_Templet;
our  $MainPageHeader;
use Time::Local;
use Date::Manip;
use URI::Escape;

our                  (
                        $sudo_admin_create_form,
                        $sudo_admin_depromote_form,
                        $admin_create_form,
                     );

my $cgi = CGI::new();
my $flag = $cgi->param('flag');
$cgi->autoEscape(0);

if ($flag eq 'SHOW_MEMBER_ADD_FORM'){
   my $out;
   my $tt = Template->new;
         $tt->process('admin_member_add_form.html', undef, \$out)
            || die $tt->error;
   print "Content-type: text/plain; charset=iso-8859-1\n\n";
   print $out;
   
}elsif ($flag eq 'SHOW_MEMBER_MODIFY_FORM'){
    my @blocks = ( 1, 2, 3, 4);
    my @floors = (1,2,3,4,5,6);
    my $out;
    my $data = {
               block => \@blocks,
               floor => \@floors,
      };
    
     my $tt = Template->new;
          $tt->process('admin_member_modify_view_form.html', $data, \$out)
            || die $tt->error;
     print $out;
}elsif ($flag eq 'SHOW_OCCUPANT_MANAGE_FORM'){
    my @blocks = ( 1, 2, 3, 4);
    my @floors = (1,2,3,4,5,6);
    my $out;
    my $data = {
               block => \@blocks,
               floor => \@floors,
      };
    
     my $tt = Template->new;
          $tt->process('admin_occupant_manage_details.html', $data, \$out)
            || die $tt->error;
     print $out;
}elsif( $flag eq 'GET_BLK_FLOOR_INFO' ){  
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
          $tt->process('admin_members_id_tab_view_form.html', $data, \$out)
            || die $tt->error;
   print "Content-type: text/plain; charset=iso-8859-1\n\n";
   print $out;
}elsif( $flag eq 'GET_BLK_FLOOR_OF_OCCUPANT' ){  
   my ($user_name,$role) = is_valid_user($cgi); 
   my $floor = $cgi->param('floor');
   my $block = $cgi->param('block');
   my $block_floor =  $block . $floor;
   my @unames = get_locked_unames_in_block_floor ( $block_floor );
   my $out = '';
   my $data = {
            uname => \@unames,
   };            
   my $tt = Template->new;
          $tt->process('admin_occupannt_button_content.html', $data, \$out)
            || die $tt->error;
   print "Content-type: text/plain; charset=iso-8859-1\n\n";
   print $out;
}elsif( $flag eq 'SHOW_MEMBER_INFO' ){  
   my ($user_name,$role) = is_valid_user($cgi); 
   my $uname = $cgi->param('uname');
   my %hash = get_owner_info ( $uname);
   my $out = '';

   my $tt = Template->new;
          $tt->process('admin_member_view_profile.html', \%hash, \$out)
            || die $tt->error;
   print "Content-type: text/plain; charset=iso-8859-1\n\n";
   print $out;
}elsif( $flag eq 'MOD_MEMBER_INFO' ){  
   my ($user_name,$role) = is_valid_user($cgi); 
   my $uname = $cgi->param('uname');
   my %hash = get_owner_info ( $uname);
   my $out = '';
   my $tt = Template->new;
          $tt->process('admin_member_modify_profile.html', \%hash , \$out)
            || die $tt->error;
   print "Content-type: text/plain; charset=iso-8859-1\n\n";
   print $out;
}elsif( $flag eq 'MEMBER_ADD_INFO' ){  
   my ($user_name,$role) = is_valid_user($cgi); 
   
   my $ret = is_uname_exist ( $cgi->param('uname') );
   print "Content-type: text/plain; charset=iso-8859-1\n\n";
   print '<br><font color="red" size="15"><b> Uname : ' . $cgi->param('uname') . ' already used !. </b> </font>';
   exit;
   my %hash = (
               'uname' => $cgi->param('uname'),
               'fname' => $cgi->param('fname'),
               'lname' => $cgi->param('lname'),
               'occupation' => $cgi->param('occupation'),
               'email' => $cgi->param('email'),
               'mobile' => $cgi->param('mobile'),
               'adress' => $cgi->param('adress'), 
   );
   
   my @params = (
                  $cgi->param('uname'), $cgi->param('fname'),$cgi->param('lname'),
                  $cgi->param('occupation'), $cgi->param('email'),
                  $cgi->param('mobile'), $cgi->param('adress')
               );
   my @index =  (
                  'Uname' , 'First Name', 'Last Name',
                  'Type Of Occupation', 'Email' , 'Mobile Number',
                  'Adress'
               );
   my $z_flag = 'NO_EMPTY' ;
   my $i ;
   for ( $i = 0 ; $i < @params ; $i++ ){ 
       if ( $params[$i] !~ /\S/ ){
         $z_flag = 'EMPTY';
        last; 
       }  
   }
   
   if ( $z_flag eq 'NO_EMPTY'){   
      my $ret = update_owner_info ( %hash);
      print "Content-type: text/plain; charset=iso-8859-1\n\n";
      print '<br><font color="green" size="15"><b> New Owner Info Updated </b> </font>';
   }else{
        print "Content-type: text/plain; charset=iso-8859-1\n\n";
        print '<br><font color="red" size="15"><b> Not Success full : ' . $index[$i] . ' is to be filled. </b> </font>';
   }
  
}elsif( $flag eq 'MEMBER_MODIFIED_INFO' ){  
   my ($user_name,$role) = is_valid_user($cgi); 
   
   my %hash = (
               uname => $cgi->param('uname'),
               fname => $cgi->param('fname'),
               lname => $cgi->param('lname'),
               occupation => $cgi->param('occupation'),
               email => $cgi->param('email'),
               mobile => $cgi->param('mobile'),
               adress => $cgi->param('adress'), 
   );
   
    my @params = (
                  $cgi->param('uname'), $cgi->param('fname'),$cgi->param('lname'),
                  $cgi->param('occupation'), $cgi->param('email'),
                  $cgi->param('mobile'), $cgi->param('adress')
               );
   my @index =  (
                  'Uname' , 'First Name', 'Last Name',
                  'Type Of Occupation', 'Email' , 'Mobile Number',
                  'Adress'
               );
   my $z_flag = 'NO_EMPTY' ;
   my $i ;
   for ( $i = 0 ; $i < @params ; $i++ ){ 
       if ( $params[$i] !~ /\S/ ){
         $z_flag = 'EMPTY';
        last; 
       }  
   }
      
   if ( $z_flag eq 'NO_EMPTY'){ 
      my $ret = modify_owner_info ( %hash);
      print "Content-type: text/plain; charset=iso-8859-1\n\n";
      print '<br><font color="green" size="15"><b>Owner Info Updated </b> </font>';
   }else{
        print "Content-type: text/plain; charset=iso-8859-1\n\n";
        print '<br><font color="red" size="15"><b> Not Success full : ' . $index[$i] . ' is to be filled. </b> </font>';
   }

}elsif( $flag eq 'SHOW_CHPASSWD_FORM' ){
   my ($user_name,$role) = is_valid_user($cgi);
   my %hash = ( uname => $user_name);
   my $out = '';
   my $tt = Template->new;
          $tt->process('admin_chpasswd_form.html', \%hash , \$out)
            || die $tt->error;
   print "Content-type: text/plain; charset=iso-8859-1\n\n";
   print $out;   
}elsif( $flag eq 'CHPASSWD_INFO' ){
   my ($user_name,$role) = is_valid_user($cgi);   
   my $uname = $cgi->param('uname');
   my $old_passwd = $cgi->param('old_passwd');
   my $new1_passwd = $cgi->param('new1_passwd');
   my $new2_passwd = $cgi->param('new2_passwd');
   my $org_passwd = get_user_passwd_by_name ( $user_name );
   if ( $new1_passwd !~ /\S/ ){
      print "Content-type: text/plain; charset=iso-8859-1\n\n";
      print '<font color="red"> <b>Password Can not be Empty</b></font>';
      exit ();
   }
   if ( $old_passwd ne $org_passwd ){
      print "Content-type: text/plain; charset=iso-8859-1\n\n";
      print '<font color="red"> <b>Password Entered is invalid</b></font>';
      exit ();
   }
   if ( $new1_passwd ne $new2_passwd ){
      print "Content-type: text/plain; charset=iso-8859-1\n\n";
      print '<font color="red"> <b>New Password and Repeated Password do not Match.</b></font>';
      exit ();
   }
   my $ret = change_user_passwd ( $uname, $new1_passwd);
   print "Content-type: text/plain; charset=iso-8859-1\n\n";
   print '<font color="green"> <b>Password Changed...</b></font>';
}elsif( $flag eq 'SHOW_ADMIN_NOTICE_TEXT_BOX' ){
    my ($user_name,$role) = is_valid_user($cgi);
    my $out = '';
   my $tt = Template->new;
          $tt->process('admin_notice_text_box_form.html', undef , \$out)
            || die $tt->error;
   print "Content-type: text/html; charset=iso-8859-1\n\n";
   print $out;   
}elsif( $flag eq 'SUBMIT_ADMIN_NOTICE_TEXT' ){
      my ($user_name,$role) = is_valid_user($cgi);
      my $html_text =  $cgi->param('html_text');
      $html_text =~ s/MY_AMB/&/g;
      $html_text =~ s/MY_LT/</g;
      $html_text =~ s/MY_GT/>/g;
      $html_text =~ s/MY_SEMICOMM/;/g;
      my $ret = submit_admin_notice_preview_text( $html_text);
       print "Content-type: text/html; charset=iso-8859-1\n\n";
       print '<b><font color="green"> Admin Notice Submitted for Preview </font><b>' ;
}elsif( $flag eq 'PROMOTE_PREVIEW_NOTICE' ){
    my ($user_name,$role) = is_valid_user($cgi);
    my $ret = promote_preview_notice ();
    print "Content-type: text/html; charset=iso-8859-1\n\n";
    print '<b><font size="10" color="green"> Preview notice is Promoted to Main Notice Board</font></b>';   
}elsif( $flag eq 'LIST_ALL_NOTICE' ){
    my ($user_name,$role) = is_valid_user($cgi);
    my @notice_list = get_all_notice_list ();
    my $data = {
               data => \@notice_list,   
    };
       
   my $out = '';
   my $tt = Template->new;
          $tt->process('admin_notice_list_form.html', $data , \$out)
            || die $tt->error;
   print "Content-type: text/html; charset=iso-8859-1\n\n";
   print $out;
}elsif( $flag eq 'DELETE_NOTICE_BY_ID' ){
    my ($user_name,$role) = is_valid_user($cgi);
    my $notice_id = $cgi->param('notice_id');
    my $ret = delete_notice_by_id ( $notice_id );
     print "Content-type: text/html; charset=iso-8859-1\n\n";
    print '<b><font size="3" color="green"> Selected Notice Deleted </font></b>';  
}elsif( $flag eq 'DELETE_EXISTING_NOTICE' ){
    my ($user_name,$role) = is_valid_user($cgi);
    my $ret = delete_existing_notice( );
     print "Content-type: text/html; charset=iso-8859-1\n\n";
     print '<b><font size="3" color="green"> Deleted Existing Notice </font></b>';  
}elsif( $flag eq 'SUDO_ADMIN_CREATE_FORM' ){
     my ($user_name,$role) = is_valid_user($cgi);
     print "Content-type: text/html; charset=iso-8859-1\n\n";
     print $sudo_admin_create_form;  
}elsif( $flag eq 'SUDO_ADMIN_DEPROMOTE_FORM' ){
     my ($user_name,$role) = is_valid_user($cgi);
     print "Content-type: text/html; charset=iso-8859-1\n\n";
     print $sudo_admin_depromote_form;  
}elsif( $flag eq 'ADMIN_CREATE_FORM' ){
     my ($user_name,$role) = is_valid_user($cgi);
     print "Content-type: text/html; charset=iso-8859-1\n\n";
     print $admin_create_form;  
}elsif( $flag eq 'SUDO_ADMIN_CREATE' ){
     my ($user_name,$role) = is_valid_user($cgi);
     my $uname = $cgi->param('uname');
     my $ret = create_sudo_admin ( $uname );
     print "Content-type: text/html; charset=iso-8859-1\n\n";
     print '<b><font size="3" color="green">' . "  $uname" . ' is privilage as sudo admin</font></b>';  
}elsif( $flag eq 'SUDO_ADMIN_DEPRMOTE' ){
     my ($user_name,$role) = is_valid_user($cgi);
     my $uname = $cgi->param('uname');
     my $ret = depromote_sudo_admin ( $uname );
     print "Content-type: text/html; charset=iso-8859-1\n\n";
     print '<b><font size="3" color="green">' . "  $uname" . ' privilage is depromted and will be able login as normal user</font></b>'; 
}elsif( $flag eq 'REGISTER_ADMIN' ){
     my ($user_name,$role) = is_valid_user($cgi);
     my %params  = $cgi->Vars;
     if (is_uname_exist($params{uname}) != 0 ){
         my $ret = register_admin ( %params);
         print "Content-type: text/html; charset=iso-8859-1\n\n";
         print '<b><font size="3" color="green">' . " $params{fname} $params{lname}" . '  is promoted as admin user</font></b>';     
     }else{
         print "Content-type: text/html; charset=iso-8859-1\n\n";
         print '<b><font size="5" color="red">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'.
               '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'.
               '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'
               . "$params{uname}" . '  is already exist </font></b>';     
     }
}elsif( $flag eq 'ADMIN_DELETE_FORM' ){
   my ($user_name,$role) = is_valid_user($cgi);
   my $out;
   my @admin_list = get_admin_and_sudo_admin_info();
   my $data = {
      data => \@admin_list,
   };
   my $tt = Template->new;
          $tt->process('admin_list_all_admins.html', $data , \$out)
            || die $tt->error;
   print "Content-type: text/html; charset=iso-8859-1\n\n";
   print $out;
}elsif( $flag eq 'ADMIN_DELETE' ){
   my ($user_name,$role) = is_valid_user($cgi);
   my $uname = $cgi->param('uname');
   my $ret = delete_admin ($uname);
   print "Content-type: text/html; charset=iso-8859-1\n\n";
   print  '<b><font size="5" color="red">' . " Admin ..$uname " . 'Admin privilages depromoted and account removed. </font></b>'  
}elsif( $flag eq 'LOCK_OCCUPANT_ACCT' ){
   my ($user_name,$role) = is_valid_user($cgi);
   my $uname = $cgi->param('uname');
   my $ret = lock_occupant_account ($uname);
   print "Content-type: text/html; charset=iso-8859-1\n\n";
   print  '<br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
   
         <b><font size="5" color="red">' . " $uname " . ' Account Locked </font></b>'  
}elsif( $flag eq 'UNLOCK_OCCUPANT_ACCT' ){
   my ($user_name,$role) = is_valid_user($cgi);
   my $uname = $cgi->param('uname');
   my $ret = unlock_occupant_account ($uname);
   print "Content-type: text/html; charset=iso-8859-1\n\n";
   print  '<br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
   <b><font size="5" color="green">' . " $uname " . ' Account UnLocked </font></b>'  
}elsif( $flag eq 'VIEW_OCCUPANT_PROFILE' ){
   my ($user_name,$role) = is_valid_user($cgi);
   my $uname = $cgi->param('uname');
   my @profiles = get_all_member_profiles( $uname );
   my $out = '';
   my $data = {
               profiles => \@profiles,
               count => 0,
      };
     if (@profiles){
         $data->{count} = 1;      
     }
   my $tt = Template->new;
            $tt->process('admin_show_occupants_profile.html', $data, \$out)
            || die $tt->error;
   print $out;
}elsif( $flag eq 'DEL_OCCUPANT_PROFILE' ){
   my ($user_name,$role) = is_valid_user($cgi);
   my $uname = $cgi->param('uname');
   my $ret = unlock_occupant_account ($uname);
   delete_all_msgs_from_user ($uname);
   back_up_member_profile_by_uname ($uname);
   delete_up_member_profile_by_uname ($uname);
   print "Content-type: text/html; charset=iso-8859-1\n\n";
   print  '<br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
   <b><font size="5" color="red">' . ' All profiles of ' . " $uname " . ' Has been deleted </font></b>'  
}





1
;