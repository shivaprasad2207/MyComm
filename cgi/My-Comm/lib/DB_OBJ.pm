package lib::DB_OBJ;

BEGIN{
   use Cwd;
   our $directory = cwd;
   require(Exporter);
   use warnings;
   use strict;
   use Data::Dumper;
};

use lib $directory;
use DBModule;
use POSIX qw/strftime/;

   our @ISA = qw(Exporter);
   our @EXPORT    = qw (
                        back_up_member_profile_by_uname_from_db            
                        delete_all_message_by_uname_from_db
                        delete_all_sent_message_by_uname_from_db
                        get_locked_unames_in_block_floor_from_db 
                        delete_admin_from_db 
                        get_admin_and_sudo_admin_info_from_db 
                        get_admin_notice_by_notice_id_from_db   
                        get_all_notice_list_from_db
                        get_admin_notice_text_from_db
                        create_uniq_string
                        promote_preview_notice_from_db
                        get_admin_notice_preview_text_from_db
                        is_uname_exist_in_db
                        modify_owner_info_to_db
                        get_owner_info_from_db
                        update_owner_info_to_db
                        get_unread_msg_count_from_db
                        get_broadcast_msg_count_from_db
                        get_admin_msg_count_from_db
                        get_deleted_sentmail_list_by_uname_from_db
                        get_delete_msg_list_from_inbox_by_uname_from_db
                        search_pattern_from_profiles_from_db
                        get_all_unames_from_db
                        delete_sent_message_by_msg_id_from_db    
                        get_sent_message_by_msg_id_from_db   
                        get_user_sentmail_list_by_uname_from_db
                        delete_message_by_msg_id_from_db
                        get_message_by_msg_id_from_db
                        get_user_mail_list_by_uname_from_db
                        update_message_to_db  
                        generate_my_sql_rand_db
                        get_unames_in_block_floor_from_db   
                        modify_member_profile_data_to_db    
                        get_member_profile_by_member_id_from_db
                        delete_member_profile_by_member_id_from_db
                        get_all_member_ids_of_apartment_from_db 
                        get_all_member_profiles_from_db   
                        get_number_of_person_in_apartment_from_db
                        update_member_profile_data_to_db 
                        get_uid_by_uname_from_db
                        get_unames_by_uid_from_db
                        get_name_by_email_from_db
                        get_all_subscribed_emails_db
                        get_topic_name_by_mpid_db
                        get_user_f_and_l_name_by_uname_from_db 
                        get_user_email_by_name_from_db
                        get_user_passwd_by_name_from_db
                        get_mpid_spid_by_qid_db   
                        get_sub_topic_name_db
                        get_all_discussion_db 
                        get_qid_n_qtxt_db
                        is_user_subscribed_db 
                        subscribe_user_db
                        get_main_topic_name_by_mpid_db 
                        get_sub_topic_name_by_spid_db
                        get_main_page_info_db
                        get_all_subpage_info_by_mpid_db
                        get_user_id_by_name
                        get_quesation_by_qid_db
                        
                        
                        get_all_book_info_from_db 
                        get_new_book_id_from_db
                        get_reservation_info_by_book_pid_from_db  
                        my_sql_exec
                        get_all_reserved_books_by_uid_from_db
                        reserve_this_book_copy_into_db
                        get_book_info_by_book_pid_from_db
                        get_reservation_dates_from_db
                        get_book_copies_by_id_from_db
                        get_book_details_by_id_from_db
                        get_serached_books_from_db 
                        get_all_category_of_books_from_db
                        get_all_subcategory_of_books_from_db
                        get_mail_sender_name_from_db
                        get_mail_reciever_name_from_db
                        get_subject_text_by_mail_id_from_db
                        get_all_details_about_shop_id
                        get_shop_admins_reg_shipment_from_db
                        update_shipment_admin_info
                        get_user_name_by_id
                        get_shop_admin_id_by_shop_id
                        get_shop_admin_id_by_shop_name
                        get_shop_location_by_shop_id_from_db
                        get_shop_id_by_shop_uid_by_db
                        update_shop_id_for_user
                        get_shop_id_by_location
                        get_all_shop_location_from_db
                        get_shipment_id_and_date
                        update_shipment_data_db
                        db_exec_return_boolean
                        get_order_price
                        delete_this_draft_mail_from_db
                        find_this_draft_mail_by_id_in_db
                        fetch_user_draft_mail_db
                        insert_into_draft_box
                        db_exec_string_ret
                        db_exec_string_no_ret
                        trash_this_mail_in_db
                        db_exec_single_val_ret
                        get_mail_fp_by_mail_id_from_db
                        get_all_included_mailds_from_db
                        update_inc_mail_ids_meta
                        get_all_included_mail_ids_used_by_mail
                        get_mail_fp_from_db_by_mail_id
                        delete_this_mail_from_db
                        get_all_mail_content_by_mail_id_from_db
                        get_mail_params_from_db
                        get_mail_content_from_db_by_mail_id
                        fetch_user_mail_from_db
                        insert_mail_content_info
                        select_mail_uniq_index_from_db
                        insert_mail_header_info
                        get_list_of_uid_and_name_of_Library_Admins
                        search_for_uname_by_user_info_db
                        get_user_info_by_field_val_db
                        get_all_login_phones_from_db 
                        get_all_login_emails_from_db
                        get_all_login_adress_from_db
                        get_all_login_dadress_from_db
                        get_all_login_lnames_from_db
                        get_all_login_fnames_from_db
                        delete_this_user_by_name
                        get_user_list_by_role_from_db
                        create_new_user_in_db
                        update_role_to_user
                        de_update_user_to_shop_admin
                        update_user_to_shop_admin
                        get_user_role_by_uname
                        get_all_login_names_from_db
                        update_user_password
                        user_authentication
                        update_user_info_to_db
                        get_user_details_by_login_name
                        delete_item_content_by_id_x
                        update_item_content_by_id_x
                        edit_ing_list_in_db
                        delete_ing_list_in_db
                        add_ing_to_db
                        get_all_ings_from_db
                        update_item_price_by_id
                        update_item_desc_by_id
                        update_item_compliment_by_id
                        update_item_content_by_id
                        get_topping_id_by_oid
                        delete_all_topping_map_by_topping_id
                        modify_order_existing_in_db
                        get_sid_by_oid
                        is_order_exist
                        get_item_id
                        get_item_code_by_id
                        get_item_objs
                        get_image_location
                        get_item_name
                        get_item_contents
                        get_item_compliment
                        get_item_ingridients
                        get_item_price_by_size
                        
                        get_ing_id_by_name
                        register_order_transacton
                        get_numberof_item_ordered_by_sid
                        get_item_name_by_oid
                        get_item_id_by_oid
                        get_order_details_by_oid
                        get_forder_details_by_oid
                        get_item_image_by_oid
                        get_Ocount_by_sid
                        delete_order_made_by_oid
                        get_order_info_from_db_oid
                        get_all_prize_of_item_by_item_id_db
                   );

   our $db_exec;

sub get_admin_and_sudo_admin_info_from_db{

    my $sql = "select user_role , uname, fname, lname from user_index where user_role > \'1\' and active='1';";
    
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
    
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
    my @admin_list;
    while ( my ($user_role , $uname, $fname, $lname) = $qh->fetchrow_array() ){
      my %hash;
      @hash{'role', 'uname', 'fname', 'lname'} = ($user_role , $uname, $fname, $lname);
      push (@admin_list,\%hash);
    }
    return @admin_list;
}



sub get_admin_notice_by_notice_id_from_db {
    my ($notice_id) = @_;
    
    my $sql = "select html_txt from notice_body where notice_id=\'$notice_id\';";
    
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
    
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
    
    my $html_text = $qh->fetchrow_array();
    
    return $html_text;
}

sub get_all_notice_list_from_db{
    
    my $sql = "select date , notice_id , active_flag from notice_info where delete_flag=\'0\' and notice_id != 'xxx0xxx';";
    
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
    
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );  
    
    my @notice_list;
    
    while ( my ($date, $notice_id, $active_flag ) = $qh->fetchrow_array()){
      my %notice;
      
      my $sql = "select html_txt from notice_body where notice_id=\'$notice_id\';";
      
      my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
      $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
      
      my ($html_txt) = $qh->fetchrow_array();
      
      @notice{ 'date' , 'notice_id' , 'active_flag', 'html_txt' } = ( $date, $notice_id, $active_flag, $html_txt );
      push (@notice_list , \%notice);
    }
    return @notice_list;
}



sub delete_admin_from_db{
   my ($uname) = @_;
   my $sql = "select fname,lname,email,mobile from user_index where uname=\'$uname\';";
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   my( $fname,$lname,$email,$mobile) = $qh->fetchrow_array();
   my $date = strftime('%Y-%m-%d %H:%M:%S',localtime);
   
   $sql = "insert into admin_info_backup
                                         (uname, fname, lname,email, mobile, deleted_date)
                                 values
                                       (\'$uname\', \'$fname\', \'$lname\', \'$email\', \'$mobile\', \'$date\');
          ";
   $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );       
   
   $sql = "update user_index
                           set
                              active=\'0\' ,
                              password=\'null\'
                                       where uname=\'$uname\';
         ";
   $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   return 1;
}



sub get_admin_notice_text_from_db{
    my $sql = "select html_txt from notice_body
                                 where notice_id =
                                             (
                                                select notice_id from notice_info
                                                                  where active_flag=\'1\'
                                             );
              ";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );  
    my ($html_text) = $qh->fetchrow_array();
    return $html_text;
}

sub promote_preview_notice_from_db{
    my $sql = "select my_text from admin_notice_preview;";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );  
    my ($html_text) = $qh->fetchrow_array();
    my $date = strftime('%Y-%m-%d %H:%M:%S',localtime);
    my $msg_id = create_uniq_string (8);
    ###############################################
    
    $sql = "update
                  notice_info
                           set active_flag = \'0\'
                     where        
                           active_flag = \'1\'
            ;";
    $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' ); 
    
    ###################################################
    $sql = "insert
                  into
                     notice_info
                           ( date, notice_id, active_flag, delete_flag )
                     values       
                           (\'$date\', \'$msg_id\', \'1\', \'0\' )
            ;";
    $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
    
    $sql = "insert
                  into
                     notice_body
                           ( notice_id,html_txt )
                     values       
                           (\'$msg_id\', \'$html_text\' )
            ;";
    $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
   
}

sub create_uniq_string {
         my $length_of_randomstring=shift;
         my @chars=('a'..'z','A'..'Z','0'..'9','_');
         my $random_string;
         foreach (1..$length_of_randomstring){
		$random_string.=$chars[rand @chars];
	}
	return $random_string;
}

sub get_admin_notice_preview_text_from_db {
    my $sql = "select my_text from admin_notice_preview;";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );  
    my ($html_text) = $qh->fetchrow_array();
    return $html_text;
}


sub is_uname_exist_in_db{
    my ($uname ) = @_;
    my $sql = "select COUNT(*) from user_index where uname=\'$uname\';";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );  
    my ($count) = $qh->fetchrow_array();
    if ( $count){
      return 0;
    }else{
      return 1;
    }
}

sub modify_owner_info_to_db {
   my( %hash) = @_;
   my $sql = "update user_index
                           set
                                   fname= \'$hash{fname}\',
                                   lname=\'$hash{lname}\',
                                   type_of_occupation=\'$hash{occupation}\',
                                   email=\'$hash{email}\',
                                   mobile=\'$hash{mobile}\',
                                   Adress=\'$hash{adress}\'
                           where
                                   uname=\'$hash{uname}\'; 
            ";
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );  
   return 1;
}

sub update_owner_info_to_db {
   my( %hash) = @_;
   my $sql = "insert into user_index (
                                          user_role , uname, password,
                                          fname, lname, active, type_of_occupation,
                                          email, mobile, Adress
                                    )
                                       values
                                    (
                                          '0', \'$hash{uname}\', \'$hash{uname}\',
                                          \'$hash{fname}\', \'$hash{lname}\', '1', \'$hash{occupation}\',
                                          \'$hash{email}\', \'$hash{mobile}\', \'$hash{adress}\'
                                     );
            ";
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );  
   return 1;
}

