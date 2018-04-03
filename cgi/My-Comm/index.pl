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

use CGI;
use CGI qw(:all -utf8);
use CGI::Carp qw(fatalsToBrowser);
require CGI::Session;
require 'debug.pl';
use Template;
use strict;
use warnings;
use Data::Dumper;
use lib::Headers;
use JSON;
use utf8;
use Time::Local;
use Date::Manip;
#use HTML::FromText;

our $HtmlEditorHeader;
our $MainPageHeader;
our $MailEditor;

my $cgi = CGI::new;
$cgi->autoEscape(1);

my %page_function_hash = (
   
        'MainPage' => {
                        pFunction => \&F_MainPage,
                        pHeader =>  $MainPageHeader,
                        pBody => 'F_MainPageBody',
                        pFooter => 'F_MainPageFooter',
                        
                     },
       'UpLoadForm' => {
                        pFunction => \&F_UpLoadForm,
                        pHeader =>  $MainPageHeader,
                        pBody => 'F_MainPageBody',
                        pFooter => 'F_MainPageFooter',
                        
                     },
       'GetProfileData' => {
                        pFunction => \&F_GetProfileData,
                        pHeader =>  $MainPageHeader,
                        pBody => 'F_MainPageBody',
                        pFooter => 'F_MainPageFooter',
                        
                     },
      'ShowProfileData' => {
                        pFunction => \&F_ShowProfileData,
                        pHeader =>  $MainPageHeader,
                        pBody => 'F_MainPageBody',
                        pFooter => 'F_MainPageFooter',
                        
                     },
      'DeleteProfileForm' => {
                        pFunction => \&F_DeleteProfileForm,
                        pHeader =>  $MainPageHeader,
                        pBody => 'F_MainPageBody',
                        pFooter => 'F_MainPageFooter',
                        
                     },
      'DeleteProfileData' => {
                        pFunction => \&F_DeleteProfileData,
                        pHeader =>  $MainPageHeader,
                        pBody => 'F_MainPageBody',
                        pFooter => 'F_MainPageFooter',
                        
                     },
      'ModifyProfileForm' => {
                        pFunction => \&F_ModifyProfileForm,
                        pHeader =>  $MainPageHeader,
                        pBody => 'F_MainPageBody',
                        pFooter => 'F_MainPageFooter',
                        
                     },
      
      'ModifyMemberProfileForm' => {
                        pFunction => \&F_ModifyMemberProfileForm,
                        pHeader =>  $MainPageHeader,
                        pBody => 'F_MainPageBody',
                        pFooter => 'F_MainPageFooter',
                        
                     },
      'ModifiedProfileData' =>{
                        pFunction => \&F_ModifiedProfileData,
                        pHeader =>  $MainPageHeader,
                        pBody => 'F_MainPageBody',
                        pFooter => 'F_MainPageFooter',
            },
      'SelectNeibhourForm' => {
                        pFunction => \&F_SelectNeibhourForm,
                        pHeader =>  $MainPageHeader,
                        pBody => 'F_MainPageBody',
                        pFooter => 'F_MainPageFooter',
      },
      
      'GotBlockFloor' => {
                        pFunction => \&F_GotBlockFloor ,
                        pHeader =>  $MainPageHeader,
                        pBody => 'F_MainPageBody',
                        pFooter => 'F_MainPageFooter',
      },
      'ShowMsgMainForm' =>{
                           pFunction => \&F_ShowMsgMainForm ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },
      'Compose' =>{
                           pFunction => \&F_Compose ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },
      'ShowInBox' => {
                           pFunction => \&F_ShowInBox ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },    
      'ShowMessage' => {
                           pFunction => \&F_ShowMessage ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },    
      
       'ReplyAll' => {
                           pFunction => \&F_ReplyAll ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },
       'Reply' => {
                           pFunction => \&F_Reply ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },    
      'MsgFarward' =>{
                           pFunction => \&F_MsgFarward ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },    
      
      'MsgDelete' =>{
                           pFunction => \&F_MsgDelete ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },    
      'SentMessage' => {
                           pFunction => \&F_SentMessage ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter', 
      },
      
      'ShowSentMessage' => {
                           pFunction => \&F_ShowSentMessage ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },
       
      'MsgSentDelete' => {
                           pFunction => \&F_MsgSentDelete ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },
      'MsgBroadCast' => {
                           pFunction => \&F_MsgBroadCast ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },
      'GeneralSearchForm' => {
                           pFunction => \&F_GeneralSearchForm ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },
      
      'GetGeneralSearch' => {
                           pFunction => \&F_GetGeneralSearch ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },
      'MailSearchForm' => {
                           pFunction => \&F_MailSearchForm ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },
      'GotMailSearchParam' => {
                           pFunction => \&F_GotMailSearchParam ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },
      
      'MsgDeletedFromInBox' => {
                           pFunction => \&F_MsgDeletedFromInBox ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },
      'MsgDeletedFromSentBox' => {
                           pFunction => \&F_MsgDeletedFromSentBox ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },
      'GetBroadCastMsg' => {
                           pFunction => \&F_GetBroadCastMsg ,
                           pHeader =>  $MailEditor,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },
      'AdminAddNotice' => {
                           pFunction => \&F_AdminAddNotice ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },
      'GetHtmlEditor' => {
                           pFunction => \&F_GetHtmlEditor ,
                           pHeader =>  $HtmlEditorHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },
      'ShowAdminNoticePriview' => {
                           pFunction => \&F_ShowAdminNoticePriview ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },
      'ShowNoticeById' =>  {
                           pFunction => \&F_ShowNoticeById ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },
      'AdminManage' =>  {
                           pFunction => \&F_AdminManage ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },
      
      'GetHTMLcontent' => {
                           pFunction => \&F_GetHTMLcontent ,
                           pHeader =>  $MainPageHeader,
                           pBody => 'F_MainPageBody',
                           pFooter => 'F_MainPageFooter',
      },
);



