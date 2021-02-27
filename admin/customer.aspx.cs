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
    public partial class customer : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridview();
            }
        }

        void PopulateGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(s))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Customer", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvcust.DataSource = dtbl;
                gvcust.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvcust.DataSource = dtbl;
                gvcust.DataBind();
                gvcust.Rows[0].Cells.Clear();
                gvcust.Rows[0].Cells.Add(new TableCell());
                gvcust.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvcust.Rows[0].Cells[0].Text = "No Data Found ..!";
                gvcust.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }
        protected void gvcust_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvcust.EditIndex = -1;
            PopulateGridview();
            panel1.Visible = false;

        }

        protected void gvcust_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM Customer WHERE Cid = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvcust.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    PopulateGridview();
                    panel1.Visible = true;

                    lblSuccessMessage.Text = "Selected Record Deleted";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void gvcust_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvcust.EditIndex = e.NewEditIndex;
            PopulateGridview();
            panel1.Visible = false;

        }

        protected void gvcust_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    sqlCon.Open();
                    string query = "UPDATE Customer SET cname=@FirstName,gstno=@LastName,Contact=@Contact,address=@Email WHERE Cid = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@FirstName", (gvcust.Rows[e.RowIndex].FindControl("txtname") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@LastName", (gvcust.Rows[e.RowIndex].FindControl("txtgst") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Contact", (gvcust.Rows[e.RowIndex].FindControl("txtcontact") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Email", (gvcust.Rows[e.RowIndex].FindControl("txtaddress") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvcust.DataKeys[e.RowIndex].Value.ToString()));

                    sqlCmd.ExecuteNonQuery();
                    gvcust.EditIndex = -1;
                    PopulateGridview();
                    panel1.Visible = true;
                    lblSuccessMessage.Text = "Selected Record Updated";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void gvcust_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(s))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO Customer (cname,gstno,contact,address) VALUES (@FirstName,@LastName,@Contact,@Email)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@FirstName", (gvcust.FooterRow.FindControl("txtname1") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@LastName", (gvcust.FooterRow.FindControl("txtgst1") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Contact", (gvcust.FooterRow.FindControl("txtcontact1") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Email", (gvcust.FooterRow.FindControl("txtaddress1") as TextBox).Text.Trim());
                        sqlCmd.ExecuteNonQuery();

                        PopulateGridview();
                        panel1.Visible = true;

                        lblSuccessMessage.Text = "Customer Added Successfully";
                        lblErrorMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }


        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        private void exportpdf()
        {

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=customer.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            panel12.RenderControl(hw);
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
        private Stream GenerateStreamFromString(string s)
        {
            var stream = new MemoryStream();
            var writer = new StreamWriter(stream);
            writer.Write(s);
            writer.Flush();
            stream.Position = 0;
            return stream;
        }
        protected void print_Click(object sender, EventArgs e)
        {
            this.exportpdf();

        }

        protected void excel_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.AppendHeader("content-disposition", "attachment; filename=customer.xls");
            Response.ContentType = "application/excel";
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);
            gvcust.HeaderRow.Style.Add("background-color", "#FFFFFF");
            gvcust.RenderControl(htw);
            Response.Write(stringWriter.ToString());
            Response.End();
        }

     
    }

}

