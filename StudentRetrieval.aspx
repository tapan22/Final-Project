<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentRetrieval.aspx.cs" Inherits="StudentRetrieval.StudentRetrieval" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/pro.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
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
    </form>
</body>
</html>
