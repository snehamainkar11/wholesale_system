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

namespace wholesale.admin
{
    public partial class vieworder : System.Web.UI.Page
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
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        private void exportpdf()
        {
            Int64 orderno = Convert.ToInt64(Request.QueryString["orderno"]);

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename="+orderno+".pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            panel1.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }

        protected void print_Click(object sender, EventArgs e)
        {
            this.exportpdf();
        }
        private void BindDetails()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                String orderno = (Request.QueryString["orderno"]);

                using (SqlCommand cmd = new SqlCommand("select M.* ,C.* from sales M inner join Customer C on M.cid=C.cid where orderno ='" + orderno + "'", con))
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