<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ans_report.aspx.cs" Inherits="StudentRetrieval.Ans_report" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="H:\StudentRetrieval\StudentRetrieval\Reports\AnswerKey.rpt">
            </Report>
        </CR:CrystalReportSource>

        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
            AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="1269px" 
            ReportSourceID="CrystalReportSource2" ToolbarImagesFolderUrl="" 
            ToolPanelView="None" ToolPanelWidth="200px" Width="881px" />
        <CR:CrystalReportSource ID="CrystalReportSource2" runat="server">
            <Report FileName="H:\StudentRetrieval\StudentRetrieval\Reports\AnswerKey.rpt">
            </Report>
        </CR:CrystalReportSource>
    </div>
    </form>
</body>
</html>