&AppInit( $cgi ); 

sub AppInit {
    my ($cgi) = @_;
    my $param = $cgi->param('AppParam');
    if (!$param){
        $param = 'MainPage';
    }elsif ($param =~ /\?/){
        my @params = split '\?' , $param;
        $cgi->{code} = $params[1];
        $param = $params[0];
    }
    $cgi->{'AppParam'} = $param  ;
    my $function_ref = $page_function_hash{$param}->{'pFunction'};
    $function_ref->($cgi);
}

sub F_GetHTMLcontent{
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my %params = $cgi->Vars;
    my $textarea = $cgi->param('textarea');
    my $FL;
    open($FL , ">XXXX");
    print $FL $textarea;
    close $FL;
    
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    print $cgi->header( );
    print $cgi->start_html();
    
   print "<pre>" , Dumper \%params, "</pre>";
   print $cgi->end_html()
}   

sub F_MainPage {
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $uname = $session->param("usr_name");
    if ( $role > 1 ){
       print $cgi->header( );
       print $cgi->start_html($PageHeader);
       my ( $fname, $lname) = get_user_f_and_l_name_by_uname ( $uname );
       my $data = {
                fname => $fname,
                lname => $lname,
                sid => $sid,
                role => $role,
      };
      my $out = '';
      my $tt = Template->new;
        $tt->process('admin_front_page.html', $data, \$out)
        || die $tt->error;
      print $out;
      print $cgi->end_html();
   }else {
      my $notice_html = get_admin_notice_text();
      my $out = renderMainPage ( $cgi, $notice_html );
      print $out;   
      print $cgi->end_html();
    }
}

