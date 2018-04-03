package lib::html_Templet;
require(Exporter);
use warnings;
use strict;
our @ISA = qw(Exporter);
our @EXPORT    = qw (
                      $sudo_admin_create_form
                      $sudo_admin_depromote_form
                      $admin_create_form
                    );


our $sudo_admin_create_form=<<H1;

<div id="new_sudo_admin_create">
<form id="new_sudo_admin_create_form">
<table id="test_case_add" border="4px" cellpadding="10px"  align="center" style="margin-left:25%;width:60%;background-color:#F4F8F8;">
      <tr>
	  <td colspan="2" align="center" style="background-color:#81F7BE;">
	     <b> Sudo Admin Create </b>
	    <a href="#" style="float:right" onclick="javascript:close_this_window ( 'new_sudo_admin_create');return false;">
	      <img src="/static/images/My-Comm/closebutton.png" height="50" width="50">
	    </a>
	  </td>
      </tr>          
      <tr>
	  <td  style="
                                                   margin-left:5x;
                                                   margin-right:5px;
                                                   border-color:green;
                                                   border-width:5px;
                                                   background:#FBB917;
                                                   font-family:Arial, Helvetica, sans-serif;
                                                   font-size: large;
                                                   color:white; 
                      "  
	    >
	     <b> Enter Uname  </b>
	    </td>
	    <td>
	         <input type="text" value="" id="uname" name="uname" size="60">
	    </td>
      </tr>
      <tr>
	  <td colspan="2" align="center">
	   <button class="btn btn-large btn-primary" onclick="javascript:register_sudo_admin();return false;"> Create Sudo Admin </button>
           <br> <font color="red">*Password will be same as your logging as flat member</font>
	  </td>
	</tr> 
    </table>
    <br><br>
    </form>
    <br>
    <div id="new_sudo_admin_create_msg">  </div>
</div>

H1

our $sudo_admin_depromote_form=<<H2;

<div id="sudo_admin_depromote">
<form id="sudo_admin_depromote_form">
<table id="test_case_add" border="4px" cellpadding="10px"  align="center" style="margin-left:25%;width:60%;background-color:#F4F8F8;">
      <tr>
	  <td colspan="2" align="center" style="background-color:#81F7BE;">
	     <b> Sudo Admin Depromote</b>
	    <a href="#" style="float:right" onclick="javascript:close_this_window ( 'sudo_admin_depromote');return false;">
	      <img src="/static/images/My-Comm/closebutton.png" height="50" width="50">
	    </a>
	  </td>
      </tr>          
      <tr>
	  <td  style="
                                                   margin-left:5x;
                                                   margin-right:5px;
                                                   border-color:green;
                                                   border-width:5px;
                                                   background:#FBB917;
                                                   font-family:Arial, Helvetica, sans-serif;
                                                   font-size: large;
                                                   color:white; 
                      "  
	    >
	     <b> Enter Uname  </b>
	    </td>
	    <td>
	         <input type="text" value="" id="uname" name="uname" size="60">
	    </td>
      </tr>
      <tr>
	  <td colspan="2" align="center">
	   <button class="btn btn-large btn-primary" onclick="javascript:depromote_sudo_admin();return false;"> Depromote Sudo Admin </button>
	  </td>
	</tr> 
    </table>
    <br><br>
    </form>
    <br>
    <div id="sudo_admin_depromote_msg">  </div>
</div>

H2


our $admin_create_form=<<H3;

