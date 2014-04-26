<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SurveyEdit.aspx.cs" Inherits="SurveyEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <meta name="language" content="en" />

    <!--======== CSS FRAMEWORK ========-->
    <link rel="stylesheet" type="text/css" href="static/css/print.css" media="print" />
    <!--[if lt IE 8]>
    <link rel="stylesheet" type="text/css" href="/mySurvey/mySurvey_app/static/css/ie.css" media="screen, projection" />
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="static/css/main.css" />
    <script type="text/javascript" src="static/js//jquery.min.js"></script>
    <!--<script type="text/javascript" src="/mySurvey/mySurvey_app/static/js/jquery.min.js"></script>-->

    <script type="text/javascript" src="static/js/jquery.js"></script>
    <script type="text/javascript" src="static/js/jquery.yiiactiveform.js"></script>
    <script src="static/js/ui.js"></script>

    <title>MySurvey - Update Survey</title>
</head>

<!--======== LAYOUT MODEL FOR INTERIOR PAGES ========-->
<body style="">

    <!--======== PAGE ========-->
    <div class="container" id="page">

        <!--======== HEADER ========-->
        <div id="header">
            <div class="content-area">
                <a href="Homepage.aspx">
                    <div id="logo-container"><img id="headerLogo" src="static/img/logo-white.png" /></div>
                </a>
                <div id="logout">
                    Hello <%=Session["email"]%><a href='#' onclick="logout()">Logout</a>
                </div><!-- logout -->
            </div>
        </div><!-- header -->
        <!--======== MENU + MAIN CONTENT AREA ========-->
        <div class="content-area">


            <!--======== MENU ========-->
            <div id="mainmenu">
                <ul id="yw0">
                    <li><a href="http://localhost:8089/mySurvey/mySurvey_app/survey">Surveys</a></li>
                    <li><a href="http://localhost:8089/mySurvey/mySurvey_app/site/reports">Reports</a></li>
                    <li><a href="http://localhost:8089/mySurvey/mySurvey_app/site/settings">Account Settings</a></li>
                </ul>
            </div><!-- mainmenu -->
            <!--======== BREADCRUMBS ========-->
            <!-- breadcrumbs -->
            <!--======== CONTENT: Pulls in .php views from Site & Survey ========-->
            <div id="content">

                <!--======== EDIT SURVEY ========-->
                <div class="stripe">
                    <div class="page-name">
                        <h1>Survey Editor</h1>
                        <p class="intro-text">Edit your survey fields including Survey Title, Question information.</p>
                    </div>
                </div>
                <div class="content-width">
                    <div class="form">
<!--=======form=======-->
                         <form id="surveyform" runat="server">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                            <div id="xxx" runat="server"></div>
                            <div id="survey-form_es_" class="errorSummary" style="display:none">
                                <p>Please fix the following input errors:</p>
                                <ul><li>dummy</li></ul>
                            </div>  
                                          
                            <div class="row buttons" id="save-cancel">
                            &nbsp;<asp:Button ID="btnBackHome" runat="server" Text="Back to all Surveys" OnClick="btnBackHome_Click" />
                            </div>
                            <div class="row">
                                <label for="Survey_title" class="required">Title <span class="required">*</span></label>     
                                <asp:TextBox size="60" maxlength="100" class="title" name="Survey[title]" ID="Survey_title" runat="server"></asp:TextBox>   
                                                 
                                <span class="arrow-left"></span>
                                <div 0="successCssClass" 1="success" class="errorMessage" id="Survey_title_em_" style="display:none"></div>
                            </div>

                            <div id="survey-url">
                                <h3>Survey URL:</h3><a target="_blank" href="http://localhost:8089/mySurvey/mySurvey_app/survey/take/2I8kFt">/mySurvey/mySurvey_app/survey/take/2I8kFt</a>
                            </div>
                             
<!--======== questions template=======-->
                            <h4 id="question-title">Questions</h4>
                            <div id="divQ" class="sortable ui-sortable" runat="server">               
                            <ul id="ulQuestions" class="sortable ui-sortable" runat="server">
                            </ul>
                            </div>         
                            <asp:Button ID="btnsavechange" runat="server" Text="Button" Style="display:none" />
                            <div class="row buttons" id="add-new-question">
                                <asp:Button ID="btnAddQuestion" runat="server" Text="Add New Question" />
                            </div>

                            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" style="display:none"/>
                        </ContentTemplate>
                        </asp:UpdatePanel>
                        </form>
                    </div><!-- form -->
                </div>
            </div><!-- content -->
        </div><!-- content-area -->
        <asp:SqlDataSource ID="DSQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:connMySurvey %>" SelectCommand="SELECT [survey_question].id, survey_id, type, text FROM [survey_question], [survey] where [survey].id=survey_question.survey_ID and [survey].title=@title">
            <SelectParameters>
                <asp:SessionParameter Name="title" SessionField="surveyTitle" />
            </SelectParameters>
        </asp:SqlDataSource>
        <!--======== FOOTER ========-->
        <div id="footer">
            <p><a href="ContactUs.htm">Contact Us
                </a></p>
        </div><!-- footer -->
    </div><!-- page -->
    <script src="static/js/jquery-ui.min.js"></script>
    <!--<script type="text/javascript" src="/mySurvey/mySurvey_app/static/js/jquery-ui.min.js"></script>-->
    <script type="text/javascript" src="static/js/functions.js"></script>
    <script type="text/javascript" src="static/js/survey_update.js"></script>
    <script type="text/javascript">
        /*<![CDATA[*/
        jQuery(function ($) {
            jQuery('#survey-form').yiiactiveform({
                'validateOnChange': true, 'validateOnType': true,
                'attributes': [{ 'id': 'Survey_title', 'inputID': 'Survey_title', 'errorID': 'Survey_title_em_', 'model': 'Survey', 'name': 'title', 'enableAjaxValidation': true, 'status': 1, 'summary': true }, { 'summary': true }, { 'summary': true }, { 'summary': true }, { 'summary': true }], 'summaryID': 'survey-form_es_', 'focus': '#Survey_title', 'errorCss': 'error'
            });
        });
        /*]]>*/
    </script>

    <div style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; visibility: hidden;">
    <embed id="lingoes_plugin_object" type="application/lingoes-npruntime-capture-word-plugin" 
        hidden="true" width="0" height="0" /></div>
</body>
</html>