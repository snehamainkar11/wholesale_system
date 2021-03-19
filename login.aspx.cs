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
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void signin_click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("Select * from registeration where username='" + txtemail1.Text + "' and Password ='" + txtpass1.Text + "'", con);
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();

        da.Fill(dt);
        if (txtemail1.Text == "superadmin" && txtpass1.Text == "admin123")
        {

            Response.Redirect("~/admin/dashboard.aspx");

        }

        Session["userid"] = txtemail1.Text;

        if (dt.Rows.Count > 0)
            {

                if (chk_remember.Checked)
                {
                    HttpCookie user = new HttpCookie("user_cookies"); //creating cookie object where user_cookies is cookie name
                    user["Useremail"] = txtemail1.Text; // cookie content
                    user.Expires = DateTime.Now.AddYears(3); // give the time/duration of cookie
                    Response.Cookies.Add(user); // it gives the response in browser
                }
                
                  


                

            Response.Redirect("index.aspx");
            //Session.RemoveAll();
        }

            else

            {
                Response.Write("<script>alert('Please enter valid Username and Password')</script>");

            }

        
           
        }
         

      }

