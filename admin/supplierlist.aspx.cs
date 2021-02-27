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
    public partial class supplierlist : System.Web.UI.Page
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
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from Supplier", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvsupplier.DataSource = dtbl;
                gvsupplier.DataBind();
                lblSuccessMessage.Text = "";
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvsupplier.DataSource = dtbl;
                gvsupplier.DataBind();
                gvsupplier.Rows[0].Cells.Clear();
                gvsupplier.Rows[0].Cells.Add(new TableCell());
                gvsupplier.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvsupplier.Rows[0].Cells[0].Text = "No Data Found ..!";
                gvsupplier.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }


        protected void BindGrid()
        {
            gvsupplier.DataSource = ViewState["dt"] as DataTable;
            gvsupplier.DataBind();
        }

        protected void gvsupplier_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvsupplier.EditIndex = -1;
            PopulateGridview();

            panel1.Visible = false;
            panel.Visible = false;
        }

        protected void gvsupplier_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(s))
                {


                    sqlCon.Open();
                    string query = "DELETE FROM Supplier where supid = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvsupplier.DataKeys[e.RowIndex].Value.ToString()));
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

                panel1.Visible = true;
                panel.Visible = false;
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }
        protected void clear()
        {
            txtname.Text = "";
            txtstate.Text = "";
            txtstore.Text = "";
            txtzip.Text = "";
            txtaddr.Text = "";
            txtcity.Text = "";
            txtct.Text = "";
            txtemail.Text = "";
            txtgst.Text = "";
        }
        protected void gvsupplier_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {


                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    sqlCon.Open();
                    SqlCommand cmd = new SqlCommand("update Supplier set sname=@sname,gstno=@gstno,company=@company,address=@address,contact=@contact,email=@email,city=@city,state=@state,zip=@zip where supid=@id", sqlCon);

                    cmd.Parameters.AddWithValue("@sname", (gvsupplier.Rows[e.RowIndex].FindControl("txtsname") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@gstno", (gvsupplier.Rows[e.RowIndex].FindControl("gst") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@company", (gvsupplier.Rows[e.RowIndex].FindControl("txtcompany") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@address", (gvsupplier.Rows[e.RowIndex].FindControl("addr") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@contact", (gvsupplier.Rows[e.RowIndex].FindControl("contact") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@email", (gvsupplier.Rows[e.RowIndex].FindControl("email") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@city", (gvsupplier.Rows[e.RowIndex].FindControl("txtcity") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@state", (gvsupplier.Rows[e.RowIndex].FindControl("txtstate") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@zip", (gvsupplier.Rows[e.RowIndex].FindControl("txtzip") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvsupplier.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();


                }

                gvsupplier.EditIndex = -1;
                PopulateGridview();

                panel.Visible = true;
                panel1.Visible = false;
                lblSuccessMessage.Text = "Selected Record Updated";
                lblErrorMessage.Text = "";
            }

            catch (Exception ex)
            {

                panel1.Visible = true;
                panel.Visible = false;
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }


        protected void gvsupplier_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvsupplier.EditIndex = e.NewEditIndex;
            PopulateGridview();

            panel1.Visible = false;
            panel.Visible = false;
        }

        protected void btnaddsupplier_Click(object sender, EventArgs e)
        {
            if (txtname.Text != "" && txtstore.Text != "" && txtstate.Text != "" && txtct.Text != "" && txtaddr.Text != "" && txtzip.Text != "")
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(s))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("insert into Supplier Values(@sname,@company,@gstno,@contact,@email,@address,@city,@state,@zip)", con);

                        cmd.Parameters.AddWithValue("@sname", txtname.Text);
                        cmd.Parameters.AddWithValue("@gstno", txtgst.Text);
                        cmd.Parameters.AddWithValue("@company", txtstore.Text);
                        cmd.Parameters.AddWithValue("@address", txtaddr.Text);
                        cmd.Parameters.AddWithValue("@contact", txtct.Text);
                        cmd.Parameters.AddWithValue("@email", txtemail.Text);
                        cmd.Parameters.AddWithValue("@city", txtcity.Text);
                        cmd.Parameters.AddWithValue("@state", txtstate.Text);
                        cmd.Parameters.AddWithValue("@zip", txtzip.Text);
                        cmd.ExecuteNonQuery();
                        PopulateGridview();

                        panel.Visible = true;
                        panel1.Visible = false;
                        lblSuccessMessage.Text = "Record Added Successfully!!";
                        lblErrorMessage.Text = "";
                        this.clear();
                    }
                }
                catch (Exception ex)
                {

                    panel1.Visible = true;
                    panel.Visible = false;
                    lblSuccessMessage.Text = "";
                    lblErrorMessage.Text = ex.Message;
                }

            }
            else
            {
                panel1.Visible = true;
                panel.Visible = false;
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = "Please Enter Valid Details";

            }
        }


        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        private void exportpdf()
        {

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=supplier.pdf");
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
            Response.AppendHeader("content-disposition", "attachment; filename=supplier.xls");
            Response.ContentType = "application/excel";
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);
            gvsupplier.HeaderRow.Style.Add("background-color", "#FFFFFF");
            gvsupplier.RenderControl(htw);
            Response.Write(stringWriter.ToString());
            Response.End();
        }


    }

}