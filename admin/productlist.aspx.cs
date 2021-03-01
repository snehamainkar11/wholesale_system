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
using System.Drawing;
namespace wholesale
{
    public partial class productlist : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
        static string[,] ClassNames ={   {"Out of stock","Red"},  {"In stock","Green"}};

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
                SqlDataAdapter sqlDa = new SqlDataAdapter("select A.PID, A.status,A.minlevel, A.pname, A.pcode, A.unitprice, A.sellingprice, A.discount,B.*,C.* ,D.*,E.* from Product A inner join Brands C on C.ID = A.brand inner join Category E on E.ID=A.Category inner join ProdStock D on D.PID = A.PID cross apply( select top 1 * from ProdImage B where B.ProID = A.PID order by B.ProID desc )B order by A.PID desc ", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvproduct.DataSource = dtbl;
                gvproduct.DataBind();

                
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvproduct.DataSource = dtbl;
                gvproduct.DataBind();
                gvproduct.Rows[0].Cells.Clear();
                gvproduct.Rows[0].Cells.Add(new TableCell());
                gvproduct.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvproduct.Rows[0].Cells[0].Text = "No Data Found ..!";
                gvproduct.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
          
        }


        protected void BindGrid()
        {
            gvproduct.DataSource = ViewState["dt"] as DataTable;
            gvproduct.DataBind();
        }





