using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace wholesale
{
    public partial class proddetails : System.Web.UI.Page
    {
        public static String s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["PID"] != null)
            {
                if (!IsPostBack)
                {
                    BindProductImage();
                    BindProductDetails();
                

                }
            }
            else
            {
                Response.Redirect("~/Product.aspx");
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
                        rptrProductDetails.DataSource = dt;
                        rptrProductDetails.DataBind();

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


        protected void btnadd_Click(object sender, EventArgs e)
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);

            foreach (RepeaterItem item in rptrProductDetails.Items)
            {
                var txtqty = item.FindControl("qty") as TextBox;
               
                    using (SqlConnection conn = new SqlConnection(s))
                    {
                        SqlCommand cmd = new SqlCommand(@"UPDATE prodStock SET quantity = @quantity WHERE PID = @CID", conn);
                        cmd.Parameters.Add(new SqlParameter("@quantity", int.Parse(txtqty.Text)));
                        cmd.Parameters.Add(new SqlParameter("@CID",PID));
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Quantity Updated Successfully')", true);

                }
                Response.Redirect("productlist.aspx");

            }
        }
    }
}