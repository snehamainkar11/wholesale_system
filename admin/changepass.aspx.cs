using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
using System.Web;

namespace wholesale.admin
{
    public partial class changepass : System.Web.UI.Page
    {
        public static String s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
        byte up;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void save_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(s))
            {

                try
                {

                    sqlCon.Open();
                    SqlCommand cmd = new SqlCommand("select * from registeration ", sqlCon);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        if (pass.Text == reader["Password"].ToString())
                        {
                            up = 1;
                        }
                    }
                    reader.Close();
                    sqlCon.Close();
                    if (up == 1)
                    {
                        sqlCon.Open();
                        SqlCommand cmd1 = new SqlCommand("update registeration  set password=@password where username=@username ", sqlCon);

                        cmd1.Parameters.AddWithValue("@password", cpass.Text);
                        cmd1.Parameters.AddWithValue("@username", "superadmin");
                        int value = (int)cmd1.ExecuteNonQuery();



                        if (value == 1)
                        {
                            lbl.Text = "Password Changed Successfully!!";
                            lblErrorMessage.Text = "";
                            cpass.Text = "";
                            uname.Text = "";

                        }
                    }
                    else
                    {
                        lbl.Text = "";
                        lblErrorMessage.Text ="Your Old Password not match";
                        uname.Text = "";

                    }
                }
                catch(Exception ex)
                {
                    Response.Write( ex.Message);
                    lblErrorMessage.Text = ex.Message;

                }

            }
        }
    }
}
