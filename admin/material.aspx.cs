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
    public partial class material : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridview();
                BindSupplier();

            }
        }
        void BindSupplier()
        {

            using (SqlConnection con = new SqlConnection(s))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Supplier", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    sname.DataSource = dt;
                    sname.DataTextField = "company";
                    sname.DataValueField = "supid";
                    sname.DataBind();
                    sname.Items.Insert(0,   new System.Web.UI.WebControls.ListItem("--Select--", "0"));

                }
            }


        }
            void PopulateGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(s))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select M.* ,S.* from material M inner join Supplier S on S.supid=M.supid order by mid asc", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvmaterial.DataSource = dtbl;
                gvmaterial.DataBind();
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


        protected void gvmaterial_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
             try
            {
                using (SqlConnection sqlCon = new SqlConnection(s))
                {

                  
                    sqlCon.Open();
                    string query = "DELETE Material FROM Material inner join Supplier on  Supplier.supid = Material.supid where Material.mid = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvmaterial.DataKeys[e.RowIndex].Value.ToString()));
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

        protected void gvmaterial_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {


                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    sqlCon.Open();
                    SqlCommand cmd = new SqlCommand("update Material  set mcode=@mcode,mname=@mname,mcategory=@mcategory,minstock=@minstock,supid=@supid,qty=@qty,price=@price where mid=@id", sqlCon);

                    cmd.Parameters.AddWithValue("@mcode", (gvmaterial.Rows[e.RowIndex].FindControl("txtcode") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@mname", (gvmaterial.Rows[e.RowIndex].FindControl("mname") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@mcategory", (gvmaterial.Rows[e.RowIndex].FindControl("mcategory") as DropDownList).SelectedValue.Trim());
                    cmd.Parameters.AddWithValue("@minstock", (gvmaterial.Rows[e.RowIndex].FindControl("minstock") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@supid", (gvmaterial.Rows[e.RowIndex].FindControl("company") as DropDownList).SelectedValue.Trim());
                    cmd.Parameters.AddWithValue("@qty", (gvmaterial.Rows[e.RowIndex].FindControl("qty") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@price", (gvmaterial.Rows[e.RowIndex].FindControl("price") as TextBox).Text.Trim());

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

          protected void gvmaterial_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvmaterial.EditIndex = e.NewEditIndex;
            PopulateGridview();
            panel.Visible = false;
            panel1.Visible = false;
        }

        protected void gvmaterial_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvmaterial.EditIndex = -1;
            PopulateGridview();
            panel.Visible = false;
            panel1.Visible = false;
        }

        protected void clear()
        {
            mname.Text = "";
            unit.Text = "";
            price.Text = "";
            qty.Text = "";
            sname.ClearSelection();
            mcategory.ClearSelection();
            minstock.Text = "";
            mcode.Text = "";
        }
        protected void btnmaterial_Click(object sender, EventArgs e)
        {
            if (mname.Text != "" && minstock.Text != "" && mcode.Text != "" && price.Text != "" && mcategory.Text != "" && sname.Text != "")
            {

                try
                {
                    using (SqlConnection con = new SqlConnection(s))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("insert into Material Values(@mname,@mcategory,@minstock,@supid,@qty,@price,@mcode,@unit)", con);

                        cmd.Parameters.AddWithValue("@mname", mname.Text);
                        cmd.Parameters.AddWithValue("@mcategory", mcategory.Text);
                        cmd.Parameters.AddWithValue("@minstock", minstock.Text);
                        cmd.Parameters.AddWithValue("@supid", sname.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@qty", qty.Text);
                        cmd.Parameters.AddWithValue("@price", price.Text);
                        cmd.Parameters.AddWithValue("@mcode", mcode.Text);
                        cmd.Parameters.AddWithValue("@unit", unit.Text);

                        cmd.ExecuteNonQuery();
                        PopulateGridview();
                        panel.Visible = true;
                        lblSuccessMessage.Text = "Record Added Successfully!!";
                        lblErrorMessage.Text = "";
                        this.clear();

                    }
                }
                catch (Exception ex)
                {
                    panel1.Visible = true;
                    panel.Visible = false;
                    this.clear();
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

      

        protected void gvmaterial_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && ((e.Row.RowState & DataControlRowState.Edit) == DataControlRowState.Edit))
            {
                var DropDownList1 = e.Row.FindControl("company") as DropDownList;
                if (DropDownList1 != null)
                {
                    var dt = new DataTable();
                    using (var con = new SqlConnection(s))
                    {
                        con.Open();
                        var cmd = new SqlCommand("Select * from Supplier", con);
                        var da = new SqlDataAdapter(cmd);
                        da.Fill(dt);
                    }

                    DropDownList1.DataSource = dt;
                    DropDownList1.DataTextField = "company";
                    DropDownList1.DataValueField = "supid";
                    DropDownList1.DataBind();
                }
                
                 
                
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        private void exportpdf()
        {

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=materials.pdf");
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
            Response.AppendHeader("content-disposition", "attachment; filename=materials.xls");
            Response.ContentType = "application/excel";
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);
            gvmaterial.HeaderRow.Style.Add("background-color", "#FFFFFF");
            gvmaterial.RenderControl(htw);
            Response.Write(stringWriter.ToString());
            Response.End();
        }
    }
}