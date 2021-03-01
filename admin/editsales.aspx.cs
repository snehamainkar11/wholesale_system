using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
    public partial class editsales : System.Web.UI.Page
    {
        public static String s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
        double totalprice;
        double grandtotal;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) { 

                BindDetails();
                PopulateGridview();
            }
        }

        void PopulateGridview()
        {
            String orderno = (Request.QueryString["orderno"]);

            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(s))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from saleDet where orderno='" + orderno + "'", sqlCon);
                sqlDa.Fill(dtbl);

            }
            if (dtbl.Rows.Count > 0)
            {
                Gridview1.DataSource = dtbl;
                Gridview1.DataBind();
                //  Gridview1.FooterRow.Cells[3].Text = "Total:";
                //  Gridview1.FooterRow.Cells[4].Text = dtbl.Compute("Sum(total)", "").ToString() + "  Rs";
                lblSuccessMessage.Text = "";
                calculateSum();

            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                Gridview1.DataSource = dtbl;
                Gridview1.DataBind();
                Gridview1.Rows[0].Cells.Clear();
                Gridview1.Rows[0].Cells.Add(new TableCell());
                Gridview1.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                Gridview1.Rows[0].Cells[0].Text = "No Data Found ..!";
                Gridview1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        private void calculateSum()
        {
            double totalCount = 0;

            foreach (RepeaterItem item in Repeater1.Items)
            {
                var paid = item.FindControl("txtpaid") as TextBox;
                var grand = item.FindControl("grand") as Label;
                var discount = item.FindControl("discounts") as TextBox;
                var due = item.FindControl("note") as TextBox;
                var txttot = item.FindControl("txttot") as TextBox;
                try
                {
                    foreach (GridViewRow gvr in Gridview1.Rows)
                    {
                        Label tb = (Label)gvr.Cells[4].FindControl("lbltot");
                        double sum;
                        if (double.TryParse(tb.Text.Trim(), out sum))
                        {
                            totalCount += sum;
                        }
                    }
                }
                catch(Exception ex)
                {
                    Response.Write(ex);
                   
                }
                txttot.Text =totalCount.ToString();

                Gridview1.FooterRow.Cells[3].Text = "Total";
                Gridview1.FooterRow.Cells[4].Text = totalCount.ToString();

          

          
              
            //Label3.Text = " Total Price(in Words) :" + ConvertNumbertoWords(grandtotal)+ "  Rs";
            //txttot.text = Convert.ToInt32(grandtotal);

            //  grand.Text =  Convert.ToInt32(discount.text) + Convert.ToInt32(txtgst.Text);
          
              
                double tot = Convert.ToDouble(totalCount);
                txttot.Text = (tot.ToString());

                double first = (tot * 5) / 100;
                double second = Convert.ToDouble(discount.Text.Trim() != string.Empty ? discount.Text.Trim() : "0");
                grand.Text = ((tot + first) - second).ToString();
                due.Text = (Convert.ToDouble(grand.Text) - Convert.ToDouble(paid.Text)).ToString();
            }
        }

        protected void discounts_TextChanged1(object sender, EventArgs e)
        {

           calculateSum();
        }
           protected void Txtpaid_TextChanged(object sender, EventArgs e)
        {
           calculateSum();
        }
        private void BindDetails()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                String orderno = (Request.QueryString["orderno"]);

                using (SqlCommand cmd = new SqlCommand("select M.* ,C.* from sales M inner join Customer C on M.cid=C.cid where orderno ='" + orderno + "'", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptr.DataSource = dt;
                        rptr.DataBind();
                        Repeater1.DataSource = dt;
                        Repeater1.DataBind();

                    }
                }
            }
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Gridview1.EditIndex = -1;
            PopulateGridview();
            panel.Visible = false;
            panel1.Visible = false;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(s))
                {


                    sqlCon.Open();
                  

                    string query1 = "DELETE FROM saleDet where orderno = @id and sno=@sno";
                    SqlCommand sqlCmd1 = new SqlCommand(query1, sqlCon);
                    sqlCmd1.Parameters.AddWithValue("@sno", (Gridview1.Rows[e.RowIndex].FindControl("sno") as Label).Text.Trim());

                    sqlCmd1.Parameters.AddWithValue("@id", Convert.ToInt32(Gridview1.DataKeys[e.RowIndex].Value.ToString()));
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

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Gridview1.EditIndex = e.NewEditIndex;
            PopulateGridview();
            panel.Visible = false;
            panel1.Visible = false;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {


                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    sqlCon.Open();
                    SqlCommand cmd = new SqlCommand("update SaleDet  set productid=@productid,price=@price,quantity=@quantity,total=@total where orderno=@id and sno=@sno", sqlCon);
                    TextBox t1 = (TextBox)(Gridview1.Rows[e.RowIndex].FindControl("price"));
                    TextBox t2= (TextBox)(Gridview1.Rows[e.RowIndex].FindControl("quantity"));
                    Int64 total = Convert.ToInt64(t1.Text) * Convert.ToInt64(t2.Text);
                    cmd.Parameters.AddWithValue("@productid", (Gridview1.Rows[e.RowIndex].FindControl("product") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@price", (Gridview1.Rows[e.RowIndex].FindControl("price") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@quantity", (Gridview1.Rows[e.RowIndex].FindControl("quantity") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@total", total);
                    cmd.Parameters.AddWithValue("@sno", (Gridview1.Rows[e.RowIndex].FindControl("sno") as Label).Text.Trim());

                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Gridview1.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();


                    Gridview1.EditIndex = -1;
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
    }
}