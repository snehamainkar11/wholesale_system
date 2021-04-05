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


namespace wholesale
{
    public partial class adminmaster : System.Web.UI.MasterPage
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack || !IsPostBack)
            {
                HttpCookie usercookie = Request.Cookies["user_cookies"];
                if (Session["userid"] != null  || usercookie != null)
                {
                    link_loginout.Text = "Log out";
                }
                else
                {
                    link_loginout.Text = "Log in";
                }
                Label1.Text = "Superadmin".ToString();
                //Label2.Text = "Superadmin".ToString();

            }
        }
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

      


    }
}