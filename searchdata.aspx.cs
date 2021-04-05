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
    public partial class searchdata : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              

                if (Session["search"] == null)
                {
                    Session["search"] = "Formal";
                    //  searchdata();

                }
                else
                {
                    searchdataa();
                    Response.Write(Session["search"].ToString());
                }


            }
        }

        private void searchdataa()
        {
            string a = Request.QueryString["search"];

            using (SqlConnection con = new SqlConnection(s))
            {
                using (SqlCommand cmd = new SqlCommand("select  A.PID, A.status, A.pname, A.pcode, A.unitprice, A.sellingprice, A.discount,A.Type,B.Name as ImageName,B.Extension,B.ProID,C.* ,D.*,E.* from Product A inner join Brands C on C.ID = A.brand inner join Category E on E.ID=A.Category inner join ProdStock D on D.PID = A.PID cross apply( select top 1 * from ProdImage B where B.ProID = A.PID order by B.ProID desc )B where A.pname like '%" + a.ToString() + "%' or E.Category Like '%" + a.ToString() + "%'", con))
                {
                    cmd.CommandType = CommandType.Text;

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtBrands = new DataTable();
                        sda.Fill(dtBrands);
                        rptrProducts.DataSource = dtBrands;
                        rptrProducts.DataBind();
                    }

                }
            }
        }


    }
}




