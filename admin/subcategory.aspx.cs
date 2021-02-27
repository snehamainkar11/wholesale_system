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
    public partial class subcategory : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMainCat();
                PopulateGridview();
            }
           
        }

    

    protected void PopulateGridview()
    {
        DataTable dtbl = new DataTable();
        using (SqlConnection sqlCon = new SqlConnection(s))
        {
            sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("select A.*, B.* from tblSubCategory A inner join Category B on B.ID = A.MainCatID   ", sqlCon);
            sqlDa.Fill(dtbl);
        }
        if (dtbl.Rows.Count > 0)
        {
            gvsubcat.DataSource = dtbl;
            gvsubcat.DataBind();
        }
        else
        {
            dtbl.Rows.Add(dtbl.NewRow());
            gvsubcat.DataSource = dtbl;
            gvsubcat.DataBind();
            gvsubcat.Rows[0].Cells.Clear();
            gvsubcat.Rows[0].Cells.Add(new TableCell());
            gvsubcat.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
            gvsubcat.Rows[0].Cells[0].Text = "No Data Found ..!";
            gvsubcat.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
        }

    }

    private void BindMainCat()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Category", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlcat.DataSource = dt;
                    ddlcat.DataTextField = "Category";
                    ddlcat.DataValueField = "ID";
                    ddlcat.DataBind();
                    ddlcat.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-Select-", "0"));

                }




            }
        }
        protected void addsubcategory_Click(object sender, EventArgs e)
        {

            if (txtsubcat.Text != "" && ddlcat.SelectedItem.Text!="")
            {
                string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
                using (SqlConnection con = new SqlConnection(s))
                {

                    SqlCommand cmd = new SqlCommand("insert into TblSubCategory (SubCatName, MainCatID) values (@subcategory, @categoryID)", con);
                    cmd.Parameters.AddWithValue("subcategory", txtsubcat.Text);
                    cmd.Parameters.AddWithValue("categoryID", ddlcat.SelectedItem.Value);
                    panel.Visible = true;
                    try
                    {
                        con.Open();
                        int value = (int)cmd.ExecuteNonQuery();

                        if (value == 1)
                        {
                            panel.Visible = true;
                            panel1.Visible = false;

                            lblSuccessMessage.Text = "Record Added Successfully!!";
                            lblErrorMessage.Text = "";
                            txtsubcat.Text = "";
                            PopulateGridview();
                        }
                        ddlcat.ClearSelection();
                        ddlcat.Items.FindByValue("0").Selected = true;

                    }
                    catch (Exception ex)
                    {
                        panel.Visible = false;

                        lblSuccessMessage.Text = "";
                        lblErrorMessage.Text = ex.Message;
                    }

                }
            }
            else
            {
                panel1.Visible = true;
                panel.Visible = false;

                lblErrorMessage.Text = "Please Enter a Details";
            }
        }

        protected void BindGrid()
        {
            gvsubcat.DataSource = ViewState["dt"] as DataTable;
            gvsubcat.DataBind();
        }




        protected void gvsubcat_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

        protected void gvsubcat_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    sqlCon.Open();
                    string query = "UPDATE tblsubcategory SET subcatname=@subcatname WHERE SubcategoryID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@subcatname", (gvsubcat.Rows[e.RowIndex].FindControl("txtsubcat1") as TextBox).Text.Trim());
                  
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvsubcat.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    panel.Visible = true;

                    gvsubcat.EditIndex = -1;
                    PopulateGridview();
                    panel1.Visible = false;

                    lblSuccessMessage.Text = "Record Updated Successfully ";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                panel1.Visible = true;
                panel.Visible = false;

                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void gvsubcat_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM tblSubCategory WHERE SubcategoryID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvsubcat.DataKeys[e.RowIndex].Value.ToString()));
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

        protected void gvsubcat_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvsubcat.EditIndex = e.NewEditIndex;
            PopulateGridview();
        }

        protected void gvsubcat_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvsubcat.EditIndex = -1;
            PopulateGridview();
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
            gvsubcat.HeaderRow.Style.Add("background-color", "#FFFFFF");
            gvsubcat.RenderControl(htw);
            Response.Write(stringWriter.ToString());
            Response.End();
        }



     
    }

}

