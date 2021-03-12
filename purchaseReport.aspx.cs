using System;
using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

namespace wholesale
{

    public partial class purchaseReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Load_Click(object sender, EventArgs e)
        {
            string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(s))
            {
                sqlCon.Open();
                String query = "select M.* ,C.* from purchase M inner join Supplier C on M.supid=C.supid where pdate between @to and @from";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@to", to.Text);
                sqlCmd.Parameters.AddWithValue("@from", from.Text);

                SqlDataAdapter dr = new SqlDataAdapter(sqlCmd);
                dr.Fill(dtbl);
                string strFormula = "";
                strFormula = "{purchase.pdate}>=#" + to.Text + "# and {purchase.pdate}<= #" + from.Text + "#";
                CrystalReportViewer1.SelectionFormula = strFormula;

                sqlCon.Close();
            }
        }
    }
}