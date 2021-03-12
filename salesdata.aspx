<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="salesdata.aspx.cs" Inherits="wholesale.salesdata" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
 <script type="text/javascript" src="/crystalreportviewers/js/crviewer/crv.js">
      </script> 
</head>
<body>
    <form id="form1" runat="server">


               




        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <h1 style="text-align:center"> Sales Report</h1>
         <div style="text-align:center;text-size-adjust:auto;font-size:16px">
                        Start Date: <asp:TextBox runat="server" TextMode="Date" ID="to" ></asp:TextBox> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              End Date: <asp:TextBox runat="server" TextMode="Date" ID="from" ></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button runat="server" ID="Load" Text="Load" OnClick="Load_Click" BackColor="Black" ForeColor="White" Font-Size="Large"/>
            
        <hr/>
        
          <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSource1" Width="800" />
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="sales.rpt">
            </Report>
        </CR:CrystalReportSource> </div>
                   </form></body></html>
                         

    

