<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="StudentRetrieval._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
    
<table id="project">
  <tr>
    <th colspan="3">Common</th>
  </tr>
  <tr>
    <td>Subject</td>
    <td><select>
        <option value="">Select Language</option>
        <option value="1">Kannada</option>
        <option value="2">Telugu</option>
        </select></td>
    <td></td>
  </tr>
  <tr>
    <td>Total number of questions for this questions paper </td>
    <td> <input id="#" type="text" data-type="number" min="0"  /></td>
    <td></td>
  </tr>
  <tr>
    <td>Number of questions to be answered (Mandatory)</td>
    <td><input id="Text1" type="text" data-type="number" min="0"  /></td>
    <td></td>
  </tr>
  <tr>
    <td>Total Marks</td>
    <td><input id="Text2" type="text" data-type="number" min="0"  /></td>
    <td></td>
  </tr>
  <tr>
    <td colspan="3" align="center"> <input id="btn_Submit" type="Submit" value="Submit" /></td>
    
  </tr>
</table>
<br /><br />
<table id="project">
  <tr>
    <th colspan="3">Combination</th>
  </tr>
  <tr>
    <td>Module </td>
    <td><select>
        <option value="">Select Language</option>
        <option value="1">Kannada</option>
        <option value="2">Telugu</option>
        </select></td>
    <td></td>
  </tr>
  <tr>
    <td>How many questions inside this module </td>
    <td> <input id="Text3" type="text" data-type="number" min="0"  /></td>
    <td></td>
  </tr>
  <tr>
    <td>Question Type </td>
    <td><select>
        <option value="">Select Language</option>
        <option value="1">Kannada</option>
        <option value="2">Telugu</option>
        </select></td>
    <td></td>
  </tr>
  <tr>
    <td>Marks</td>
    <td> <input id="Text4" type="text" data-type="number" min="0"  /></td>
    <td></td>
  </tr>
  <tr>
    <td>Difficulty Level </td>
    <td> <input id="Text5" type="text" data-type="number" min="0"  /></td>
    <td></td>
  </tr>
  <tr>
    
    <td colspan="3"><input id="Submit2" type="Submit" value="Fetch Rows" /></td>

  </tr>
  
</table>
    </div>
</asp:Content>
