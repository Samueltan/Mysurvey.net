<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="divtest" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Calendar ID="Calendar1" ShowTitle="True" runat="server" />
                <div>
                    Background:
                    <br />
                    <asp:DropDownList ID="ColorList" AutoPostBack="True" OnSelectedIndexChanged="DropDownSelection_Change"
                        runat="server">
                        <asp:ListItem Selected="True" Value="White"> 
                        White </asp:ListItem>
                        <asp:ListItem Value="Silver"> 
                        Silver </asp:ListItem>
                        <asp:ListItem Value="DarkGray"> 
                        Dark Gray </asp:ListItem>
                        <asp:ListItem Value="Khaki"> 
                        Khaki </asp:ListItem>
                        <asp:ListItem Value="DarkKhaki"> D
                        ark Khaki </asp:ListItem>
                    </asp:DropDownList>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
