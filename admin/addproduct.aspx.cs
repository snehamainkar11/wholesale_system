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
    public partial class addproduct : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                BindBrand();
                BindCategory();
               // ddlcategory.SelectedItem.Value= (Session["ddlcategory"]).ToString();


            }
        }
       
        private void BindCategory()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Category", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlcategory.DataSource = dt;
                    ddlcategory.DataTextField = "Category";
                    ddlcategory.DataValueField = "ID";
                    ddlcategory.DataBind();
                    ddlcategory.Items.Insert(0, new ListItem("--Select--", "0"));

                }
            }
        }
        private void BindBrand()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from brands", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlbrand.DataSource = dt;
                    ddlbrand.DataTextField = "brand";
                    ddlbrand.DataValueField = "Id";
                    ddlbrand.DataBind();
                    ddlbrand.Items.Insert(0, new ListItem("--Select--", "0"));

                }
            }
        }
        
        protected void ddlcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
       
           // int MainCategoryID = Convert.ToInt32(ddlcategory.SelectedItem.Value);
           // Session["ddlcategory"] = ddlcategory.SelectedItem.Value;
            using (SqlConnection con = new SqlConnection(s))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblSubCategory where MainCatID='" + ddlcategory.SelectedItem.Value + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlsubcat.DataSource = dt;
                    ddlsubcat.DataTextField = "SubCatName";
                    ddlsubcat.DataValueField = "SubCategoryID";
                    ddlsubcat.DataBind();
                    ddlsubcat.Items.Insert(0, new ListItem("--Select--", "0"));

                }
               else
                {
                    ddlsubcat.Items.Clear();
                    ddlsubcat.DataSource = dt;
                    ddlsubcat.DataTextField = "SubCatName";
                    ddlsubcat.DataValueField = "SubCategoryID";
                    ddlsubcat.DataBind();
                    ddlsubcat.Items.Insert(0, new ListItem("NA", "0"));

                }
            }
        }

        protected void ddlsubcat_SelectedIndexChanged(object sender, EventArgs e)
        {
          
        }




        protected void btnadd_Click(object sender, EventArgs e)
        {

            string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("sp_InsertProduct", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@pcode", prodcode.Text);
                cmd.Parameters.AddWithValue("@Pname", prodname.Text);
                cmd.Parameters.AddWithValue("@type", ddltype.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@brand", ddlbrand.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@category", ddlcategory.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@subcategory", ddlsubcat.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@pdesc", desc.Text);
                cmd.Parameters.AddWithValue("@unitprice", unitprc.Text);
                cmd.Parameters.AddWithValue("@sellingprice", sellingprc.Text);
                cmd.Parameters.AddWithValue("@discount", discount.Text);
                cmd.Parameters.AddWithValue("@status",ddlstatus.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@materialcare", materialcare.Text);
                cmd.Parameters.AddWithValue("@length", ddllength.Text);
                cmd.Parameters.AddWithValue("@level", minlevel.Text);
                cmd.Parameters.AddWithValue("@mfg", ddt.Text);

                try
                {
                 con.Open();
                    
                   
                    Int64 PID = Convert.ToInt64(cmd.ExecuteScalar());
                   
                       
                            int sizeid = Convert.ToInt32(size.Text);
                            int Quantity = Convert.ToInt32(quantity.Text);
                            String  clr = (ddlcolor.SelectedItem.Text);

                    SqlCommand cmd2 = new SqlCommand("insert into ProdStock values('" + PID + "','" + sizeid + "','" + Quantity + "','" + clr + "')", con);
                            cmd2.ExecuteNonQuery();


                    if (fuImg01.HasFile)
                    {
                        string SavePath = Server.MapPath("~/Products/") + PID;
                        if (!Directory.Exists(SavePath))
                        {
                            Directory.CreateDirectory(SavePath);

                        }
                        string Extention = Path.GetExtension(fuImg01.PostedFile.FileName);
                        fuImg01.SaveAs(SavePath + "\\" + prodname.Text.ToString().Trim() + "01" + Extention);


                        SqlCommand cmd3 = new SqlCommand("insert into prodImage values('" + PID + "','" + prodname.Text.ToString().Trim() + "01" + "','" + Extention + "')", con);
                        cmd3.ExecuteNonQuery();


                    }

                    /*
                    if (fuImg02.HasFile)
                    {
                        string SavePath = Server.MapPath("~/Products/") + PID;
                        if (!Directory.Exists(SavePath))
                        {
                            Directory.CreateDirectory(SavePath);

                        }
                        string Extention = Path.GetExtension(fuImg02.PostedFile.FileName);
                        fuImg02.SaveAs(SavePath + "\\" + prodname.Text.ToString().Trim() + "02" + Extention);


                        SqlCommand cmd3 = new SqlCommand("insert into prodImage values('" + PID + "','" + prodname.Text.ToString().Trim() + "02" + "','" + Extention + "')", con);
                        cmd3.ExecuteNonQuery();
                    }
                    if (fuImg03.HasFile)
                    {
                        string SavePath = Server.MapPath("~/Products/") + PID;
                        if (!Directory.Exists(SavePath))
                        {
                            Directory.CreateDirectory(SavePath);

                        }
                        string Extention = Path.GetExtension(fuImg03.PostedFile.FileName);
                        fuImg03.SaveAs(SavePath + "\\" + prodname.Text.ToString().Trim() + "03" + Extention);


                        SqlCommand cmd3 = new SqlCommand("insert into prodImage values('" + PID + "','" + prodname.Text.ToString().Trim() + "03" + "','" + Extention + "')", con);
                        cmd3.ExecuteNonQuery();
                    }
                    if (fuImg04.HasFile)
                    {
                        string SavePath = Server.MapPath("~/Products/") + PID;
                        if (!Directory.Exists(SavePath))
                        {
                            Directory.CreateDirectory(SavePath);

                        }
                        string Extention = Path.GetExtension(fuImg04.PostedFile.FileName);
                        fuImg04.SaveAs(SavePath + "\\" + prodname.Text.ToString().Trim() + "04" + Extention);


                        SqlCommand cmd3 = new SqlCommand("insert into prodImage values('" + PID + "','" + prodname.Text.ToString().Trim() + "04" + "','" + Extention + "')", con);
                        cmd3.ExecuteNonQuery();
                    }*/
                    Response.Redirect("~/admin/product.aspx");
                }
                catch (Exception ex)
                {
                    lblSuccessMessage.Text = "";
                    lblErrorMessage.Text = ex.Message;
                }

            }

        }
    }
}