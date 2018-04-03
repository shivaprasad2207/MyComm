
function logout( sid ){
    var xmlhttp;
    var url = '/cgi-bin/My-Comm/logout.pl?term=' + sid  + '&flag=' + 'logout';
    
    if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp=new XMLHttpRequest();
    }else{// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open("GET",url,false);
    xmlhttp.send();
    var ret = xmlhttp.responseText;
    window.location = '/cgi-bin/My-Comm/login.pl?status=logout';
}

function get_neighour_buttons ( ){
         $("#disp").html('<img src="/static/images/My-Comm/1.gif" width="35" height="35"   />');
         var form_params = $("#search_form").serialize();
         form_params = form_params + '&flag=GET_BLK_FLOOR_INFO';
         var url = '/cgi-bin/My-Comm/core.pl?'+ form_params;
         $.get(
            url,
            function(data, textStatus, jqXHR) {
				$("#disp").html(data);
			    
                        },
            "text"
        );    
}


function add_to_tolist_by_click  (){
    var uname = document.getElementById('uname').value;
    var to = document.getElementById('to').value;
    if (to != ''){
	to = to + ',' +  uname;	
	$("#to").html(to);
	document.getElementById('uname').value = '';
	
    }else{
	$("#to").html(uname);
	document.getElementById('uname').value = '';
	//document.getElementById("to").innerHTML = uname;
    }
    
}


function show_profile_by_click (){
    var uname = document.getElementById('uname').value;
    show_profile_by_uname (uname);
}

function show_profile_by_uname ( uname){
    
    var url = '/cgi-bin/My-Comm/core.pl?flag=' + 'GET_PROFILE_BY_UNAME&' + 'uname=' + uname;   
    var tag = $('<div  id="local_dialog_box" style="overflow:scroll"> </div>');
    var title = '<b style="\
                                                    background-image:url(/static/images/My-Comm/oinfo_title_bar.png); \
                                                    height:15px; width:200px; color:white;padding:0px"> Profile</b>' ;
     $.ajax({
            url : url,
            type: 'GET',
            async: true,
            dataType: "html",
            context: document.body,
            processData:true,
            cache:false,
            global:true,
            traditional:true,
            success:function(data, textStatus, jqXHR) {
                       tag.html(data).dialog({
                                modal: true,
                                title: title,
                                
                                open: function(event, ui) {  
                                        $('.ui-dialog-titlebar-close')
                                        .removeClass("ui-dialog-titlebar-close")
                                        .html('<img src="/static/images/My-Comm/closebutton.png" width="25" height="25" style="padding:1px;float:right">');
                                        $('.ui-widget-overlay').css('width','100%');
                                },  
				width: 1200,
                                height: 900,              
                                close: function(event, ui){
                                                    $('body').css('overflow','auto');
                                       } 
                               
                              }).dialog('open');                
	 }
    
       }); 
   }
   
function get_mail_content (sender_uname){
    
    $("#disp").html('<img src="/static/images/My-Comm/1.gif" width="35" height="35"    />');
    var text = document.getElementById( 'msg_text').value;
    var subject = document.getElementById( 'subject').value;
    var recipient = document.getElementById( 'to').value;
    var param = '&msg_txt=' + text + '&subject=' + subject + '&recipient=' + recipient + '&from=' + sender_uname;
    var url = '/cgi-bin/My-Comm/core.pl?flag=' + 'GET_MSG_DATA' + param; 
    $.get(
            url,
            function(data, textStatus, jqXHR) {
				
			        document.getElementById( 'msg_text').value = "";
                                document.getElementById( 'subject').value = "";
                                document.getElementById( 'to').value ="";
                                $("#disp").html(data);
                        },
            "text"
        );    
}

function get_msg_in_dialog_box ( msg_id, uname){ 
    var url = '/cgi-bin/My-Comm/core.pl?flag=' + 'SHOW_SELECT_SEARCH_MSG&' + 'uname=' + uname + '&msg_id=' + msg_id ;   
    var tag = $('<div  id="local_dialog_box" style="overflow:scroll"> </div>');
    document.getElementById(msg_id).src= "/static/images/My-Comm/green.jpg" ;
    
    var title = '<b style="\
                                                    background-image:url(/static/images/My-Comm/oinfo_title_bar.png); \
                                                    height:15px;width:200px; color:white;padding:0px">Message</b>' ;
     $.ajax({
            url : url,
            type: 'GET',
            async: true,
            dataType: "html",
            context: document.body,
            processData:true,
            cache:false,
            global:true,
            traditional:true,
            success:function(data, textStatus, jqXHR) {
                       tag.html(data).dialog({
                                modal: true,
                                title: title,
                                
                                open: function(event, ui) {  
                                        $('.ui-dialog-titlebar-close')
                                        .removeClass("ui-dialog-titlebar-close")
                                        .html('<img src="/static/images/My-Comm/closebutton.png" width="25" height="25" style="padding:1px;float:right">');
                                        $('.ui-widget-overlay').css('width','100%');
                                },  
				width: 1200,
                                height: 700,              
                                close: function(event, ui){
                                                    $('body').css('overflow','auto');
                                                     
                                       } 
                               
                              }).dialog('open');                
	 }
    
       }); 
}

