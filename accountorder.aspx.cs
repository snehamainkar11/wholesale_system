using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace wholesale
{
    public partial class accountorder : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProductDetail1s();
                viewDet();
            }
        }
        private void viewDet()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                Int64 id = Convert.ToInt64(Request.QueryString["Id"]);

                using (SqlCommand cmd = new SqlCommand("select C.*,P.*,D.*,I.* from custorderDet C inner join Product  P on C.pid=P.pname inner join Prodstock D on D.PID=P.Pid inner join ProdImage I on I.ProId=P.PID where  C.purid=@id", con))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@id", id);

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
        private void BindProductDetail1s()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                Int64 id = Convert.ToInt64(Request.QueryString["Id"]);

                using (SqlCommand cmd = new SqlCommand("select * from custorder  where Id=@id", con))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@id",id);

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptr.DataSource = dt;
                        rptr.DataBind();
                        Repeater1.DataSource = dt;
                        Repeater1.DataBind();


                    }
                }
            }
        }
    }
}