sub renderMainPage {
   my ($cgi,$notice_html) = @_;
   my $param = $cgi->{'AppParam'};
   my $PageHeader = $page_function_hash{$param}->{'pHeader'};
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $uname = $session->param("usr_name");
   print $cgi->header( );
   print '<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">';
   print $cgi->start_html($PageHeader);
   my ( $fname, $lname) = get_user_f_and_l_name_by_uname ( $uname );
   my $broadcast_count = GetBroadCastMsgCount ( $cgi );
   my $unread_msg =  GetUnReadMsgs ( $cgi );
   
   my $admin_msg_count = get_admin_msg_count ( $uname );
   my $data = {
                uname => $uname,
                fname => $fname,
                lname => $lname,
                sid => $sid,
                b_count => $broadcast_count,
                u_count => $unread_msg,
                a_count => $admin_msg_count,
                notice => $notice_html,
      };
   my $out = '';
   my $tt = Template->new;
   $tt->process('Main_page.html', $data, \$out)
   || die $tt->error;
   return $out;  
}




sub F_ShowProfileData {
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name");
    my @profiles = get_all_member_profiles( $name );
    my $data = {
               profiles => \@profiles,
               count => 0,
      };
      if (@profiles){
         $data->{count} = 1;      
      }
       
    my $out = '';
    my $tt = Template->new;
    $tt->process('show_all_member_profile.html', $data, \$out)
    || die $tt->error;
   my $out1 = renderMainPage ( $cgi, $out );
   print $out1;   
   print $cgi->end_html();
}



sub F_SelectNeibhourForm{
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name");
    my @blocks = ( 1, 2, 3, 4);
    my @floors = (1,2,3,4,5,6);
    
    my $data = {
               block => \@blocks,
               floor => \@floors,
      };
     my $out = '';
     my $tt = Template->new;
     $tt->process('select_neighbour_search_form.html', $data, \$out)
     || die $tt->error;
     my $out1 = renderMainPage ( $cgi, $out );
     print $out1;   
     print $cgi->end_html(); 
   
}

sub F_GeneralSearchForm {
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name");
   
    my $out = '';
    my $tt = Template->new;
        $tt->process('general_search_form.html', undef, \$out)
        || die $tt->error;
     my $out1 = renderMainPage ( $cgi, $out );
     print $out1;   
     print $cgi->end_html(); 
}


sub F_GetGeneralSearch{
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name");
    my $search = $cgi->param('search');
    my @unames = search_pattern_from_profiles ( $search );
    my $data = {
            uname => \@unames,
    };
    my $out = '';
    my $tt = Template->new;
        $tt->process('general_search_result_form.html', $data, \$out)
        || die $tt->error;
     my $out1 = renderMainPage ( $cgi, $out );
     print $out1;   
     print $cgi->end_html(); 
}

sub F_UpLoadForm {
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name");
   
    my $out = '';
    my $tt = Template->new;
        $tt->process('show_profile_add_form.html', undef, \$out)
        || die $tt->error;
   
     my $out1 = renderMainPage ( $cgi, $out );
     print $out1;   
     print $cgi->end_html();    
   print $cgi->end_html();
   #die;
}


sub F_GetProfileData {
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name");
    my $upfile = $cgi->param('upfile');
    my %hash = $cgi->Vars;
    my ($photo, $member_id);
    my @extn = split /\./, $upfile;
    if ( $hash{fname} =~ /\w/ && $hash{lname} =~ /\w/ && $hash{upfile} =~ /\w/){
         my $count = get_number_of_person_in_apartment ( $name );
         if ( !$count ){
            $count++;
            my $suffix = '_' . $count ;
            $member_id = $name . $suffix ;
            $photo = $member_id . ".$extn[1]";
         }else{
            my $max_index = get_max_index_of_member_ids( $name );
            $max_index++;
            my $suffix = '_' . $max_index ;
            $member_id = $name . $suffix ;
            $photo = $member_id . ".$extn[1]";
         }
         no strict 'refs';
         my $OUTFILE; 
         open($OUTFILE, ">", "C:/Program Files (x86)/Apache Group/Apache2/htdocs/static/images/My-Comm/photos/$photo") || die "can't open UTF-8 encoded filename: $!";
         binmode($OUTFILE);    
         while (<$upfile>){
            print $OUTFILE $_;
         }
         $hash{uname} = $name;
         $hash{photo_name} = $photo;
         $hash{member_id} = $member_id;
         my $ret = update_member_profile_data ( %hash );
    
         my $out = '';
         my $tt = Template->new;
            $tt->process('show_profile_add_form_2.html', undef, \$out)
            || die $tt->error;
        my $out1 = renderMainPage ( $cgi, $out );
        print $out1;   
        print $cgi->end_html();    
    
    }else {   
      
      my $out = '';
      my $tt = Template->new;
        $tt->process('show_profile_add_form_E.html', undef, \$out)
        || die $tt->error;     
       my $out1 = renderMainPage ( $cgi, $out );
        print $out1;   
        print $cgi->end_html();    
    }
}


