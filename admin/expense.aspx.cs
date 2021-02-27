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

namespace wholesale
{
    public partial class expense : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //  BindMainCat();
                PopulateGridview();
            }
        }
       
        void PopulateGridview()
        {
            Int32 grandtotal = 0;

            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(s))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("Select * from Expense  ", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvExpense.DataSource = dtbl;
                gvExpense.DataBind();
                gvExpense.FooterRow.Cells[5].Text = "Total :";
                gvExpense.FooterRow.Cells[6].Text = dtbl.Compute("Sum(eamt)", "").ToString() + "  Rs";
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvExpense.DataSource = dtbl;
                gvExpense.DataBind();
                gvExpense.Rows[0].Cells.Clear();
                gvExpense.Rows[0].Cells.Add(new TableCell());
                gvExpense.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvExpense.Rows[0].Cells[0].Text = "No Data Found ..!";
                gvExpense.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }
        protected void BindGrid()
        {
            gvExpense.DataSource = ViewState["dt"] as DataTable;
            gvExpense.DataBind();
        }

        protected void gvExpense_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvExpense.EditIndex = e.NewEditIndex;
            PopulateGridview();
        }

        protected void gvExpense_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM Expense WHERE ID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvExpense.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    panel.Visible = true;
                    panel1.Visible = false;

                    PopulateGridview();

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

        protected void gvExpense_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvExpense.EditIndex = -1;
            PopulateGridview();
        }

        protected void gvExpense_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    sqlCon.Open();
                    string query = "UPDATE Expense SET ecode=@ecode,ename=@ename,edate=@edate,ecompany=@ecompany,eamt=@eamt,ecategory=@ecategory,pstatus=@pstatus WHERE ID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@ecode", (gvExpense.Rows[e.RowIndex].FindControl("ecode") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ename", (gvExpense.Rows[e.RowIndex].FindControl("ename") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@edate", (gvExpense.Rows[e.RowIndex].FindControl("edate") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ecompany", (gvExpense.Rows[e.RowIndex].FindControl("ecompany") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@eamt", (gvExpense.Rows[e.RowIndex].FindControl("eamt") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ecategory", (gvExpense.Rows[e.RowIndex].FindControl("ecategory") as DropDownList).SelectedValue.Trim());
                    sqlCmd.Parameters.AddWithValue("@pstatus", (gvExpense.Rows[e.RowIndex].FindControl("pstatus") as DropDownList).SelectedValue.Trim());

                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvExpense.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gvExpense.EditIndex = -1;
                    PopulateGridview();
                    panel.Visible = true;
                    panel1.Visible = false;

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




       

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        private void exportpdf()
        {

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=expense.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            panel11.RenderControl(hw);
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
            Response.AppendHeader("content-disposition", "attachment; filename=expense.xls");
            Response.ContentType = "application/excel";
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);
            gvExpense.HeaderRow.Style.Add("background-color", "#FFFFFF");
            gvExpense.RenderControl(htw);
            Response.Write(stringWriter.ToString());
            Response.End();
        }

       
    }

}


