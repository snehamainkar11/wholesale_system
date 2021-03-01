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
    public partial class brand : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridview();
            }
        }

        protected void addbrand_Click(object sender, EventArgs e)
        {
            if (txtbrand.Text != "")
            {


                string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
                using (SqlConnection con = new SqlConnection(s))
                {



                    try
                    {
                        string Extention;
                        if (fuImg01.HasFile)
                        {
                            string SavePath = Server.MapPath("~/Brands/");
                            if (!Directory.Exists(SavePath))
                            {
                                Directory.CreateDirectory(SavePath);

                            }
                            Extention = Path.GetExtension(fuImg01.PostedFile.FileName);
                            fuImg01.SaveAs(SavePath + "\\" + txtbrand.Text.ToString().Trim() + Extention);


                            SqlCommand cmd = new SqlCommand("insert into brands (brand, status,imageurl) values (@brand, @status,@imageurl)", con);
                            cmd.Parameters.AddWithValue("brand", txtbrand.Text);
                            cmd.Parameters.AddWithValue("status", status.SelectedItem.Text);
                            cmd.Parameters.AddWithValue("imageurl", txtbrand.Text + Extention);

                            con.Open();
                            int value = (int)cmd.ExecuteNonQuery();



                            if (value == 1)
                            {
                                PopulateGridview();
                                panel.Visible = true;
                                lblSuccessMessage.Text = "Record Added Successfully!!";
                                lblErrorMessage.Text = "";
                                txtbrand.Text = "";

                            }

                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }

                }
            }
            else
            { 
                panel1.Visible = true;
                panel.Visible = false;

                lblErrorMessage.Text = "Please Enter Brand";
            }
        }

        void PopulateGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(s))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Brands", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvbrand.DataSource = dtbl;
                gvbrand.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvbrand.DataSource = dtbl;
                gvbrand.DataBind();
                gvbrand.Rows[0].Cells.Clear();
                gvbrand.Rows[0].Cells.Add(new TableCell());
                gvbrand.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvbrand.Rows[0].Cells[0].Text = "No Data Found ..!";
                gvbrand.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }
        protected void BindGrid()
        {
            gvbrand.DataSource = ViewState["dt"] as DataTable;
            gvbrand.DataBind();
        }




        protected void gvbrand_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvbrand.EditIndex = e.NewEditIndex;
            PopulateGridview();
            panel1.Visible = false;
            panel.Visible = false;
        }

        protected void gvbrand_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string Extention;
                TextBox labName = (TextBox)gvbrand.Rows[e.RowIndex].FindControl("txtbrand1");

                FileUpload UploadImage = (FileUpload)gvbrand.Rows[e.RowIndex].FindControl("fuimg02");

                if (UploadImage.HasFile)
                {
                    string SavePath = Server.MapPath("~/Brands/");
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);

                    }
                    Extention= Path.GetExtension(UploadImage.PostedFile.FileName);
                    UploadImage.SaveAs(SavePath + "\\" + labName.Text.ToString().Trim()  + Extention);

                    using (SqlConnection sqlCon = new SqlConnection(s))
                    {
                        sqlCon.Open();
                        string query = "UPDATE Brands SET Brand=@Brand,status=@status,imageurl=@imageurl WHERE ID = @id";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@Brand", (gvbrand.Rows[e.RowIndex].FindControl("txtbrand1") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@status", (gvbrand.Rows[e.RowIndex].FindControl("txtstatus1") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@imageurl",(gvbrand.Rows[e.RowIndex].FindControl("txtbrand1") as TextBox).Text.Trim()+Extention);

                        sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvbrand.DataKeys[e.RowIndex].Value.ToString()));
                        sqlCmd.ExecuteNonQuery();
                        gvbrand.EditIndex = -1;
                        PopulateGridview();
                        panel.Visible = true;
                        panel1.Visible = false;

                        lblSuccessMessage.Text = "Selected Record Updated";
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


        protected void gvbrand_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvbrand.EditIndex = -1;
            PopulateGridview();
            panel1.Visible = false;
            panel.Visible = false;
        }

        protected void gvbrand_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM brands WHERE ID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvbrand.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    PopulateGridview();
                    panel.Visible = true;
                    panel1.Visible = false;

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

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        private void exportpdf()
        {

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=brand.pdf");
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
        private void Word_Export()

        {

            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "brands" + DateTime.Now + ".doc";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application / vnd.ms - word ";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            gvbrand.GridLines = GridLines.Both;
            gvbrand.HeaderStyle.Font.Bold = true;
            gvbrand.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }
        protected void print_Click(object sender, EventArgs e)
        {
           this.Word_Export();
        }

        protected void excel_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.AppendHeader("content-disposition", "attachment; filename=brand.xls");
            Response.ContentType = "application/excel";
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);
            gvbrand.HeaderRow.Style.Add("background-color", "#FFFFFF");
            gvbrand.RenderControl(htw);
            Response.Write(stringWriter.ToString());
            Response.End();
        }





    }
}

      
