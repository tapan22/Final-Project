<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="qform.aspx.cs" Inherits="StudentRetrieval.qform" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 824px;
        }
        .auto-style2 {
            position: absolute;
            left: 78px;
            top: 170px;
            width: 1324px;
            height: 636px;
        }
        a {
            position:absolute;
            font-size: 100px;
            left: 21px;
            top: 20px;
            width: 834px;
            height: 593px;
            text-align: center;
            text-decoration:none;
            color:black;
        }
        a:hover {
            color:palevioletred;
        }
        .auto-style3 {
            left: 739px;
            top: 22px;
            width: 520px;
        }
        .auto-style5 {
            left: 21px;
            top: 20px;
            width: 539px;
        }
        .auto-style6 {
            width: 791px;
        }
        .auto-style8 {
            height: 852px;
        }
        .auto-style9 {
            width: 749px;
        }
        .auto-style10 {
            left: 1253px;
            top: 28px;
            width: 210px;
            height: 65px;
            font-size: large;
        }
    </style>
</head>
<body style="height: 865px; width: 1467px;">
    <form id="form1" runat="server" class="auto-style8">
        <div class="auto-style1">
            
            <table class="auto-style2">
                <tr>
                     <td class="auto-style9"><a href="Retrieval.aspx" class="auto-style3">Question Retreival Module</a></td>
                     <td class="auto-style6"><a href="input_mod.aspx" class="auto-style5">&nbsp;&nbsp;&nbsp;Question&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Input Module</a></td>
               </tr>
            </table>
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="auto-style10" OnClick="LinkButton1_Click">Log Out</asp:LinkButton>
        </div>
    </form>
</body>
</html>