<div id="admin_create">
<form id="admin_create_form">
<table id="test_case_add" border="4px" cellpadding="10px"  align="center" style="margin-left:25%;width:60%;background-color:#F4F8F8;">
      <tr>
	  <td colspan="2" align="center" style="background-color:#81F7BE;">
	     <b> Admin Create </b>
	    <a href="#" style="float:right" onclick="javascript:close_this_window ( 'admin_create');return false;">
	      <img src="/static/images/My-Comm/closebutton.png" height="50" width="50">
	    </a>
	  </td>
      </tr>          
      <tr>
	  <td  style="
                                                   margin-left:5x;
                                                   margin-right:5px;
                                                   border-color:green;
                                                   border-width:5px;
                                                   background:#FBB917;
                                                   font-family:Arial, Helvetica, sans-serif;
                                                   font-size: large;
                                                   color:white; 
                      "  
	    >
	     <b> *Enter Uname  </b>
	    </td>
	    <td>
	         <input type="text" value="" id="uname" name="uname" size="60">
	    </td>
      </tr>
      <tr>
	  <td  style="
                                                   margin-left:5x;
                                                   margin-right:5px;
                                                   border-color:green;
                                                   border-width:5px;
                                                   background:#FBB917;
                                                   font-family:Arial, Helvetica, sans-serif;
                                                   font-size: large;
                                                   color:white; 
                      "  
	    >
	     <b> *Enter First name  </b>
	    </td>
	    <td>
	         <input type="text" value="" id="fname" name="fname" size="60">
	    </td>
      </tr>
      <tr>
	  <td  style="
                                                   margin-left:5x;
                                                   margin-right:5px;
                                                   border-color:green;
                                                   border-width:5px;
                                                   background:#FBB917;
                                                   font-family:Arial, Helvetica, sans-serif;
                                                   font-size: large;
                                                   color:white; 
                      "  
	    >
	     <b>*Enter Last Name </b>
	    </td>
	    <td>
	         <input type="text" value="" id="lname" name="lname" size="60">
	    </td>
      </tr>
      <tr>
	  <td  style="
                                                   margin-left:5x;
                                                   margin-right:5px;
                                                   border-color:green;
                                                   border-width:5px;
                                                   background:#FBB917;
                                                   font-family:Arial, Helvetica, sans-serif;
                                                   font-size: large;
                                                   color:white; 
                      "  
	    >
	     <b> *Enter Mobile Number  </b>
	    </td>
	    <td>
	         <input type="text" value="" id="mobile" name="mobile" size="60">
	    </td>
      </tr>
      <tr>
	  <td  style="
                                                   margin-left:5x;
                                                   margin-right:5px;
                                                   border-color:green;
                                                   border-width:5px;
                                                   background:#FBB917;
                                                   font-family:Arial, Helvetica, sans-serif;
                                                   font-size: large;
                                                   color:white; 
                      "  
	    >
	     <b> *Enter Email id  </b>
	    </td>
	    <td>
	         <input type="text" value="" id="email" name="email" size="60">
	    </td>
      </tr>
      <tr>
	  <td  style="
                                                   margin-left:5x;
                                                   margin-right:5px;
                                                   border-color:green;
                                                   border-width:5px;
                                                   background:#FBB917;
                                                   font-family:Arial, Helvetica, sans-serif;
                                                   font-size: large;
                                                   color:white; 
                      "  
	    >
	     <b> *Enter Password  </b>
	    </td>
	    <td>
	         <input type="password" value="" id="passwd1" name="passwd1" size="60">
	    </td>
      </tr>
      <tr>
	  <td  style="
                                                   margin-left:5x;
                                                   margin-right:5px;
                                                   border-color:green;
                                                   border-width:5px;
                                                   background:#FBB917;
                                                   font-family:Arial, Helvetica, sans-serif;
                                                   font-size: large;
                                                   color:white; 
                      "  
	    >
	     <b> *Repeat Password  </b>
	    </td>
	    <td>
	         <input type="password" value="" id="passwd2" name="passwd2" size="60">
	    </td>
      </tr>
      <tr>
	  <td colspan="2" align="center">
	   <button class="btn btn-large btn-primary" onclick="javascript:register_admin();return false;"> Submit </button>
	  </td>
	</tr> 
    </table>
    <br><br>
    </form>
    <br>
    
    <font color="red" > *All the fields are mandatory</font>
    <br>
    <div id="new_sudo_admin_create_msg">  </div>
</div>

H3






1
;
