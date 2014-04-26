<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0044)http://localhost:8089/MySurvey/mySurvey_app/ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html
id="home" lang="en" lang="en" xml:lang="en"
xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta content="IE=11.0000"
        http-equiv="X-UA-Compatible">
    <link href="static1/css/css.css" rel="stylesheet" type="text/css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="language" content="en">
    <link href="static1/css/main.css" rel="stylesheet"
        type="text/css">
    <script src="static1/js/jquery.min.js"></script>

    <script src="static1/js/JavaScript.js" type="text/javascript"></script>
    <%--<SCRIPT src="static1/js/jquery.yiiactiveform.js" type="text/javascript"></SCRIPT>--%>
    <title>MySurvey</title>
    <meta name="GENERATOR" content="MSHTML 11.00.9600.17041">
</head>
<!--======== LAYOUT MODEL FOR HOMEPAGE ========-->

<body>
    <form id="form1" runat="server">
        <!--======== PAGE ========-->
        <div class="container" id="page">
            <!--======== HEADER ========-->
            <div id="header">
                <div class="makeCenter">
                    <img id="appLogo" src="static1/img/logo-white.png">
                </div>
            </div>
            <!-- header -->
            <!--======== CONTENT: Pulls in index.php ========-->

            <div id="content">
                <!--======== SIGN IN / SIGN UP ========-->
                <div id="top-half">
                    <h1>Design. Collect. Analyze.</h1>
                    <p>
                        MySurvey is a web application that allows you to create, share and analyze 
online surveys.
                    </p>
                    <div id="login-logout">
                        <a class="button" id="register-link">Sign up</a>
                        <%--<asp:Button ID="Button_sign" runat="server" OnClick="Button_sign_Click" Text="Sign up" />  --%>

                        <p>or <a id="sign-in">Sign in</a></p>
                    </div>
                    <!--======== LOGIN FORM ========-->
                    <div class="modal" id="login">
                        <div class="form">
                            <!--======== Email ========-->

                            <div
                                class="row">
                                <asp:TextBox ID="TextBox_username" runat="server"></asp:TextBox>
                                <span class="arrow-left"></span>
                                <div class="errorMessage" id="LoginForm_email_em_"
                                    style="display: none;">
                                </div>
                            </div>
                            <!--======== Password ========-->

                            <div class="row">
                                <asp:TextBox ID="TextBox_password" runat="server" TextMode="Password"></asp:TextBox>
                                <span class="arrow-left"></span>
                                <div class="errorMessage" id="LoginForm_password_em_"
                                    style="display: none;">
                                </div>
                            </div>
                            <!--======== Remember Me Check Box ========-->

                            <div class="row rememberMe">
                                <input name="LoginForm[rememberMe]" id="ytLoginForm_rememberMe" type="hidden" value="0">
                                <asp:CheckBox ID="CheckBox1" runat="server" Text="Remind me Later" />
                                <span class="arrow-left"></span>
                                <div class="errorMessage" id="LoginForm_rememberMe_em_"
                                    style="display: none;">
                                </div>
                            </div>
                            <!--======== Sign In Button ========-->

                            <div class="row buttons">
                                <asp:Button ID="Button_sign_in" runat="server" Text="Sign in" OnClick="Button_sign_in_Click" />
                            </div>
                        </div>
                        <!--======== Sign Up Button ========-->

                        <p>or <a id="register-btn">Sign up</a></p>
                    </div>
                    <!--======== REGISTER FORM ========-->

                    <div class="modal" id="register">
                        <div class="form">
                            <!--======== First Name ========-->

                            <div class="row">
                                &nbsp;<asp:TextBox ID="TextBox_first" runat="server" placeholder="firstname"></asp:TextBox>
                                <span class="arrow-left"></span>
                                <div class="errorMessage" id="SurveyCreator_first_name_em_" style="display: none;"></div>
                            </div>
                            <!--======== Last Name ========-->

                            <div class="row">
                                &nbsp;
    <asp:TextBox ID="TextBox_last" runat="server" placeholder="lastname"></asp:TextBox>
                                &nbsp;<span class="arrow-left"></span><div class="errorMessage" id="SurveyCreator_last_name_em_" style="display: none;"></div>
                            </div>
                            <!--======== Email ========-->

                            <div
                                class="row">
                                &nbsp;<asp:TextBox ID="TextBox_email" runat="server" placeholder="email address"></asp:TextBox>
                                <span class="arrow-left"></span>
                                <div class="errorMessage" id="SurveyCreator_email_em_"
                                    style="display: none;">
                                </div>
                            </div>
                            <!--======== Password ========-->

                            <div class="row">
                                &nbsp;<asp:TextBox ID="TextBox_pass" runat="server" TextMode="Password" placeholder="password"></asp:TextBox>
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="SurveyCreator[password_repeat]" id="TextBox_repassword" type="password" placeholder="retype password" value="" onkeyup="OP()" onclick="OP()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                            <!--======== Sign Up Button ========-->
                            <span class="arrow-left"></span>
                            <input name="SurveyCreator[presentation]" id="Label_presentation" value="password is not the same" style="display: none; color: red; background-color: transparent; width: 154px; border: none">
                            <span class="arrow-left"></span>
                            <div class="row buttons">
                                <asp:Button ID="Button_signup" runat="server" OnClick="Button_signup_Click" Text="Sign up" Enabled="true" />
                                <%--<INPUT name="yt1" type="submit" value="Sign up" onclick="">--%>&nbsp;
                            </div>
                        </div>
                        <!--======== Sign In Button ========-->

                        <p>or <a id="sign-in-btn">Sign in</a></p>
                    </div>
                    <!--======== LEARN MORE ========-->

                    <div id="learn-more">
                        <p>
                            <a class="learn"
                                href="http://localhost:8089/MySurvey/mySurvey_app/#about">
                                <asp:HiddenField ID="hfData" ClientIDMode="Static" runat="server" />
                                <img src="static1/img/down-arrow.png"></a>
                        </p>
                    </div>
                </div>
                <!--======== ABOUT MYSURVEY ========-->
                <div id="about">
                    <div class="center-content" id="what-it-is">
                        <div class="image">
                            <img src="static1/img/create.png">
                        </div>
                        <div class="text">
                            <h1>Survey creation made easy.</h1>
                            <p>
                                With a variety of question types including multiple choice, short answer and 
