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
    public partial class editpurchase : System.Web.UI.Page
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
            String pid = (Request.QueryString["pid"]);

            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(s))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from PurDetails where p_id='" + pid + "' order by sno asc", sqlCon);
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
            }

        }
        private void BindDetails()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                String pid = (Request.QueryString["pid"]);

                using (SqlCommand cmd = new SqlCommand("select M.* ,C.* from Purchase M inner join Supplier C on M.supid=C.supid where pid ='" + pid + "'", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptr.DataSource = dt;
                        rptr.DataBind();
                        Repeater1.DataSource=dt;
                        Repeater1.DataBind();

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


                    SqlCommand cmd1 = new SqlCommand("update material set material.qty=material.qty-@quantity from  Material inner join purDetails  on purDetails.pro_id=Material.mname where Material.mname=@id", sqlCon);
                    cmd1.Parameters.AddWithValue("@id", (Gridview1.Rows[e.RowIndex].FindControl("lblp") as Label).Text.Trim());
                    cmd1.Parameters.AddWithValue("@quantity", (Gridview1.Rows[e.RowIndex].FindControl("lblsm") as Label).Text.Trim());
                    cmd1.ExecuteNonQuery();


                    string query1 = "DELETE FROM PurDetails where p_id = @id and sno=@sno";
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

        protected void Gridview1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {


                    using (SqlConnection sqlCon = new SqlConnection(s))
                    {
                        String pid = (Request.QueryString["pid"]);

                        DropDownList d1 = (DropDownList)(Gridview1.FooterRow.FindControl("txtproductid"));

                        TextBox t1 = (TextBox)(Gridview1.FooterRow.FindControl("txtprice"));
                        TextBox t2 = (TextBox)(Gridview1.FooterRow.FindControl("txtquantity"));
                        TextBox t3 = (TextBox)(Gridview1.FooterRow.FindControl("txttotal"));
                        TextBox t4 = (TextBox)(Gridview1.FooterRow.FindControl("txtsno"));

                        SqlCommand cmd = new SqlCommand("insert into PurDetails(p_id,sno,pro_id,quantity,price,total) values(@po,@sno,@mat,@qty,@price,@total)", sqlCon);
                        cmd.Parameters.AddWithValue("@po",pid );
                        cmd.Parameters.AddWithValue("@sno",t4.Text);
                        cmd.Parameters.AddWithValue("@mat",d1.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@qty", t2.Text);
                        cmd.Parameters.AddWithValue("@price", t1.Text);
                        cmd.Parameters.AddWithValue("@total",t3.Text);

                        sqlCon.Open();
                        cmd.ExecuteNonQuery();

                        SqlCommand cmd1 = new SqlCommand("update material set material.qty=material.qty+@quantity from  Material inner join purDetails  on purDetails.pro_id=Material.mname where Material.mname=@id", sqlCon);
                        cmd1.Parameters.AddWithValue("@id", d1.SelectedItem.Text);
                        cmd1.Parameters.AddWithValue("@quantity", t2.Text);
                        cmd1.ExecuteNonQuery();

                        PopulateGridview();

                    }


                    panel1.Visible = true;

                    lblSuccessMessage.Text = "Item Added Successfully";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void save_Click(object sender, EventArgs e)
        {
            try
            {

                String orderno = (Request.QueryString["pid"]);

                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    foreach (RepeaterItem item in rptr.Items)
                    {
                        foreach (RepeaterItem it2 in Repeater1.Items)
                        {

                            var invno = item.FindControl("txtnum") as TextBox;
                            var amt = it2.FindControl("txtinv") as TextBox;
                            var invpaid = it2.FindControl("txtrem") as TextBox;
                            var gst = it2.FindControl("gst") as TextBox;
                            var dis = it2.FindControl("dis") as TextBox;
                            Double rem = Convert.ToDouble(amt.Text) - Convert.ToDouble(invpaid.Text);
                            string status = "";
                            if (rem == 0)
                            {
                                status = "Paid";
                            }
                            else
                            {
                                status = "Pending";
                            }
                            sqlCon.Open();
                            SqlCommand cmd = new SqlCommand("update Purchase set supid=@sid,pdate=@pdate,dis=@dis,gst=@gst,rdate=@rdate,status=@status,invno=@invno,invamt=@amount,invrem=@rem,invpaid=@paid where pid=@id", sqlCon);

                            cmd.Parameters.AddWithValue("@invno", invno.Text);
                            cmd.Parameters.AddWithValue("@amount", amt.Text);
                            cmd.Parameters.AddWithValue("@pdate", pdate.Text);
                            cmd.Parameters.AddWithValue("@dis", dis.Text);
                            cmd.Parameters.AddWithValue("@gst", gst.Text);
                            cmd.Parameters.AddWithValue("@status", status);
                            cmd.Parameters.AddWithValue("@rdate", rdate.Text);
                            cmd.Parameters.AddWithValue("@sid", ddlsup.SelectedValue);

                            cmd.Parameters.AddWithValue("@paid", invpaid.Text);
                            cmd.Parameters.AddWithValue("@rem", rem);


                            cmd.Parameters.AddWithValue("@id", orderno);
                            cmd.ExecuteNonQuery();



                            panel.Visible = true;
                            panel1.Visible = false;
                            lblSuccessMessage.Text = "Order Updated Successfully";
                            lblErrorMessage.Text = "";
                            Response.Redirect("~/admin/ReceivedOrder.aspx");

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
    }
}
