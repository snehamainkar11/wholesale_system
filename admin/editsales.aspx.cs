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
                //inv();
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
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from saleDet where orderno='" + orderno + "' order by sno asc", sqlCon);
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
                var gst = item.FindControl("txtgst") as TextBox;

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

               // Gridview1.FooterRow.Cells[3].Text = "Total";
              //  Gridview1.FooterRow.Cells[4].Text = totalCount.ToString();

          

          
              
            //Label3.Text = " Total Price(in Words) :" + ConvertNumbertoWords(grandtotal)+ "  Rs";
            //txttot.text = Convert.ToInt32(grandtotal);

            //  grand.Text =  Convert.ToInt32(discount.text) + Convert.ToInt32(txtgst.Text);
          
              
                double tot = Convert.ToDouble(totalCount);
                txttot.Text = (tot.ToString());
                double g = Convert.ToDouble(gst.Text);
                double first = (tot * g) / 100;
                double second = Convert.ToDouble(discount.Text.Trim() != string.Empty ? discount.Text.Trim() : "0");
                grand.Text = ((tot + first) - second).ToString();
                //due.Text = (Convert.ToDouble(grand.Text) - Convert.ToDouble(paid.Text)).ToString();
            }
        }

        protected void discounts_TextChanged1(object sender, EventArgs e)
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


                    SqlCommand cmd1 = new SqlCommand("update Prodstock set ProdStock.quantity=ProdStock.quantity+@quantity from  Product inner join Prodstock  on Product.PID=ProdStock.PID where Product.pname=@id", sqlCon);
                    cmd1.Parameters.AddWithValue("@id", (Gridview1.Rows[e.RowIndex].FindControl("lblp") as Label).Text.Trim());
                    cmd1.Parameters.AddWithValue("@quantity", (Gridview1.Rows[e.RowIndex].FindControl("lblsm") as Label).Text.Trim());
                    cmd1.ExecuteNonQuery();

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

                    TextBox d1 = (TextBox)(Gridview1.Rows[e.RowIndex].FindControl("product"));

                    TextBox t1 = (TextBox)(Gridview1.Rows[e.RowIndex].FindControl("price"));
                    TextBox t2 = (TextBox)(Gridview1.Rows[e.RowIndex].FindControl("quantity"));
                 
                

                    String orderno = (Request.QueryString["orderno"]);
                    String strQuery = "select A.minlevel,B.quantity  from Product A inner join prodStock B on A.PID=B.PID where" +
              " A.pname = @mname";
                    SqlCommand cmd = new SqlCommand();
                    cmd.Parameters.AddWithValue("@mname", d1.Text);
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = strQuery;
                    cmd.Connection = sqlCon;
                    sqlCon.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();

               

                    while (sdr.Read())
                    {
                        int level = Convert.ToInt32(sdr[0]);
                        int qty = Convert.ToInt32(sdr[1]);
                        int stock = qty - level;
                        int txt = Convert.ToInt32(t2.Text);

                        if (stock < txt)
                        {
                           System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Minimum Stock. You can add upto :" + stock + " Products');", true);
                         
                            if (stock == 0)
                            {
                                using (SqlConnection con1 = new SqlConnection(s))
                                {
                                    SqlCommand cmd1 = new SqlCommand("update Product set status=@status where Product.pname=@id", con1);
                                    cmd1.Parameters.AddWithValue("@id", d1.Text);
                                    cmd1.Parameters.AddWithValue("@status", "Out of stock");
                                    con1.Open();
                                    cmd1.ExecuteNonQuery();
                                    // con1.Close();

                                }
                            }

                        }

                        else
                        {
                            using (SqlConnection sqlCon1 = new SqlConnection(s))
                            {
                                sqlCon1.Open();

                              
                                SqlCommand cmd1 = new SqlCommand("update SaleDet  set productid=@productid,price=@price,quantity=@quantity,total=@total where orderno=@id and sno=@sno", sqlCon1);
                                Int64 total = Convert.ToInt64(t1.Text) * Convert.ToInt64(t2.Text);

                                cmd1.Parameters.AddWithValue("@productid", (Gridview1.Rows[e.RowIndex].FindControl("product") as TextBox).Text.Trim());
                                cmd1.Parameters.AddWithValue("@price", (Gridview1.Rows[e.RowIndex].FindControl("price") as TextBox).Text.Trim());
                                cmd1.Parameters.AddWithValue("@quantity", (Gridview1.Rows[e.RowIndex].FindControl("quantity") as TextBox).Text.Trim());
                                cmd1.Parameters.AddWithValue("@total", total);
                                cmd1.Parameters.AddWithValue("@sno", (Gridview1.Rows[e.RowIndex].FindControl("sno") as Label).Text.Trim());

                                cmd1.Parameters.AddWithValue("@id", Convert.ToInt32(Gridview1.DataKeys[e.RowIndex].Value.ToString()));
                                cmd1.ExecuteNonQuery();

                                SqlCommand cmd12 = new SqlCommand("update Prodstock set ProdStock.quantity=ProdStock.quantity-@quantity from  Product inner join Prodstock  on Product.PID=ProdStock.PID where Product.pname=@id", sqlCon1);
                                cmd12.Parameters.AddWithValue("@id", (Gridview1.Rows[e.RowIndex].FindControl("product") as TextBox).Text);
                                cmd12.Parameters.AddWithValue("@quantity", (Gridview1.Rows[e.RowIndex].FindControl("quantity") as TextBox).Text);
                                cmd12.ExecuteNonQuery();


                                Gridview1.EditIndex = -1;
                                PopulateGridview();
                                panel.Visible = true;
                                panel1.Visible = false;
                                lblSuccessMessage.Text = "Record Updated Successfully";
                                lblErrorMessage.Text = "";
                            }
                        }
                    }
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
        private void inv()
        {    
        }
        protected void Gridview1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void Gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           try {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(s))
                    {
                        DropDownList d1 = (DropDownList)(Gridview1.FooterRow.FindControl("txtproductid"));

                        TextBox t1 = (TextBox)(Gridview1.FooterRow.FindControl("txtprice"));
                        TextBox t2 = (TextBox)(Gridview1.FooterRow.FindControl("txtquantity"));

                        String orderno = (Request.QueryString["orderno"]);

                     

                        String strQuery = "select A.minlevel,B.quantity  from Product A inner join prodStock B on A.PID=B.PID where" +
                  " A.pname = @mname";
                        SqlCommand cmd = new SqlCommand();
                        cmd.Parameters.AddWithValue("@mname", d1.SelectedItem.Text);
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = strQuery;
                        cmd.Connection = sqlCon;
                        sqlCon.Open();
                        SqlDataReader sdr = cmd.ExecuteReader();
                        while (sdr.Read())
                        {
                            int level = Convert.ToInt32(sdr[0]);
                            int qty = Convert.ToInt32(sdr[1]);
                            int stock = qty - level;
                            int txt = Convert.ToInt32(t2.Text);

                            if (stock < txt)
                            {
                                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Minimum Stock. You can add upto :" + stock + " Products');", true);
                                //con.Close();
                                if (stock == 0)
                                {
                                    using (SqlConnection con1 = new SqlConnection(s))
                                    {
                                        SqlCommand cmd1 = new SqlCommand("update Product set status=@status where Product.pname=@id", con1);
                                        cmd1.Parameters.AddWithValue("@id", d1.SelectedItem.Text);
                                        cmd1.Parameters.AddWithValue("@status", "Out of stock");
                                        con1.Open();
                                        cmd1.ExecuteNonQuery();
                                        // con1.Close();

                                    }
                                }

                            }

                            else
                            {
                                Int64 total = Convert.ToInt64(t1.Text) * Convert.ToInt64(t2.Text);
                                using (SqlConnection con1 = new SqlConnection(s))
                                {
                                    con1.Open();
                                    string query = "INSERT INTO saleDet (sno,orderno,productid,price,quantity,total) VALUES (@sno,@orderno,@productid,@price,@quantity,@total)";
                                    SqlCommand sqlCmd = new SqlCommand(query, con1);
                                    sqlCmd.Parameters.AddWithValue("@sno", (Gridview1.FooterRow.FindControl("txtsno") as TextBox).Text.Trim());
                                    sqlCmd.Parameters.AddWithValue("@orderno", orderno);

                                    sqlCmd.Parameters.AddWithValue("@productid", (Gridview1.FooterRow.FindControl("txtproductid") as DropDownList).SelectedItem.Text);
                                    sqlCmd.Parameters.AddWithValue("@price", (Gridview1.FooterRow.FindControl("txtprice") as TextBox).Text.Trim());
                                    sqlCmd.Parameters.AddWithValue("@quantity", (Gridview1.FooterRow.FindControl("txtquantity") as TextBox).Text.Trim());
                                    sqlCmd.Parameters.AddWithValue("@total", total);
                                    sqlCmd.ExecuteNonQuery();


                                    SqlCommand cmd1 = new SqlCommand("update Prodstock set ProdStock.quantity=ProdStock.quantity-@quantity from  Product inner join Prodstock  on Product.PID=ProdStock.PID where Product.pname=@id", con1);
                                    cmd1.Parameters.AddWithValue("@id", (Gridview1.FooterRow.FindControl("txtproductid") as DropDownList).SelectedItem.Text);
                                    cmd1.Parameters.AddWithValue("@quantity", (Gridview1.FooterRow.FindControl("txtquantity") as TextBox).Text);
                                    cmd1.ExecuteNonQuery();

                                    PopulateGridview();

                                }
                              

                                panel1.Visible = true;

                                lblSuccessMessage.Text = "Item Added Successfully";
                                lblErrorMessage.Text = "";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void txtproductid_SelectedIndexChanged(object sender, EventArgs e)
        {
           
                var DropDownList1 = Gridview1.FooterRow.FindControl("txtproductid") as DropDownList;
                var txtprc = Gridview1.FooterRow.FindControl("txtprice") as TextBox;

                String strQuery = "select unitprice,discount,pname from Product where" +
                    " pname = @mname";
                SqlConnection con = new SqlConnection(s);
                SqlCommand cmd = new SqlCommand();
                cmd.Parameters.AddWithValue("@mname", DropDownList1.SelectedItem.Text);
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        txtprc.Text = sdr[0].ToString();
                        // discounts.Text = sdr[1].ToString();

                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                    lblErrorMessage.Text = ex.Message;
                }
                finally
                {
                    con.Close();
                    con.Dispose();
                }
            }

        protected void save_Click(object sender, EventArgs e)
        {
            try
            {

                String orderno = (Request.QueryString["orderno"]);

                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    foreach (RepeaterItem item in Repeater1.Items)
                    {

                        var paid = item.FindControl("txtpaid") as TextBox;
                        var grand = item.FindControl("grand") as Label;
                        var discount = item.FindControl("discounts") as TextBox;
                        var txttot = item.FindControl("txttot") as TextBox;
                        var g = item.FindControl("txtgst") as TextBox;

                        sqlCon.Open();
                        SqlCommand cmd = new SqlCommand("update Sales  set  gst=@gst,cid=@cid,grand=@grand,total=@total,duedate=@duedate,pdate=@pdate,status=@status,discount=@dis,paymode=@paymode,paid=@paid,due=@due where orderno=@id", sqlCon);

                        cmd.Parameters.AddWithValue("@grand", grand.Text);
                        cmd.Parameters.AddWithValue("@total", txttot.Text);
                        cmd.Parameters.AddWithValue("@cid", ddlcust.SelectedValue);
                        cmd.Parameters.AddWithValue("@status", ddlstatus.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@paymode", ddlpay.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@paid", paid.Text);
                        cmd.Parameters.AddWithValue("@duedate", txtdue.Text);
                        cmd.Parameters.AddWithValue("@dis", discount.Text);
                        cmd.Parameters.AddWithValue("@pdate",odate.Text);
                        cmd.Parameters.AddWithValue("@due", Convert.ToDouble(grand.Text) - Convert.ToDouble(paid.Text));
                        cmd.Parameters.AddWithValue("@gst", g.Text);


                        cmd.Parameters.AddWithValue("@id", orderno);
                        cmd.ExecuteNonQuery();

                      

                        panel.Visible = true;
                        panel1.Visible = false;
                        lblSuccessMessage.Text = "Order Updated Successfully";
                        lblErrorMessage.Text = "";
                        Response.Redirect("~/admin/vieworder.aspx?orderno=" + orderno);

                    }
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
    
