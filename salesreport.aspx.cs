using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;


namespace wholesale
{
    public partial class salesreport : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {


            ReportDocument cryRpt = new ReportDocument();
            cryRpt.Load(Server.MapPath("CrystalReport1.rpt"));
            CrystalReportViewer1.ReportSource = cryRpt;
            //cryRpt.SetDatabaseLogon("SNEHA\\Htc", "");



        }



    }
}