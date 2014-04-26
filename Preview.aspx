<%@ Page Language="C#" AutoEventWireup="true" CodeFile="preview.aspx.cs" Inherits="preview" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0062)http://localhost:8089/mySurvey/mySurvey_app/survey/take/ruCEnO -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><HTML 
lang="en" xml:lang="en" 
xmlns="http://www.w3.org/1999/xhtml"><HEAD><META content="IE=11.0000" 
http-equiv="X-UA-Compatible">
             
<META http-equiv="Content-Type" content="text/html; charset=utf-8">             
<META name="language" content="en">             <!--======== CSS FRAMEWORK ========--> 
            <LINK href="static1/css/print.css" rel="stylesheet" type="text/css" 
media="print">             <!--[if lt IE 8]>
            <link rel="stylesheet" type="text/css" href="/mySurvey/mySurvey_app/static/css/ie.css" media="screen, projection" />
            <![endif]--> 
            <LINK href="static1/css/main.css" rel="stylesheet" 
type="text/css">             
<SCRIPT src="static1/js/jquery.min.js" type="text/javascript"></SCRIPT>
             <!--<script type="text/javascript" src="/mySurvey/mySurvey_app/static/js/jquery.min.js"></script>--> 
 <SCRIPT src="static1/js/operations.js" type="text/javascript"></SCRIPT>                      
<SCRIPT src="static1/js/jquery.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="static1/js/jquery.yiiactiveform.js" type="text/javascript"></SCRIPT>MySurvey - Take Survey</TITLE>     
<META name="GENERATOR" content="MSHTML 11.00.9600.17041"></HEAD><!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <DIV class="container take-survey-view" id="page"><!--======== MENU + MAIN CONTENT AREA ========--> 
            
<DIV class="content-area"><!--======== BREADCRUMBS ========-->                   
                      <!-- breadcrumbs -->                				 <!--======== CONTENT: Pulls in .php views from Site & Survey ========--> 
                
<DIV id="content">
<H1>
    <asp:Label ID="Label_survey" runat="server"></asp:Label>
    </H1><BR><BR>
<DIV class="form"  id="questionnaire">
<DIV id="biaoge" runat="server">
<%--<P class="note">Fields with elds with <SPAN class="required">*</SPAN> are required.</P>
<H2 id="q1" runat="server">1. question 1 in survey 1</H2><BR>
<DIV class="errorSummary" id="survey-response-form_es_" style="display: none;">
<P>Please fix the following input errors:</P>
<UL>
  <LI>dummy</LI></UL></DIV>
<DIV class="row"><INPUT name="SurveyResponse[8][survey_question_type]" id="SurveyResponse_8_survey_question_type" type="hidden" value="2"><INPUT name="SurveyResponse[8][text]" id="ytSurveyResponse_8_text" type="hidden"><SPAN 
id="SurveyResponse_8_text"><INPUT name="SurveyResponse[8][text]" id="SurveyResponse_8_text_0" 
type="radio" value="9"> <LABEL for="SurveyResponse_8_text_0">answer 
a</LABEL><BR><INPUT name="SurveyResponse[8][text]" id="SurveyResponse_8_text_1" 
type="radio" value="10"> <LABEL for="SurveyResponse_8_text_1">answer 
b</LABEL><BR><INPUT name="SurveyResponse[8][text]" id="SurveyResponse_8_text_2" 
type="radio" value="11"> <LABEL for="SurveyResponse_8_text_2">answer 
c</LABEL></SPAN><BR>
<DIV class="errorMessage" id="SurveyResponse_8_text_em_" 
style="display: none;"></DIV><BR></DIV>
<H2>2. question 2 in survey 1</H2><BR>
<DIV class="errorSummary" id="survey-response-form_es_" style="display: none;">
<P>Please fix the following input errors:</P>
<UL>
  <LI>dummy</LI></UL></DIV>
<DIV class="row"><INPUT name="SurveyResponse[9][survey_question_type]" id="SurveyResponse_9_survey_question_type" type="hidden" value="3"><INPUT name="SurveyResponse[9][text]" id="ytSurveyResponse_9_text" type="hidden"><SPAN 
id="SurveyResponse_9_text"><INPUT name="SurveyResponse[9][text][]" id="SurveyResponse_9_text_0" 
type="checkbox" value="12"> <LABEL for="SurveyResponse_9_text_0">answer 
x</LABEL><BR><INPUT name="SurveyResponse[9][text][]" id="SurveyResponse_9_text_1" 
type="checkbox" value="13" > <LABEL for="SurveyResponse_9_text_1">answer 
y</LABEL></SPAN><BR>
<DIV class="errorMessage" id="SurveyResponse_9_text_em_" 
style="display: none;"></DIV><BR></DIV>
<H2>3. question 3 (short answer)</H2><BR>
<DIV class="errorSummary" id="survey-response-form_es_" style="display: none;">
<P>Please fix the following input errors:</P>
<UL>
  <LI>dummy</LI></UL></DIV>
