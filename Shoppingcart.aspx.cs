using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Threading;
namespace wholesale
{
    public partial class Shoppingcart : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie usercookie = Request.Cookies["user_cookies"];
            if (Session["userid"] != null || usercookie != null)
            {

                link_loginout.Text = "Log out";

                Label2.Text = "Welcome </br>" + Session["userid"].ToString();
                BindCartNumber();
                BindProductCart();

            }
            else
            {
                Response.Redirect("~/login.aspx");

                link_loginout.Text = "Log in";

            }


        }

        private void BindProductCart()
        {

         
                    DataTable dt = new DataTable();
                    Int64 CartTotal = 0;
                    Int64 Total = 0;

                            using (SqlConnection con = new SqlConnection(s))
                            {
                                SqlCommand cmd1 = new SqlCommand("select count(Id)  from cart where uid=@uid", con);
                                con.Open();
                                cmd1.Parameters.AddWithValue("@uid", Session["userid"].ToString());

                                SqlDataReader sdr1 = cmd1.ExecuteReader();
                                while (sdr1.Read())
                                {
                                    Int64 ss = Convert.ToInt64(sdr1[0]);

                                    h4Noitems.InnerText = "MY CART (" + (ss).ToString() + " Items)";

                                    if (ss == 0) {
                                        h4Noitems.InnerText = "Your Shopping Cart is Empty";
                                        divpricedetails.Visible = false;

                                    }

                                }
                            }
                      using (SqlConnection con = new SqlConnection(s))
                        {

                            using (SqlCommand cmd = new SqlCommand("select A.PID, A.pname,  A.unitprice, A.sellingprice, A.discount,B.*,C.* ,D.color,D.PID from Product A  inner join Cart C on C.Pid = A.PID inner join ProdStock D on D.PID=A.PID cross apply( select top 1 * from ProdImage B where B.ProID = A.PID order by B.ProID desc )B  where C.uid=@uid", con))
                            {
                                cmd.CommandType = CommandType.Text;
                                cmd.Parameters.AddWithValue("@uid", Session["userid"].ToString());

                             using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                                {
                                    sda.Fill(dt);
                                }
                                con.Open();
                                SqlDataReader sdr = cmd.ExecuteReader();
                                while (sdr.Read())
                                {
                                    CartTotal += Convert.ToInt64(sdr["sellingprice"])* Convert.ToInt64(sdr["qty"]);


                                    rptrCartProducts.DataSource = dt;
                                    rptrCartProducts.DataBind();
                                    divpricedetails.Visible = true;
                                    spanCartTotal.InnerText = ( CartTotal).ToString("c");
                                    dis.InnerText = "+ ( 5 % GST ) " + (((CartTotal) * 5) / 100).ToString("c");
                                    Total = (( CartTotal)) + (((CartTotal) * 5) / 100);
                                    
                                    spanTotal.InnerText = "Rs. " + Total.ToString("c");

                                }
                            }

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

      
        public void BindCartNumber()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select count(Id)  from cart where uid=@uid", con);
                try
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@uid", Session["userid"].ToString());

                    SqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        Int64 ss = Convert.ToInt64(sdr[0]);

                        pCount.InnerText = (ss).ToString();
                    }
                }
                catch (Exception ex)
                {
                    pCount.InnerText = "0";

                }
                /*  if (Request.Cookies["CartPID"] != null)
                  {
                      string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
                      string[] ProductArray = CookiePID.Split(',');
                      int ProductCount = ProductArray.Length;
                      pCount.InnerText = ProductCount.ToString();

                  }
                  else
                  {

                      pCount.InnerText = 0.ToString();
                  }*/
            }
        }
      

        protected void btnRemoveItem_Click(object sender, EventArgs e)
        {
          
            Button btn = (Button)(sender);
            string Ids = btn.CommandArgument;


            try
            {
                SqlConnection con = new SqlConnection(s);
                SqlCommand cmd = new SqlCommand("delete from cart where Id=@id", con);
                SqlDataAdapter sda = new SqlDataAdapter();
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@id", Ids);

                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();

                Response.Redirect("shoppingcart.aspx");

            }
            catch (Exception ex)
            {
                string s = ex.Message;
                Response.Write(s);
            }
        }
        protected override void InitializeCulture()
        {
            CultureInfo ci = new CultureInfo("en-IN");
            ci.NumberFormat.CurrencySymbol = "₹";
            Thread.CurrentThread.CurrentCulture = ci;

            base.InitializeCulture();
        }
    }
}