sub F_ModifyProfileForm {
   
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name");
    my @profiles = get_all_member_profiles( $name );
    my $data = {
               profiles => \@profiles,
               count => 0,
      };
     if (@profiles){
         $data->{count} = 1;      
     } 
     my $out = '';
     my $tt = Template->new;
          $tt->process('show_all_member_profile_for_modify.html', $data, \$out)
            || die $tt->error;
    my $out1 = renderMainPage ( $cgi, $out );
    print $out1;   
    print $cgi->end_html();  
   
}


sub F_ModifyMemberProfileForm{
   
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name");
    my $member_id = $cgi->param('member_id');
    my %member_profile = get_member_profile_by_member_id( $member_id );
    my $data = \%member_profile;
     my $out = '';
     my $tt = Template->new;
          $tt->process('show_member_profile_for_modify.html', $data, \$out)
            || die $tt->error;
    my $out1 = renderMainPage ( $cgi, $out );
    print $out1;   
    print $cgi->end_html();  
   
}


sub F_ModifiedProfileData{
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name");
    my $upfile = $cgi->param('upfile');
    my %hash = $cgi->Vars;
    $hash{uname} = $name;
    my ($photo, $member_id) = @hash{'photo_name','member_id' };
    if ( $hash{fname} =~ /\w/ && $hash{lname} =~ /\w/){
        if ($hash{upfile} =~ /\w/){ #New Phot Added
            no strict 'refs';
            my $OUTFILE; 
            open($OUTFILE, ">", "C:/Program Files (x86)/Apache Group/Apache2/htdocs/static/images/My-Comm/photos/$photo")
               || die "can't open UTF-8 encoded filename: $!";
            binmode($OUTFILE);    
            while (<$upfile>){
               print $OUTFILE $_;
            } 
        }
        my $ret = modify_member_profile_data ( %hash );
         my $out = '';
         my $tt = Template->new;
          $tt->process('member_profile_modified_confirm.html', undef, \$out)
            || die $tt->error;
       my $out1 = renderMainPage ( $cgi, $out );
       print $out1;   
      print $cgi->end_html();  
            
    }else {   
      my $member_id = $cgi->param('member_id');
      my %member_profile = get_member_profile_by_member_id( $member_id );
      my $data = \%member_profile;
      my $out = '';
      my $tt = Template->new;
          $tt->process('show_member_profile_for_modify_E.html', $data, \$out)
            || die $tt->error;
      my $out1 = renderMainPage ( $cgi, $out );
      print $out1;   
      print $cgi->end_html();  
       
    }   
}

sub F_DeleteProfileForm{    
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name");
    my @profiles = get_all_member_profiles( $name );
    my $data = {
               profiles => \@profiles,
               count => 0,
      };
     if (@profiles){
         $data->{count} = 1;      
     }  
     my $out = '';
     my $tt = Template->new;
          $tt->process('show_all_member_profile_for_delete.html', $data, \$out)
            || die $tt->error;
    my $out1 = renderMainPage ( $cgi, $out );
      print $out1;   
      print $cgi->end_html();  
}



