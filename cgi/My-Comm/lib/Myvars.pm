package Myvars;;
BEGIN{
   use Cwd;
   our $directory = cwd;
   require(Exporter);
};

use warnings;
use strict;
our @ISA = qw(Exporter);

our @EXPORT    = qw (
                      $H1
                      $H12
                      $H3
                      $H4
                      $H5
                      $H6
                      $footer
                   );
                   

our $H1 = '
         <br>
         
            <div class="hero-unit" style="margin-left:10%;margin-right:10%;margin-top:10px;height:100%">
            <img hight="150px" width="150px" src="/static/images/My-Blog/pl.jpg"  style="float:right"/>
            <br><br><img hight="150px" width="150px" src="/static/images/My-Blog/pr.png"  style="float:right"/>
            <br><br>         
         <p><b>welcome %NAME% </b></p>   
         <p>
            <button class="btn btn-small btn-primary" type="button">About</button>
            <a href="index.pl?AppParam=Settings" class="btn btn-small btn-success ">Settings</a>
            <a href="#" onclick="javascript:contact_admin(\'%NAME%\');return false;" class="btn btn-small btn-warning">Contact Admin</a>
            <a href="#" onclick="javascript:request_for_main_topic(\'%NAME%\');return false;" class="btn btn-small btn-info">Request for New Topic</a>
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <a href="#" class="btn btn-small btn-warning" onclick="javascript:logout(\'SID\' );return false;">Logout</a> 
            </p>
            <div class="hero-unit" id="sub1">
            <table cellspacing="20px" cellpadding="10px">
         ';
our $H12 = '
         <br>
            <div class="hero-unit" style="margin-left:10%;margin-right:10%;margin-top:10px;height:100%">
            <img hight="150px" width="150px" src="/static/images/My-Blog/pl.jpg"  style="float:right"/>
             <br><br><img hight="150px" width="150px" src="/static/images/My-Blog/pr.png"  style="float:right"/>
            <br><br>  
         <p><b>welcome %NAME% </b></p>   <div id="load"> </div> 
         <p>
            <a href="main_page.pl" class="btn btn-small btn-success ">Main</a>
            <a href="" class="btn btn-small btn-primary" onclick="javascript:request_new_sub_topic_form(\'%NAME%\',\'%MPID%\');return false;">Request For New Topic</a>
            <a href="#" onclick="javascript:contact_admin(\'%NAME%\');return false;" class="btn btn-small btn-warning">Contact Admin</a>
            <a href="" class="btn btn-small btn-info " onclick="javascript:my_subscription();return false;">My Subscriptions</a>  
            
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            
            
            <a href="#" class="btn btn-small btn-warning" onclick="javascript:logout(\'SID\' );return false;">Logout</a> 
            </p>
            <div id="tag"> </div>
            <div class="hero-unit" id="sub1">
            <table cellspacing="20px" cellpadding="10px">
         ';         
         
our $H3 = '
         <br>
         
            <div class="hero-unit" style="margin-left:10%;margin-right:10%;margin-top:10px;height:100%">
            <img hight="150px" width="150px" src="/static/images/My-Blog/pl.jpg"  style="float:right"/>
             <br><br><img hight="150px" width="150px" src="/static/images/My-Blog/pr.png"  style="float:right"/>
            <br><br>  
         <p><b>welcome %NAME% </b></p>   
         <p>
            <a href="main_page.pl" class="btn btn-small btn-success ">Main</a>
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <a href="#" class="btn btn-small btn-warning" onclick="javascript:logout(\'SID\' );return false;">Logout</a> 
            </p>
            <div class="hero-unit" id="sub1">
            <table cellspacing="20px" cellpadding="10px">
         ';
our $H4 = '
         <br>
            <div class="hero-unit" style="margin-left:10%;margin-right:10%;margin-top:10px;height:100%">
            <img hight="150px" width="150px" src="/static/images/My-Blog/pl.jpg"  style="float:right"/>
             <br><br><img hight="150px" width="150px" src="/static/images/My-Blog/pr.png"  style="float:right"/>
            <br><br>  
         <p><b>welcome %NAME% </b></p>   
         <p>
            <a href="main_page.pl" class="btn btn-small btn-success ">Main</a>
            <a href="index.pl?AppParam=MPID&mpid=%MPID%" class="btn btn-small btn-primary ">Sub Topic Page</a>
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <a href="#" class="btn btn-small btn-warning" onclick="javascript:logout(\'SID\' );return false;">Logout</a> 
            </p>
            <div class="hero-unit" id="sub1">
            <table cellspacing="20px" cellpadding="10px">
         ';

our $H5 = '
         <br>
            <div class="hero-unit" style="margin-left:10%;margin-right:10%;margin-top:10px;height:100%">
            <img hight="150px" width="150px" src="/static/images/My-Blog/pl.jpg"  style="float:right"/>
             <br><br><img hight="150px" width="150px" src="/static/images/My-Blog/pr.png"  style="float:right"/>
            <br><br>  
         <p><b>welcome %NAME% </b></p>   <div id="load"> </div> 
         <p>
            <a href="main_page.pl" class="btn btn-small btn-success ">Main</a>
            <a href="#" onclick="javascript:password_change_form( \'%uid%\' );return false;" class="btn btn-small btn-primary ">Password Change</a>
            <a href="#" onclick="javascript:email_change_form(\'%uid%\');return false;" class="btn btn-small btn-warning ">EMail Change</a>
            <a href="#" onclick="javascript:name_change_form(\'%uid%\');return false;" class="btn btn-small btn-info "> Name Change</a> 
            
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            
            
            <a href="#" class="btn btn-small btn-warning" onclick="javascript:logout(\'SID\' );return false;">Logout</a> 
            </p>
            <br><br>
            <div class="hero-unit" id="sub1"> 
               <p id="passwd_form_disp"> </p>
               <p id="email_form_disp"> </p>
               <p id="name_form_disp"> </p>
            </div>
            <table cellspacing="20px" cellpadding="10px">
         ';         
 
our $H6 = '
         <br>
         
            <div class="hero-unit" style="margin-left:10%;margin-right:10%;margin-top:10px;height:100%">
            <img hight="150px" width="150px" src="/static/images/My-Blog/pl.jpg"  style="float:right"/>
            <br><br><img hight="150px" width="150px" src="/static/images/My-Blog/pr.png"  style="float:right"/>
            <br><br>         
         <p><b>welcome %NAME% </b></p><br><br>[  ORGI  ] '   ;
         
         
         
our $H2 = '
            </table>
               </div>

               </div>
         ';


our $footer = '<div style="position:absoulute;top:1000px">
						<SMALL style="bottom:0px;float:inherit;color:#BC8F8F">
						      Web Site Copyright © FWAUS pvt Ltd All rights reserved.<br>
						      feedback on web site @ nnsprasad@gmail.com
						</SMALL>
          ';

1
;