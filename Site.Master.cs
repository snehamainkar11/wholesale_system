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
    public partial class SiteMaster : MasterPage
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {



            if (IsPostBack || !IsPostBack)
            {
                HttpCookie usercookie = Request.Cookies["user_cookies"];
                if (Session["userid"] != null || usercookie != null)
                {

                    link_loginout.Text = "Log out";

                   // Label2.Text = "Welcome </br>" + Session["userid"].ToString();

                }
                else
                {

                    link_loginout.Text = "Log in";

                }
                BindCartNumber();
                BindCategories();
                // string id = Session["id"].ToString();

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

        public void BindCategories()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Category", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtBrands = new DataTable();
                        sda.Fill(dtBrands);
                        rptCategory.DataSource = dtBrands;
                        rptCategory.DataBind();
                    }

                }
            }
        }
        public void BindCartNumber()
        {
            if (Request.Cookies["CartPID"] != null)
            {
                string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
                string[] ProductArray = CookiePID.Split(',');
                int ProductCount = ProductArray.Length;
                pCount.InnerText = ProductCount.ToString();

            }
            else
            {

                pCount.InnerText = 0.ToString();
            }
        }
        protected void OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string catId = (e.Item.FindControl("hfCatId") as HiddenField).Value;
                Repeater rptSubCategories = e.Item.FindControl("rptSubCategories") as Repeater;

                using (SqlConnection con = new SqlConnection(s))
                {
                    using (SqlCommand cmd = new SqlCommand(string.Format("SELECT * from Category where ID ='{0}'", catId), con))
                    {
                        cmd.CommandType = CommandType.Text;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dtBrands = new DataTable();
                            sda.Fill(dtBrands);
                            rptSubCategories.DataSource = dtBrands;
                            rptSubCategories.DataBind();
                        }

                    }
                }
            }
        }
    }
}