<DIV class="row"><INPUT name="SurveyResponse[10][survey_question_type]" id="SurveyResponse_10_survey_question_type" type="hidden" value="0"><INPUT name="SurveyResponse[10][survey_answer_id]" id="SurveyResponse_10_survey_answer_id" type="hidden" value="14"><TEXTAREA name="SurveyResponse[10][text]" id="SurveyResponse_10_text" onkeypress=""></TEXTAREA><BR>
<DIV class="errorMessage" id="SurveyResponse_10_text_em_" 
style="display: none;"></DIV><BR></DIV>
<H2>4. question 4 (T/F)</H2><BR>
<DIV class="errorSummary" id="survey-response-form_es_" style="display: none;">
<P>Please fix the following input errors:</P>
<UL>
  <LI>dummy</LI></UL></DIV>
<DIV class="row"><INPUT name="SurveyResponse[11][survey_question_type]" id="SurveyResponse_11_survey_question_type" type="hidden" value="1"><INPUT name="SurveyResponse[11][text]" id="ytSurveyResponse_11_text" type="hidden"><SPAN 
id="SurveyResponse_11_text"><INPUT name="SurveyResponse[11][text]" id="SurveyResponse_11_text_0" 
type="radio" value="15" onmousedown=""> <LABEL for="SurveyResponse_11_text_0">True 
edited</LABEL><BR><INPUT name="SurveyResponse[11][text]" id="SurveyResponse_11_text_1" 
type="radio" value="16"> <LABEL 
for="SurveyResponse_11_text_1">False</LABEL></SPAN><BR>
<DIV class="errorMessage" id="SurveyResponse_11_text_em_" 
style="display: none;"></DIV><BR></DIV>
<DIV 
class="row buttons"><INPUT name="yt0" type="submit" value="Submit">	</DIV>--%>
    <asp:Button ID="Button1" runat="server" Height="16px" OnClick="Button1_Click" Text="how are you" Width="16px" style="display:none"/>
    </DIV></DIV><!-- end form --> 
               </DIV><!-- content -->                         </DIV><!-- content-area --> 
       				<!--======== FOOTER ========-->                 
<DIV id="footer">
<P>Powered by MySurveyy MySurvey</P></DIV><!-- footer -->         </DIV><!-- page -->      
 <asp:HiddenField id="hfarray" ClientIDMode="Static" runat="server" />  
<SCRIPT src="static1/js/jquery-ui.min.js"></SCRIPT>
         <!--<script type="text/javascript" src="/mySurvey/mySurvey_app/static/js/jquery-ui.min.js"></script>-->
	    
<SCRIPT src="static1/js/functions.js" type="text/javascript"></SCRIPT>
             
<SCRIPT type="text/javascript">
    /*<![CDATA[*/
    jQuery(function ($) {
        jQuery('#survey-response-form').yiiactiveform({
            'validateOnSubmit': true, 'attributes': [{
                'id': 'SurveyResponse_8_text', 'inputID': 'SurveyResponse_8_text', 'errorID': 'SurveyResponse_8_text_em_', 'model': 'SurveyResponse', 'name': '[8]text', 'enableAjaxValidation': false, 'clientValidation': function (value, messages, attribute) {

                    if (jQuery.trim(value) == '') {
                        messages.push("All reponses are required.");
                    }

                }
            }, {
                'id': 'SurveyResponse_9_text', 'inputID': 'SurveyResponse_9_text', 'errorID': 'SurveyResponse_9_text_em_', 'model': 'SurveyResponse', 'name': '[9]text', 'enableAjaxValidation': false, 'clientValidation': function (value, messages, attribute) {

                    if (jQuery.trim(value) == '') {
                        messages.push("All reponses are required.");
                    }

                }
            }, {
                'id': 'SurveyResponse_10_text', 'inputID': 'SurveyResponse_10_text', 'errorID': 'SurveyResponse_10_text_em_', 'model': 'SurveyResponse', 'name': '[10]text', 'enableAjaxValidation': false, 'clientValidation': function (value, messages, attribute) {

                    if (jQuery.trim(value) == '') {
                        messages.push("All reponses are required.");
                    }

                }
            }, {
                'id': 'SurveyResponse_11_text', 'inputID': 'SurveyResponse_11_text', 'errorID': 'SurveyResponse_11_text_em_', 'model': 'SurveyResponse', 'name': '[11]text', 'enableAjaxValidation': false, 'clientValidation': function (value, messages, attribute) {

                    if (jQuery.trim(value) == '') {
                        messages.push("All reponses are required.");
                    }

                }
            }, { 'summary': true }, { 'summary': true }, { 'summary': true }, { 'summary': true }], 'summaryID': 'survey-response-form_es_', 'errorCss': 'error'
        });
    });
    /*]]>*/
</SCRIPT>
    </form>
</body>
</html>