sub get_owner_info_from_db{
      my ( $uname) = @_;
      my %hash;
      my $sql = "select
                        uname, fname, lname, type_of_occupation,
                                email, mobile, Adress
                        from  user_index
                              where uname = \'$uname\';
                 ";
      my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
      $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );                                          
      @hash {'uname','fname','lname','occupation','email','mobile','adress'}
                               = $qh->fetchrow_array();
      return %hash;                         
}      

sub get_unames_by_uid_from_db{
    my ($uid) = @_;
    my $sql = " select uname  from user_index where uid=\'$uid\';";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );  
    my ($uname) = $qh->fetchrow_array();
    return $uname;
}


sub search_pattern_from_profiles_from_db{
    my ($pat) = @_;
    my $sql = " select distinct uid from member_profile
                        where
                              fname like \'%$pat%\' or
                              lname like \'%$pat%\' or
                              company  like \'%$pat%\' or
                              designation  like \'%$pat%\' or
                              email  like \'%$pat%\';
               ";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );             
    my @uname_list;
    while ( my ( $uid) = $qh->fetchrow_array()){
      my $uname = get_unames_by_uid_from_db ($uid);
      push ( @uname_list, $uname);
    }
   return @uname_list;           
}

sub get_all_unames_from_db {
    my $sql = "select uname from user_index ;";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );  
    my @uname_list;
    while ( my ( $uname ) = $qh->fetchrow_array()){
      push ( @uname_list, $uname);
    }
   return @uname_list;
}


sub get_user_sentmail_list_by_uname_from_db {
    my ($uname ) = @_;
    my $sql = "select msg_id, msg_body_id, subject ,to_s  from msg_header where from_s=\' $uname\' and sender_del_flag='1';";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );  
    my @sent_msg_list;
    while ( my ( $msg_id, $msg_body_id, $subject, $to_s) = $qh->fetchrow_array()){
          my %hash;
          my $sql = "select msg_text from msg_body where msg_body_id=\'$msg_body_id\';";
          my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
          $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
          my ($msg_text) = $qh->fetchrow_array();
          
          
          $sql = "select date from msg_index where msg_id=\'$msg_id\';";
          $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
          $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
          my ($date) = $qh->fetchrow_array();
          @hash{ 'msg_id', 'date', 'subject', 'to_s' , 'msg_text'} = ( $msg_id, $date, $subject, $to_s, $msg_text );
          
          push (@sent_msg_list,\%hash);        
    }  
    return  @sent_msg_list;
}

sub get_deleted_sentmail_list_by_uname_from_db {
    my ($uname ) = @_;
    my $sql = "select msg_id, msg_body_id, subject ,to_s  from msg_header where from_s=\' $uname\' and sender_del_flag='0';";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );  
    my @sent_msg_list;
    while ( my ( $msg_id, $msg_body_id, $subject, $to_s) = $qh->fetchrow_array()){
          my %hash;
          my $sql = "select msg_text from msg_body where msg_body_id=\'$msg_body_id\';";
          my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
          $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
          my ($msg_text) = $qh->fetchrow_array();
          
          
          $sql = "select date from msg_index where msg_id=\'$msg_id\';";
          $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
          $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
          my ($date) = $qh->fetchrow_array();
          @hash{ 'msg_id', 'date', 'subject', 'to_s' , 'msg_text'} = ( $msg_id, $date, $subject, $to_s, $msg_text );
          
          push (@sent_msg_list,\%hash);        
    }  
    return  @sent_msg_list;
}


sub delete_message_by_msg_id_from_db {
   my ($msg_id, $uname ) = @_;
  
   my $sql = "update msg_index set t_del = '0'
               where msg_id=\'$msg_id\' and to_uid=(
                                                            select uid from user_index where uname = \'$uname\'
                                                         );
               ";
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );  
   return 1;
}

sub delete_all_message_by_uname_from_db {
   my ($uname ) = @_;
  
   my $sql = "update msg_index set t_del = \'0\', p_del=\'0\'
               where to_uid=(
                              select uid from user_index where uname = \'$uname\'
                            );
               ";
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );  
   return 1;
}


sub delete_sent_message_by_msg_id_from_db {
   my  ( $msg_id, $uname ) = @_;
   my $sql = "update msg_header set sender_del_flag = '0'
               where msg_id=\'$msg_id\' and from_s=\' $uname\'";
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );  
   return 1;    
}

sub delete_all_sent_message_by_uname_from_db {
   my  ( $uname ) = @_;
   my $sql = "update msg_header set sender_del_flag = '0'
               where from_s=\' $uname\'";
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );  
   return 1;    
}




sub get_message_by_msg_id_from_db {
    my ($msg_id, $uname ) = @_; 
    my %hash;
    my $sql = "
                           select msg_body_id , subject , to_s , from_s
                                 from msg_header
                                       where msg_id=\'$msg_id\';
                        ";
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   my ( $msg_body_id, $subject, $to_s, $from_s) = $qh->fetchrow_array();
   $hash{subject} = $subject;
   $hash{to_s} = $to_s;
   $hash{from_s} = $from_s;
   $hash{msg_id} = $msg_id;
            
   $sql = " select msg_text
                       from msg_body
                                     where msg_body_id=\'$msg_body_id\';
                  ";
   $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   my ( $msg_body) = $qh->fetchrow_array();    
   $hash{msg_body} = $msg_body;
   $hash{uname} = $uname;
   
   $sql = "select date from msg_index
               where msg_id=\'$msg_id\' and to_uid=(
                                                            select uid from user_index where uname = \'$uname\'
                                                         );
               ";
   $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   my ( $date) = $qh->fetchrow_array();  
   $hash{date} = $date;
   
   $sql = "update msg_index set read_flag=\'0\'
               where
                     msg_id=\'$msg_id\' and
                                           to_uid=(
                                                            select uid from user_index where uname = \'$uname\'
                                                         );
          ";
   $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   
   return %hash;
}

sub get_sent_message_by_msg_id_from_db {
   my ( $msg_id, $uname ) = @_;
    my %hash;
    my $sql = "
                           select msg_body_id , subject , to_s , from_s
                                 from msg_header
                                       where msg_id=\'$msg_id\';
                        ";
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   my ( $msg_body_id, $subject, $to_s, $from_s) = $qh->fetchrow_array();
   
   $sql = " select msg_text
                       from msg_body
                                     where msg_body_id=\'$msg_body_id\';
                  ";
   $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   my ( $msg_body) = $qh->fetchrow_array();    
   
   $sql = "select date from msg_index   where msg_id=\'$msg_id\' ";
   $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   my ( $date) = $qh->fetchrow_array();  
   
   $hash{date} = $date;
   $hash{msg_body} = $msg_body;
   $hash{subject} = $subject;
   $hash{to_s} = $to_s;
   $hash{from_s} = $from_s;
   $hash{msg_id} = $msg_id;
   $hash{uname} = $uname;
   return %hash;   
}




sub get_user_mail_list_by_uname_from_db {
    my ($uname ) = @_;
    my @mesg_list;
    my $sql = "
                select date, msg_id, read_flag
                                          from
                                            msg_index where t_del='1' and
                                                 to_uid=(
                                                            select uid from user_index where uname = \'$uname\'
                                                         ) ORDER BY date desc;
               ";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );                                                
    
    while (my ( $date, $msg_id, $read_flag) = $qh->fetchrow_array() ){
            
            my %hash = (
                        date => $date,
                        read_flag => $read_flag
             );
             my $sql = "
                           select msg_body_id , subject , to_s , from_s
                                 from msg_header
                                       where msg_id=\'$msg_id\';
                        ";
             my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
             $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
             my ( $msg_body_id, $subject, $to_s, $from_s) = $qh->fetchrow_array();
             $hash{subject} = $subject;
             $hash{to_s} = $to_s;
             $hash{from_s} = $from_s;
             $hash{msg_id} = $msg_id;
             
             $sql = " select msg_text
                             from msg_body
                                     where msg_body_id=\'$msg_body_id\';
                  ";
             $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
             $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
             my ( $msg_body) = $qh->fetchrow_array();    
             $hash{msg_body} = $msg_body;
             $hash{msg_text} = $msg_body;           
             push @mesg_list, \%hash;  
    }                                               
    return @mesg_list;            
}

sub get_broadcast_msg_count_from_db {
     my ($uname ) = @_;
     my @mesg_list;
     my $count = 0;
     my $sql = "
                select msg_id from msg_index
                              where
                                 t_del='1' and
                                                 to_uid=(
                                                            select uid from user_index where uname = \'$uname\'
                                                         );
               ";
     my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
     $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' ); 
     while (my ( $msg_id ) = $qh->fetchrow_array() ){
           my $sql = " select to_s from msg_header where msg_id=\'$msg_id\'; ";
           my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
           $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' ); 
           my ( $to ) = $qh->fetchrow_array();
           if ( $to =~ /broadcast/i){
               $count++; 
           }
     }
     return $count;    
}

sub get_admin_msg_count_from_db {
     my ($uname ) = @_;
     my @mesg_list;
     my $count = 0;
     my $sql = "
                select msg_id from msg_index
                              where
                                 t_del='1' and
                                                 to_uid=(
                                                            select uid from user_index where uname = \'$uname\'
                                                         );
               ";
     my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
     $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' ); 
     while (my ( $msg_id ) = $qh->fetchrow_array() ){
           my $sql = " select from_s from msg_header where msg_id=\'$msg_id\'; ";
           my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
           $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' ); 
           my ( $from_s ) = $qh->fetchrow_array();
           if ( $from_s =~ /ADMIN/i){
               $count++; 
           }
     }
     return $count;    
}



sub get_unread_msg_count_from_db {
     my ($uname ) = @_;
     my @mesg_list;
     my $count = 0;
     my $sql = "
                select COUNT(msg_id) from msg_index
                              where
                                 t_del='1'
                             and   
                                 read_flag='1'
                              and   
                                                 to_uid=(
                                                            select uid from user_index where uname = \'$uname\'
                                                         );
               ";                                          
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' ); 
    $count = $qh->fetchrow_array();
    return $count;
}



sub get_delete_msg_list_from_inbox_by_uname_from_db{
    my ($uname ) = @_;
    my @mesg_list;
    my $sql = "
                select date, msg_id, read_flag
                                          from
                                            msg_index where t_del='0' and
                                                 to_uid=(
                                                            select uid from user_index where uname = \'$uname\'
                                                         ) ORDER BY date desc;
               ";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
    while (my ( $date, $msg_id, $read_flag) = $qh->fetchrow_array() ){
            
            my %hash = (
                        date => $date,
                        read_flag => $read_flag
             );
             my $sql = "
                           select msg_body_id , subject , to_s , from_s
                                 from msg_header
                                       where msg_id=\'$msg_id\';
                        ";
             my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
             $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
             my ( $msg_body_id, $subject, $to_s, $from_s) = $qh->fetchrow_array();
             $hash{subject} = $subject;
             $hash{to_s} = $to_s;
             $hash{from_s} = $from_s;
             $hash{msg_id} = $msg_id;
             
             $sql = " select msg_text
                             from msg_body
                                     where msg_body_id=\'$msg_body_id\';
                  ";
             $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );      
             $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
             my ( $msg_body) = $qh->fetchrow_array();    
             $hash{msg_body} = $msg_body;
             $hash{msg_text} = $msg_body;
             push @mesg_list, \%hash;  
    }                                               
    return @mesg_list;            
}



