using System;
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
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signup1_click(object sender, EventArgs e)
        {
            string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
            using (SqlConnection con = new SqlConnection(s))
            {

                SqlCommand cmd = new SqlCommand("insert into registeration values (@fullname, @username, @Password,@role)", con);
                cmd.Parameters.AddWithValue("@fullname", txtname.Text);
                cmd.Parameters.AddWithValue("@username", txtemail.Text);
                cmd.Parameters.AddWithValue("@password", txtpass.Text);
                cmd.Parameters.AddWithValue("@role","Customer");

                try
                {
                    con.Open();
                    int value = (int)cmd.ExecuteNonQuery();

                    if (value == 1)
                    {
                        Response.Redirect("~/Login.aspx?register=successfull");
                    }

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }
    }
}