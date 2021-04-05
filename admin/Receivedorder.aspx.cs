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
using System.Collections;

namespace wholesale.admin
{
    public partial class Receivedorder : System.Web.UI.Page
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
                SqlDataAdapter sqlDa = new SqlDataAdapter("select M.* ,C.* from purchase M inner join Supplier C on M.supid=C.supid", sqlCon);
                sqlDa.Fill(dtbl);

            }
            if (dtbl.Rows.Count > 0)
            {
                gvpo.DataSource = dtbl;
                gvpo.DataBind();

                lblSuccessMessage.Text = "";
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvpo.DataSource = dtbl;
                gvpo.DataBind();
                gvpo.Rows[0].Cells.Clear();
                gvpo.Rows[0].Cells.Add(new TableCell());
                gvpo.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvpo.Rows[0].Cells[0].Text = "No Data Found ..!";
                gvpo.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
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
            gvpo.GridLines = GridLines.Both;
            gvpo.HeaderStyle.Font.Bold = true;
            gvpo.HeaderStyle.ForeColor = System.Drawing.Color.Black;

            for (int col = 0; col < gvpo.HeaderRow.Controls.Count; col++)
            {
                TableCell tc = gvpo.HeaderRow.Cells[col];
                tc.Style.Add("color", "#FFFFFF");
                tc.Style.Add("background-color", "#444");
            }
            gvpo.RenderControl(htmltextwrtter);
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
            gvpo.HeaderStyle.ForeColor = System.Drawing.Color.Black;
            gvpo.HeaderStyle.BackColor = System.Drawing.Color.White;

            gvpo.RenderControl(htw);
            Response.Write(stringWriter.ToString());
            Response.End();
        }

        protected void gvpo_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            gvpo.EditIndex = -1;
            PopulateGridview();
            panel.Visible = false;
            panel1.Visible = false;
        }

        protected void gvpo_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvpo.EditIndex = e.NewEditIndex;
            PopulateGridview();
            panel.Visible = false;
            panel1.Visible = false;
        }

        protected void gvpo_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {


                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    sqlCon.Open();
                    SqlCommand cmd = new SqlCommand("update purchase  set rdate=@pdate,invamt=@total,invrem=@invrem,invpaid=@invpaid,status=@status where pid=@id", sqlCon);

                    cmd.Parameters.AddWithValue("@pdate", (gvpo.Rows[e.RowIndex].FindControl("pdate") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@total", (gvpo.Rows[e.RowIndex].FindControl("invamt") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@invrem", (gvpo.Rows[e.RowIndex].FindControl("invrem") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@invpaid", (gvpo.Rows[e.RowIndex].FindControl("invpaid") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@status", (gvpo.Rows[e.RowIndex].FindControl("status") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvpo.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();


                    gvpo.EditIndex = -1;
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

        protected void gvpo_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(s))
                {


                    sqlCon.Open();

                    string query1 = "DELETE FROM purDetails where p_id = @id";
                    SqlCommand sqlCmd1 = new SqlCommand(query1, sqlCon);
                    sqlCmd1.Parameters.AddWithValue("@id", Convert.ToInt32(gvpo.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd1.ExecuteNonQuery();

                    string query = "DELETE Purchase FROM purchase inner join Supplier on  Supplier.supid = Purchase.supid where purchase.pid = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvpo.DataKeys[e.RowIndex].Value.ToString()));
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
    }
}