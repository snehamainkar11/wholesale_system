using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class login : System.Web.UI.Page
{
    string str, UserName, Password;

    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void signin_click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("Select * from registeration ", con);
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();


        da.Fill(dt);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            UserName = dt.Rows[i]["UserName"].ToString();
            Password = dt.Rows[i]["Password"].ToString();

            if (UserName == txtemail1.Text && Password == txtpass1.Text)
            {
                Session["userid"] = txtemail1.Text;
                if (dt.Rows[i]["role"].ToString() == "Admin")
                    Response.Redirect("~/admin/dashboard.aspx");
                else
                    Response.Redirect("index.aspx");

                /*  if ((txtemail1.Text == "superadmin") && (txtpass1.Text = dt.Columns[3].ToString()))
                  {
                      Session["userid"] = "superadmin".ToString();

                      Response.Redirect("~/admin/dashboard.aspx");

                  }*/
            }
            else

            {
                lbl.Text = "Invalid Username or Password";
            }

        }
            if (dt.Rows.Count > 0)
            {

                if (chk_remember.Checked)
                {
                    HttpCookie user = new HttpCookie("user_cookies");
                    user["Useremail"] = txtemail1.Text; 
                    user.Expires = DateTime.Now.AddYears(3);
                    Response.Cookies.Add(user); 
                }               

                Session.RemoveAll();
            }

            else

            {
                  lbl.Text = "Invalid Username or Password";

            }



    }
         

      }

