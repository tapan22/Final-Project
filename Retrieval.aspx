<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Retrieval.aspx.cs" Inherits="StudentRetrieval.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="css/pro.css" rel="stylesheet" type="text/css" />
    
    <style type="text/css">
       
        .stylelink
       {
          position:absolute;
          font-size: x-large;
            top: 18px;
            left: 1257px;
        }
       
        .hidden
        {
            visibility:collapse;
        }
        .style1
        {
            text-align: center;
        }
        .style3
        {
            width: 224px;
        }
        .style4
        {
            width: 367px;
        }
        .style5
        {
            width: 195px;
        }
        .style7
        {
            width: 186px;
        }
        .style9
        {
            width: 317px;
        }
        .style10
        {
            width: 313px;
        }
    </style>
    
</head>
<body>
    <h1 class="style1">Question Retrieval Window</h1>
    
    <form id="form1" runat="server">
    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="stylelink" 
        onclick="LinkButton1_Click" CausesValidation="false">Log Out</asp:LinkButton>
    <center>
    <div class="content"> 
    <table id="project">
  <tr>
    <th colspan="2" style="background-color: #4CAF50;">Selections For Question Paper</th>
    
  </tr>
  <tr>
    <td class="style4">Subject</td>
    <td class="style3">
        <asp:DropDownList ID="ddlSelSubject" runat="server">
        </asp:DropDownList>
    </td>
    <td class='hidden'>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
            ControlToValidate="ddlSelSubject" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
      </td>
    <td class='hidden'>
        <asp:Label ID="Label_Subject" runat="server"></asp:Label>
      </td>
  </tr>
  <tr>
    <td class="style4">Total number of questions in the questions paper </td>
    <td class="style3">
        <asp:TextBox ID="tb_total_quest" runat="server" min="1"></asp:TextBox> </td>
    <td class='hidden'>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
            ControlToValidate="tb_total_quest" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
      </td>
    <td class='hidden'>
        <asp:Label ID="Label_total_quest" runat="server"></asp:Label>
      </td>
  </tr>
  <tr>
    <td class="style4">Number of questions to be answered (Mandatory)</td>
    <td class="style3">
        <asp:TextBox ID="tb_to_be_answ" runat="server" min="1"></asp:TextBox></td>
    <td class='hidden'>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
            ErrorMessage="RequiredFieldValidator" ControlToValidate="tb_to_be_answ"></asp:RequiredFieldValidator>
      </td>
    <td class='hidden'>
        <asp:Label ID="Label_NoToAnsw" runat="server"></asp:Label>
      </td>
  </tr>
  <tr>
    <td class="style4">Enter total marks of the question paper</td>
    <td class="style3">
        <asp:TextBox ID="tb_total_marks" runat="server" min="1"></asp:TextBox></td>
    <td class='hidden'>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
            ErrorMessage="RequiredFieldValidator" ControlToValidate="tb_total_marks"></asp:RequiredFieldValidator>
      </td>
    <td class='hidden'>
        <asp:Label ID="Label_tot_marks" runat="server"></asp:Label>
      </td>
  </tr>
  <tr>
    <td class="style4">Choose total number of modules</td>
    <td class="style3">
        <asp:DropDownList ID="ddlModuleCnt" runat="server">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
        </asp:DropDownList>
    </td>
    <td class='hidden'>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
            ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlModuleCnt"></asp:RequiredFieldValidator>
      </td>
    <td class='hidden'>
        <asp:Label ID="Label_mod_cnt" runat="server"></asp:Label>
      </td>
  </tr>
  <tr>
    <td colspan="2" align="center"> <asp:Button ID="btn_Submit" runat="server" Text="Submit" style="background-color: #4CAF50;" onclick="btn_Submit_Click"/></td>
    
   </tr>