more, it's easy to create online surveys from scratch using 
MySurvey.
                            </p>
                        </div>
                    </div>
                    <div class="color1">
                        <div class="center-content" id="feature-1">
                            <div class="image">
                                <img src="static1/img/responses.png">
                            </div>
                            <div class="text">
                                <h1>Collecting responses.</h1>
                                <p>
                                    Gather responses with one handy URL by including your link on emails, 
websites, Twitter, Facebook, and more.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="center-content" id="feature-2">
                        <div class="image">
                            <img src="static1/img/reports.png">
                        </div>
                        <div class="text">
                            <h1>Analyzing results.</h1>
                            <p>
                                Gain insights with real-time charts and graphs or download a full report to 
get the most out of your data.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content -->
            <!--======== FOOTER ========-->

            <div id="footer">
                <p>
                    <a href="http://localhost:8089/MySurvey/mySurvey_app/contact">Contact 
Us</a>
                </p>
            </div>
            <!-- footer -->
        </div>
        <!-- page -->
        <%--<SCRIPT src="static1/js/jquery-ui.min.js"></SCRIPT>--%>

        <script src="static1/js/functions.js" type="text/javascript"></script>

        <script type="text/javascript">
            /*<![CDATA[*/
            /*   jQuery(function ($) {
                   jQuery('#login-form').yiiactiveform({ 'validateOnSubmit': true, 'attributes': [{ 'id': 'LoginForm_email', 'inputID': 'LoginForm_email', 'errorID': 'LoginForm_email_em_', 'model': 'LoginForm', 'name': 'email', 'enableAjaxValidation': true }, { 'id': 'LoginForm_password', 'inputID': 'LoginForm_password', 'errorID': 'LoginForm_password_em_', 'model': 'LoginForm', 'name': 'password', 'enableAjaxValidation': true }, { 'id': 'LoginForm_rememberMe', 'inputID': 'LoginForm_rememberMe', 'errorID': 'LoginForm_rememberMe_em_', 'model': 'LoginForm', 'name': 'rememberMe', 'enableAjaxValidation': true }], 'errorCss': 'error' });
                   jQuery('#register-form').yiiactiveform({ 'validateOnSubmit': true, 'attributes': [{ 'id': 'SurveyCreator_first_name', 'inputID': 'SurveyCreator_first_name', 'errorID': 'SurveyCreator_first_name_em_', 'model': 'SurveyCreator', 'name': 'first_name', 'enableAjaxValidation': true }, { 'id': 'SurveyCreator_last_name', 'inputID': 'SurveyCreator_last_name', 'errorID': 'SurveyCreator_last_name_em_', 'model': 'SurveyCreator', 'name': 'last_name', 'enableAjaxValidation': true }, { 'id': 'SurveyCreator_email', 'inputID': 'SurveyCreator_email', 'errorID': 'SurveyCreator_email_em_', 'model': 'SurveyCreator', 'name': 'email', 'enableAjaxValidation': true }, { 'id': 'SurveyCreator_password', 'inputID': 'SurveyCreator_password', 'errorID': 'SurveyCreator_password_em_', 'model': 'SurveyCreator', 'name': 'password', 'enableAjaxValidation': true }, { 'id': 'SurveyCreator_password_repeat', 'inputID': 'SurveyCreator_password_repeat', 'errorID': 'SurveyCreator_password_repeat_em_', 'model': 'SurveyCreator', 'name': 'password_repeat', 'enableAjaxValidation': true }], 'errorCss': 'error' });
               });*/
            /*]]>*/
        </script>
    </form>
</body>
</html>

