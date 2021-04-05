using System;
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
    public partial class shoptypes : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // BindBrand();
             
                string types = (Request.QueryString["type"]);
                if (types.ToString() == "Women")
                {
                    womens();
                }
                else if (types.ToString() == "Men")
                {
                    mens();

                }
                else
                {
                    kids();
                }
            }
        }





        protected void mens()
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

        protected void kids()
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

        protected void womens()
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
    }
}



