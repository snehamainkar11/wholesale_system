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

using System.Configuration;
namespace wholesale
{
    public partial class printpurchase : System.Web.UI.Page
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
                String orderno = (Request.QueryString["po"]);

                using (SqlCommand cmd = new SqlCommand("select M.* ,C.* from Porder M inner join Supplier C on M.sid=C.supid where po ='" + orderno + "'", con))
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