sub F_DeleteProfileData{
    
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name");
    my $member_id = $cgi->param('member_id');
    my $ret = delete_member_profile_by_member_id ( $member_id );
    my @profiles = get_all_member_profiles( $name );
    my $data = {
               profiles => \@profiles,
               count => 0,
      };
     if (@profiles){
         $data->{count} = 1;      
     } 
     my $out = '';
     my $tt = Template->new;
          $tt->process('show_all_member_profile_for_delete.html', $data, \$out)
            || die $tt->error;
      my $out1 = renderMainPage ( $cgi, $out );
      print $out1;   
      print $cgi->end_html();   
}


sub F_ShowMsgMainForm {
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name");
    my $data = {
            uname => $name
    };
    my $out = '';
   my $tt = Template->new;
        $tt->process('main_mail_form.html', $data, \$out)
        || die $tt->error;
   my $out1 = renderMainPage ( $cgi, $out );
   print $out1;   
   print $cgi->end_html();   
}

sub show_mail_box_tabs {
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name");
    my $data = {
            uname => $name
    };
   my $out = '';
   my $tt = Template->new;
   $tt->process('main_mail_form.html', $data, \$out)
   || die $tt->error;
   return $out;   
}

sub F_ShowInBox{
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $uname = $session->param("usr_name");
    my $page_num = $cgi->param("page");
    my @mail_list = get_user_mail_list_by_uname ( $uname );
    my $elements = @mail_list;
    my $pages = int ( $elements / 20 );    
    if ( $elements % 20){
       $pages++;
    }    
    my ($start,$end) = (0,19);
    if ($page_num =~ /\w+/){
       $start = 10 * $page_num;
       $end = $start + 19;
    }    
    @mail_list = @mail_list[$start..$end];
    my $data = {
                data=> \@mail_list,                    
                uname => $uname,
                pages => [2..$pages],
    };    
    my $out = '';
    my $tt = Template->new;
        $tt->process('mesg_inbox_form.html', $data, \$out)
        || die $tt->error;
   my $tabs = show_mail_box_tabs ( $cgi);
   $out = $tabs . $out;
   my $out1 = renderMainPage ( $cgi, $out );
   print $out1;   
   print $cgi->end_html();   
}


sub F_SentMessage{
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $uname = $session->param("usr_name");
    my $page_num = $cgi->param("page");
    my @mail_list = get_user_sentmail_list_by_uname ( $uname ); 
    my $elements = @mail_list;
    my $pages = int ( $elements / 20 );    
    if ( $elements % 20){
       $pages++;
    }   
    my ($start,$end) = (0,19);
    if ($page_num =~ /\w+/){
       $start = 10 * $page_num;
       $end = $start + 19;
    }    
    @mail_list = @mail_list[$start..$end];    
     my $data = {
                data=> \@mail_list,                    
                uname => $uname,
                pages => [2..$pages],
    };
    my $out = '';
    my $tt = Template->new;
        $tt->process('msg_sent_box_form.html', $data, \$out)
        || die $tt->error;
   my $tabs = show_mail_box_tabs ( $cgi);
   $out = $tabs . $out;     
   my $out1 = renderMainPage ( $cgi, $out );
   print $out1;   
   print $cgi->end_html();   
}
sub F_MsgBroadCast {
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};    
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name");
    my $data = {
            uname => $name
    };
    my $out = '';
    my $tt = Template->new;
        $tt->process('message_broadcast_form.html', $data, \$out)
        || die $tt->error;
   my $tabs = show_mail_box_tabs ( $cgi);
   $out = $tabs . $out;     
   my $out1 = renderMainPage ( $cgi, $out );
   print $out1;   
   print $cgi->end_html(); 
}


sub F_Compose {
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name");
    my $data = {
            uname => $name
    };
    my $out = '';
    my $tt = Template->new;
        $tt->process('message_compose_form.html', $data, \$out)
        || die $tt->error;
   my $tabs = show_mail_box_tabs ( $cgi);
   $out = $tabs . $out;     
   my $out1 = renderMainPage ( $cgi, $out );
   print $out1;   
   print $cgi->end_html(); 
   
}

