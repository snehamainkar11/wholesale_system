using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace wholesale
{
    public partial class Checkout : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
        private RadioButton selectedRadioButton;

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie usercookie = Request.Cookies["user_cookies"];
            if (Session["userid"] != null || usercookie != null)
            {

                link_loginout.Text = "Log out";

              //  Label2.Text = "Welcome </br>" + Session["userid"].ToString();
                BindProductCart();
                BindCartNumber();
            }
            else
            {
                Response.Redirect("~/login.aspx");

                link_loginout.Text = "Log in";

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


        private void BindProductCart()
        {


            DataTable dt = new DataTable();
            Int64 CartTotal = 0;
            Int64 Total = 0;
            Int64 ship = 0;
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd1 = new SqlCommand("select count(Id)  from cart where uid=@uid", con);
                con.Open();
                cmd1.Parameters.AddWithValue("@uid", Session["userid"].ToString());

                SqlDataReader sdr1 = cmd1.ExecuteReader();
                while (sdr1.Read())
                {
                    Int64 ss = Convert.ToInt64(sdr1[0]);

                    h4Noitems.InnerText = "Order Items (" + (ss).ToString() + ")";

                    if (ss == 0)
                    {
                        h4Noitems.InnerText = "Order Items (0) ";
                        divpricedetails.Visible = false;

                    }

                }
            }

            using (SqlConnection con = new SqlConnection(s))
            {

                using (SqlCommand cmd = new SqlCommand("select A.PID, A.pname,  A.unitprice, A.sellingprice, A.discount,B.*,C.* ,D.color,D.PID from Product A  inner join Cart C on C.Pid = A.PID inner join ProdStock D on D.PID=A.PID cross apply( select top 1 * from ProdImage B where B.ProID = A.PID order by B.ProID desc )B  where C.uid=@uid ", con))
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
                        CartTotal += Convert.ToInt64(sdr["sellingprice"]) * Convert.ToInt64(sdr["qty"]);
                        shipped.Text = "0".ToString();

                        rptrCartProducts.DataSource = dt;
                        rptrCartProducts.DataBind();
                        divpricedetails.Visible = true;
                        spanCartTotal.Text = (CartTotal).ToString();
                        dis.Text = (((CartTotal) * 5) / 100).ToString();
                        ship = Convert.ToInt64(shipped.Text);
                        Total = ((CartTotal)) + (((CartTotal) * 5) / 100) + ship;

                        spanTotal.Text = Total.ToString();







                    }
                }

            }



        }





        protected void order_Click(object sender, EventArgs e)
        {
            string USERID = Session["userid"].ToString();
            string PaymentType = "COD";
            string PaymentStatus = "Not Paid";


            string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("insert into custorder values(@cid,@fname,@lname,@email,@ad1,@ad2,@city,@zip,@contact,@note,@paymode,@odate,@paystatus,@total,@shippcharge,@tax,@grand,@shipstatus)", con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@cid", USERID.ToString());
                cmd.Parameters.AddWithValue("@fname", checkoutBillingFirstName.Text);
                cmd.Parameters.AddWithValue("@lname", checkoutBillingLastName.Text);
                cmd.Parameters.AddWithValue("@email", checkoutBillingEmail.Text);
                cmd.Parameters.AddWithValue("@ad1", checkoutBillingAddress.Text);
                cmd.Parameters.AddWithValue("@ad2", checkoutBillingAddressTwo.Text);
                cmd.Parameters.AddWithValue("@city", checkoutBillingTown.Text);
                cmd.Parameters.AddWithValue("@zip", checkoutBillingZIP.Text);
                cmd.Parameters.AddWithValue("@contact", checkoutBillingPhone.Text);
                cmd.Parameters.AddWithValue("@note", note.Text);
                cmd.Parameters.AddWithValue("@paymode", PaymentType);
                cmd.Parameters.AddWithValue("@odate", DateTime.Now);
                cmd.Parameters.AddWithValue("@paystatus", PaymentStatus);
                cmd.Parameters.AddWithValue("@total", spanCartTotal.Text);
                cmd.Parameters.AddWithValue("@shippcharge", shipped.Text);
                cmd.Parameters.AddWithValue("@tax", dis.Text);
                cmd.Parameters.AddWithValue("@grand", spanTotal.Text);
                cmd.Parameters.AddWithValue("@shipstatus", "Order Placed");

                con.Open();
                cmd.ExecuteNonQuery();
                using (SqlConnection con11 = new SqlConnection(s))
                {
                    SqlCommand cmd11 = new SqlCommand("select Max(Id)  from custorder", con11);

                    con11.Open();
                    SqlDataReader sdr = cmd11.ExecuteReader();
                    while (sdr.Read())
                    {
                        Int64 ss = Convert.ToInt64(sdr[0]);

                        Int32 purid = Convert.ToInt32(ss);

                        //con11.Close();

                        foreach (RepeaterItem item in rptrCartProducts.Items)
                        {
                            Label pname = item.FindControl("pname") as Label;
                            Label qty = item.FindControl("qty") as Label;
                            HiddenField prc = item.FindControl("prc") as HiddenField;

                            string pid = pname.Text;
                            using (SqlConnection con1 = new SqlConnection(s))
                            {
                                SqlCommand cmd1 = new SqlCommand("insert into custorderDet values(@pid,@qty,@prc,@purid)", con1);
                                cmd1.CommandType = CommandType.Text;
                                cmd1.Parameters.AddWithValue("@pid", pid.ToString());
                                cmd1.Parameters.AddWithValue("@qty", qty.Text);
                                cmd1.Parameters.AddWithValue("@prc", prc.Value);
                                cmd1.Parameters.AddWithValue("@purid", purid);

                                con1.Open();
                                cmd1.ExecuteNonQuery();
                            }
                            using (SqlConnection cono = new SqlConnection(s))
                            {
                                SqlCommand cmd1 = new SqlCommand("update Prodstock set ProdStock.quantity=ProdStock.quantity-@quantity from  Product inner join Prodstock  on Product.PID=ProdStock.PID where Product.pname=@id", cono);
                                cmd1.Parameters.AddWithValue("@id", pid.ToString());
                                cmd1.Parameters.AddWithValue("@quantity", qty.Text);
                                cono.Open();
                                cmd1.ExecuteNonQuery();
                                // con1.Close();

                            }
                            using (SqlConnection con12 = new SqlConnection(s))
                            {
                                SqlCommand cmd1 = new SqlCommand("delete from cart where uid=@uid", con12);
                                cmd1.CommandType = CommandType.Text;
                               cmd1.Parameters.AddWithValue("@uid", Session["userid"].ToString());

                                con12.Open();
                                cmd1.ExecuteNonQuery();
                            }
                        }
                        Response.Redirect("ordercomplete.aspx?ID=" + purid);

                    }
                }



            }
        }

    }

}