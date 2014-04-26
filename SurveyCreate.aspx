<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SurveyCreate.aspx.cs" Inherits="SurveyCreate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="IE=11.0000" http-equiv="X-UA-Compatible"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="language" content="en"/>             <!--======== CSS FRAMEWORK ========-->
    <link href="static/css/print.css" rel="stylesheet" type="text/css" media="print"/>
    <!--[if lt IE 8]>
    <link rel="stylesheet" type="text/css" href="/mySurvey/mySurvey_app/static/css/ie.css" media="screen, projection" />
    <![endif]-->
    <link href="static/css/main.css" rel="stylesheet" type="text/css"/>

    <script src="static/js/jquery.min.js" type="text/javascript"></script>
    <!--<script type="text/javascript" src="/mySurvey/mySurvey_app/static/js/jquery.min.js"></script>-->
    <title>MySurvey - Create Survey</title>
    <meta name="GENERATOR" content="MSHTML 11.00.9600.17041"/>
</head>	 <!--======== LAYOUT MODEL FOR INTERIOR PAGES ========-->

<body>
    <!--======== PAGE ========-->
    <div class="container" id="page">
        <!--======== HEADER ========-->
        <div id="header">
            <div class="content-area">
                <a href="http://localhost:8089/mySurvey/mySurvey_app/survey">
                    <div id="logo-container"><img id="headerLogo" src="static/img/logo-white.png"></div>
                </a>

                <div id="logout">
                    samueltango@gmail.com<a href="http://localhost:8089/mySurvey/mySurvey_app/logout">Logout</a>
                </div><!-- logout -->
            </div>
        </div><!-- header -->
        <!--======== MENU + MAIN CONTENT AREA ========-->
        <div class="content-area">
            <!--======== MENU ========-->
            <div id="mainmenu">
                <ul id="yw0">
                    <li>
                        <a href="http://localhost:8089/mySurvey/mySurvey_app/survey">Surveys</a>
                    </li>
                    <li>
                        <a href="http://localhost:8089/mySurvey/mySurvey_app/site/reports">Reports</a>
                    </li>
                    <li>
                        <a href="http://localhost:8089/mySurvey/mySurvey_app/site/settings">
                            Account
                            Settings
                        </a>
                    </li>
                </ul>
            </div><!-- mainmenu -->				 <!--======== BREADCRUMBS ========-->
            <!-- breadcrumbs -->                				 <!--======== CONTENT: Pulls in .php views from Site & Survey ========-->

            <div id="content">
                <!--======== CREATE SURVEY ========-->
                <div class="stripe">
                    <div class="page-name">
                        <h1>Create Survey</h1>
                        <p class="intro-text instructions">
                            <span>1</span> Enter the title of the survey
                            below. <span class="two">2</span> Use the Survey Editor to add
                            questions.
                        </p>
                    </div>
                </div>
                <div class="content-width">
                    <div class="form" id="create-survey-form">
                        <!-- action="/mySurvey/mySurvey_app/survey/create" method="post"-->
                        <form id="surveyform" runat="server" >
                            
                            <p class="note">Fields with <span class="required">*</span> are required.</p>
                            <div class="row">
                                <label class="required" for="Survey_title">Title <span class="required">*</span></label>

                               <!--  <input name="Survey[title]" id="Survey_title" type="text" size="60" maxlength="100">-->
                                <asp:TextBox ID="Survey_title"  type="text" size="60" maxlength="100" runat="server"></asp:TextBox>
                                <span class="arrow-left"></span>
                            </div>
                            <div class="row buttons">
                                <!--input name="yt0" type="submit" value="Create"-->
                                <asp:Button ID="Create" runat="server" Text="Create" OnClick="Create_Click" />
                                <!--input onclick="window.location = '/mySurvey/mySurvey_app/survey';" type="button" value="Cancel"-->
                                <A ID="cancelcreate" class="button" runat="server" href="Homepage.aspx">Cancel</A>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connMySurvey %>" InsertCommand="INSERT INTO survey(title) VALUES (@newdata)" SelectCommand="SELECT * FROM [survey] " ProviderName="<%$ ConnectionStrings:connMySurvey.ProviderName %>">
                                    <InsertParameters>
                                        <asp:ControlParameter ControlID="Survey_title" Name="newdata" PropertyName="Text" />
                                    </InsertParameters>
                                </asp:SqlDataSource>
                               
                                <asp:HiddenField ID="url" runat="server" />
                                <asp:HiddenField ID="created" runat="server" />
                                <asp:HiddenField ID="survey_creator_ID" runat="server" />
                            </div>
                        </form>
                    </div><!-- form -->
                </div>
            </div><!-- content -->
        </div><!-- content-area -->        				<!--======== FOOTER ========-->

        <div id="footer">
            <p>
                <a href="http://localhost:8089/mySurvey/mySurvey_app/contact">
                    Contact
                    Us
                </a>
            </p>
        </div><!-- footer -->
    </div><!-- page -->
    <script src="static/js/jquery-ui.min.js"></script>
    <!--<script type="text/javascript" src="/mySurvey/mySurvey_app/static/js/jquery-ui.min.js"></script>-->

    <script src="static/js/functions.js" type="text/javascript"></script>
</body>
</html>