sub F_MailSearchForm {
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};    
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );   
    my $uname = $session->param("usr_name");
    my $out = '';
    my $tt = Template->new;
        $tt->process('msg_search_form.html', undef, \$out)
        || die $tt->error;
   my $tabs = show_mail_box_tabs ( $cgi);
   $out = $tabs . $out;     
   my $out1 = renderMainPage ( $cgi, $out );
   print $out1;   
   print $cgi->end_html(); 
}


sub F_GotMailSearchParam{
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name");
    my %params = $cgi->Vars;
    my $pattern = $cgi->param ( 'search');
    my $field =  $cgi->param ( 'search_body');
    my $mail_box = $cgi->param ('mail_box');
    my @searched_mails = get_searched_mails ($pattern,$field,$mail_box,$user_name );   
     my $data = {
                data=> \@searched_mails,                    
                uname => $user_name,
    };    
    my $out = '';
    my $tt = Template->new;
        $tt->process('msg_searched_list_form.html', $data, \$out)
        || die $tt->error;
    my $tabs = show_mail_box_tabs ( $cgi);
   $out = $tabs . $out;
    my $out1 = renderMainPage ( $cgi, $out );    
    print $out1;   
    print $cgi->end_html();       
}

sub F_MsgDeletedFromInBox{
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $uname = $session->param("usr_name");
    my $page_num = $cgi->param("page");   
    my @mail_list = get_delete_msg_list_from_inbox_by_uname ( $uname ); 
    my $elements = @mail_list;
    my $pages = int ( $elements / 20 );    
    if ( $elements % 20){
       $pages++;
    }    
    my ($start,$end) = (0,19);
    if ($page_num =~ /\w+/){
       $start = 10 * $page_num;
       $end = $start + 19;
    }    
    @mail_list = @mail_list[$start..$end];
    my $data = {
                data=> \@mail_list,                    
                uname => $uname,
                pages => [2..$pages],
    };
    my $out = '';
    my $tt = Template->new;
        $tt->process('msg_deleted_from_inbox.html', $data, \$out)
        || die $tt->error;
    my $tabs = show_mail_box_tabs ( $cgi);
   $out = $tabs . $out;    
    my $out1 = renderMainPage ( $cgi, $out );    
    print $out1;   
    print $cgi->end_html();       
}

sub F_MsgDeletedFromSentBox{
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $uname = $session->param("usr_name");
    my $page_num = $cgi->param("page");
    my @mail_list = get_deleted_sentmail_list_by_uname( $uname ); 
    my $elements = @mail_list;
    my $pages = int ( $elements / 20 );
    
    if ( $elements % 20){
       $pages++;
    }
   
    my ($start,$end) = (0,19);
    if ($page_num =~ /\w+/){
       $start = 10 * $page_num;
       $end = $start + 19;
    }
   @mail_list = @mail_list[$start..$end]; 
   
     my $data = {
                data=> \@mail_list,                    
                uname => $uname,
                pages => [2..$pages],
    };
    my $out = '';
    my $tt = Template->new;
        $tt->process('msg_deleted_from_sent_box.html', $data, \$out)
        || die $tt->error;
   my $tabs = show_mail_box_tabs ( $cgi);
   $out = $tabs . $out;     
   my $out1 = renderMainPage ( $cgi, $out );    
    print $out1;   
    print $cgi->end_html();      
}


















sub F_ShowMessage{
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $uname = $session->param("usr_name");
    my $msg_id = $cgi->param('msg_id');
    print $cgi->header( );
    print $cgi->start_html($PageHeader);
    my %data = get_message_by_msg_id ( $msg_id, $uname ); 
    my $out = '';
    my $tt = Template->new;
        $tt->process('mesg_open_form.html', \%data, \$out)
        || die $tt->error;
   print $out;
   print $cgi->end_html(); 
}


sub F_ShowAdminNoticePriview{
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $uname = $session->param("usr_name");
    print $cgi->header( );
    print $cgi->start_html($PageHeader);
    my $notice_html = get_admin_notice_preview_text();
    my $data = {
            notice =>  $notice_html,
    };
    my $out = '';
    my $tt = Template->new;
         $tt->process('admin_notice_preview_html.html', $data, \$out)
        || die $tt->error;
      print $out;
      print $cgi->end_html();
}

