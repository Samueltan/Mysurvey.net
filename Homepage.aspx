<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Homepage.aspx.cs" Inherits="Homepage" %>

<!DOCTYPE html>

<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD><META content="IE=11.0000" 
http-equiv="X-UA-Compatible">
                
<META http-equiv="Content-Type" content="text/html; charset=utf-8">             
<META name="language" content="en">             <!--======== CSS FRAMEWORK ========--> 
    
<SCRIPT src="static/js/ui.js"></SCRIPT>
<SCRIPT src="static/js/jquery-ui.min.js"></SCRIPT>
<!--<script type="text/javascript" src="/mySurvey/mySurvey_app/static/js/jquery-ui.min.js"></script>-->	    
<SCRIPT src="static/js/functions.js" type="text/javascript"></SCRIPT>             
<SCRIPT src="static/js/jquery.confirm_on.js" type="text/javascript"></SCRIPT>
            <LINK href="static/css/print.css" rel="stylesheet" type="text/css" 
media="print">             <!--[if lt IE 8]>
            <link rel="stylesheet" type="text/css" href="/mySurvey/mySurvey_app/static/css/ie.css" media="screen, projection" />
            <![endif]--> 
            <LINK href="static/css/main.css" rel="stylesheet" type="text/css"> 
            
<SCRIPT src="static/js/jquery.min.js" type="text/javascript"></SCRIPT>
             <!--<script type="text/javascript" src="/mySurvey/mySurvey_app/static/js/jquery.min.js"></script>--> 
                        <LINK href="static/css/jquery.confirm_on.css" rel="stylesheet" 
type="text/css"> <TITLE>MySurvey</TITLE>     
<META name="GENERATOR" content="MSHTML 11.00.9600.17041"></HEAD>	 <!--======== LAYOUT MODEL FOR INTERIOR PAGES ========--> 
    
<BODY>
    <form id="form1" runat="server">
        <!--======== PAGE ========-->         
<div class="container" id="page"><!--======== HEADER ========-->                 
<div id="header">
<div class="content-area"><A href="Homepage.aspx">
<div id="logo-container"><IMG id="headerLogo" src="static/img/logo-white.png"></div></A> 
                                
<div id="logout">                                    Hello <%=Session["email"]%><A 
href='#' onclick="logout()">Logout</A>             
                    </div><!-- logout -->                         </div></div><!-- header -->
								 <!--======== MENU + MAIN CONTENT AREA ========-->                 
<div class="content-area"><!--======== MENU ========-->                         
<div id="mainmenu">
<UL id="yw0">
  <LI><A 
  href="Homepage.aspx">Surveys</A></LI>
  <LI><A 
  href="Report.aspx">Reports</A></LI>
  <LI><A 
  href="Account.aspx">Account 
  Settings</A></LI></UL></div><!-- mainmenu -->				 <!--======== BREADCRUMBS ========--> 
                                        <!-- breadcrumbs -->                				 <!--======== CONTENT: Pulls in .php views from Site & Survey ========--> 
                
<div id="content">
<SCRIPT type="text/javascript">

    $(function () {
        $('.delete-confirm').on('click', function (e) {
            e.preventDefault();
        })
        $('.delete-confirm').confirmOn('click', function (e, confirmed) {
            if (confirmed) window.location = $(e.target).attr('href');
        });
    });

    $(function () {
        $('.unpublish-confirm').on('click', function (e) {
            e.preventDefault();
        })
        $('.unpublish-confirm').confirmOn({ questionText: 'If you unpublish the survey and plan to publish it again, you will lose the current submissions. Do you still want to continue?' }, 'click', function (e, confirmed) {
            if (confirmed) window.location = $(e.target).attr('href');
        });
    });

</SCRIPT>

 <!--======== CREATE NEW SURVEY ========--> 
<div class="stripe">
<div class="page-name">
<H1>Surveys</H1>
<P class="intro-text">To get started, create a new survey. Or, manage your 
existing surveys below. </P>
<div id="new"><A class="button" href="SurveyCreate.aspx">Create 
New Survey</A>		 </div>        
    <br />
    </div></div>
<div class="content-width"><!--======== PUBLISHIED SURVEYS ========--> 
<div id="published" runat="server">
<H2>Published</H2>
<UL class="survey-lists" id="ulP" runat="server">
</UL>
</div><!--======== UNPUBLISHED SURVEYS ========--> 
<div id="unpublished" runat="server">
<H2>Unpublished</H2>
<UL class="survey-lists" id="ulUP" runat="server">
</UL></div></div></div><!-- content -->                     
    </div><!-- content-area -->        				<!--======== FOOTER ========-->       
<div id="footer">
<P><A href="ContactUs.htm">Contact 
Us</A></P></div><!-- footer --></div><!-- page -->
        <asp:SqlDataSource ID="DSSurvey" runat="server" ConnectionString="<%$ ConnectionStrings:connMySurvey %>" SelectCommand="SELECT [title] FROM [survey]" UpdateCommand="update survey set is_published=1-is_published where title = @title" DeleteCommand="Delete from survey where title = @title" ProviderName="<%$ ConnectionStrings:connMySurvey.ProviderName %>">
            <DeleteParameters>
                <asp:ControlParameter ControlID="HFSurveyTitle" Name="title" PropertyName="Value" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="HFSurveyTitle" Name="title" PropertyName="Value" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Button ID="btnUpdate" runat="server" Text="U" OnClick="btnUpdate_Click" style="display:none"/>
        <asp:Button ID="btnDelete" runat="server" Text="D" OnClick="btnDelete_Click" style="display:none"/>
        <asp:Button ID="btnEdit" runat="server" Text="E" OnClick="btnEdit_Click" style="display:none"/>
        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" style="display:none"/>
        <asp:HiddenField ID="HFSurveyTitle" runat="server" />
    </form>
    </BODY></HTML>