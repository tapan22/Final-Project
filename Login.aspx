<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StudentRetrieval.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/pro.css" rel="stylesheet" type="text/css" />

<style type="text/css">
        
                
        .style1
    {
        text-align: center;
        font-size: xx-large;
    }
        
                
        .style2
    {
        height: 69px;
        background-color:white;
    }
        
    .pass
    {
        width: 100%;
        padding: 6px 10px;
        margin: 4px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }   
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <p class="style1"><strong>Question Paper Retrieval System</strong></p>
    <center>
    <table id="project" style="background-color:White; margin-top:110px; height: 192px;">
    <tr><th colspan="2" align="center">Login</th></tr>
  <tr>
    <td>Email</td>
    <td>
        <asp:TextBox ID="uname" runat="server"></asp:TextBox></td>
    <td style="visibility:collapse">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="uname" ErrorMessage="*Required"></asp:RequiredFieldValidator>
      </td>
  </tr>
  <tr>
    <td>Password </td>
    <td>
        <asp:TextBox ID="pass" runat="server" TextMode="Password" Width="100%" 
            CssClass="pass"></asp:TextBox> </td>
    <td style="visibility:collapse">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="pass" ErrorMessage="*Required"></asp:RequiredFieldValidator>
      </td>
  </tr>
 
  <tr>
    
    <td colspan="2" align="center" class="style2">
        <asp:Button ID="btn_login" runat="server" onclick="btn_login_Click" 
            Text="Login" />
        <br />
        <br />
        New User? 
        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
            onclick="LinkButton1_Click">Click Here</asp:LinkButton>
        
      </td>
    <td class="style2" align="left" style="visibility:collapse"></td>
  </tr>
  
</table>
    </center>
    </form>
</body>
</html>