function get_sent_msg_in_dialog_box ( msg_id, uname){ 
    var url = '/cgi-bin/My-Comm/core.pl?flag=' + 'SHOW_SENT_MSG&' + 'uname=' + uname + '&msg_id=' + msg_id ;   
    var tag = $('<div  id="local_dialog_box" style="overflow:scroll"> </div>');
    var title = '<b style="\
                                                    background-image:url(/static/images/My-Comm/oinfo_title_bar.png); \
                                                    height:15px;width:200px; color:white;padding:0px">  Message </b>' ;
     $.ajax({
            url : url,
            type: 'GET',
            async: true,
            dataType: "html",
            context: document.body,
            processData:true,
            cache:false,
            global:true,
            traditional:true,
            success:function(data, textStatus, jqXHR) {
                       tag.html(data).dialog({
                                modal: true,
                                title: title,
                                
                                open: function(event, ui) {  
                                        $('.ui-dialog-titlebar-close')
                                        .removeClass("ui-dialog-titlebar-close")
                                        .html('<img src="/static/images/My-Comm/closebutton.png" width="25" height="25" style="padding:1px;float:right">');
                                        $('.ui-widget-overlay').css('width','100%');
                                },  
				width: 1000,
                                height: 700,              
                                close: function(event, ui){
                                                    $('body').css('overflow','auto');
                                                     
                                       } 
                               
                              }).dialog('open');                
	 }
    
       }); 
}







function get_search_msg_in_dialog_box (  msg_id, uname ){ 
    var url = '/cgi-bin/My-Comm/core.pl?flag=' + 'SHOW_SELECT_SEARCH_MSG&' + 'uname=' + uname + '&msg_id=' + msg_id ;   
    var tag = $('<div  id="local_dialog_box" style="overflow:scroll"> </div>');
    var title = '<b style="\
                                                    background-image:url(/static/images/My-Comm/oinfo_title_bar.png); \
                                                    height:15px;width:200px; color:white;padding:0px">Message</b>' ;
     $.ajax({
            url : url,
            type: 'GET',
            async: true,
            dataType: "html",
            context: document.body,
            processData:true,
            cache:false,
            global:true,
            traditional:true,
            success:function(data, textStatus, jqXHR) {
                       tag.html(data).dialog({
                                modal: true,
                                title: title,
                                
                                open: function(event, ui) {  
                                        $('.ui-dialog-titlebar-close')
                                        .removeClass("ui-dialog-titlebar-close")
                                        .html('<img src="/static/images/My-Comm/closebutton.png" width="25" height="25" style="padding:1px;float:right">');
                                        $('.ui-widget-overlay').css('width','100%');
                                },  
				width: 1200,
                                height: 700,              
                                close: function(event, ui){
                                                    $('body').css('overflow','auto');
                                                     
                                       } 
                               
                              }).dialog('open');                
	 }
    
       }); 
}

function delete_marked_msg (uname){
        $("#disp").html('<img src="/static/images/My-Comm/1.gif" width="35" height="35"   />');
        var id = document.getElementsByClassName('my_check_box')[0].id;
        var arr = document.getElementsByClassName("my_check_box");
        var length = arr.length;
        var checks = new Array();
        var j = 0;
        for (var i = 0 ; i < length ; i++){
         if ( arr[i].checked ){
            checks[j] = arr[i].id;
            j++; 
         }
        }
        var checked = checks.join(':');  
        var url = '/cgi-bin/My-Comm/core.pl?flag=' + 'DEL_MSG_MARKED&' + 'msg_ids=' + checked + '&uname=' + uname; 
        $.get(
            url,
            function(data, textStatus, jqXHR) {
                                window.location='index.pl?AppParam=ShowInBox';
                        },
            "text"
        );            
}

function delete_marked_sent_msg (uname){
         $("#disp").html('<img src="/static/images/My-Comm/1.gif" width="35" height="35"   />');
        var id = document.getElementsByClassName('my_check_box')[0].id;
        var arr = document.getElementsByClassName("my_check_box");
        var length = arr.length;
        var checks = new Array();
        var j = 0;
        for (var i = 0 ; i < length ; i++){
         if ( arr[i].checked ){
            checks[j] = arr[i].id;
            j++; 
         }
        }
        var checked = checks.join(':');  
        var url = '/cgi-bin/My-Comm/core.pl?flag=' + 'DEL_SENT_MSG_MARKED&' + 'msg_ids=' + checked + '&uname=' + uname; 
        $.get(
            url,
            function(data, textStatus, jqXHR) {
                                window.location='index.pl?AppParam=SentMessage';
                        },
            "text"
        );            
}