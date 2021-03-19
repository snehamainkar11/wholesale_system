using System;
using System.Web;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;
using System.Web.UI;
namespace wholesale.admin
{
    public partial class custorder : System.Web.UI.Page
    {
        public static String s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // BindProductImage();
                BindDetails();

            }
        }
        private void BindDetails()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                String pid = (Request.QueryString["Id"]);

                using (SqlCommand cmd = new SqlCommand("select * from custorder where Id ='" + pid + "'", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptr.DataSource = dt;
                        rptr.DataBind();

                    }
                }
            }
        }
    }
}
