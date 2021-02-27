﻿using System;
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
    public partial class addpurchase : System.Web.UI.Page
    {

        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)

            {
                BindSupplier();
                dt = new DataTable();
                dt.Columns.Add("sno");
                dt.Columns.Add("material");
                dt.Columns.Add("quantity");
                Session["data"] = dt;
                txtsrno.Text = "1";

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
                    ddlsup.DataTextField = "company";
                    ddlsup.DataValueField = "supid";
                    ddlsup.DataBind();
                    ddlsup.Items.Insert(0, new ListItem("--Select--", "0"));

                }
            }
        }
        protected void additem_Click(object sender, EventArgs e)
        {
            dt = (DataTable)Session["data"];
            DataRow dr;
            dr = dt.NewRow();
            if (dt.Rows.Count > 0)
            {
                dr["sno"] = txtsrno.Text;
                dr["material"] = ddlmaterial1.SelectedItem.Text;
                dr["quantity"] = txtqty.Text;
            }
            else
            {
                dr["sno"] = txtsrno.Text;
                dr["material"] = ddlmaterial1.SelectedItem.Text;
                dr["quantity"] = txtqty.Text;
                           
            }
            dt.Rows.Add(dr);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            Session["buyitems"] = dt;
            txtsrno.Text = (dt.Rows.Count + 1).ToString();
            ddlmaterial1.ClearSelection();
            txtqty.Text = "";

        }

        protected void save_Click(object sender, EventArgs e)
        {
            Double paid = Convert.ToDouble(txtinv.Text) - Convert.ToDouble(txtrem.Text);
            try
            {
                string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;
                using (SqlConnection con = new SqlConnection(s))
                {
                    SqlCommand cmd = new SqlCommand("insert into purchase values(@pid,@sid,@odate,@inv,@amt,@rem,@paid)", con);
                    cmd.Parameters.AddWithValue("@sid", ddlsup.SelectedValue);
                    cmd.Parameters.AddWithValue("@odate", Convert.ToDateTime(DateTime.Now));
                    cmd.Parameters.AddWithValue("@inv", txtnum.Text);
                    cmd.Parameters.AddWithValue("@pid", txtnum.Text);
                    cmd.Parameters.AddWithValue("@amt", txtinv.Text);
                    cmd.Parameters.AddWithValue("@rem", txtrem.Text);
                    cmd.Parameters.AddWithValue("@paid", paid);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }


                // DataTable dt;
                dt = (DataTable)Session["data"];

                for (int i = 0; i <= dt.Rows.Count - 1; i++)

                {

                    using (SqlConnection con = new SqlConnection(s))
                    {


                        SqlCommand cmd = new SqlCommand("insert into PurDetails(p_id,sno,pro_id,quantity) values(@po,@sno,@mat,@qty)", con);
                        cmd.Parameters.AddWithValue("@po",txtnum.Text);
                        cmd.Parameters.AddWithValue("@sno", dt.Rows[i]["sno"]);
                        cmd.Parameters.AddWithValue("@mat", dt.Rows[i]["material"]);
                        cmd.Parameters.AddWithValue("@qty", dt.Rows[i]["quantity"]);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        //con.Close();
                    }
                    using (SqlConnection con = new SqlConnection(s))
                    {
                        SqlCommand cmd1 = new SqlCommand("update material set material.qty=material.qty+@quantity from  Material inner join purDetails  on purDetails.pro_id=Material.mname where Material.mname=@id", con);
                        cmd1.Parameters.AddWithValue("@id", dt.Rows[i]["material"]);
                        cmd1.Parameters.AddWithValue("@quantity", dt.Rows[i]["quantity"]);
                        con.Open();
                        cmd1.ExecuteNonQuery();
                        // con1.Close();

                    }
                }

                lblSuccessMessage.Text = "Order Added Successfully";
                Response.Redirect("~/admin/Receivedorder.aspx");
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }



        }
    }
}