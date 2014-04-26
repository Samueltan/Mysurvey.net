<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Session.aspx.cs" Inherits="Session" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <SCRIPT src="static/js/JavaScript.js" type="text/javascript"></SCRIPT>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input name="SurveyCreator[password_repeat]" id="TextBox1" type="password" placeholder="retype password" value="" onkeypress="OP()">
    </div>
    </form>
</body>
</html>
