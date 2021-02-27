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
            if (!IsPostBack)
            {
                BindProductRepeater();
                //BindBra   
                BindProductDetail1s();
                BindProductImage();
                BindProductDetails();
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
                using (SqlCommand cmd = new SqlCommand("select A.PID,A.status,A.pname,A.length,A.pcode,A.unitprice,A.sellingprice,A.discount,A.pdesc,A.materialcare,B.*,C.*,D.* ,E.* from product A with(nolock) inner join Category B on B.ID =a.category  inner join Brands C on C.Id =A.brand inner join tblSubCategory D on D.SubCategoryID =A.subcategory inner join ProdStock E on E.PID=A.PID where A.PID ='" + PID + "'", con))
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
        private void BindBrand()
    {
        using (SqlConnection con = new SqlConnection(s))
        {
            using (SqlCommand cmd = new SqlCommand("Select * from brands ", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {

                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                //    rptrBrand.DataSource = dt;
                  //  rptrBrand.DataBind();
                }
            }
        }
    }




    protected void women_Click(object sender, EventArgs e)
    {

    }

    protected void men_Click(object sender, EventArgs e)
    {

    }

    protected void kid_Click(object sender, EventArgs e)
    {

    }

    protected void men_DataBinding(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(s))
        {
            using (SqlCommand cmd = new SqlCommand("select A.PID, A.status,A.minlevel, A.pname, A.pcode, A.unitprice, A.sellingprice, A.discount,A.Type,B.Name as ImageName,B.Extension,B.ProID,C.* ,D.*,E.* from Product A inner join Brands C on C.ID = A.brand inner join Category E on E.ID=A.Category inner join ProdStock D on D.PID = A.PID cross apply( select top 1 * from ProdImage B where B.ProID = A.PID order by B.ProID desc )B  where A.Type=@type", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    cmd.Parameters.AddWithValue("@type", "MEN");

                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrProducts.DataSource = dt;
                    rptrProducts.DataBind();
                }
            }
        }
    }

    protected void kids_DataBinding(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(s))
        {
            using (SqlCommand cmd = new SqlCommand("select A.PID, A.status,A.minlevel, A.pname, A.pcode, A.unitprice, A.sellingprice, A.discount,A.Type,B.Name as ImageName,B.Extension,B.ProID,C.* ,D.*,E.* from Product A inner join Brands C on C.ID = A.brand inner join Category E on E.ID=A.Category inner join ProdStock D on D.PID = A.PID cross apply( select top 1 * from ProdImage B where B.ProID = A.PID order by B.ProID desc )B  where A.Type=@type", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    cmd.Parameters.AddWithValue("@type", "Kid's");

                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrProducts.DataSource = dt;
                    rptrProducts.DataBind();
                }
            }
        }
    }

    protected void women_DataBinding(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(s))
        {
            using (SqlCommand cmd = new SqlCommand("select A.PID, A.status,A.minlevel, A.pname, A.pcode, A.unitprice, A.sellingprice, A.discount,A.Type,B.Name as ImageName,B.Extension,B.ProID,C.* ,D.*,E.* from Product A inner join Brands C on C.ID = A.brand inner join Category E on E.ID=A.Category inner join ProdStock D on D.PID = A.PID cross apply( select top 1 * from ProdImage B where B.ProID = A.PID order by B.ProID desc )B  where A.Type=@type", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    cmd.Parameters.AddWithValue("@type", "Women");

                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrProducts.DataSource = dt;
                    rptrProducts.DataBind();
                }
            }
        }
    }

        protected void postrvw_Click(object sender, EventArgs e)
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
            try
            {
                SqlConnection con = new SqlConnection(s);
                SqlCommand cmd = new SqlCommand("insert into tblrating1 (pid,username,usermail,title,ratings,feedback) values (@pid,@username,@usermail,@title,@ratings,@feedback)", con);
                SqlDataAdapter sda = new SqlDataAdapter();
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@username", reviewName.Text);
                cmd.Parameters.AddWithValue("@usermail", reviewEmail.Text);
                cmd.Parameters.AddWithValue("@title", reviewTitle.Text);
                cmd.Parameters.AddWithValue("@pid", PID);

                cmd.Parameters.AddWithValue("@ratings", Rating1.CurrentRating.ToString());
                cmd.Parameters.AddWithValue("@feedback", txtreview.Text);
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
    }

}