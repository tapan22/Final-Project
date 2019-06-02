<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="input_mod.aspx.cs" Inherits="StudentRetrieval.input_mod" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <%--<link href="css/pro.css" rel="stylesheet" type="text/css" />--%>
    <style type="text/css">
        .stylelink
       {
          position:absolute;
          font-size: x-large;
            top: 18px;
            left: 1257px;
        }
   
        #project {
  border-collapse: collapse;
  width: 50%;
  margin-top:80px;
}

#project td, #project th {
  border: 1px solid #ddd;
  padding: 8px;
}

#project tr:nth-child(even){background-color: #f2f2f2;}



#project th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}

input[type=text], select {
  width: 100%;
  padding: 6px 10px;
  margin: 4px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  border-style: none;
    border-color: inherit;
    border-width: medium;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

        .style1
        {
            font-size: xx-large;
            text-align: center;
        }
        .hidden
        {
            visibility:hidden;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <h1 class="style1"><strong>Question Input Window</strong></h1>
    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="stylelink" 
        onclick="LinkButton1_Click" CausesValidation="false">Log Out</asp:LinkButton>
    
    <center>
    <table id="project">
  
  <tr>
    <td>Enter Subject </td>
    <td>
        <asp:DropDownList ID="ddlSelSubject" runat="server">
        </asp:DropDownList>
    </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="ddlSelSubject" ErrorMessage="*Required"></asp:RequiredFieldValidator>
      </td>
  </tr>
  <tr>
    <td>Enter Module</td>
    <td>
        <asp:TextBox ID="tb_module" runat="server"></asp:TextBox>
      </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
            ControlToValidate="tb_module" ErrorMessage="*Required"></asp:RequiredFieldValidator>
      </td>
  </tr>
  <tr>
    <td>Question Type </td>
    <td>
        <asp:DropDownList ID="ddlSelQtype" runat="server">
        </asp:DropDownList> </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
            ControlToValidate="ddlSelQtype" ErrorMessage="*Required"></asp:RequiredFieldValidator>
      </td>
  </tr>
  <tr>
    <td>Difficulty Level</td>
    <td>
        <asp:DropDownList ID="ddlSelDifLevel" runat="server">
        </asp:DropDownList>
      </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
            ControlToValidate="ddlSelDifLevel" ErrorMessage="*Required"></asp:RequiredFieldValidator>
      </td>
  </tr>
  <tr>
    <td>Marks Awarded</td>
    <td>
        <asp:TextBox ID="tb_marks" runat="server"></asp:TextBox></td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
            ControlToValidate="tb_marks" ErrorMessage="*Required"></asp:RequiredFieldValidator>
      </td>
  </tr>
  <tr>
    <td>Enter Question</td>
    <td>
        <asp:TextBox ID="tb_stem" runat="server" TextMode="MultiLine" Width="98%"></asp:TextBox> </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
            ControlToValidate="tb_stem" ErrorMessage="*Required"></asp:RequiredFieldValidator>
      </td>
  </tr>
  <tr>
    <td>Enter Answer</td>
    <td>
        <asp:TextBox ID="tb_a_stem" runat="server" TextMode="MultiLine" Width="98%"></asp:TextBox> </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
            ControlToValidate="tb_a_stem" ErrorMessage="*Required"></asp:RequiredFieldValidator>
      </td>
  </tr>
  <tr>
    
    <td colspan="3" align="center">
        <asp:Button ID="btn_insert" runat="server" Text="Insert Question" Width="169px" 
          onclick="btn_insert_Click"/>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <asp:Button ID="btn_reset" runat="server" Text="Reset" 
            onclick="btn_reset_Click" CausesValidation="false" /></td>
  </tr>
  
</table>
    </center>
    </form>
</body>
</html>