sub F_ShowNoticeById {
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $uname = $session->param("usr_name");
    my $notice_id = $cgi->param("notice_id");
    
    print $cgi->header( );
    print $cgi->start_html($PageHeader);
    my $notice_html = get_admin_notice_by_notice_id($notice_id);
    my $data = {
            notice =>  $notice_html,
    };
    my $out = '';
    my $tt = Template->new;
         $tt->process('admin_notice_preview_html.html', $data, \$out)
        || die $tt->error;
      print $out;
      print $cgi->end_html();
   
   
}


sub F_AdminAddNotice{
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $uname = $session->param("usr_name");
    print $cgi->header( );
    print $cgi->start_html($PageHeader); 
    my $out = '';
    my $tt = Template->new;
        $tt->process('admin_add_notice_form.html', undef , \$out)
        || die $tt->error;
   print $out;
   print $cgi->end_html(); 
   
}


sub F_AdminManage{
   my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $uname = $session->param("usr_name");
    print $cgi->header( );
    print $cgi->start_html($PageHeader); 
    my $data = {
               role => $role,
    };
    my $out = '';
    my $tt = Template->new;
        $tt->process('admin_manage_admins_form.html', $data , \$out)
        || die $tt->error;
   print $out;
   print $cgi->end_html(); 
}


sub GetBroadCastMsgCount {
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name");
    my $count = get_broadcast_msg_count ( $name );
    return $count ; 
}

sub GetUnReadMsgs{
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name");
    my $count = get_unread_msg_count ($name );
    return $count;
}


sub F_GetBroadCastMsg{
   
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    print $cgi->header( );
    print $cgi->start_html($PageHeader);
    my $out = '';
    my $tt = Template->new;
        $tt->process('mail_editor.html', undef, \$out)
        || die $tt->error;
   print $out;
   print $cgi->end_html()

}   

sub get_searched_mails {
   my ($pattern,$field,$mail_box,$uname ) = @_;   
   my @mail_list;
   
   if ($mail_box =~ /InBox/i){
       @mail_list = get_user_mail_list_by_uname ( $uname ); 
   }elsif ( $mail_box =~ /SentBox/i ){
       @mail_list = get_user_sentmail_list_by_uname ( $uname ); 
   }
   
   my @searched;   
   if ( $field =~ /subject/i ){
      foreach my $hash_ref ( @mail_list ){
         my %mail = %{$hash_ref};
         if ($mail{subject} =~ /$pattern/i){
            push (@searched , $hash_ref );
         }
      }   
      return @searched;  
   }elsif ($field =~ /body/i){
       foreach my $hash_ref ( @mail_list ){
         my %mail = %{$hash_ref};
         if ( $mail{msg_body} =~ /$pattern/i ){
            push (@searched , $hash_ref );
         }
      }   
      return @searched;  
   }elsif ($field =~ /both/i){
      foreach my $hash_ref ( @mail_list ){
         my %mail = %{$hash_ref};
         if ( $mail{msg_body} =~ /$pattern/i || $mail{subject} =~ /$pattern/i){
            push (@searched , $hash_ref );
         }
      }   
      return @searched; 
   }
}







sub F_ReplyAll{
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $uname = $session->param("usr_name");
    my $msg_id = $cgi->param('msg_id');
    print $cgi->header( );
    print $cgi->start_html($PageHeader);
    my %data = get_message_by_msg_id ( $msg_id, $uname );
    $data{from_s} =~ s/^\s+//; $data{from_s} =~ s/\s+$//;
    $data{to_s} =~ s/^\s+//; $data{to_s} =~ s/\s+$//;
    
    $data{from_s} =  "$data{from_s}," . $data{to_s};
    $data{from_s} =~ s/$uname//g;
    
    my @from_s = split ',' , $data{from_s};
    @from_s = grep { $_ =~ /[0-9]/ } @from_s;
    my $from_s = join ',' , @from_s;
    $data{from_s} = $from_s;
    
    my $out = '';
    my $tt = Template->new;
        $tt->process('msg_reply_all_compose_form.html', \%data, \$out)
        || die $tt->error;
   print $out;
   print $cgi->end_html(); 
}

