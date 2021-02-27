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
    public partial class Category : System.Web.UI.Page
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

        protected void addCategory_Click(object sender, EventArgs e)
        {
            if (txtCategory.Text != "")
            {
                string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
                using (SqlConnection con = new SqlConnection(s))
                {

                    SqlCommand cmd = new SqlCommand("insert into Category (Category, status,description) values (@Category, @status,@description)", con);
                    cmd.Parameters.AddWithValue("Category", txtCategory.Text);
                    cmd.Parameters.AddWithValue("status", status.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("description", txtDesc.Text);
                    panel.Visible = true;
                    try
                    {
                        con.Open();
                        int value = (int)cmd.ExecuteNonQuery();

                        if (value == 1)
                        {

                            lblSuccessMessage.Text = "Record Added Successfully!!";
                            lblErrorMessage.Text = "";
                            txtCategory.Text = "";
                            txtDesc.Text = "";
                            PopulateGridview();


                        }

                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }

                }
            }
            else {
                panel1.Visible = true;
                panel.Visible = false;

                lblErrorMessage.Text = "Please Enter Category";
            }
        }

        void PopulateGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(s))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("Select * from Category  ", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvCategory.DataSource = dtbl;
                gvCategory.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvCategory.DataSource = dtbl;
                gvCategory.DataBind();
                gvCategory.Rows[0].Cells.Clear();
                gvCategory.Rows[0].Cells.Add(new TableCell());
                gvCategory.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvCategory.Rows[0].Cells[0].Text = "No Data Found ..!";
                gvCategory.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }
        protected void BindGrid()
        {
            gvCategory.DataSource = ViewState["dt"] as DataTable;
            gvCategory.DataBind();
        }
         protected void gvCategory_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCategory.EditIndex = e.NewEditIndex;
            PopulateGridview();
        }

        protected void gvCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM Category WHERE ID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvCategory.DataKeys[e.RowIndex].Value.ToString()));
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

        protected void gvCategory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCategory.EditIndex = -1;
            PopulateGridview();
        }

        protected void gvCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    sqlCon.Open();
                    string query = "UPDATE Category SET Category=@Category,status=@status,description=@description WHERE ID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@Category", (gvCategory.Rows[e.RowIndex].FindControl("txtcategory1") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@status", (gvCategory.Rows[e.RowIndex].FindControl("txtstatus1") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@description", (gvCategory.Rows[e.RowIndex].FindControl("txtdesc1") as TextBox).Text.Trim());

                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvCategory.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gvCategory.EditIndex = -1;
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
            Response.AddHeader("content-disposition", "attachment;filename=category.pdf");
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
            Response.AppendHeader("content-disposition", "attachment; filename=category.xls");
            Response.ContentType = "application/excel";
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);
            gvCategory.HeaderRow.Style.Add("background-color", "#FFFFFF");
            gvCategory.RenderControl(htw);
            Response.Write(stringWriter.ToString());
            Response.End();
        }




    }
}


