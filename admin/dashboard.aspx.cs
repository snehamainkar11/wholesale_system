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
    public partial class Dashboard : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            getprod();
            getsale();
            getexp();
            getdata();
            getdata1();
        }
        public void getprod()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select count(PID) from Product", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    lblprod.Text = i.ToString();

                }
                catch (Exception ex)
                {
                    string x = ex.Message;
                    Response.Write(x);
                }
            }
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("SELECT count(PID) FROM Product WHERE mfg >= DATEADD(DAY, -30, GETDATE()) ", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    Label1.Text = i.ToString();

                }
                catch (Exception ex)
                {
                    string x = ex.Message;
                    Response.Write(x);
                }
            }
        }
        public void getsale()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select count(orderno) from sales", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    lblsale.Text = i.ToString();

                }
                catch (Exception ex)
                {
                    string x = ex.Message;
                    Response.Write(x);
                }
            }
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("SELECT sum(grand) FROM sales WHERE duedate >= DATEADD(DAY, -30, GETDATE()) ", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    label2.Text = i.ToString("c");

                }
                catch (Exception ex)
                {
                    string x = ex.Message;
                    Response.Write(x);
                }
            }
        }
        public void getexp()
        {
            SqlConnection con = new SqlConnection(s);
            SqlConnection con1 = new SqlConnection(s);
            SqlCommand cmd = new SqlCommand("select sum(eamt) from expense ", con);
            SqlCommand cmd1 = new SqlCommand("SELECT sum(salary) FROM emp", con1);

            try
            {
                con.Open();
                int j = Convert.ToInt32(cmd.ExecuteScalar());
                Label5.Text = j.ToString("c");


                con1.Open();
                int i = Convert.ToInt32(cmd1.ExecuteScalar());
                Label4.Text = i.ToString("c");
                Label3.Text = (i + j).ToString("c");
             }
            catch (Exception ex)
            {
                string x = ex.Message;
                Response.Write(x);
            }
           }
        public void getdata()
        {
            SqlConnection con = new SqlConnection(s);
            SqlCommand cmd = new SqlCommand("select  Top(5) M.* ,C.* from sales M inner join Customer C on M.cid=C.cid order by ID desc ", con);
           
            try
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptr.DataSource = dt;
                    rptr.DataBind();

                }
            }
            catch (Exception ex)
            {
                string x = ex.Message;
                Response.Write(x);
            }
        }
        public void getdata1()
        {
            SqlConnection con = new SqlConnection(s);
            SqlCommand cmd = new SqlCommand("select Top(5) A.PID,A.status,A.pname,A.minlevel,A.pcode,B.*,C.*,D.* ,E.* from product A with(nolock) inner join Category B on B.ID =a.category  inner join Brands C on C.Id =A.brand inner join tblSubCategory D on D.SubCategoryID =A.subcategory inner join ProdStock E on E.PID=A.PID order by A.PID desc ", con);

            try
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();

                }
            }
            catch (Exception ex)
            {
                string x = ex.Message;
                Response.Write(x);
            }
        }
    }
}