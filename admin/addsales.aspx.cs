using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

namespace wholesale.admin
{
    public partial class addsales : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
        DataTable dt;
        double totalprice;
        double grandtotal = 0;
       

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!Page.IsPostBack)

            {
                inv();
                
                
                dt = new DataTable();
                dt.Columns.Add("sno");
                dt.Columns.Add("product");
                dt.Columns.Add("quantity");
                dt.Columns.Add("price");
                dt.Columns.Add("total");
                Session["data"] = dt;
                txtsrno.Text = "1";

            }
        }

        private void inv()
        {

           string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
                using (SqlConnection con = new SqlConnection(s))
                {
                    SqlCommand cmd = new SqlCommand("select Max(Id)  from Sales", con);
                try
                {
                    con.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        Int64 ss = Convert.ToInt64(sdr[0]);

                        txtinv.Text = "0000"+(ss + 1).ToString();
                    }
                }
                catch (Exception ex)
                {
                    txtinv.Text = "00001";
                    //throw ex;
                    lblErrorMessage.Text = ex.Message;
                }
            }
            }


        protected void additem_Click(object sender, EventArgs e)
        {
            Button1.Visible = true;
            dt = (DataTable)Session["data"];
            DataRow dr;
            dr = dt.NewRow();
            if (dt.Rows.Count > 0)
            {
                dr["sno"] = txtsrno.Text;
                dr["product"] = ddlproduct.SelectedItem.Text;
                dr["quantity"] = txtqty.Text;
                dr["price"] = txtprc.Text;
                totalprice = Convert.ToDouble(txtqty.Text) * Convert.ToDouble(txtprc.Text);

                dr["total"] = totalprice.ToString();
              
            }
            else
            {
                dr["sno"] = txtsrno.Text;
                dr["product"] = ddlproduct.SelectedItem.Text;
                dr["quantity"] = txtqty.Text;
                dr["price"] = txtprc.Text;
                totalprice = Convert.ToDouble(txtqty.Text) * Convert.ToDouble(txtprc.Text);

                dr["total"] = totalprice.ToString();
              //  stockalert();
            }
            using (SqlConnection con = new SqlConnection(s))
            {
                String strQuery = "select A.minlevel,B.quantity  from Product A inner join prodStock B on A.PID=B.PID where" +
                    " A.pname = @mname";
                SqlCommand cmd = new SqlCommand();
                cmd.Parameters.AddWithValue("@mname", ddlproduct.SelectedItem.Text);
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery;
                cmd.Connection = con;
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    int level = Convert.ToInt32(sdr[0]);
                    int qty = Convert.ToInt32(sdr[1]);
                    int stock = qty - level;
                    int txt = Convert.ToInt32(txtqty.Text);
                  
                    if (stock < txt)
                    {
                        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Minimum Stock. You can add upto :" + stock + " Products');", true);
                        //con.Close();
                        if (stock == 0)
                        {
                            using (SqlConnection con1 = new SqlConnection(s))
                            {
                                SqlCommand cmd1 = new SqlCommand("update Product set status=@status where Product.pname=@id", con1);
                                cmd1.Parameters.AddWithValue("@id", ddlproduct.SelectedItem.Text);
                                cmd1.Parameters.AddWithValue("@status", "Out of stock");
                                con1.Open();
                                cmd1.ExecuteNonQuery();
                                // con1.Close();

                            }
                        }

                    }
                   
                    else
                    {

                      
                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        txtsrno.Text = (dt.Rows.Count + 1).ToString();
                        ddlproduct.ClearSelection();
                        txtqty.Text = "";
                        txtprc.Text = "";
                        calculateSum();
                    }
                }
                   
                }
            
          

         
                    

                
         

          
            // calculategst();


          
        }

        private void calculateSum()
        {



            foreach (GridViewRow row in GridView1.Rows)
            {

                grandtotal = grandtotal + Convert.ToDouble(row.Cells[4].Text);

            }
           // GridView1.FooterRow.Cells[3].Text = "Total";
           // GridView1.FooterRow.Cells[4].Text = grandtotal.ToString();

            //Label3.Text = " Total Price(in Words) :" + ConvertNumbertoWords(grandtotal)+ "  Rs";
            //txttot.text = Convert.ToInt32(grandtotal);

            //  grand.Text =  Convert.ToInt32(discount.text) + Convert.ToInt32(txtgst.Text);

            double tot = Convert.ToDouble(grandtotal);
            txttot.Text = (tot.ToString());

            double first = (tot * 5) / 100;
            double second = Convert.ToDouble(discounts.Text.Trim() != string.Empty ? discounts.Text.Trim() : "0");
            grand.Text = ((tot + first )-  second).ToString();
            note.Text = (Convert.ToDouble(grand.Text) - Convert.ToDouble(Txtpaid.Text)).ToString();
        }


        protected void discounts_TextChanged1(object sender, EventArgs e)
        {

            calculateSum();
        }



        public static string ConvertNumbertoWords(int number)
        {
            if (number == 0)
                return "ZERO";
            if (number < 0)
                return "minus " + ConvertNumbertoWords(Math.Abs(number));
            string words = "";
            if ((number / 100000) > 0)
            {
                words += ConvertNumbertoWords(number / 100000) + " Lacs ";
                number %= 100000;
            }
            if ((number / 1000) > 0)
            {
                words += ConvertNumbertoWords(number / 1000) + " Thousand ";
                number %= 1000;
            }
            if ((number / 100) > 0)
            {
                words += ConvertNumbertoWords(number / 100) + " Hundred ";
                number %= 100;
            }
            if (number > 0)
            {
                if (words != "")
                    words += "AND ";
                var unitsMap = new[] { "Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen" };
                var tensMap = new[] { "Zero", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety" };

                if (number < 20)
                    words += unitsMap[number];
                else
                {
                    words += tensMap[number / 10];
                    if ((number % 10) > 0)
                        words += " " + unitsMap[number % 10];
                }
            }
            return words;
        }

        protected void ddlproduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            String strQuery = "select unitprice,discount,pname from Product where" +
                     " pname = @mname";
            SqlConnection con = new SqlConnection(s);
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@mname", ddlproduct.SelectedItem.Text);
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
                    discounts.Text = sdr[1].ToString();

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



        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
      
        protected void discounts_TextChanged(object sender, EventArgs e)
        {

            //this.calculateSum();
        }

        protected void stockalert()
        {
            String strQuery = "select A.minlevel,B.quantity from Product A inner join prodStock B on A.PID=B.PID where" +
                    " A.pname = @mname";
            SqlConnection con = new SqlConnection(s);
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@mname", ddlproduct.SelectedItem.Text);
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strQuery;
            cmd.Connection = con;
            try
            {
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    int stock = Convert.ToInt32(sdr[0]);
                    int qty =Convert.ToInt32(txtqty.Text);

                    if (stock > qty)
                    {
                        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Stock Alert')", true);
                    }
                    else
                    {

                    }
                   

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
                string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
              
                using (SqlConnection con = new SqlConnection(s))
                {
                    SqlCommand cmd = new SqlCommand("insert into sales values(@cid,@pdate,@duedate,@gst,@discount,@total,@paymode,@status,@orderno,@due,@grand,@paid)", con);
                  
                    cmd.Parameters.AddWithValue("@orderno", txtinv.Text);
                    cmd.Parameters.AddWithValue("@cid", ddlcust.SelectedValue);
                    cmd.Parameters.AddWithValue("@pdate", Convert.ToDateTime(DateTime.Now));
                    cmd.Parameters.AddWithValue("@duedate", Convert.ToDateTime(txtdue.Text).Date);
                    cmd.Parameters.AddWithValue("@gst",5);
                    cmd.Parameters.AddWithValue("@discount", discounts.Text);
                    cmd.Parameters.AddWithValue("@total", txttot.Text);
                    cmd.Parameters.AddWithValue("@paymode", ddlpay.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@status", ddlstatus.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@due", note.Text);
                    cmd.Parameters.AddWithValue("@grand", (grand.Text));
                    cmd.Parameters.AddWithValue("@paid", Txtpaid.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
              

                    // DataTable dt;
                 dt = (DataTable)Session["buyitems"];

                for (int i = 0; i <= dt.Rows.Count - 1; i++)

                {
                    using (SqlConnection con = new SqlConnection(s))
                    {
                        SqlCommand cmd1 = new SqlCommand("update Prodstock set ProdStock.quantity=ProdStock.quantity-@quantity from  Product inner join Prodstock  on Product.PID=ProdStock.PID where Product.pname=@id", con);
                        cmd1.Parameters.AddWithValue("@id", dt.Rows[i]["product"]);
                        cmd1.Parameters.AddWithValue("@quantity", dt.Rows[i]["quantity"]);
                        con.Open();
                        cmd1.ExecuteNonQuery();
                        // con1.Close();

                    }

                    using (SqlConnection con = new SqlConnection(s))
                    {


                        SqlCommand cmd = new SqlCommand("insert into saleDet(orderno,sno,productid,price,quantity,total) values(@orderno,@sno,@pid,@price,@quantity,@tot)", con);
                        cmd.Parameters.AddWithValue("@orderno", txtinv.Text);
                        cmd.Parameters.AddWithValue("@sno", dt.Rows[i]["sno"]);
                        cmd.Parameters.AddWithValue("@pid", dt.Rows[i]["product"]);
                        cmd.Parameters.AddWithValue("@price", dt.Rows[i]["price"]);
                        cmd.Parameters.AddWithValue("@quantity", dt.Rows[i]["quantity"]);
                        cmd.Parameters.AddWithValue("@tot", dt.Rows[i]["total"]);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        //con.Close();
                    }

                  
                   

                }
                    







                

             
                string orderno = txtinv.Text;
                lblSuccessMessage.Text = "Order Added Successfully";
                Response.Redirect("~/admin/vieworder.aspx?orderno=" + orderno);
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }


        }



        protected void Txtpaid_TextChanged(object sender, EventArgs e)
        {
            calculateSum();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
            dt = (DataTable)Session["buyitems"];
            dt.Clear();

            grand.Text = "0.0";
            txtsrno.Text = "1";
            txttot.Text = "0.0";
            txtdue.Text = "0.0";
            Button1.Visible = false;
        }
    }
}
