using System;
using System.Web;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Linq;

using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;

namespace wholesale.admin
{
    public partial class materialstock : System.Web.UI.Page
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
            double total = 0;

            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(s))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select M.* ,S.* from material M inner join Supplier S on S.supid=M.supid order by mid desc ", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvproduct.DataSource = dtbl;
                gvproduct.DataBind();
                gvproduct.FooterRow.Cells[5].Text = "Total:";

                foreach (GridViewRow gvr in gvproduct.Rows)
                {
                    Label tb = (Label)gvr.Cells[1].FindControl("Label3");
                    double sum;
                    if (double.TryParse(tb.Text.Trim(), out sum))
                    {
                        total += sum;
                    }
                }
                //Display  the Totals in the Footer row  
                gvproduct.FooterRow.Cells[6].Text = total.ToString("c");
                label2.Visible = false;
                label1.Visible = true;

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
        protected DataSet search()
        {
            SqlConnection con = new SqlConnection(s);

            SqlCommand cmd = new SqlCommand("select M.* ,S.* from material M inner join Supplier S on S.supid=M.supid where M.mcategory like '" + ddlcat.SelectedItem.Text + "%' AND S.company like '" + ddlsup.SelectedItem.Text + "%' order by mid desc ", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (!object.Equals(ds, null))
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    gvproduct.DataSource = ds.Tables[0];
                    gvproduct.DataBind();
                }

            }
            panel1.Visible = false;
            panel.Visible = false;

            return ds;
        }


        protected void btnsearch_Click(object sender, EventArgs e)
        {
            DataSet ds = search();
            double total = 0;
            if (!object.Equals(ds, null))
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    gvproduct.Visible = true;
                    foreach (GridViewRow gvr in gvproduct.Rows)
                    {
                        Label tb = (Label)gvr.Cells[1].FindControl("Label3");
                        double sum;
                        if (double.TryParse(tb.Text.Trim(), out sum))
                        {
                            total += sum;
                        }
                    }
                    //Display  the Totals in the Footer row  
                    gvproduct.FooterRow.Cells[5].Text = "Total:";

                    gvproduct.FooterRow.Cells[6].Text = total.ToString("c");
                    label2.Visible = false;
                    label1.Visible = true;

                }


                else
                {
                    gvproduct.Visible = false;
                    label1.Visible = false;

                    label2.Visible = true;
                    label2.Text = "Stock is not available";

                }
            }
        }



        protected void btnvw_Click(object sender, EventArgs e)
        {
            gvproduct.Visible = true;

            PopulateGridview();
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

        protected void gvproduct_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            try
            {


                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    sqlCon.Open();
                    SqlCommand cmd = new SqlCommand("update Material  set minstock=@minstock,qty=@qty,price=@price where mid=@id", sqlCon);

                    cmd.Parameters.AddWithValue("@minstock", (gvproduct.Rows[e.RowIndex].FindControl("minstock") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@qty", (gvproduct.Rows[e.RowIndex].FindControl("qty") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@price", (gvproduct.Rows[e.RowIndex].FindControl("price") as TextBox).Text.Trim());

                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvproduct.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();

                   
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
        protected void gvproduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(s))
                {

                    panel.Visible = true;

                    sqlCon.Open();
                    string query = "DELETE Material FROM Material inner join Supplier on  Supplier.supid = Material.supid where Material.mid = @id";
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
    }
}