sub F_Reply{
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $uname = $session->param("usr_name");
    my $msg_id = $cgi->param('msg_id');
    print $cgi->header( );
    print $cgi->start_html($PageHeader);
    my %data = get_message_by_msg_id ( $msg_id, $uname );
    $data{from_s} =~ s/^\s+//; $data{from_s} =~ s/\s+$//;
    
    my $out = '';
    my $tt = Template->new;
        $tt->process('msg_reply_compose_form.html', \%data, \$out)
        || die $tt->error;
   print $out;
   print $cgi->end_html(); 
}

sub F_MsgFarward {
   
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $uname = $session->param("usr_name");
    my $msg_id = $cgi->param('msg_id');
    print $cgi->header( );
    print $cgi->start_html($PageHeader);
    my %data = get_message_by_msg_id ( $msg_id, $uname );
    $data{from_s} =~ s/^\s+//; $data{from_s} =~ s/\s+$//;
    
    my $out = '';
    my $tt = Template->new;
        $tt->process('msg_farward_form.html', \%data, \$out)
        || die $tt->error;
   print $out;
   print $cgi->end_html();   

}

sub F_ShowSentMessage {
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $uname = $session->param("usr_name");
    my $msg_id = $cgi->param('msg_id');
    print $cgi->header( );
    print $cgi->start_html($PageHeader);
    my %data = get_sent_message_by_msg_id ( $msg_id, $uname );
    $data{from_s} =~ s/^\s+//; $data{from_s} =~ s/\s+$//;
    
    my $out = '';
    my $tt = Template->new;
        $tt->process('msg_open_sent_item.html', \%data, \$out)
        || die $tt->error;
    print $out;
    print $cgi->end_html();   
   
}


sub F_MsgDelete{
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $uname = $session->param("usr_name");
    my $msg_id = $cgi->param('msg_id');
    print $cgi->header( );
    print $cgi->start_html($PageHeader);
    my $ret = delete_message_by_msg_id ( $msg_id, $uname );
    my $out = '';
    my $tt = Template->new;
        $tt->process('msg_del_confirm_form.html', undef, \$out)
        || die $tt->error;
   print $out;
   print $cgi->end_html();  
   
}

sub F_MsgSentDelete {
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $uname = $session->param("usr_name");
    my $msg_id = $cgi->param('msg_id');
    print $cgi->header( );
    print $cgi->start_html($PageHeader);
    my $ret = delete_sent_message_by_msg_id ( $msg_id, $uname );
    my $out = '';
    my $tt = Template->new;
        $tt->process('msg_del_confirm_form.html', undef, \$out)
        || die $tt->error;
   print $out;
   print $cgi->end_html();  
}




sub F_GotBlockFloor {
    
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name");
    my $floor = $cgi->param('floor');
    my $block = $cgi->param('block');
    
    
    
    
    my %params = $cgi->Vars;
    
    print $cgi->header( );
    print $cgi->start_html($PageHeader);
    print "<pre>";print Dumper \%params ; print "</pre>"; 
    
   
}








sub F_GetHtmlEditor{
         
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name");
    print $cgi->header(-type=>"text/html", -charset=>"UTF-8" , -content => 'multipart/mixed');
    print $cgi->start_html($PageHeader);
    my $out = '';
    my $tt = Template->new;
            $tt->process('admin_notice_editor.html', undef, \$out)
            || die $tt->error;
         print $out;
         print $cgi->end_html();     
         
}









sub GetBasename {
	my $fullname = shift;
	my(@parts);
	# check which way our slashes go.
	if ( $fullname =~ /(\\)/ ) {
		@parts = split(/\\/, $fullname);
	} else {
		@parts = split(/\//, $fullname);
	}
	return(pop(@parts));
}
