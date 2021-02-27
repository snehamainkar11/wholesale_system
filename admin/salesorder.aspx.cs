using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace wholesale.admin
{
    public partial class salesorder : System.Web.UI.Page
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
                SqlDataAdapter sqlDa = new SqlDataAdapter("select M.* ,C.* from sales M inner join Customer C on M.cid=C.cid", sqlCon);
                sqlDa.Fill(dtbl);
               
            }
            if (dtbl.Rows.Count > 0)
            {
                gvmaterial.DataSource = dtbl;
                gvmaterial.DataBind();
                gvmaterial.FooterRow.Cells[3].Text = "Total:";
                gvmaterial.FooterRow.Cells[4].Text = dtbl.Compute("Sum(grand)","").ToString() + "  Rs";
                gvmaterial.FooterRow.Cells[6].Text = dtbl.Compute("Sum(due)", "").ToString() + "  Rs";

                lblSuccessMessage.Text = "";
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvmaterial.DataSource = dtbl;
                gvmaterial.DataBind();
                gvmaterial.Rows[0].Cells.Clear();
                gvmaterial.Rows[0].Cells.Add(new TableCell());
                gvmaterial.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvmaterial.Rows[0].Cells[0].Text = "No Data Found ..!";
                gvmaterial.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void gvmaterial_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
             gvmaterial.EditIndex = -1;
            PopulateGridview();
            panel.Visible = false;
            panel1.Visible = false;
        }

        protected void gvmaterial_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvmaterial.EditIndex = e.NewEditIndex;
            PopulateGridview();
            panel.Visible = false;
            panel1.Visible = false;
        }

        protected void gvmaterial_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(s))
                {


                    sqlCon.Open();
                    string query = "DELETE Sales FROM sales inner join Customer on  Customer.cid = Sales.cid where Sales.orderno = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvmaterial.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();

                    string query1 = "DELETE FROM saleDet where orderno = @id";
                    SqlCommand sqlCmd1 = new SqlCommand(query1, sqlCon);
                    sqlCmd1.Parameters.AddWithValue("@id", Convert.ToInt32(gvmaterial.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd1.ExecuteNonQuery();
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

        protected void gvmaterial_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {


                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    sqlCon.Open();
                    SqlCommand cmd = new SqlCommand("update Sales  set pdate=@pdate,grand=@total,status=@status,paymode=@paymode,paid=@paid,due=@due where orderno=@id", sqlCon);

                    cmd.Parameters.AddWithValue("@pdate", (gvmaterial.Rows[e.RowIndex].FindControl("pdate") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@total", (gvmaterial.Rows[e.RowIndex].FindControl("total") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@status", (gvmaterial.Rows[e.RowIndex].FindControl("status") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@paymode", (gvmaterial.Rows[e.RowIndex].FindControl("paymode") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@paid", (gvmaterial.Rows[e.RowIndex].FindControl("paid") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@due", (gvmaterial.Rows[e.RowIndex].FindControl("due") as TextBox).Text.Trim());

                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvmaterial.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();


                    gvmaterial.EditIndex = -1;
                    PopulateGridview();
                    panel.Visible = true;
                    panel1.Visible = false;
                    lblSuccessMessage.Text = "Record Updated Successfully";
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
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        private void exportpdf()
        {


            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "sales" + DateTime.Now + ".doc";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application / vnd.ms - word ";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            gvmaterial.GridLines = GridLines.Both;
            gvmaterial.HeaderStyle.Font.Bold = true;
            gvmaterial.HeaderStyle.ForeColor = System.Drawing.Color.Black;

            for (int col = 0; col < gvmaterial.HeaderRow.Controls.Count; col++)
            {
                TableCell tc = gvmaterial.HeaderRow.Cells[col];
                tc.Style.Add("color", "#FFFFFF");
                tc.Style.Add("background-color", "#444");
            }
            gvmaterial.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
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
            Response.AppendHeader("content-disposition", "attachment; filename=sales.xls");
            Response.ContentType = "application/excel";
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);
            gvmaterial.HeaderStyle.ForeColor = System.Drawing.Color.Black;
            gvmaterial.HeaderStyle.BackColor = System.Drawing.Color.White;

            gvmaterial.RenderControl(htw);
            Response.Write(stringWriter.ToString());
            Response.End();
        }
    }


}