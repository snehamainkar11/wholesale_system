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
    public partial class shop : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProductRepeater();
                // BindBrand();
            }
        }

        private void BindProductRepeater()
        {
            Int64 ID = Convert.ToInt64(Request.QueryString["Id"]);

            using (SqlConnection con = new SqlConnection(s))
            {
                using (SqlCommand cmd = new SqlCommand("select  A.PID, A.status, A.pname, A.pcode, A.unitprice, A.sellingprice, A.discount,A.Type,B.Name as ImageName,B.Extension,B.ProID,C.* ,D.*,E.* from Product A inner join Brands C on C.ID = A.brand inner join Category E on E.ID=A.Category inner join ProdStock D on D.PID = A.PID cross apply( select top 1 * from ProdImage B where B.ProID = A.PID order by B.ProID desc )B where E.ID ='" + ID + "'", con))
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


    }
}

        


       