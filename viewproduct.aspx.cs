using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using AjaxControlToolkit;

namespace wholesale
{
    public partial class viewproduct : System.Web.UI.Page
    { 
   string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie usercookie = Request.Cookies["user_cookies"];
            if (Session["userid"] != null || usercookie != null)
            {

                //link_loginout.Text = "Log out";

                //Label2.Text = "Welcome </br>" + Session["userid"].ToString();
                BindCartNumber();
                if (!IsPostBack)
                {
                    BindProductRepeater();
                    Reviews();
                    BindProductDetail1s();
                    BindProductImage();
                    BindProductDetails();
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
                 
                      pCount.InnerText = 0.ToString();
                  }*/
            }
        }
        private void Reviews()
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
            using (SqlConnection con = new SqlConnection(s))
            {
                using (SqlCommand cmd = new SqlCommand("select ISNULL(AVG(Ratings), 0) AverageRating from tblrating1 where pid ='" + PID + "'", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptr1.DataSource = dt;
                        rptr1.DataBind();
                        Repeater3.DataSource = dt;
                        Repeater3.DataBind();
                    }
                }
            }
            using (SqlConnection con = new SqlConnection(s))
            {
                using (SqlCommand cmd = new SqlCommand("select * from tblrating1 where pid ='" + PID + "'", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        Repeater4.DataSource = dt;
                        Repeater4.DataBind();

                    }
                }
            }
        }
        private void BindProductImage()
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
            using (SqlConnection con = new SqlConnection(s))
            {
                using (SqlCommand cmd = new SqlCommand("select * from prodImage where ProID='" + PID + "'", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrImage.DataSource = dt;
                        rptrImage.DataBind();
                    }
                }
            }
        }

        private void BindProductRepeater()
    {
            using (SqlConnection con = new SqlConnection(s))
            {
                using (SqlCommand cmd = new SqlCommand("select top 3 A.PID, A.status, A.pname, A.pcode, A.unitprice, A.sellingprice, A.discount,A.Type,B.Name as ImageName,B.Extension,B.ProID,C.* ,D.*,E.* from Product A inner join Brands C on C.ID = A.brand inner join Category E on E.ID=A.Category inner join ProdStock D on D.PID = A.PID cross apply( select top 1 * from ProdImage B where B.ProID = A.PID order by B.ProID desc )B ", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {

                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrProducts.DataSource = dt;
                        rptrProducts.DataBind();
                    }
                }
            }
            }
        private void BindProductDetails()
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
            using (SqlConnection con = new SqlConnection(s))
            {
                using (SqlCommand cmd = new SqlCommand("select  A.PID,A.status,A.pname,A.length,A.pcode,A.unitprice,A.sellingprice,A.discount,A.pdesc,A.materialcare,B.*,C.*,D.* ,E.* from product A with(nolock) inner join Category B on B.ID =a.category  inner join Brands C on C.Id =A.brand inner join tblSubCategory D on D.SubCategoryID =A.subcategory inner join ProdStock E on E.PID=A.PID where A.PID ='" + PID + "'", con))
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
            }
        }
        private void BindProductDetail1s()
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
            using (SqlConnection con = new SqlConnection(s))
            {
                using (SqlCommand cmd = new SqlCommand("select A.PID,A.status,A.pname,A.length,A.pcode,A.unitprice,A.sellingprice,A.discount,A.pdesc,A.materialcare,B.*,C.*,D.* ,E.* from product A with(nolock) inner join Category B on B.ID =a.category  inner join Brands C on C.Id =A.brand inner join tblSubCategory D on D.SubCategoryID =A.subcategory inner join ProdStock E on E.PID=A.PID where A.PID ='" + PID + "'", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        Repeater2.DataSource = dt;
                        Repeater2.DataBind();

                    }
                }
            }
        }
        protected void ButtonAddtoCart_Click(object sender, EventArgs e)
        {
            string SelectedSize = string.Empty;
            string quantity = string.Empty;
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);

            foreach (RepeaterItem item in Repeater1.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    var rbList = item.FindControl("rblSize") as RadioButtonList;
                    var qty = item.FindControl("quantity") as DropDownList;

                    SelectedSize = rbList.SelectedValue;
                    quantity = qty.SelectedItem.Text;
                    var lblError = item.FindControl("lblError") as Label;
                    lblError.Text = "";
                    try
                    {
                        SqlConnection con = new SqlConnection(s);
                        SqlCommand cmd = new SqlCommand("insert into cart values (@username,@pid,@qty,@size)", con);
                        SqlDataAdapter sda = new SqlDataAdapter();
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@username", Session["userid"].ToString());
                        cmd.Parameters.AddWithValue("@qty", quantity);
                        cmd.Parameters.AddWithValue("@size", SelectedSize);
                        cmd.Parameters.AddWithValue("@pid", PID);

                        cmd.Connection = con;
                        con.Open();
                       cmd.ExecuteNonQuery();
                        //Int64 cid= Convert.ToInt64(cmd.ExecuteScalar());
                     
                       
                    }
                    catch (Exception ex)
                    {
                        string s = ex.Message;
                        Response.Write(s);
                    }
                }
            }

         
            Response.Redirect("~/shoppingcart.aspx");



        }




        protected void postrvw_Click(object sender, EventArgs e)
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
            try
            {
                SqlConnection con = new SqlConnection(s);
                SqlCommand cmd = new SqlCommand("insert into tblrating1 (pid,username,usermail,title,ratings,feedback,rdate) values (@pid,@username,@usermail,@title,@ratings,@feedback,@date)", con);
                SqlDataAdapter sda = new SqlDataAdapter();
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@username", reviewName.Text);
                cmd.Parameters.AddWithValue("@usermail", reviewEmail.Text);
                cmd.Parameters.AddWithValue("@title", reviewTitle.Text);
                cmd.Parameters.AddWithValue("@pid", PID);

                cmd.Parameters.AddWithValue("@ratings", Rating1.CurrentRating.ToString());
                cmd.Parameters.AddWithValue("@feedback", txtreview.Text);
                cmd.Parameters.AddWithValue("@date", DateTime.Now);

                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                //con.Close();
                Response.Redirect("shop.aspx");

            }
            catch (Exception ex)
            {
                string s = ex.Message;
                Response.Write(s);
            }
        }
          protected void ButtonAddtoWishlist_Click(object sender, EventArgs e)
        {
            string SelectedSize = string.Empty;
            string quantity = string.Empty;
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);

            foreach (RepeaterItem item in Repeater1.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    var rbList = item.FindControl("rblSize") as RadioButtonList;
                    var qty = item.FindControl("quantity") as DropDownList;

                    SelectedSize = rbList.SelectedValue;
                    quantity = qty.SelectedItem.Text;
                    var lblError = item.FindControl("lblError") as Label;
                    lblError.Text = "";
                    try
                    {
                        SqlConnection con = new SqlConnection(s);
                        SqlCommand cmd = new SqlCommand("insert into wishlist1 values (@username,@qty,@size,@pid)", con);
                        SqlDataAdapter sda = new SqlDataAdapter();
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@username", Session["userid"].ToString());
                        cmd.Parameters.AddWithValue("@qty", quantity);
                        cmd.Parameters.AddWithValue("@size", SelectedSize);
                        cmd.Parameters.AddWithValue("@pid", PID);

                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        //Int64 cid= Convert.ToInt64(cmd.ExecuteScalar());


                    }
                    catch (Exception ex)
                    {
                        string s = ex.Message;
                        Response.Write(s);
                    }
                }
            }


            Response.Redirect("~/wishlist.aspx");



        }


    }

}