sub update_message_to_db {
    my (%hash) = @_;
    my @recipients = @{$hash{recipients}};
    my $rand = generate_my_sql_rand_db ();
    my $sql = "insert into  msg_header
                           ( msg_body_id, subject, to_s, from_s, sender_del_flag )
                     values
                           ( \'$rand \', \'$hash{subject}\',  \'$hash{ to_s} \',  \' $hash{from}\', '1')
               ;";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   
   #=============================================================================================# 
    $sql = "insert into  msg_body
                           ( msg_body_id, msg_text )
                     values
                           ( \'$rand \', \'$hash{msg_txt}\')
               ;";
    $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   
   #============================================================================================#
    
    
   $sql = "select msg_id from msg_header where msg_body_id=\'$rand\';";
   $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' ); 
   my ($msg_id) =  $qh->fetchrow_array();
   
   #==============================================================================================# 
    
    my $date = strftime('%Y-%m-%d %H:%M:%S',localtime);
    foreach ( @recipients ){
     my $uid = get_uid_by_uname_from_db ( $_); 
     my $sql = "insert into  msg_index
                           ( date, msg_id, to_uid, read_flag, p_del, t_del )
                     values
                           ( \'$date \', \'$msg_id\', \'$uid\', \'1\',\'1\',\'1\')
               ;";
     my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
     $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   }  
    
}

sub generate_my_sql_rand_db {
   
   my $sql= "SELECT CAST(RAND() * 99999999 AS UNSIGNED) + 1 as randNum";
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' ); 
   my ($rand) = $qh->fetchrow_array();
   return $rand;
}


sub get_unames_in_block_floor_from_db {
   my ($pat) = @_;
   my $sql = "select uname from user_index where uname like \'$pat%\';";
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' ); 
   my @unames;
   while (my ($uname) = $qh->fetchrow_array() ){
      push (@unames , $uname);
   }
   return @unames;
}

sub get_locked_unames_in_block_floor_from_db {
   my ($pat) = @_;
   my $sql = "select uname , active from user_index where uname like \'$pat%\';";
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' ); 
   my @unames;
   while (my ($uname,$active) = $qh->fetchrow_array() ){
      my %hash;
      @hash{'uname','active'} = ($uname,$active);
      push (@unames , \%hash);
   }
   return @unames;
}


sub get_user_f_and_l_name_by_uname_from_db {
   my ($uname) = @_;
    my $sql = "select fname, lname  from user_index where uname=\'$uname\';";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
    my ($fname, $lname)  = $qh->fetchrow_array();
    return ($fname,$lname);   
}
sub get_number_of_person_in_apartment_from_db{
    my ($uname) = @_;
    my $uid = get_uid_by_uname_from_db ($uname);
    my $sql = "select count(*) from member_profile where uid=\'$uid\';";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
    my ($count)  = $qh->fetchrow_array();
    return $count;
}

sub get_uid_by_uname_from_db{
    my ($uname) = @_;
    my $sql = "select uid from user_index where uname=\'$uname\';";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
    my ($uid)  = $qh->fetchrow_array();
    return $uid;
}

sub update_member_profile_data_to_db{
   my( %hash ) = @_;
   my $uid = get_uid_by_uname_from_db ($hash{uname});
   my $sql = "insert into member_profile values (
                     \'$uid\',   \'$hash{fname}\', \'$hash{lname}\' , \'$hash{company}\' ,
                      \'$hash{designation}\', \'$hash{mobile}\' , \'$hash{email}\' ,
                       \'$hash{photo_name}\' , '1', \'$hash{member_id}\'
             )";
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   return 1; 
}

sub modify_member_profile_data_to_db{
   my( %hash ) = @_;
   my $uid = get_uid_by_uname_from_db ($hash{uname});
   my $sql = "update member_profile set
                                       fname=\'$hash{fname}\',
                                       lname=\'$hash{lname}\',
                                       company=\'$hash{company}\',
                                       designation=\'$hash{designation}\',
                                       mobile=\'$hash{mobile}\' ,
                                       email=\'$hash{email}\'                                                      
                                          WHERE
                                       member_id=\'$hash{member_id}\';
               ";
   
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   return 1; 
}

sub get_all_member_profiles_from_db{
    my ($uname) = @_;
    my $uid = get_uid_by_uname_from_db ($uname);
    my $sql = "select fname , lname , company, designation, mobile, email , photo_name, member_id from member_profile
                  where uid=\'$uid\' and active='1';";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
    my @profiles;
   
    while ( my( $fname , $lname , $company, $designation, $mobile, $email , $photo_name, $member_id ) = $qh->fetchrow_array()){
         my %info;
         @info{ 'fname' , 'lname' , 'company', 'designation', 'mobile', 'email' , 'photo_name', 'member_id' }
           = ( $fname , $lname , $company, $designation, $mobile, $email , $photo_name , $member_id);
         push @profiles,\%info;
   }
   return @profiles; 
}

sub back_up_member_profile_by_uname_from_db {
    my ($uname) = @_;
    my $del_id = create_uniq_string (9);
    my $del_date = strftime('%Y-%m-%d %H:%M:%S',localtime);   
    my $sql = "insert into member_del_index
                                    (  del_id,  del_date,  uname)
                           values
                                    (\'$del_id\',\'$del_date\',\'$uname\')
            ;";
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );        
   
   my @profiles = get_all_member_profiles_from_db ($uname);
   foreach my $profile_ref ( @profiles ){
      my %profile = %{$profile_ref};
      my $phot_name = $del_id . '_' . $profile{photo_name};
      my ($FR,$FW);
      open($FR, "C:/Program Files (x86)/Apache Group/Apache2/htdocs/static/images/My-Comm/photos/$profile{photo_name}");
      open($FW, ">", "C:/Program Files (x86)/Apache Group/Apache2/htdocs/static/images/My-Comm/photos/$phot_name");
      binmode($FW);
      while (<$FR>){
               print $FW $_;
      };    
      
      my $sql = "insert into member_del_info
                                    values
                                    (
                                       \'$profile{fname}\',  \'$profile{lname}\',  \'$profile{company}\',                     
                                        \'$profile{designation}\',  \'$profile{mobile}\',   \'$profile{email}\', 
                                        \'$phot_name\', \'$profile{member_id}\', \'$del_id\'
                                    );
               ";
      my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' ); 
   }
   return 1;   
}



sub get_all_member_ids_of_apartment_from_db {
    my ($uname) = @_;
    my $uid = get_uid_by_uname_from_db ($uname);
    my $sql = "select member_id from member_profile where uid=\'$uid\' and active='1';";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
    my @member_ids;
    while ( my( $member_id)  = $qh->fetchrow_array()){
         push (@member_ids, $member_id);
    }
    return @member_ids;
}

sub delete_member_profile_by_member_id_from_db {
    my ($member_id) = @_;
    my $sql = "delete from member_profile where member_id = \'$member_id\';";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
    return 1;
}

sub get_member_profile_by_member_id_from_db {
    my ($member_id) = @_;
    my $sql = "select fname , lname , company, designation, mobile, email , photo_name
                  from 
                  member_profile
                     where member_id = \'$member_id\';
             ";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
    
    my(
         $fname , $lname , $company, $designation,
         $mobile, $email , $photo_name
      ) = $qh->fetchrow_array();
    
    my %profile;
    @profile{ 'fname' , 'lname' , 'company', 'designation', 'mobile', 'email' , 'photo_name', 'member_id' }
           = ( $fname , $lname , $company, $designation, $mobile, $email , $photo_name , $member_id); 
    
    return %profile;
}

sub get_user_passwd_by_name_from_db{
    my ($uname) = @_;
    my $sql = "select password  from user_index where uname=\'$uname\';";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
    my ($passwd)  = $qh->fetchrow_array();
    return ($passwd);   
}

sub my_sql_exec {
    my ($sql) = @_;
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
    return 1;
}






#########################################################


sub get_name_by_email_from_db{
   my ($email) = @_;
   my $sql = "select user_name  from user_info where user_email=\'$email\';";
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   my ($uname)  = $qh->fetchrow_array();
   return $uname; 
}

sub get_all_subscribed_emails_db {
   my ($mpid,$spid) = @_;
   my $sql = "select uid from subscribe where mpid=\'$mpid\' and mpid=\'$mpid\';";
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   my @emails;
   while ( my( $uid ) = $qh->fetchrow_array()){
         my $sql = "select user_email from user_info where uid=\'$uid\' ;";
         my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
         my ($email) =  $qh->fetchrow_array();  
         push ( @emails, $email );
   }
   return   @emails; 
}






sub get_user_email_by_name_from_db {
    my ($uname) = @_;
    my $sql = "select user_email  from user_info where user_name=\'$uname\';";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
    my ($user_email)  = $qh->fetchrow_array();
    return ($user_email);   
   
}







sub get_mpid_spid_by_qid_db {
    my ($qid) = @_;
    my $sql = "select  mpid , spid  from quesation where qid=\'$qid\';";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
    my ($mpid, $spid)  = $qh->fetchrow_array();
   return ($mpid, $spid);   
}


sub get_sub_topic_name_db {
   my ( $mpid, $spid ) = @_;
   my $sql = "select sub_topic from sub_page where mpid=\'$mpid\' and spid=\'$spid\';";
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   my ($sub_topic)  = $qh->fetchrow_array();
   return $sub_topic;  
}



sub get_quesation_by_qid_db{
    my ($qid) = @_;
    my $sql = "select que_text from quesation where qid=\'$qid\';";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
    my ( $que_text )  = $qh->fetchrow_array();
    return $que_text;  
}


sub get_all_discussion_db {
   my ($qid) = @_;
   my $sql = "select uid , msg_time , mesg_text from discussion where qid=\'$qid\';";
   $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   my @Dlist;
   while ( my( $uid , $msg_time , $msg_text ) = $qh->fetchrow_array()){
         my %info;
         my ($fname,$lname) = get_fname_lname($uid);
         my $full_name = $fname. ' ' . $lname ;
          ( $info{NAME}, $info{TIME}, $info{MSG_TXT} ) = ( $full_name, $msg_time, $msg_text);
          push @Dlist,\%info;
         
   }
      
      return @Dlist;
}

sub get_fname_lname {
    my ($uid) = @_;
    my $sql = "select FirstName , LastName from user_info where uid=\'$uid\';";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
    my ($fname,$lname) = $qh->fetchrow_array(); 
    return ($fname,$lname); 
}



sub get_qid_n_qtxt_db{
   my ( $mpid,$spid,$uid) = @_;
   my $sql = "select qid, que_text from quesation where mpid=\'$mpid\' and spid=\'$spid\';";
   $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   my @Qlist;
   
     while ( my( $qid, $que_text) = $qh->fetchrow_array()){
         my %info;        
          ( $info{QID}, $info{Q_TXT}) = ( $qid, $que_text);
          push @Qlist,\%info;    
      }
      return @Qlist;
}





sub is_user_subscribed_db {
   my( $mpid, $spid, $uid ) = @_;
   my $sql = "select subscribe_status  from subscribe where mpid=\'$mpid\' and spid=\'$spid\' and uid = \'$uid\';";
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   my ($ret ) = $qh->fetchrow_array();
   return $ret;
    
}   


sub subscribe_user_db {
   my ( $mpid, $spid, $uid , $status ) = @_;   
   my $sql = "DELETE FROM subscribe where mpid=\'$mpid\' and spid=\'$spid\' and uid = \'$uid\';";
   my $qh;
   eval {
         $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   };
   $sql = "insert into subscribe ( mpid, spid, uid, subscribe_status) values ( \'$mpid\', \'$spid\', \'$uid\', \'$status\');";
   $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   return 1;
}


sub get_main_page_info_db{
     my $sql = "select * from main_page;";
     my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
     $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
     my @main_page_info;
   
     while ( my( $mpid, $main_topic, $css_class ) = $qh->fetchrow_array()){
         my %info;        
          ( $info{M_PID}, $info{M_TOPIC},$info{M_CLASS}) = ( $mpid, $main_topic, $css_class );
          push @main_page_info,\%info;    
      }
      return @main_page_info;
}
     
sub get_all_subpage_info_by_mpid_db {
    my ($mpid,$uid) = @_;
    my $sql = "select * from sub_page where mpid = \'$mpid\';";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   my @sub_page_info;
   
     while ( my( $spid, $sub_topic, $css_class, $mpid ) = $qh->fetchrow_array()){
         my %info;
           if ( is_user_subscribed_db ( $mpid, $spid, $uid ) ){
               $info{IS_SUBSCRIBED} = 'YES';  
           } 
          ( $info{S_PID}, $info{S_TOPIC},$info{S_CLASS},$info{M_PID} ) = ( $spid, $sub_topic, $css_class,$mpid );
          push @sub_page_info,\%info;    
      }
      return @sub_page_info;
   
}   
   
sub get_user_id_by_name{
   my ($user_name) = @_;   
   my $sql = "SELECT uid FROM user_info WHERE user_name=?;";
   my $qh = $db_exec->prepare ($sql);
   $qh->execute($user_name);
   my $user_id  = $qh->fetchrow_array();
   return $user_id;
}

sub get_sub_topic_name_by_spid_db{
   my ($spid) = @_;
   my $sql = "select sub_topic from sub_page where spid=\'$spid\';" ;
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   my ($sub_topic_name) = $qh->fetchrow_array();
   return $sub_topic_name;
}

sub get_main_topic_name_by_mpid_db{
   my ($mpid) = @_;
   my $sql = "select main_topic from main_page where mpid=\'$mpid\';" ;
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   my ($main_topic_name) = $qh->fetchrow_array();
   return $main_topic_name;
}


#################################################################################################################
sub get_all_book_info_from_db {
   my ($sql) = @_;
   my @search;
    eval{
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
      
       while ( my( $book_name, $isbn_num, $book_publisher, $book_author , $book_edition, $book_cd,
                  $book_category, $book_sub_category,  $book_pages ) = $qh->fetchrow_array()
      ){
         my %book_info;        
          
          ( $book_info{book_name},      $book_info{isbn_num},          $book_info{book_publisher},
            $book_info{ book_author},   $book_info{ book_edition},     $book_info{book_cd},
            $book_info{ book_category}, $book_info{book_sub_category}, $book_info{book_pages} 
           
          )
          =
          (
             $book_name,      $isbn_num,         $book_publisher,
             $book_author ,   $book_edition,      $book_cd,
             $book_category,  $book_sub_category, $book_pages
         );
          
          push @search,\%book_info;    
      }
   };
   if ( $@ ){
            return ('FAIL',$@);
      }else{
            return @search ;
   }  
}




sub get_new_book_id_from_db {
    my $sql = "select count(*) from t_book;";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
    my ($rows) = $qh->fetchrow_array();
    return $rows+3;
}



sub get_all_reserved_books_by_uid_from_db {
   my ($uid) = @_;
   my $sql = "select book_pid, start_date, end_date from book_reservation where uid=\'$uid\' and status='1';" ;
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   my @ret ;
   while ( my ($book_pid, $start_date, $end_date) = $qh->fetchrow_array() ){
          my %book_info  =  get_book_info_by_book_pid_from_db ( $book_pid);
          my $book_name  = $book_info{book_name};   
          my %data;
          $data{book_name} = $book_name ;
          $data{book_pid} = $book_pid;
          $data{start_date} = $start_date;
          $data{end_date} = $end_date;
          push (@ret , \%data);
   }
   return @ret;
}


sub reserve_this_book_copy_into_db {
    my ($sql) = @_;
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
    return 1;
}

sub get_book_info_by_book_pid_from_db {
    my ($book_pid) = @_;
    my $sql = "select book_id from book_collection where book_pid=\'$book_pid\'";
    my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
    my $book_id = $qh->fetchrow_array();
    $sql = "select
                   book_name, isbn_num,  book_publisher,
                   book_author,  book_edition, book_cd,
                   book_category,  book_sub_category, book_pages
            from t_book
                  where book_id =\'$book_id\'";
                  
   $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
   $qh->execute()or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' ); 
   my %book_info;  
           (
                $book_info{book_name}, $book_info{isbn_num},  $book_info{book_publisher},
                $book_info{book_author},  $book_info{book_edition}, $book_info{book_cd},
                $book_info{book_category},  $book_info{book_sub_category}, $book_info{book_pages}
            ) =  $qh->fetchrow_array();
       $book_info{book_id} =  $book_id;
      return %book_info;       
  
}

sub get_reservation_info_by_book_pid_from_db {
   my ( $book_copy ) = @_;
   my $sql = "select start_date, end_date, uid from book_reservation where book_pid=\'$book_copy\' and status != '0' ";
   my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
   $qh->execute() or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   my @ret;
   while ( my ($start_date,$end_date , $uid ) = $qh->fetchrow_array()){
          my $sql = "select user_name from user_info where uid=\'$uid\' ;" ;
          my $qh = $db_exec->prepare ($sql) or die (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
          $qh->execute() or die (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
          my ($uname) = $qh->fetchrow_array();
          my %data;
          $data{uname} = $uname;
          $data{start_date} = $start_date;
          $data{end_date} = $end_date;
          push @ret , \%data ;
   }
   return @ret;
}

sub get_reservation_dates_from_db {
   my ( $book_copy ) = @_;
   my $sql = "select start_date, end_date from book_reservation where book_pid=\'$book_copy\' and status != '0' ";
   my @ret;
   eval{
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
      while ( my ($start_date,$end_date) = $qh->fetchrow_array()){
         my $date = $start_date. ':' . $end_date;   
         push @ret, $date;
      }
   };
   if ( $@ ){
            return ('FAIL',$@);
      }else{
            return @ret ;
   }  
}

sub get_book_copies_by_id_from_db {
   my ($book_id) = @_; 
   my $sql = "select book_pid from book_collection where book_id = \'$book_id\'";
   my @book_copies;
   
   eval{
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
      while ( my ($book_copy) = $qh->fetchrow_array()){
         push @book_copies, $book_copy;
      }
   };
   if ( $@ ){
            return ('FAIL',$@);
      }else{
            return @book_copies ;
   }  
 
}



sub get_book_details_by_id_from_db {
   my ($book_id) = @_;
   my %book_info; 
   my $sql = "select book_name, book_publisher, book_author , book_edition,
                      book_category, book_sub_category, isbn_num , book_cd , book_pages from t_book
                      where book_id =\'$book_id\' ";
   eval{
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
      
      ( $book_info{book_name},$book_info{book_publisher},
        $book_info{ book_author}, $book_info{ book_edition},
        $book_info{ book_category}, $book_info{book_sub_category},
        $book_info{isbn_num},$book_info{book_cd},$book_info{book_pages}
      ) = $qh->fetchrow_array()
   };
   
   if ( $@ ){
      $book_info{ERROR} = $@;        
   }
   return %book_info;
   
}

sub get_serached_books_from_db {
   my ($sql) = @_;
   my @search;
    eval{
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
      
       while ( my( $book_name, $book_publisher, $book_author , $book_edition,
                  $book_category, $book_sub_category, $isbn_num, $book_id ) = $qh->fetchrow_array()
      ){
         my %book_info;        
          
          ( $book_info{book_name},$book_info{book_publisher},$book_info{ book_author},
           $book_info{ book_edition},$book_info{ book_category}, $book_info{book_sub_category},
           $book_info{isbn_num},$book_info{book_id}
          )
          =
          ( $book_name, $book_publisher, $book_author , $book_edition,
            $book_category, $book_sub_category, $isbn_num, $book_id ); 
          
          push @search,\%book_info;    
      }
   };
   if ( $@ ){
            return ('FAIL',$@);
      }else{
            return @search ;
   }  
}



sub get_all_category_of_books_from_db {
   my $sql = "select distinct book_category from t_book;";
   my @categorys;
    eval{
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
      
       while ( my($category) = $qh->fetchrow_array()){
         push (@categorys, $category);    
      }
   };
   if ( $@ ){
            return ('FAIL',$@);
      }else{
            return @categorys ;
   }  
}


sub get_all_subcategory_of_books_from_db {
   my $sql = "select distinct book_sub_category from t_book;";
   my @categorys;
    eval{
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
      
       while ( my($category) = $qh->fetchrow_array()){
         push (@categorys, $category);    
      }
   };
   if ( $@ ){
            return ('FAIL',$@);
      }else{
            return @categorys ;
   }  
}




sub get_mail_sender_name_from_db {
   my ( $mail_id ) = @_;
   my $sql = "select sender_name from t_mail_box where mail_unique_id=\'$mail_id\'; ";
   my $sender_name; 
    eval{
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
      $sender_name = $qh->fetchrow_array() ;
   };
   if ( $@ ){
            return ('FAIL',$@);
      }else{
            return ($sender_name) ;
   }  
}

sub get_mail_reciever_name_from_db {
   my ( $mail_id ) = @_;
   my $sql = "select reciever_name from t_mail_box where mail_unique_id=\'$mail_id\'; ";
   my $reciever_name; 
    eval{
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
      $reciever_name = $qh->fetchrow_array() ;
   };
   if ( $@ ){
            return ('FAIL',$@);
      }else{
            return ($reciever_name) ;
   }  
}

sub get_subject_text_by_mail_id_from_db {
   my ( $mail_id ) = @_;
   my $sql = "select subject from t_mail_box where mail_unique_id=\'$mail_id\'; ";
   my $subject; 
    eval{
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
      $subject = $qh->fetchrow_array() ;
   };
   if ( $@ ){
            return ('FAIL',$@);
      }else{
            return ($subject) ;
   }   

}


sub get_all_details_about_shop_id {
    my ( $shipment_id ) = @_;
    my @errors;
    my $sql;
    my %data;
    eval{
         $sql = "
                  select shop_admin_id, sender_id, ordered_date,
                  deleivery_adress_customer,order_ids_of_ship_ment
                  from shipment_admin_table
                        where ship_ment_id=\'$shipment_id\' ;
                ";
                
                
         my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
         @data{ shop_admin_id, sender_id, ordered_date, deleivery_adress_customer,order_ids_of_ship_ment} = $qh->fetchrow_array() ;
    };
    if ( $@ ){
            
            $data{error} = $@;
            return %data;
      }else{
         return %data;      
      }
      
}

sub update_shipment_admin_info {
 my ( %data ) = @_;
    my @errors;
    my $sql;
    eval {
          $sql = "
                     insert into shipment_admin_table
                                             (
                                                shop_admin_id, sender_id, ship_ment_id,  mail_id ,
                                                ordered_date,  sid  ,deleivery_adress_customer,
                                                order_ids_of_ship_ment
                                                )
                                                   values
                                             (
                                                \'$data{shop_admin_id}\', \'$data{sender_id}\', \'$data{ship_ment_id}\', \'$data{mail_id}\',
                                                \'$data{ordered_date}\' , \'$data{sid}\', \'$data{deleivery_adress_customer}\',
                                                \'$data{order_ids_of_ship_ment}\'
                                             );  
                                                   
                    ";
         my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
     };
     if ( $@ ){
            return ('FAIL',$@);
      }else{
            return (1);
      }      
}


sub get_shop_admin_id_by_shop_id {
    my ($shop_id) = @_;
    my @errors;
    my $uid;
    my $sql = "select uid from usr_roles where shop_id=\'$shop_id\'; ";
    eval{
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
      $uid = $qh->fetchrow_array() ;
   };
   if ( $@ ){
            return ('FAIL',$@);
      }else{
            return ($uid) ;
   }  
}

sub get_shop_admin_id_by_shop_name {
    my ($shop_name) = @_;
    my @errors;
    my $shop_id;
    my $sql = "select shop_id from shop_loaction where shop_location like \'%$shop_name%\'; ";
   eval{
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
      $shop_id = $qh->fetchrow_array() ;
   };
   if ( $@ ){
            return ('FAIL',$@);
      }else{
            return ($shop_id) ;
   }  
}

sub get_shop_location_by_shop_id_from_db{
    my ( $shop_id ) = @_;
    my @errors;
    my $shop_loaction;
    my $sql = "select shop_location from shop_loaction where shop_id=\'$shop_id\'; ";
    
    eval{
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
      $shop_loaction = $qh->fetchrow_array() ;
   };
   if ( $@ ){
            return ('FAIL',$@);
      }else{
            return ($shop_loaction) ;
   }  
   
}


sub get_shop_id_by_shop_uid_by_db {
   my ( $uid ) = @_;
   my @errors;
   my $shop_id;
   my $sql = "select shop_id from usr_roles where uid=\'$uid\'; ";
  
   eval{
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
      $shop_id = $qh->fetchrow_array() ;
   };
   
   
   if ( $@ ){
       return ('FAIL',$@);
   }elsif (!defined ($shop_id) ){
      return ( 'NOT Assagined') ;   
   }
   else{
      return ($shop_id) ;
   }  
}
sub update_shop_id_for_user{
   my ($shop_admin_uid, $shop_id ) = @_;
   my @errors;
   my $sql = "update usr_roles set shop_id=\'$shop_id\' WHERE uid=\'$shop_admin_uid\'; ";
   eval{
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
   };
   if ( $@ ){
            return ('FAIL',$@);
      }else{
            return ('PASS') ;
   }  
}


sub get_shop_id_by_location {
   my( $location ) = @_;
   my @errors;
   my $shop_id;
   my $sql = "select shop_id from shop_loaction WHERE shop_location like  \'%$location%\';" ;
   eval{
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
      $shop_id = $qh->fetchrow_array() ;
   };
   if ( $@ ){
            return ('FAIL',$@);
      }else{
            return ($shop_id) ;
   }  
}



sub get_all_shop_location_from_db {
   
    my @shop_locaions ;
    eval { 
      my $sql = "SELECT * FROM shop_loaction;";
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
     
      while ( my ( $shop_location, $shop_id ) = $qh->fetchrow_array() ){
            my $hash_ref = {};
            $hash_ref->{shop_location} = $shop_location;
            $hash_ref->{shop_id} = $shop_id;
            push ( @shop_locaions ,$hash_ref);      
      }
   };
   if ( $@ ){
            return ('FAIL',$@);
      }else{
            return @shop_locaions ;
   }  
   
   
}
sub get_order_price {
    my ($oid) = @_;
    my $order_price = 0;
     eval { 
         my $sql = "SELECT price FROM t_orderinfo WHERE order_id=\'$oid\';";
         my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
         $order_price = $qh->fetchrow_array() ;
     };
      if ( $@ ){
            return ('FAIL',$@);
      }else{
            return ($order_price);
   }  
}


sub update_shipment_data_db{
    my ( %data ) = @_;
    my @errors;
    my $sql;
    eval {
          $sql = "
                     insert into shipment_table
                                             (  shipment_id, order_ids, uid,  shiped_date , sid )
                                                   values
                                             (
                                                \'$data{shipment_id}\', \'$data{order_ids}\',
                                                \'$data{uid}\', \'$data{shiped_date}\', \'$data{sid}\'
                                             );  
                                                   
                    ";
         my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
     };
     if ( $@ ){
            return ('FAIL',$@);
      }else{
            return (1);
      }      
}

sub get_shipment_id_and_date {
   my ( $sql ) = @_;  
   my @errors;
   my ($shipment_id, $shipment_date);
   my %data;
    eval {
         my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
         ($shipment_id, $shipment_date) = $qh->fetchrow_array() ;
     };
     if ( $@ ){
            $data{error} = $@;
            return %data;
      }else{
            $data{shipment_id} = $shipment_id;
            $data{shipment_date} = $shipment_date;
            $data{sql} = $sql;
      }
      return %data;;
}


sub insert_into_draft_box {
    my ( %data) = @_;
    my @errors;
    my $sql;
    eval {
          $sql = "
                     insert into t_draft_mail_box
                                             ( sender, recipient , mail_content , subject_text, sent_date , drat_mail_id )
                                                   values
                                                (
                                                      \'$data{sender}\' ,        \'$data{recipient}\' ,
                                                      \'$data{mail_content}\' ,  \'$data{subject_text}\' ,
                                                      \'$data{sent_date}\',       \'$data{drat_mail_id}\' 
                                                 );
                    ";
         my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
     };
     if ( $@ ){
            return ('FAIL',$@);
      }else{
            return (1);
      }   
}

sub trash_this_mail_in_db {
   my ($mail_id) = @_;
    my @errors;
    eval {
      
         my $sql = "insert into t_mail_trash_box   select * from  t_mail_box where mail_unique_id=\'$mail_id\'";
         my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
      
         $sql = "insert into t_mail_trash_content   select * from  t_mail_content where mail_unique_id=\'$mail_id\';";
         $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
         delete_this_mail_from_db ($mail_id );
     };
      if ( $@ ){
            return ('FAIL',$@);
      }else{
            return (1);
   }  
   
              
               my $sql1 = "insert into t_mail_trash_content   select * from  t_mail_content where mail_unique_id=\'$mail_id\';"
   
   
}
sub db_exec_single_val_ret {
   my ($sql) = @_;
   my $mail_id;
    my @errors;
   eval { 
         my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
         $mail_id = $qh->fetchrow_array() ;
     };
      if ( $@ ){
            return ('FAIL',$@);
      }else{
            if ( defined ( $mail_id )){
               return ($mail_id);   
            }else{
               return ('FAIL',$@);   
            } 
   }  
}

sub db_exec_string_ret {
   my ($sql) = @_;
   my $mail_id;
    my @errors;
   eval { 
         my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
         $mail_id = $qh->fetchrow_array() ;
     };
      if ( $@ ){
            return ('FAIL',$@);
      }else{
            if ( defined ( $mail_id )){
               return ($mail_id);   
            }else{
               return ('FAIL',$@);   
            } 
   }    
}

sub db_exec_return_boolean {
   my ($sql) = @_;
   my $ret;
    my @errors;
   eval { 
         my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
         $ret = $qh->fetchrow_array() ;
     };
      if ( $@ ){
            return 0;
      }else{
            if ( defined ( $ret )){
               return 1;   
            }else{
               return 0;   
            } 
   }    
}


sub db_exec_string_no_ret {
   my ($sql) = @_;
    my @errors;
   eval { 
         my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
     };
      if ( $@ ){
            return ('FAIL',$@);
      }else{
            return 1;
      }     
}


sub get_mail_fp_by_mail_id_from_db {
    my ($mail_id) = @_;
    my $mail_fp;
    eval { 
         my $sql = "SELECT mail_fp FROM t_mail_content WHERE mail_unique_id=\'$mail_id\';";
         my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
          $mail_fp = $qh->fetchrow_array() ;
     };
      if ( $@ ){
            return ('FAIL',$@);
      }else{
            return ($mail_fp);
   }  
}


sub get_all_included_mailds_from_db {
    my ($mail_id) = @_; 
    my @errors;
    my @included_mail_ids;
     eval { 
         my $sql = "SELECT included_mail_ids FROM t_mail_content WHERE mail_unique_id=\'$mail_id\';";
         my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
         while ( my ( $included_mail_is ) = $qh->fetchrow_array() ){  
            push ( @included_mail_ids ,$included_mail_is);      
         }
     };
      if ( $@ ){
            return ('FAIL',$@);
      }else{
            return (@included_mail_ids);
   } 
     
}
sub update_inc_mail_ids_meta{
    my ($mail_id) = @_;
    my @errors;
      eval { 
         my $sql = "SELECT mail_unique_id FROM t_mail_content WHERE included_mail_ids=\'$mail_id\';";
         my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
         my $main_mail_id = $qh->fetchrow_array();
         
         $sql = "update t_mail_content set external_mail_id_used=\'$mail_id\' WHERE mail_unique_id=\'$main_mail_id\'; ";
         $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
         
         $sql = "SELECT mail_id_inclusion_type FROM t_mail_content WHERE included_mail_ids=\'$mail_id\';";
         $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
         my $mail_usage_type = $qh->fetchrow_array();
         
         $sql = "update t_mail_content set external_mail_id_used_type=\'$mail_usage_type\' WHERE mail_unique_id=\'$main_mail_id\'; ";
         $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
   };
   if ( $@ ){
            return ('FAIL',$@);
      }else{
            return ('PASS For ' . $mail_id);
   } 
}

sub get_all_included_mail_ids_used_by_mail{
   my ($mail_id) = @_;
   my @errors;
   my @included_mail_ids;
   my @mail_ids;
   eval { 
      my $sql = "SELECT included_mail_ids FROM t_mail_content WHERE mail_unique_id=\'$mail_id\';";
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
      while ( my ( $included_mail_is ) = $qh->fetchrow_array() ){  
            push ( @included_mail_ids ,$included_mail_is);      
      }
      my %seen;
      @mail_ids = grep { ! $seen{$_}++ } @included_mail_ids;
   };
   if ( $@ ){
            return ('FAIL',$@);
      }else{
            return (@mail_ids);
   } 
   
}


sub get_mail_fp_from_db_by_mail_id{
   my ($mail_id) = @_;
   my @errors;
   my $mail_fp;

   eval { 
      my $sql = "SELECT mail_fp FROM t_mail_content WHERE mail_unique_id=\'$mail_id\';";
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
      $mail_fp = $qh->fetchrow_array();
   };
   
   if ( $@ ){
            return ('FAIL',$@);
      }else{
            return ('PASS', $mail_fp);
   } 
}



sub delete_this_mail_from_db {
   my ($mail_id) = @_;
    eval { 
      my $sql = "delete from t_mail_content WHERE mail_unique_id=?;";
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute($mail_id)or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
      $sql = "delete from t_mail_box WHERE mail_unique_id=?;";
      $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute($mail_id)or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
   };
    if ( $@ ){
            return ('FAIL',$@);
      }else{
            return ('PASS');
   } 
   
}

sub delete_this_draft_mail_from_db {
   my ($mail_id) = @_;
    eval { 
      my $sql = "delete from t_draft_mail_box WHERE drat_mail_id=?;";
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute($mail_id)or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
   };
    if ( $@ ){
            return ('FAIL',$@);
      }else{
            return ('PASS');
   } 
   
}



sub get_mail_content_from_db_by_mail_id{
   my ($mail_id) = @_;
   my @errors;
   my $mail_content;

   eval { 
      my $sql = "SELECT mail_content FROM t_mail_content WHERE mail_unique_id=\'$mail_id\';";
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
      $mail_content = $qh->fetchrow_array();
   };
   
   if ( $@ ){
            return ('FAIL',$@);
      }else{
            return ('PASS', $mail_content);
   } 
}

sub find_this_draft_mail_by_id_in_db {
   my ($sql) = @_;
   my @errors;
   my %data ;
    eval{ 
            $qh = $db_exec->prepare ("$sql") or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
            $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
            (   
                       $data{sender},        $data{recipient},
                       $data{mail_content},  $data{subject_text},
                       $data{sent_date},     $data{drat_mail_id}
            )  = $qh->fetchrow_array();
    };
    if ( $@ &&  defined ($data{drat_mail_id}) ){
            $data{status} = 'FAIL';
            $data{error} = $@;
            return %data;
      }else{
            $data{status} = 'PASS';
             return %data;
      } 
}

sub fetch_user_draft_mail_db {
   my ($sql) = @_;
   my @errors;
   my @draft_box_data;
   eval{ 
            $qh = $db_exec->prepare ("$sql") or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
            $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
            
            my  (   
                       $sender,        $recipient,
                       $mail_content,  $subject_text,
                       $sent_date,     $drat_mail_id
            );
            
            while (              
                    my  (   
                       $sender,        $recipient,
                       $mail_content,  $subject_text,
                       $sent_date,     $drat_mail_id
                     )
                     =  $qh->fetchrow_array()
                 ){
                    my %data ;
                    
                    (   
                       $data{sender},        $data{recipient},
                       $data{mail_content},  $data{subject_text},
                       $data{sent_date},     $data{drat_mail_id}
                    )
                     =
                    (   
                       $sender,        $recipient,
                       $mail_content,  $subject_text,
                       $sent_date,     $drat_mail_id
                    );
                   
                    push (@draft_box_data, \%data);               
             }
    };
      if ( $@ ){
            return ('FAIL',$@);
      }else{
            return @draft_box_data;
      } 
}

sub get_shop_admins_reg_shipment_from_db {
   my ($uid) = @_;
   my @errors;
   my @shipment_orders;
   my $sql = "select sender_id, ship_ment_id, mail_id, ordered_date, deleivery_adress_customer, order_ids_of_ship_ment, is_shipped
                     from shipment_admin_table where shop_admin_id=\'$uid\';";
            $qh = $db_exec->prepare ("$sql") or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
            $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
         
              while (              
                    my(   
                       $sender_id, $ship_ment_id, $mail_id,  $ordered_date,
                       $deleivery_adress_customer, $order_ids_of_ship_ment, $is_shipped
                     ) =  $qh->fetchrow_array()
             ){
                    my $hash_ref = {};
                    my $ref_oids = [];
                    @{$ref_oids} = split ',' ,$order_ids_of_ship_ment;
                    (   
                        $hash_ref->{sender_id}, $hash_ref->{ship_ment_id},
                        $hash_ref->{mail_id}, $hash_ref->{ordered_date},
                        $hash_ref->{deleivery_adress_customer}, $hash_ref->{order_ids_of_ship_ment},
                        $hash_ref->{ref_to_oids}, $hash_ref->{is_shipped}
                     )
                      =
                     (   
                       $sender_id, $ship_ment_id, $mail_id,  $ordered_date,
                       $deleivery_adress_customer, $order_ids_of_ship_ment,
                       $ref_oids,$is_shipped
                     );
                     
                     my $sql = "select  FirstName, LastName from user_info where uid=\'$hash_ref->{sender_id}\';";
                     $qh1 = $db_exec->prepare ("$sql") or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
                     $qh1->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
                     ( $hash_ref->{FirstName}, $hash_ref->{LastName} ) =  $qh1->fetchrow_array();
                     $hash_ref->{uname} = get_user_name_by_id ($uid );
                     
                      push ( @shipment_orders ,$hash_ref);
              }
  
              if ( $@ ){
                  return ('FAIL',$@);
            }else{
               return @shipment_orders;
         } 
}


sub get_all_mail_content_by_mail_id_from_db {
   my ($sql) = @_;
   my @errors;
   my %data;  
   eval{ 
            $qh = $db_exec->prepare ("$sql") or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
            $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
            
            my(   
                       $subject, $sender_name, $sent_date,
                       $recieve_group, $reciever_name 
              )
               =
                  $qh->fetchrow_array();
            
               (   
                       $data{subject}, $data{sender_name}, $data{sent_date},
                       $data{recieve_group}, $data{reciever_name} 
               )
            =
               (   
                       $subject, $sender_name, $sent_date,
                       $recieve_group, $reciever_name 
               );
               
   };      
   if ( $@ ){
            $data{status} = 'FAIL';
            $data{error} = $@;
            return %data;
      }else{
            $data{status} = 'PASS';
             return %data;
      } 
}


sub get_mail_params_from_db {
   my ($sql) = @_;
   my @errors;
   my %data;  
   eval{ 
            $qh = $db_exec->prepare ("$sql") or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
            $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
            
            my(   
                       $subject, $mail_read, $sender_name,
                       $sent_date, $recieve_group , $reciever_name
              ) = $qh->fetchrow_array();
            
           (
            
             $data{subject}, $data{mail_read}, $data{sender_name},
             $data{sent_date}, $data{recieve_group} , $data{reciever_name}
           )
            =
           (
            
             $subject, $mail_read, $sender_name,
             $sent_date, $recieve_group , $reciever_name
           ) 
   };      
   if ( $@ ){
            $data{status} = 'FAIL';
            $data{error} = $@;
            return %data;
      }else{
            $data{status} = 'PASS';
             return %data;
      } 
}
sub fetch_user_mail_from_db {
   my ($sql) = @_;
   my @errors;
   my @mails;
        
        eval{ 
            $qh = $db_exec->prepare ("$sql") or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
            $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
         
            my(   
                        $mail_unique_id, $subject,
                        $mail_read, $sender_name,
                        $sent_date, $recieve_group,
                        $reciever_name
              );
            while (
                     (   
                        $mail_unique_id, $subject,
                        $mail_read, $sender_name,
                        $sent_date, $recieve_group,
                        $reciever_name
                     )
                      = $qh->fetchrow_array()
            ){
                  my $hash_ref = {};
                  (   
                        $hash_ref->{mail_unique_id}, $hash_ref->{subject},
                        $hash_ref->{mail_read}, $hash_ref->{sender_name},
                        $hash_ref->{sent_date}, $hash_ref->{recieve_group},
                        $hash_ref->{reciever_name}
                  )
                  =
                  (   
                        $mail_unique_id, $subject,
                        $mail_read, $sender_name,
                        $sent_date, $recieve_group,
                        $reciever_name
                  );
               push ( @mails ,$hash_ref);    
            }
      };
      if ( $@ ){
            return ('FAIL',$@);
      }else{
            return @mails;
      } 
}



sub insert_mail_content_info {
      my (
             $mail_index , $mail_content,$mail_fp ,
             $included_mail_ids,  $mail_id_inclusion_type,
             $external_mail_id_used, $external_mail_id_used_type
       ) = @_;
      my $sql ;
      my @errors;
            eval{ 
               $sql = "insert into t_mail_content(
                                                   mail_content , mail_unique_id , mail_fp ,
                                                   included_mail_ids,  mail_id_inclusion_type,
                                                   external_mail_id_used, external_mail_id_used_type
                                             )
                                                 values
                                             (
                                                \'$mail_content\' , \'$mail_index\' , \'$mail_fp\',
                                                \'$included_mail_ids\' ,  \'$mail_id_inclusion_type\' ,
                                                \'$external_mail_id_used\' , \'$external_mail_id_used_type\'
                                              );
                      ";
               $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
               $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
            };
            
            
            
      if ( $@ ){
            return ('FAIL',$@);
      }else{
            return('PASS',$sql);
      } 
}


sub select_mail_uniq_index_from_db{
      my ($sql) = @_;
      my @errors;
      my $mail_uniq_index;
      eval{
             my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
             $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
              $mail_uniq_index = $qh->fetchrow_array();
      };
      if ( $@){
            return ('FAIL',$@);
      }else{
            return ('PASS' , $mail_uniq_index);
      }
      
}

sub insert_mail_header_info{
      my ($sql) = @_;
      my @errors;
      eval{
             my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
             $qh->execute()or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
      };
      if ( $@){
         return ('FAIL',$@);
      }else{
         return 1;
      }
   
}

sub get_list_of_uid_and_name_of_Library_Admins {
      my ( $role ) = @_;
      my @errors;
      my ( $sql,$qh);
      my @user_names;
      my %data;
      eval {
         
            $sql = "SELECT uid FROM usr_roles WHERE role=?;";
            $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
            $qh->execute($role)or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
            my @uids;
            while ( my ($uid )  = $qh->fetchrow_array() ){
                  push (@uids,$uid);
            }
            
            foreach my $uid ( @uids){
               $sql = "SELECT user_name FROM user_info WHERE uid=?;";
               $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
               $qh->execute($uid)or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
               my $user_name = $qh->fetchrow_array();
               $data{ $uid } = $user_name;
            }
      };    

      return %data;
}

sub search_for_uname_by_user_info_db {
    my ( $sql) = @_;
    my @errors;
    my @unames;
     eval {
         
            $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
            $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
             

            while ( my ($uname )  = $qh->fetchrow_array() ){
                  push (@unames,$uname);
            }
      };
     if ($@){
         return ('FAIL', $@ );
     }else{
         return ('PASS',@unames);   
     }
}




sub get_user_info_by_field_val_db{
   my ( $f_name , $fval) = @_;
   my (@errors,$sql,$qh,%data);
   
   my %map_h = (
      uname => 'user_name',
      fname => 'FirstName',
      lname => 'LastName',
      adress => 'Address',
      dadress =>  'DeliveryAddress',
      phone =>   'mobile',
      email =>   'user_email', 
   );
   
   eval {
      $sql = "
               SELECT
                        user_name,  user_email, mobile,
                        Address,  DeliveryAddress,
                        FirstName, LastName
                FROM user_info  WHERE  " .
                "$map_h{$f_name}"   .
                '=' . "\'$fval\'"  ;
             
      $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
      
      (
         $data{'search_uname'}, $data{'search_email'},
         $data{'search_phone'}, $data{'search_adress'},
         $data{'search_dadress'}, $data{'search_fname'} ,
         $data{'search_lname'}
      ) =  $qh->fetchrow_array();   
   };
   
    
   if ( $@){
      $data{result} = 'FAIL';
      @{$data{error}} = $@;
      return %data; 
   }else{
      return %data;   
   }

}

sub delete_this_user_by_name{
   my ( $name ) = @_;
   my @errors;
      
         
      
            
   return 1;  
}

sub get_user_list_by_role_from_db{
      my ( $role ) = @_;
      my @errors;
      my ( $sql,$qh);
      my @user_names;
      eval {
         
            $sql = "SELECT uid FROM usr_roles WHERE role=?;";
            $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
            $qh->execute($role)or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
            my @uids;

            while ( my ($uid )  = $qh->fetchrow_array() ){
                  push (@uids,$uid);
            }
            
            foreach my $uid ( @uids){
               $sql = "SELECT user_name FROM user_info WHERE uid=?;";
               $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
               $qh->execute($uid)or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );   
               my $user_name = $qh->fetchrow_array();
               push @user_names , $user_name;
            }
      }; 
      
      if ($@) {
         push (@errors, "$@"); 
         return  ('FAIL', @errors);
      }else{
         return @user_names;
      } 
}


sub create_new_user_in_db{
      my ( %data ) = @_;
      my @errors;
      my ( $sql,$qh);
      eval { 
             $sql = " insert into user_info
                                             (
                                                user_name, user_passwd, FirstName ,
                                                LastName , user_email, mobile, 
                                                Address , DeliveryAddress
                                              )
                                                values 
                                                      (
                                                         \'$data{'user_login_name'}\', \'$data{'user_login_name'}\', \'$data{'first_name'}\',
                                                         \'$data{'last_name'}\', \'$data{'user_email'}\', \'$data{'mobile'}\' ,
                                                         \'$data{'adress'}\',  \'$data{'adress'}\'
                                                
                                             );
             
                      ";
             $qh = $db_exec->prepare($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
             $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
             
             $sql = " select uid from user_info where user_name=\'$data{'user_login_name'}\';";
             $qh = $db_exec->prepare($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
             $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
             my $uid = $qh->fetchrow_array();
             
             $sql = " insert into usr_roles (uid,role) values ( \'$uid\' , '0' );";
             $qh = $db_exec->prepare($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
             $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
      }; 
      
      if ($@) {
         push (@errors, "$@"); 
         return  ('FAIL', @errors);
      }else{
         return ('PASS');
      } 
}



sub get_user_role_by_uname {
      my  ( $user_name ) = @_;
      my $uid = get_user_id_by_name ( $user_name );
      my $sql = "SELECT role FROM usr_roles WHERE uid=?;";
      my $qh = $db_exec->prepare ($sql);
      $qh->execute($uid);
      my $role = $qh->fetchrow_array;
      return $role;
}

sub update_role_to_user {
my  ( $user_name,$role ) = @_;
     my $uid = get_user_id_by_name ( $user_name );
     my @errors;
    eval { 
      my $sql = "update usr_roles set role =\'$role\' where uid=\'$uid\'";
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   };
   if ($@) {
      push (@errors, "$@"); 
      return  ('FAIL', @errors);
   }else{
      return ('PASS');
   }    
   
}

sub update_user_to_shop_admin {
     my  ( $user_name ) = @_;
     my $uid = get_user_id_by_name ( $user_name );
     my @errors;
    eval { 
      my $sql = "update usr_roles set role =\'1\' where uid=\'$uid\'";
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   };
   if ($@) {
      push (@errors, "$@"); 
      return  ('FAIL', @errors);
   }else{
      return ('PASS');
   } 
}

sub de_update_user_to_shop_admin{
   my  ( $user_name ) = @_;
     my $uid = get_user_id_by_name ( $user_name );
     my @errors;
    eval { 
      my $sql = "update usr_roles set role =\'0\' where uid=\'$uid\'";
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   };
   if ($@) {
      push (@errors, "$@"); 
      return  ('FAIL', @errors);
   }else{
      return ('PASS');
   } 
}  

sub get_all_login_names_from_db {
   my $sql = "select user_name from user_info ";
   my $qh = $db_exec->prepare ($sql);
   $qh->execute();
   my @user_names;

   while ( my ($user_name )  = $qh->fetchrow_array() ){
         push (@user_names,$user_name);
   }   
   return @user_names;
}

sub get_all_login_fnames_from_db{
   my $sql = "select FirstName from user_info ";
   my $qh = $db_exec->prepare ($sql);
   $qh->execute();
   my @user_names;

   while ( my ($user_name )  = $qh->fetchrow_array() ){
         push (@user_names,$user_name);
   }   
   return @user_names;
}

sub get_all_login_lnames_from_db{
   my $sql = "select LastName from user_info ";
   my $qh = $db_exec->prepare ($sql);
   $qh->execute();
   my @user_names;

   while ( my ($user_name )  = $qh->fetchrow_array() ){
         push (@user_names,$user_name);
   }   
   return @user_names;
}

sub get_all_login_adress_from_db{
   my $sql = "select Address from user_info ";
   my $qh = $db_exec->prepare ($sql);
   $qh->execute();
   my @adress_s;

   while ( my ($adress )  = $qh->fetchrow_array() ){
         push (@adress_s,$adress );
   }   
   return @adress_s;
}

sub get_all_login_dadress_from_db{
   my $sql = "select DeliveryAddress from user_info ";
   my $qh = $db_exec->prepare ($sql);
   $qh->execute();
   my @dadress_s;

   while ( my ($dadress )  = $qh->fetchrow_array() ){
         push (@dadress_s,$dadress );
   }   
   return @dadress_s;
}

sub get_all_login_phones_from_db{
   my $sql = "select mobile from user_info ";
   my $qh = $db_exec->prepare ($sql);
   $qh->execute();
   my @phones;

   while ( my ($phone)  = $qh->fetchrow_array() ){
         push (@phones,$phone );
   }   
   return @phones;
}


sub get_all_login_emails_from_db{
   my $sql = "select user_email from user_info ";
   my $qh = $db_exec->prepare ($sql);
   $qh->execute();
   my @emails;

   while ( my ($email)  = $qh->fetchrow_array() ){
         push (@emails,$email );
   }   
   return @emails;
}




sub user_authentication{
   my  ( $user_name , $user_passwd ) = @_;
   
   my $sql = "SELECT user_passwd FROM user_info WHERE user_name=?;";
   my $qh = $db_exec->prepare ($sql);
   $qh->execute($user_name);
   my $passwd = $qh->fetchrow_array;
   if ( "$user_passwd" eq "$passwd" ){
      return 1;
   }else{
      return 0;
   }
}

sub update_user_password{
   my  ( $user_name , $user_passwd ) = @_;
   my @errors;
   eval { 
      my $sql = "update user_info set user_passwd =\'$user_passwd\' where user_name=\'$user_name\'";
      my $qh = $db_exec->prepare ($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
      $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   };
   if ($@) {
      push (@errors, "$@"); 
      return  ('FAIL', @errors);
   }else{
      return ('PASS');
   } 
}   
   
sub update_user_info_to_db {
   my (%params) = @_;
   my @errors;
   eval { 
         my $sql = "
               update user_info set
               
                     user_email = \'$params{ user_email  }\' ,
                     mobile = \'$params{ mobile }\' ,
                     Address = \'$params{ adress }\' ,
                     DeliveryAddress = \'$params{ delivery_adress  }\' ,
                     FirstName = \'$params{ first_name }\' ,
                     LastName = \'$params{ last_name }\'
               where user_name = \'$params{ user_login_name }\'
            ";
    my $qh = $db_exec->prepare($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   }; 
    if ($@) {
      push (@errors, "$@"); 
      return  ('FAIL', @errors);
   }else{
      return ('PASS');
   } 
   
}

sub get_user_details_by_login_name {
      my ($login_name) = @_;
      my @errors;
      my ( $sql,$qh);
      eval { 
             $sql = "select FirstName , LastName ,user_email, mobile, Address , DeliveryAddress
                                    from user_info where user_name=\'$login_name\'";
             $qh = $db_exec->prepare($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
            $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
      }; 
      
      if ($@) {
         push (@errors, "$@"); 
         return  ('FAIL', @errors);
      }         
    
      my %data;
      $data{user_name} = $login_name;
      (
         $data{FirstName },
         $data{ LastName},
         $data{user_email },
         $data{mobile },
         $data{Address },
         $data{DeliveryAddress }
      ) =  $qh->fetchrow_array();
      
      return ('PASS',%data);
     
   
}

sub edit_ing_list_in_db {
   my (%params) = @_;  
   my @errors;
  
   foreach my $ing ( keys (%params) ){ 
      my $sql = "select id from t_ingridients where ingridient_name=\'$ing\'"; 
      my $qh = $db_exec->prepare($sql);
      $qh->execute();
      my $ing_id = $qh->fetchrow_array();
     
      eval { 
            my $sql = "update t_ingridients set ingridient_name = \'$params{$ing}\' where id = \'$ing_id\' ";
            my $qh = $db_exec->prepare($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
            $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
      }; 
      if ($@) {
         push (@errors, "$@"); 
         return  ('FAIL', @errors);
      }         
   }
   return ('PASS');
}


sub delete_ing_list_in_db {
   my ($ing) = @_;
   eval {
         my $sql = "DELETE FROM t_ingridients WHERE ingridient_name=\'$ing\' ";
         my $qh = $db_exec->prepare($sql);
         $qh->execute();
     };
     if ($@){
         return ('FAIL', $@ );
     }else{
         return ('PASS');   
     }
}

sub get_item_objs {
   my ($item_code_pat) = @_;
   
   my $sql = "select item_code from T_ItemIndex ";
   my $qh = $db_exec->prepare ($sql);
   $qh->execute();
   my @item_codes;

   while ( my ($item_code )  = $qh->fetchrow_array() ){
      if ( $item_code =~ /$item_code_pat/){  
         push (@item_codes,$item_code);
      }
   }
   my @items = ();
   foreach my $item_code (@item_codes){
      my $href = {};
      $href->{code} = $item_code;
      my $sql = "select item_id from T_ItemIndex where item_code like  \'$item_code%\' ";
      my $qh = $db_exec->prepare ($sql);
      $qh->execute();
      my $item_id  = $qh->fetchrow_array();
      $sql = "select price_small, price_medium, price_large from T_PriceItem where item_id=\'$item_id\'";
      $qh = $db_exec->prepare ($sql);
      $qh->execute();
      while ( my ( $price_small, $price_medium, $price_large ) = $qh->fetchrow_array() ){
            ($href->{price}{small}, $href->{price}{medium}, $href->{price}{large})
                                          = ( $price_small, $price_medium, $price_large );   
      }
      
      $sql = "select disp_name,tab,image,link,remark,compliments from T_ItemDetail where item_id=\'$item_id\'"; 
      $qh = $db_exec->prepare ($sql);
      $qh->execute();
      while ( my( $disp_name, $tab, $image, $link, $remark, $compliments ) =  $qh->fetchrow_array() ){
            ( $href->{item_id}, $href->{name}, $href->{tab}, $href->{image},
               $href->{link}, $href->{desc}, $href->{compliments})   =
               ( $item_id, $disp_name, $tab, $image, $link, $remark, $compliments );
               my @ings =  get_item_ingridients ($item_code);
               my $ings = join ', ' , @ings ;
               $href->{contents} = $ings;  
      }
      push(@items, $href);
   }
   return @items;
}



sub get_all_ings_from_db {
      my %ing_hash;
      my $sql = "select id, ingridient_name from t_ingridients";
      my $qh = $db_exec->prepare ($sql);
      $qh->execute();
      while ( my ( $ing_id, $ing_name ) = $qh->fetchrow_array() ){
            $ing_hash{$ing_id} = "$ing_name"; 
      }   
      return %ing_hash;
}


sub get_all_prize_of_item_by_item_id_db {
      my ($item_id) = @_;
      my $sql = "select price_small, price_medium, price_large from T_PriceItem where item_id=\'$item_id\'";
      $qh = $db_exec->prepare ($sql);
      $qh->execute();
      my %item_prices;
      ( $item_prices{small}, $item_prices{medium}, $item_prices{large} ) = $qh->fetchrow_array();
      return %item_prices;
}

sub update_item_price_by_id{
   my ($item_id, %item_prices) = @_;
   my @errors;
   eval { 
    my $sql = "
               update T_PriceItem set
               
                     price_small = \'$item_prices{small}\',
                     price_medium = \'$item_prices{medium}\',
                     price_large = \'$item_prices{large}\'
               
               where item_id = \'$item_id\'
            ";
    my $qh = $db_exec->prepare($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   }; 
    if ($@) {
      push (@errors, "$@"); 
      return  ('FAIL', @errors);
   }else{
      return ('PASS');
   } 
}

sub update_item_content_by_id {
     my ($item_id, @ings) = @_;
     
     eval {
         my $sql = "DELETE FROM T_ItemIngMap WHERE item_id=\'$item_id\' ";
         my $qh = $db_exec->prepare($sql);
         $qh->execute();
     };
     if ( $@ ){
         return $@;
     }else {
         foreach my $ing_name( @ings ){
            my $ing_id = get_ing_id_by_name ( $ing_name );
            my @errors;
            eval {
               my $sql = "insert into t_itemingmap (item_id,ing_id) values ( \'$item_id\', \'$ing_id\'  )";
               my $qh = $db_exec->prepare($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
               $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
            };
            if ($@) {
               push (@errors, "$@"); 
               return  ('FAIL', @errors);
            }
         }
         return ('PASS');
     }
   
}

sub update_item_content_by_id_x {
    my ($item_id, $ing_name) = @_;
    my $ing_id = get_ing_id_by_name ( $ing_name );
    my @errors;
   eval {
         my $sql = "insert into t_itemingmap (item_id,ing_id) values ( \'$item_id\', \'$ing_id\'  )";
         my $qh = $db_exec->prepare($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   };
   if ($@) {
      push (@errors, "$@"); 
      return  ('FAIL', @errors);
   }
   return ('PASS' , "$ing_name Updated to Item Ing List");
}


sub delete_item_content_by_id_x {
my ($item_id, $ing_name) = @_;
    my $ing_id = get_ing_id_by_name ( $ing_name );
    my @errors;
   eval {
         my $sql = "DELETE FROM t_itemingmap WHERE item_id=\'$item_id\' AND ing_id=\'$ing_id\'";
         my $qh = $db_exec->prepare($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   };
   if ($@) {
      push (@errors, "$@"); 
      return  ('FAIL', @errors);
   }
   return ('PASS' , "$ing_name Deleted From Item Ing List");  
   
}

sub get_item_ingridients{
      my ($item_code) = @_;
      my $sql = "select item_id from t_itemindex where item_code=\'$item_code\' ";
      my $qh = $db_exec->prepare ($sql);
      $qh->execute();
      my $item_id  = $qh->fetchrow_array();
      $sql = "select ing_id from T_ItemIngMap where item_id=\'$item_id\' ";
      $qh = $db_exec->prepare ($sql);
      $qh->execute();
      my @ing_names ;
      while (my $ing_id  = $qh->fetchrow_array()){
         my $sql = "select ingridient_name from t_ingridients where id=\'$ing_id\' ";
         my $qh = $db_exec->prepare ($sql);
         $qh->execute();
         my $ingridient_name = $qh->fetchrow_array();
         push (@ing_names, $ingridient_name);
      }
      return @ing_names;
}

sub get_ing_id_by_name{
    my ($ing_name) = @_;
    my $sql = "select id from t_ingridients where ingridient_name like \'$ing_name\' ";
    my $qh = $db_exec->prepare ($sql);
    $qh->execute();
    my $ing_id  = $qh->fetchrow_array();
    return $ing_id;
}

sub get_image_location {
    my ($item_code) = @_;
    my $sql = "select item_id from T_ItemIndex where item_code like  \'%$item_code%\' ";
    my $qh = $db_exec->prepare ($sql);
    $qh->execute();
    my $item_id  = $qh->fetchrow_array();
    
    $sql = "select image from T_ItemDetail where item_id=\'$item_id\'";
    $qh = $db_exec->prepare ($sql);
    $qh->execute();
    my $item_image  = $qh->fetchrow_array();
    if (!$item_image){
      return " $item_image L $item_code L NO IMAGE Found";
    }else {
      return $item_image;
    }   
}

sub get_item_name {
    my ($item_code) = @_;
    my $sql = "select item_id from T_ItemIndex where item_code like  \'$item_code%\' ";
    my $qh = $db_exec->prepare ($sql);
    $qh->execute();
    my $item_id  = $qh->fetchrow_array();
    
    $sql = "select disp_name from T_ItemDetail where item_id=\'$item_id\'";
    $qh = $db_exec->prepare ($sql);
    $qh->execute();
    my $item_name  = $qh->fetchrow_array();
    if (!$item_name){
      return " $item_name NO IMAGE Found";
    }else {
      return $item_name;
    }   
}

sub get_item_contents {
    my ($item_code) = @_;
    my $sql = "select item_id from T_ItemIndex where item_code like  \'$item_code%\' ";
    my $qh = $db_exec->prepare ($sql);
    $qh->execute();
    my $item_id  = $qh->fetchrow_array();
    
    $sql = "select contents from T_ItemDetail where item_id=\'$item_id\'";
    $qh = $db_exec->prepare ($sql);
    $qh->execute();
    my $item_contents  = $qh->fetchrow_array();
    if (!$item_contents){
      return " $item_contents NO IMAGE Found";
    }else {
      return $item_contents;
    }   
}
sub get_item_compliment {
   my ($item_code) = @_;
    my $sql = "select item_id from T_ItemIndex where item_code like  \'$item_code%\' ";
    my $qh = $db_exec->prepare ($sql);
    $qh->execute();
    my $item_id  = $qh->fetchrow_array();
    
    $sql = "select compliments from T_ItemDetail where item_id=\'$item_id\'";
    $qh = $db_exec->prepare ($sql);
    $qh->execute();
    my $item_compliments  = $qh->fetchrow_array();
    if (!$item_compliments){
      return " $item_compliments NO IMAGE Found";
    }else {
      return $item_compliments;
    }   
}

sub get_item_id {
    my ($item_code) = @_;
    my $sql = "select item_id from T_ItemIndex where item_code like  \'$item_code%\' ";
    my $qh = $db_exec->prepare ($sql);
    $qh->execute();
    my $item_id  = $qh->fetchrow_array();
    return $item_id;
}

sub get_item_code_by_id {
    my ($item_id) = @_;
    my $sql = "select item_code from t_itemindex where item_id=\'$item_id%\' ";
    my $qh = $db_exec->prepare ($sql);
    $qh->execute();
    my $item_code  = $qh->fetchrow_array();
    return $item_code;
}

sub update_item_desc_by_id {
    my ($item_id, $desc) = @_;
    my @errors;
   eval { 
    my $sql = "update t_itemdetail set remark = \'$desc\' where item_id = \'$item_id\' ";
    my $qh = $db_exec->prepare($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   }; 
    if ($@) {
      push (@errors, "$@"); 
      return  ('FAIL', @errors);
   }else{
      return ('PASS');
   }
}

sub add_ing_to_db {
   my ( $ing ) = @_;
   eval { 
    my $sql = "insert into t_ingridients ( ingridient_name ) values (\'$ing\')";
    my $qh = $db_exec->prepare($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   }; 
    if ($@) {
      push (@errors, "$@"); 
      return  ('FAIL', @errors);
   }else{
      return ('PASS');
   }
   
   
   
    
}

sub update_item_compliment_by_id {
    my ($item_id, $compliment) = @_;
    my @errors;
   eval { 
    my $sql = "update t_itemdetail set compliments = \'$compliment\' where item_id = \'$item_id\' ";
    my $qh = $db_exec->prepare($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
    $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   }; 
    if ($@) {
      push (@errors, "$@"); 
      return  ('FAIL', @errors);
   }else{
      return ('PASS');
   }
}



sub get_item_price_by_size {
   my ($item_id,$size_p) = @_;
   my $size ;
   if ($size_p =~ /S/){
      $size = "price_small";   
   }elsif ($size_p =~ /L/){
      $size = "price_large";   
   }else{
      $size = "price_medium";   
   }
   my $sql = "select $size from t_priceitem where item_id=\'$item_id\' ";
   my $qh = $db_exec->prepare ($sql);
   $qh->execute();
   my $item_price =  sprintf("%.3f", $qh->fetchrow_array());
   return $item_price;
}



sub get_user_name_by_id{
   my ($uid) = @_;   
   my $sql = "SELECT user_name FROM user_info WHERE uid=?;";
   my $qh = $db_exec->prepare ($sql);
   $qh->execute($uid);
   my $user_name  = $qh->fetchrow_array();
   return $user_name;
}






sub register_order_transacton {
   my (%order_info) = @_;
   my @errors;
   
   eval {
         my $sql = "insert into t_orderinfo (order_id) values (\'$order_info{order_id}\')";
         my $qh = $db_exec->prepare($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $qh->execute() or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
   
         $db_exec->do("insert into t_toppings (order_id,item_id) values ( \'$order_info{order_id}\' , \'$order_info{item_id}\')")
                              or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
                              
         $sql = "SELECT topping_id from t_toppings WHERE order_id=?;";
         
         $qh = $db_exec->prepare($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         
         $qh->execute($order_info{order_id}) or push (@errors, '<br>' . "* $sql *" . $qh->errstr. '<br>' );
         
         my $topping_id = $qh->fetchrow_array();
         my %ing_id_hash = %{$order_info{ingridients_id}};
         foreach my $ing_id (keys (%ing_id_hash)){
            my $sql = "insert into t_toppingmap values ( \'$topping_id\',\'$ing_id\',\'$ing_id_hash{$ing_id}\')";
            $db_exec->do($sql);
         }
         $sql = "
                  update t_orderinfo set
                        uid =          \'$order_info{user_id}\' ,
                        item_id =      \'$order_info{item_id}\' ,
                        session_id =   \'$order_info{sid}\',
                        price =        \'$order_info{item_price}\',
                        o_date =       \'$order_info{o_date}\',
                        d_date =       \'$order_info{o_date}\',
                        size =         \'$order_info{size}\',
                        topping_id =   \'$topping_id\',
                        package_id =   \'$topping_id\'
                    where
                        order_id =   \'$order_info{order_id}\'       
                ";
         $db_exec->do($sql) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' );
         $db_exec->commit(  ) or push (@errors, '<br>' . "* $sql *" . $db_exec->errstr. '<br>' ); 
    };
   if ($@) {
      push (@errors, "$@"); 
      eval { $db_exec->rollback(  ) };
      push (@errors, "$@"); 
      return  ('FAIL', @errors);
   }else{
      return ( 'PASS' , $order_info{order_id} );
   }
   
}

sub modify_order_existing_in_db{
      my (%order_info) = @_;
      my @errors;
      my $topping_id = $order_info{topping_id};
      my $oid = $order_info{oid};
      my %ing_id_hash = %{$order_info{ingridients_id}};
      my ( $sql,$qh);
   eval { 
      foreach my $ing_id (keys (%ing_id_hash)){
            $sql = "insert into t_toppingmap values ( \'$topping_id\',\'$ing_id\',\'$ing_id_hash{$ing_id}\')";
            $qh = $db_exec->prepare($sql);
            $qh->execute();
      }
      $sql = "
                  update t_orderinfo set
                        price =        \'$order_info{item_price}\',
                        size =         \'$order_info{size}\'
                    where
                        order_id =   \'$order_info{oid}\'       
                ";
      $qh = $db_exec->prepare($sql);
      $qh->execute();
   };   
   if ( $@ ) {
      return 0;
   } else {
      return 1;
   }
}



sub get_order_info_from_db_oid{
      my ($oid) = @_;
      my %order_info;
      my $sql = "select  uid, item_id , session_id , price , size  from t_orderinfo where order_id=\'$oid\' ";
      $qh = $db_exec->prepare ($sql);
      $qh->execute();
      (
            $order_info{user_id} ,$order_info{item_id}, $order_info{sid},
            $order_info{item_price}, $order_info{size}
       )  =  $qh->fetchrow_array();
      my %order_info_oid = get_order_details_by_oid ($oid);
      my @ings = keys ( %{$order_info_oid{ingridient_info}} );
   
      foreach my $ing (@ings){ 
         my $ing_id = get_ing_id_by_name ("$ing");
         $order_info{ingridients_id}{$ing_id} = $order_info_oid{ingridient_info}{$ing};
      }
      return %order_info;
}

sub is_order_exist {
   my ($oid) = @_;
   my $sql = "select count(*) from t_orderinfo where order_id=\'$oid\'";
   $qh = $db_exec->prepare ($sql);
   $qh->execute();
   my $ret = $qh->fetchrow_array();
   return $ret;
}


sub get_numberof_item_ordered_by_sid {
   my ($sid) = @_;
   my $sql = "select order_id from t_orderinfo where session_id=\'$sid\'";
   my $qh = $db_exec->prepare($sql);
   $qh->execute();
   my @order_ids ;
   while (my $order_id  = $qh->fetchrow_array()){
         push (@order_ids, $order_id);
      }
   return @order_ids;
}

sub get_item_name_by_oid {
   my ($oid) = @_;
   my $sql = "select item_id from t_orderinfo where order_id=\'$oid\' ";
   my $qh = $db_exec->prepare($sql);
   $qh->execute();
   my $item_id  = $qh->fetchrow_array();
   $sql = "select disp_name from t_itemdetail where item_id=\'$item_id\' ";
   $qh = $db_exec->prepare($sql);
   $qh->execute();
   my $disp_name  = $qh->fetchrow_array();
   return $disp_name;
}

sub get_item_id_by_oid {
   my ($oid) = @_;
   my $sql = "select item_id from t_orderinfo where order_id=\'$oid\' ";
   my $qh = $db_exec->prepare($sql);
   $qh->execute();
   my $item_id  = $qh->fetchrow_array();
   return $item_id;    
}

sub get_topping_id_by_oid {
   my ($oid) = @_;
   my $sql = "select topping_id from t_orderinfo where order_id=\'$oid\' ";
   my $qh = $db_exec->prepare($sql);
   $qh->execute();
   my $topping_id  = $qh->fetchrow_array();
   return $topping_id;    
}

sub delete_all_topping_map_by_topping_id {
   my ($topping_id) = @_;
   my $sql = "DELETE FROM t_toppingmap WHERE topping_id=\'$topping_id\' ";
   my $qh = $db_exec->prepare($sql);
   $qh->execute();
   my $ret = is_topping_id_exist ($topping_id );
   return $ret;
}





sub is_topping_id_exist {
   my ($topping_id) = @_;
   my $sql = "select count(*) from t_toppingmap where topping_id=\'$topping_id\' ";
   $qh = $db_exec->prepare ($sql);
   $qh->execute();
   my $ret = $qh->fetchrow_array();
   return $ret;
}



sub get_sid_by_oid {
   my ($oid) = @_; 
   my $sql = "select session_id from t_orderinfo where order_id=\'$oid\' ";
   my $qh = $db_exec->prepare($sql);
   $qh->execute();
   my $sid  = $qh->fetchrow_array();
   return $sid;
}

sub delete_order_made_by_oid {
   my ($oid) = @_;
   my $sid = get_sid_by_oid ( $oid );
   $sid = 'CANC_' . $sid . '_CANC';
   my ( $sql ,$qh);
   eval {
      $sql = "update t_orderinfo set session_id=\'$sid\' where order_id=\'$oid\' ";
      $qh = $db_exec->prepare($sql);
      $qh->execute();
   };
   if ($@){
      return 0;   
   }else {
      return 1;  
   }
}

sub get_order_details_by_oid{
   my ($oid) = @_;
   my $sql = "select item_id, price, o_date , size , topping_id  from t_orderinfo where order_id=\'$oid\' ";
   my $qh = $db_exec->prepare($sql);   
   $qh->execute();
   my %order_info;
   $qh->bind_columns(\$order_info{item_id},\$order_info{price},\$order_info{o_date},\$order_info{size},\$order_info{topping_id});
   $qh->fetch();
   $sql = "select ing_id, ing_qty from t_toppingmap where topping_id=\'$order_info{topping_id}\' ";
   $qh = $db_exec->prepare($sql);
   $qh->execute();
   my @row ;
   while (@row = $qh->fetchrow_array){
      my ($ing_id,$ing_qty) = @row ;
      $sql = "select ingridient_name from t_ingridients where id=\'$ing_id\'";
      my $qh1 = $db_exec->prepare($sql);
      $qh1->execute();
      my $ingridient_name  = $qh1->fetchrow_array();
      $order_info{ingridient_info}{$ingridient_name} = $ing_qty;
   }
   $order_info{item_name} = get_item_name_by_oid ($oid);
   delete $order_info{item_id} ;
   delete $order_info{topping_id};
   return %order_info;
}

sub get_forder_details_by_oid{
      my ($oid) = @_;
      my %order_info = get_order_details_by_oid  ($oid);
      my %ret_order_info;
      $ret_order_info{'ITEM Price'} = $order_info{price};
      $ret_order_info{'ITEM NAME'} =  $order_info{item_name};
      $ret_order_info{'ORDER Date'} = $order_info{o_date};
      $ret_order_info{'SIZE'}    =    $order_info{size};
      %{$ret_order_info{'INGRIDIENTS'}} = %{$order_info{ingridient_info}};
      return %ret_order_info;

}

sub get_item_image_by_oid {
   my ($oid) = @_;
   my $sql = "select item_id from t_orderinfo where order_id=\'$oid\' ";
   my $qh = $db_exec->prepare($sql);
   $qh->execute();
   my $item_id  = $qh->fetchrow_array();
   $sql = "select image from t_itemdetail where item_id=\'$item_id\' ";
   $qh = $db_exec->prepare($sql);
   $qh->execute();
   my $image  = $qh->fetchrow_array();
   return $image ;
}

sub get_Ocount_by_sid {
      my ($sid) = @_;
      my $sql = "SELECT count(*) FROM t_orderinfo WHERE session_id=?;";
      my $qh = $db_exec->prepare ($sql);
      $qh->execute($sid);
      my $o_count  = $qh->fetchrow_array();
      return $o_count ;
}

1
;