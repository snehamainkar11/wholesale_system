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
    public partial class manfproducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack || !IsPostBack)
            {
                HttpCookie usercookie = Request.Cookies["user_cookies"];
                if (Session["userid"] != null || usercookie != null)
                {
                    link_loginout.Text = "Log out";
                }
                else
                {
                    link_loginout.Text = "Log in";
                }
                //Label1.Text = "Welcome  <br/>" + Session["userid"].ToString();
                // Label2.Text = Session["userid"].ToString();

            }
        }
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
        protected void link_loginout_Click(object sender, EventArgs e)
        {
            if (link_loginout.Text == "Log out")
            {
                Response.Cookies["user_cookies"].Expires = DateTime.Now.AddYears(-1);
                Response.Cookies.Clear();
                Session.Clear();
                Response.Redirect("/login.aspx");
            }
            else if (link_loginout.Text == "Log in")
            {
                Response.Redirect("/login.aspx");
            }
        }

        protected void Load_Click(object sender, EventArgs e)
        {
            string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(s))
            {
                sqlCon.Open();
                String query = "select M.* ,C.* ,P.* from product M inner join category C on M.category=C.Id inner join ProdStock p on M.PID=p.PId where mfg between @to and @from";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@to", to.Text);
                sqlCmd.Parameters.AddWithValue("@from", from.Text);

                SqlDataAdapter dr = new SqlDataAdapter(sqlCmd);
                dr.Fill(dtbl);
                string strFormula = "";
                strFormula = "{product.mfg}>=#" + to.Text + "# and {product.mfg}<= #" + from.Text + "#";
                CrystalReportViewer1.SelectionFormula = strFormula;

                sqlCon.Close();
            }
        }
    }
}