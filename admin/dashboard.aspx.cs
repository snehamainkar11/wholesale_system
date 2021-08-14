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
using System.Drawing;

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
            getpurchase();
            getorders();
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
                   // Response.Write(x);
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
                   // Response.Write(x);
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
                    //Response.Write(x);
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
                    //Response.Write(x);
                }
            }
        }
        public void getpurchase()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select count(pid) from Purchase WHERE pdate >= DATEADD(DAY, -30, GETDATE())", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    porder.Text = i.ToString();

                }
                catch (Exception ex)
                {
                    string x = ex.Message;
                    //Response.Write(x);
                }
            }
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("SELECT sum(invrem) FROM Purchase ", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    due.Text = i.ToString("c");

                }
                catch (Exception ex)
                {
                    string x = ex.Message;
                    //Response.Write(x);
                }
            }
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("SELECT count(pid) FROM Purchase where invrem > 0 ", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    pending.Text = i.ToString();

                }
                catch (Exception ex)
                {
                    string x = ex.Message;
                    //Response.Write(x);
                }
            }
        }
        public void getorders()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select count(Id) from custorder WHERE odate >= DATEADD(DAY, -30, GETDATE())", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    orders.Text = i.ToString();

                }
                catch (Exception ex)
                {
                    string x = ex.Message;
                   // Response.Write(x);
                }
            }
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("SELECT sum(grandtotal) FROM custorder  WHERE odate >= DATEADD(DAY, -30, GETDATE())", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    onliners.Text = i.ToString("c");

                }
                catch (Exception ex)
                {
                    string x = ex.Message;
                    //Response.Write(x);
                }
            }
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("SELECT count(Id) FROM custorder where shipstatus='Shipped' ", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    shipped.Text = i.ToString();

                }
                catch (Exception ex)
                {
                    string x = ex.Message;
                   // Response.Write(x);
                }
            }
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("SELECT count(Id) FROM custorder where shipstatus='Delivered' ", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    delivered.Text = i.ToString();

                }
                catch (Exception ex)
                {
                    string x = ex.Message;
                    //Response.Write(x);
                }
            }
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("SELECT count(Id) FROM custorder where shipstatus='Order Placed' ", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    placed.Text = i.ToString();

                }
                catch (Exception ex)
                {
                    string x = ex.Message;
                   // Response.Write(x);
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


                con1.Open();
                int i = Convert.ToInt32(cmd1.ExecuteScalar());
                Label4.Text = i.ToString("c");
                Label3.Text = (j).ToString("c");
             }
            catch (Exception ex)
            {
                string x = ex.Message;
               // Response.Write(x);
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
                //Response.Write(x);
            }
        }
        public void getdata1()
        {
            SqlConnection con = new SqlConnection(s);
            SqlCommand cmd = new SqlCommand("select Top(5) A.PID,A.status,A.pname,A.minlevel,A.pcode,B.*,C.*,D.* ,E.* from product A with(nolock) inner join Category B on B.ID =a.category  inner join Brands C on C.Id =A.brand inner join tblSubCategory D on D.SubCategoryID =A.subcategory inner join ProdStock E on E.PID=A.PID  where minlevel >= E.quantity order by A.PID desc  ", con);

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
                //Response.Write(x);
            }
        }

    }
}