        protected void gvproduct_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvproduct.EditIndex = -1;
            PopulateGridview();
            panel.Visible = false;
            panel1.Visible = false;
        }

        protected void gvproduct_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvproduct.EditIndex = e.NewEditIndex;
            PopulateGridview();
            panel.Visible = false;
            panel1.Visible = false;
        }



        protected void gvproduct_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(s))
                {

                    panel.Visible = true;

                    sqlCon.Open();
                    string query = "DELETE Product FROM Product inner join ProdStock on  Product.PID = ProdStock.PID inner join ProdImage  on ProdImage.ProID = Product.PID where Product.PID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvproduct.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();

                    ///  string query1 = "DELETE ProdImage FROM ProdImage inner join ProdStock on  Product.PID = ProdStock.PID inner join ProdImage  on ProdImage.ProID = Product.PID WHERE I.PrID = @id";

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



        protected void gvproduct_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            try
            {


                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    sqlCon.Open();
                    SqlCommand cmd = new SqlCommand("update Product  set pcode=@pcode,pname=@pname,minlevel=@minlevel,status=@status,unitprice=@unitprice,sellingprice=@sellingprice,discount=@discount where PID=@id", sqlCon);

                    cmd.Parameters.AddWithValue("@pcode", (gvproduct.Rows[e.RowIndex].FindControl("txtpcode") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Pname", (gvproduct.Rows[e.RowIndex].FindControl("txtpname") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@unitprice", (gvproduct.Rows[e.RowIndex].FindControl("txtup") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@sellingprice", (gvproduct.Rows[e.RowIndex].FindControl("txtsp") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@discount", (gvproduct.Rows[e.RowIndex].FindControl("txtdis") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@status", (gvproduct.Rows[e.RowIndex].FindControl("status") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@minlevel", (gvproduct.Rows[e.RowIndex].FindControl("minlevel") as TextBox).Text.Trim());

                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvproduct.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();

                    SqlCommand cmd1 = new SqlCommand("update ProdStock  set quantity=@qty,size=@size,color=@color where PID =@id", sqlCon);

                    cmd1.Parameters.AddWithValue("@qty", (gvproduct.Rows[e.RowIndex].FindControl("txtqty") as TextBox).Text.Trim());
                    cmd1.Parameters.AddWithValue("@size", (gvproduct.Rows[e.RowIndex].FindControl("txtsize") as TextBox).Text.Trim());
                    cmd1.Parameters.AddWithValue("@color", (gvproduct.Rows[e.RowIndex].FindControl("color") as TextBox).Text.Trim());
                    cmd1.Parameters.AddWithValue("@id", Convert.ToInt32(gvproduct.DataKeys[e.RowIndex].Value.ToString()));

                    cmd1.ExecuteNonQuery();
                    SqlCommand cmd4 = new SqlCommand("update Product set brand=@brand,category=@category from Product inner join Brands on brands.ID=Product.Brand inner join Category on Category.ID=Product.Category  where PID =@id", sqlCon);

                    cmd4.Parameters.AddWithValue("@brand", (gvproduct.Rows[e.RowIndex].FindControl("ddlbrd") as DropDownList).SelectedValue.Trim());
                    cmd4.Parameters.AddWithValue("@category", (gvproduct.Rows[e.RowIndex].FindControl("catddl") as DropDownList).SelectedValue.Trim());
                    cmd4.Parameters.AddWithValue("@id", Convert.ToInt32(gvproduct.DataKeys[e.RowIndex].Value.ToString()));

                    cmd4.ExecuteNonQuery();
                    Int64 PID = Convert.ToInt32(gvproduct.DataKeys[e.RowIndex].Value.ToString());


                    TextBox labName = (TextBox)gvproduct.Rows[e.RowIndex].FindControl("txtpname");

                    FileUpload UploadImage = (FileUpload)gvproduct.Rows[e.RowIndex].FindControl("fuimg01");

                    if (UploadImage.HasFile)
                    {
                        string SavePath = Server.MapPath("~/Products/") + PID;
                        string Extention = Path.GetExtension(UploadImage.PostedFile.FileName);
                        UploadImage.SaveAs(SavePath + "\\" + labName.Text.ToString().Trim() + "01" + Extention);


                        SqlCommand cmd3 = new SqlCommand("update prodImage set extension=@extension,name=@name where ProID=@id", sqlCon);
                        cmd3.Parameters.AddWithValue("@name", labName.Text + "01");
                        cmd3.Parameters.AddWithValue("@extension", Extention.ToString());
                        cmd3.Parameters.AddWithValue("@id", Convert.ToInt32(gvproduct.DataKeys[e.RowIndex].Value.ToString()));

                        cmd3.ExecuteNonQuery();
                        PopulateGridview();
                    }

                  

                    gvproduct.EditIndex = -1;
                    panel.Visible = true;
                    panel1.Visible = false;
                    PopulateGridview();

                    lblSuccessMessage.Text = "Record Updated successfully !!";
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

        

        protected void gvproduct_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
            if (e.Row.RowType == DataControlRowType.DataRow && ((e.Row.RowState & DataControlRowState.Edit) == DataControlRowState.Edit))
            {
                var DropDownList1 = e.Row.FindControl("ddlbrd") as DropDownList;
                var DropDownList2 = e.Row.FindControl("catddl") as DropDownList;

                if (DropDownList1 != null)
                {
                    var dt = new DataTable();
                    using (var con = new SqlConnection(s))
                    {
                        con.Open();
                        var cmd = new SqlCommand("Select * from Brands", con);
                        var da = new SqlDataAdapter(cmd);
                        da.Fill(dt);
                    }

                    DropDownList1.DataSource = dt;
                    DropDownList1.DataTextField = "brand";
                    DropDownList1.DataValueField = "ID";
                    DropDownList1.DataBind();
                }
                if (DropDownList2 != null)
                {
                    var dt = new DataTable();
                    using (var con = new SqlConnection(s))
                    {
                        con.Open();
                        var cmd = new SqlCommand("Select * from Category", con);
                        var da = new SqlDataAdapter(cmd);
                        da.Fill(dt);
                    }

                    DropDownList2.DataSource = dt;
                    DropDownList2.DataTextField = "Category";
                    DropDownList2.DataValueField = "ID";
                    DropDownList2.DataBind();
                }
                var ss = e.Row.FindControl("lblstatus") as Label;
                if (ss.Text == "Out of stock")
                {
                    ss.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    ss.ForeColor = System.Drawing.Color.Red;
                }


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
            string FileName = "products" + DateTime.Now + ".doc";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application / vnd.ms - word ";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            gvproduct.GridLines = GridLines.Both;
            gvproduct.HeaderStyle.Font.Bold = true;
            gvproduct.HeaderStyle.ForeColor = System.Drawing.Color.Black;

            for (int col = 0; col < gvproduct.HeaderRow.Controls.Count; col++)
            {
                TableCell tc = gvproduct.HeaderRow.Cells[col];
                tc.Style.Add("color", "#FFFFFF");
                tc.Style.Add("background-color", "#444");
            }
            gvproduct.RenderControl(htmltextwrtter);
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
            Response.AppendHeader("content-disposition", "attachment; filename=products.xls");
            Response.ContentType = "application/excel";
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);
            gvproduct.HeaderStyle.ForeColor = System.Drawing.Color.Black;
            gvproduct.HeaderStyle.BackColor = System.Drawing.Color.White;

            gvproduct.RenderControl(htw);
            Response.Write(stringWriter.ToString());
            Response.End();
        }
    }


}