</table>
<br /><br />
<table id="project">
  <tr>
    <th colspan="2" style="background-color: #4CAF50;">Module Number</th>
  </tr>
  <tr>
    <td class="style9">Enter module number</td>
    <td class="style5">
        <asp:TextBox ID="tb_sel_mod" runat="server"></asp:TextBox> </td>
    <td class='hidden'>
        <asp:Label ID="Label_sel_mod" runat="server"></asp:Label>
      </td>
  </tr>
  </table><br /><br />
  <table id="project" >
  <tr>
    <th colspan="2" style="background-color: #4CAF50;">Selections for the Module: 
        </th>
  </tr>
  <tr>
    <td class="style10">Marks for each module </td>
    <td class="style7">
        <asp:TextBox ID="tb_module_marks" runat="server" ></asp:TextBox></td>
    <td class='hidden'>
        <asp:Label ID="Label_marks_for_module" runat="server"></asp:Label>
      </td>
  </tr>
  <tr>
    <td class="style10">Total no. of questions in the module</td>
    <td class="style7"><asp:TextBox ID="tb_no_of_ques_mod" runat="server"  min="1" /></td>
    <td class='hidden'>
        <asp:Label ID="Label_no_of_mod_ques" runat="server"></asp:Label>
      </td>
  </tr>
  <tr>
    <td class="style10">Question type</td>
    <td class="style7"><asp:DropDownList ID="ddlSelQtype" runat="server" >
        </asp:DropDownList></td>
    <td class='hidden'>
        <asp:Label ID="Label_q_type" runat="server"></asp:Label>
      </td>
  </tr>
  
    <tr>
    <td class="style10">Difficulty level</td>
    <td class="style7"><asp:DropDownList ID="ddlSelDifLevel" runat="server" >
        </asp:DropDownList></td>
    <td class='hidden'>
        <asp:Label ID="Label_diff_level" runat="server"></asp:Label>
        </td>
  </tr>

  <tr>
    <td class="style10">Marks for each question</td>
    <td class="style7">
        <asp:TextBox ID="tb_marks" runat="server" ></asp:TextBox></td>
    <td class='hidden'>
        <asp:Label ID="Label_marks" runat="server"></asp:Label>
      </td>
  </tr>

  <tr>
    <td class="style10">Part</td>
    <td class="style7"><asp:DropDownList ID="ddlSelPart" runat="server" >
                          <asp:ListItem Value="0">Select Part</asp:ListItem>
                          <asp:ListItem>1</asp:ListItem>
                          <asp:ListItem>2</asp:ListItem>
                      </asp:DropDownList></td>
    <td class='hidden'>
        <asp:Label ID="Label_part" runat="server"></asp:Label>
      </td>
  </tr>

  <tr>
    <td class="style10">
        <asp:Button ID="btn_check_avail" runat="server" 
            Text="Check Question Availability" onclick="btn_check_avail_Click" /></td>
    <td class="style7">
        <asp:Label ID="Label_avail" runat="server" Text="Label" Visible="False"></asp:Label>
        </td>
  </tr>
  <tr>
    <td class="style10">Choose no. of questions to be retrieved
       </td>
    <td class="style7">
        <asp:DropDownList ID="ddlqcount" runat="server">
        </asp:DropDownList>
        
        </td>
    <td class='hidden'>
        <asp:Label ID="Label_ques_count" runat="server"></asp:Label>
      </td>
  </tr>
  <tr>
    <td colspan="2">
        <asp:Button ID="add_questions" runat="server" Text="Add Questions" 
            onclick="add_questions_Click" /></td>
  </tr>
  <tr>
    <td colspan="2">
        <asp:Label ID="Label_add" runat="server" Text="Label" Visible="False"></asp:Label></td>
  </tr>
  </table><br /><br />
<table id="project">
<tr>
    <th colspan="3">Added Questions</th>
  </tr>
  <tr>
    <td colspan="3">
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView> </td>
  </tr>
</table><br /><br />
<table id="project">
<tr>
    <th colspan="2">Question Paper Status</th>
  </tr>
  <tr>
    <td>Total Marks:
        </td>
        <td>
            <asp:Label ID="lbl_totmarks" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>Number of Marks Selected:
        </td>
        <td>
            <asp:Label ID="lbl_SelMarks" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>Remaining Marks:
        </td>
        <td>
            <asp:Label ID="lbl_RemMarks" runat="server"></asp:Label></td>
  </tr>
  
    
</table>
    </div></center>
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
        <asp:button ID="btn_redirect" runat="server" text="Click To View Question Paper" 
            onclick="btn_redirect_Click" Visible="False"  />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:button ID="btn_answer" runat="server" text="Click To View Answer Keys" 
            onclick="btn_answer_Click" Visible="False"  />
    
    </form>
</body>

</html>
