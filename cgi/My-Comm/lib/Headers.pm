package lib::Headers;
require(Exporter);
use warnings;
use strict;
our @ISA = qw(Exporter);
our @EXPORT    = qw (
                      $MainPageHeader
                      $HtmlEditorHeader
                      $MailEditor
                    );

our $MainPageHeader = {
                        -title => 'My Community',
                        -style=>[ 
                                       { -type =>'text/css', -src=>'/static/styles/My-Comm/body.css'},
                                       { -type =>'text/css', -src=>'/static/styles/NestDrop/bootstrap.min.css'}, 
                                       { -type =>'text/css', -src=>'/static/styles/My-Comm/bootstrap-responsive.css'},
                                        { -type =>'text/css', -src=>'/static/styles/NestDrop/jquery.smartmenus.bootstrap.css'},                                        
                                       { -type =>'text/css', -src=>'/static/styles/My-Comm/jquery-ui-1.8.18.custom.css'},
                                       { -type =>'text/css', -src=>'/static/styles/My-Comm/ddsmoothmenu.css'},
                                       { -type =>'text/css', -src=>'/static/styles/My-Comm/ddsmoothmenu-v.css'},
                                       { -type =>'text/css', -src=>'/static/styles/My-Comm/font-awesome.min.css'}, 
                                    ],  
                         -script=>[
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/jquery.min.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/jquery-1.3.2.min.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/jquery.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/jquery.ui.core.js' },
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/jquery-ui-1.8.18.custom.min.js' },
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/advanced.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/ddsmoothmenu.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/vertical_menu.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/pre_logout.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/admin.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/dispatch.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/bootstrap.js'},
                                        { -type => 'text/javascript', -src => '/static/js/NestDrop/jquery.smartmenus.bootstrap.min.js'},
                                        { -type => 'text/javascript', -src => '/static/js/NestDrop/jquery.smartmenus.bootstrap.js'},
                                        { -type => 'text/javascript', -src => '/static/js/NestDrop/jquery.smartmenus.js'},
                                       
                                        
                                      
                                     
                                     ],
                    };
      
our $HtmlEditorHeader = {
                        -title => 'My Community',
                        -style=>[ 
                                       
                                       { -type =>'text/css', -src=>'/static/styles/My-Comm/stylesheet.css'},
                                       { -type =>'text/css', -src=>'/static/styles/My-Comm/editor.css'},
                                       { -type =>'text/css', -src=>'/static/styles/My-Comm/reset-min.css'},
                                    ],  
                         -script=>[                      
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/jquery-1.3.2.min.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/jquery.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/advanced.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/wysihtml5-0.3.0.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/vertical_menu.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/pre_logout.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/admin.js'},
                                     ],
                    };

our $MailEditor = {
                        -title => 'My Community',
                        -style=>[ 
                                       
                                       { -type =>'text/css', -src=>'/static/styles/My-Comm/jquery-ui-1.8.18.custom.css'},
                                       { -type =>'text/css', -src=>'/static/styles/My-Comm/uEditor.css'},
                                       { -type =>'text/css', -src=>'/static/styles/My-Comm/uEditorContent.css'},
                                      
                                       
                                    ],  
                         -script=>[
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/admin.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/jquery.min.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/jquery-1.3.2.min.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/jquery.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/jquery.ui.core.js' },
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/jquery-ui-1.8.18.custom.min.js' },
                                        { -type => 'text/javascript', -src => '/static/js/My-Comm/uEditor.js' },
                                       
                                     
                                     ],
                    };
                       

















1
;


                                       
                                       
                                       
                                        