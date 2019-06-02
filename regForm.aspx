<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="regForm.aspx.cs" Inherits="StudentRetrieval.regForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
<style type="text/css">
       
    #project {
  border-collapse: collapse;
  width: 91%;
  margin-top:80px;
  margin-left:270px;
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

input[type=text],input[type=Password] select {
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

.hidden
{
  visibility:collapse;
}
        
    .style1
    {
        width: 1614px;
    }
    .style3
    {
        width: 223px;
    }
    .style7
    {
        width: 298px;
    }
        
    .style8
    {
        width: 223px;
        height: 57px;
    }
    .style9
    {
        width: 298px;
        height: 57px;
    }
    .style10
    {
        visibility: collapse;
        height: 57px;
    }
    .style11
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
    <form id="form1" runat="server" >
        <h1 style="text-align: center; font-size:50px;" class="style1"><strong>User Registration Form</strong></h1>
        <center>
            
            <table id="project">
            
                <tr>
                    <td class="style3">Username</td>
                    <td class="style7">
                        <asp:TextBox ID="tb_name" runat="server" 
                            ToolTip="Enter username of your choice"></asp:TextBox>
                    </td>
                    <td class='hidden' align="left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="tb_name" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                
                <tr>
                    <td class="style3" >Contact No.</td>
                    <td class="style7" >
                        <asp:TextBox ID="tb_num" runat="server" ToolTip="Number should begin with +91"></asp:TextBox>
                    </td>
                    <td class='hidden' align="left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tb_num" ErrorMessage="*Start with +91 " ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="tb_num" ErrorMessage="*Number is Invalid" ForeColor="Red" ValidationExpression="^((\+){1}91){1}[1-9]{1}[0-9]{9}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3" >Email</td>
                    <td class="style7" >
                        <asp:TextBox ID="tb_email" runat="server" ToolTip="Enter valid email address"></asp:TextBox>
                    </td>
                    <td class='hidden' align="left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tb_email" ErrorMessage="*Enter Valid Email Address" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="tb_email" ErrorMessage="*Invalid Email Address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style8">Password</td>
                    <td class="style9">
                        <asp:TextBox ID="tb_pass" runat="server" TextMode="Password" Height="29px" 
                            Width="100%" CssClass="style11" 
                            ToolTip="*Password must be 4-8 characters long, must include an upper case letter, a lower case letter &amp; a numeric digit."></asp:TextBox>
                    </td>
                    <td class='style10' align="left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tb_pass" ErrorMessage="*Password Is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        &nbsp;<br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                            ControlToValidate="tb_pass" ErrorMessage="*Password must be 4-8 characters long, must include an upper case letter, a lower case letter &amp; a numeric digit." 
                            ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,8}$"></asp:RegularExpressionValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="style3">Confirm Password</td>
                    <td class="style7">
                        <asp:TextBox ID="tb_cnpass" runat="server" TextMode="Password" Height="33px" 
                            Width="100%" CssClass="style11"></asp:TextBox>
                    </td>
                    <td class='hidden' align="left">
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tb_pass" ControlToValidate="tb_cnpass" ErrorMessage="*Password Does Not Match" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>

                <tr>
                    <td class="style3">Register As</td>
                    <td class="style7">
                        <asp:DropDownList ID="ddlseluser" runat="server" Height="33px" Width="100%" 
                            CssClass="style11">
                            <asp:ListItem>Select User</asp:ListItem>
                            <asp:ListItem>Administrator</asp:ListItem>
                            <asp:ListItem>Question Inputter</asp:ListItem>
                            <asp:ListItem>Question Retriever</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class='hidden' align="left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="tb_pass" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    
                    <td colspan="2" align="center">
                        <asp:Button ID="btn_submit" runat="server" Text="Submit" 
                            OnClick="btn_submit_Click"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btn_reset" runat="server" Text="Reset" 
                            onclick="btn_reset_Click" /> 
                        </td>        
                </tr>

            </table>
            
           </center> 
            
        
    </form>
</body>
</html>
