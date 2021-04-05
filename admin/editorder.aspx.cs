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
    public partial class editorder : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //inv();
                BindDetails();
                PopulateGridview();
            }
        }
        void PopulateGridview()
        {
            String po = (Request.QueryString["po"]);

            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(s))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from podet where po='" + po + "' order by sno asc", sqlCon);
                sqlDa.Fill(dtbl);

            }
            if (dtbl.Rows.Count > 0)
            {
                Gridview1.DataSource = dtbl;
                Gridview1.DataBind();
                //  Gridview1.FooterRow.Cells[3].Text = "Total:";
                //  Gridview1.FooterRow.Cells[4].Text = dtbl.Compute("Sum(total)", "").ToString() + "  Rs";
                lblSuccessMessage.Text = "";
               
               
              
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

              


                    grand.Text = "0.00".ToString();
                }
            

        }
        private void BindDetails()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                String pid = (Request.QueryString["po"]);

                using (SqlCommand cmd = new SqlCommand("select M.* ,C.* from porder M inner join Supplier C on M.sid=C.supid where po ='" + pid + "'", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptr.DataSource = dt;
                        rptr.DataBind();
                       

                    }
                }
            }
        }
        protected void Gridview1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(s))
                {


                    sqlCon.Open();


                  

                    string query1 = "DELETE FROM podet where po = @id and sno=@sno";
                    SqlCommand sqlCmd1 = new SqlCommand(query1, sqlCon);
                    sqlCmd1.Parameters.AddWithValue("@sno", (Gridview1.Rows[e.RowIndex].FindControl("sno") as Label).Text.Trim());

                    sqlCmd1.Parameters.AddWithValue("@id", Convert.ToInt32(Gridview1.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd1.ExecuteNonQuery();
                    PopulateGridview();
                 

                    panel.Visible = true;
                    panel1.Visible = false;
                    lblSuccessMessage.Text = "Item Deleted Successfully!";
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
        protected void Gridview1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {

                    double sum = 0.0;
                    using (SqlConnection sqlCon = new SqlConnection(s))
                    {
                        String po = (Request.QueryString["po"]);

                        DropDownList d1 = (DropDownList)(Gridview1.FooterRow.FindControl("txtproductid"));

                        TextBox t1 = (TextBox)(Gridview1.FooterRow.FindControl("txtprice"));
                        TextBox t2 = (TextBox)(Gridview1.FooterRow.FindControl("txtquantity"));
                        TextBox t3 = (TextBox)(Gridview1.FooterRow.FindControl("txttotal"));
                        TextBox t4 = (TextBox)(Gridview1.FooterRow.FindControl("txtsno"));

                        SqlCommand cmd = new SqlCommand("insert into Podet(po,sno,material,quantity,price,total) values(@po,@sno,@mat,@qty,@price,@total)", sqlCon);
                        cmd.Parameters.AddWithValue("@po", po);
                        cmd.Parameters.AddWithValue("@sno", t4.Text);
                        cmd.Parameters.AddWithValue("@mat", d1.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@qty", t2.Text);
                        cmd.Parameters.AddWithValue("@price", t1.Text);
                        cmd.Parameters.AddWithValue("@total", t3.Text);

                        sqlCon.Open();
                        cmd.ExecuteNonQuery();


                        PopulateGridview();
                      

                            panel1.Visible = true;

                        lblSuccessMessage.Text = "Item Added Successfully";
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
        private void calculateSum()
        {
                 Int32 grandtotal = 0;
               // Gridview1.ShowFooter = false;

                foreach (GridViewRow row in Gridview1.Rows)
            {

                grandtotal = grandtotal + Convert.ToInt32(row.Cells[4].Text);
            }
             //  GridView1.FooterRow.Cells[3].Text = "Grand Total";
                // GridView1.FooterRow.Cells[4].Text = grandtotal.ToString();
                // Label3.Text = " Total Price(in Words) :" + ConvertNumbertoWords(grandtotal)+ "  Rs";
                double tot = Convert.ToDouble(grandtotal);
           


                grand.Text = tot.ToString();

            }
        
        protected void save_Click(object sender, EventArgs e)
        {
            try
            {

                String po = (Request.QueryString["po"]);

                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    
                        sqlCon.Open();
                        SqlCommand cmd = new SqlCommand("update porder  set odate=@pdate,total=@total,sid=@sid where po=@id", sqlCon);

                        cmd.Parameters.AddWithValue("@total", grand.Text);
                        cmd.Parameters.AddWithValue("@pdate", odate.Text);

                         cmd.Parameters.AddWithValue("@sid",ddlsup.SelectedValue);


                        cmd.Parameters.AddWithValue("@id", po);
                        cmd.ExecuteNonQuery();



                        panel.Visible = true;
                        panel1.Visible = false;
                        lblSuccessMessage.Text = "Order Updated Successfully";
                        lblErrorMessage.Text = "";
                        Response.Redirect("~/admin/printpurchase.aspx?po="+po);

                    
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

        double grandTotal = 0;

        protected void Gridview1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {

                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    grandTotal = grandTotal + Convert.ToDouble((e.Row.Cells[4].FindControl("lbltot") as Label).Text);



                }
                grand.Text = grandTotal.ToString();
            }
            catch(Exception ex)
            {
                grand.Text = 0.ToString();
            }
        }
    }
}