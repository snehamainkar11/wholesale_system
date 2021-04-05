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
    public partial class purchaseorder : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
        DataTable dt;
        Int64 totalprice;
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!Page.IsPostBack)

            {
                inv();
                BindSupplier();
                dt = new DataTable();
                dt.Columns.Add("sno");
                dt.Columns.Add("material");
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
                SqlCommand cmd = new SqlCommand("select Max(Id)  from porder", con);
                try
                {
                    con.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        Int64 ss = Convert.ToInt64(sdr[0]);

                        txtpo.Text = "0000" + (ss + 1).ToString();
                    }
                }
                catch (Exception ex)
                {
                    txtpo.Text = "00001";
                    //throw ex;
                    lblErrorMessage.Text = ex.Message;
                }
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
                    ddlsup.DataSource = dt;
                    ddlsup.DataTextField = "company" +
                        "" +
                        "";
                    ddlsup.DataValueField = "supid";
                    ddlsup.DataBind();

                }
            }


        }

        protected void additem_Click(object sender, EventArgs e)
        {
            dt = (DataTable)Session["data"];
            DataRow dr;
            dr = dt.NewRow();
            Button1.Visible = true;

            if (dt.Rows.Count > 0)
            {
                dr["sno"] = txtsrno.Text;
                dr["material"] = ddlmaterial1.SelectedItem.Text;
                dr["quantity"] = txtqty.Text;
                dr["price"] = txtprc.Text;
                totalprice = Convert.ToInt64(txtqty.Text) * Convert.ToInt64(txtprc.Text);
               
                dr["total"] = totalprice.ToString();
            }
            else
            {
                dr["sno"] = txtsrno.Text;
                dr["material"] = ddlmaterial1.SelectedItem.Text;
                dr["quantity"] = txtqty.Text;
                dr["price"] = txtprc.Text;
                totalprice = Convert.ToInt64(txtqty.Text) * Convert.ToInt64(txtprc.Text);

                dr["total"] = totalprice.ToString();
            }
            dt.Rows.Add(dr);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            Session["buyitems"] = dt;
            txtsrno.Text = (dt.Rows.Count + 1).ToString();
            ddlmaterial1.ClearSelection();
            txtqty.Text = "";
            txtprc.Text = "";
            
           calculateSum();


        }
       
        private void calculateSum()
        {
            Int32 grandtotal = 0;
            foreach (GridViewRow row in GridView1.Rows)
            {

                grandtotal = grandtotal + Convert.ToInt32(row.Cells[4].Text); 
            }
          //  GridView1.FooterRow.Cells[3].Text = "Grand Total";
          //  GridView1.FooterRow.Cells[4].Text = grandtotal.ToString();
            // Label3.Text = " Total Price(in Words) :" + ConvertNumbertoWords(grandtotal)+ "  Rs";

            double tot = Convert.ToDouble(grandtotal);
            grand.Text = (tot.ToString());

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





        protected void ddlmaterial1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String strQuery = "select price,mname from Material where" +
                     " mname = @mname";
            SqlConnection con = new SqlConnection(s);
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@mname", ddlmaterial1.SelectedItem.Text);
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
                    SqlCommand cmd = new SqlCommand("insert into porder values(@sid,@po,@odate,@total)", con);
                    cmd.Parameters.AddWithValue("@sid", ddlsup.SelectedValue);
                    cmd.Parameters.AddWithValue("@po", txtpo.Text);

                    cmd.Parameters.AddWithValue("@odate", odate.Text);
                    cmd.Parameters.AddWithValue("@total",grand.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }


                // DataTable dt;
                dt = (DataTable)Session["data"];

                for (int i = 0; i <= dt.Rows.Count - 1; i++)

                {

                    using (SqlConnection con = new SqlConnection(s))
                    {


                        SqlCommand cmd = new SqlCommand("insert into podet(po,sno,material,quantity,price,total) values(@po,@sno,@mat,@qty,@prc,@tot)", con);
                        cmd.Parameters.AddWithValue("@po", txtpo.Text);
                        cmd.Parameters.AddWithValue("@sno", dt.Rows[i]["sno"]);
                        cmd.Parameters.AddWithValue("@mat", dt.Rows[i]["material"]);
                        cmd.Parameters.AddWithValue("@qty", dt.Rows[i]["quantity"]);
                        cmd.Parameters.AddWithValue("@prc", dt.Rows[i]["price"]);
                        cmd.Parameters.AddWithValue("@tot", dt.Rows[i]["total"]);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        //con.Close();
                    }
                }

                string orderno = txtpo.Text;
                lblSuccessMessage.Text = "Order Added Successfully";
                Response.Redirect("~/admin/printpurchase.aspx?po=" + orderno);
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }



        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
            dt = (DataTable)Session["buyitems"];
            dt.Clear();

            txtsrno.Text = "1";
            Button1.Visible = false;
          
            grand.Text = "0.0";
        }
    }
}
