﻿using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace wholesale
{
    public partial class addexpense : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["wholesale"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }




        protected void save_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("insert into expense values(@ecode,@ename,@edate,@ecompany,@eamt,@pstatus,@ecategory)", con);
                cmd.Parameters.AddWithValue("@ecode", code.Text);
                cmd.Parameters.AddWithValue("@ename", name.Text);
                cmd.Parameters.AddWithValue("@edate", edate.Text);
                cmd.Parameters.AddWithValue("@ecompany", company.Text);
                cmd.Parameters.AddWithValue("@eamt", amt.Text);
                cmd.Parameters.AddWithValue("@pstatus", status.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@ecategory", ecategory.SelectedItem.Value);

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Redirect("~/admin/expense.aspx");

                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = ex.Message;
                }

            }
        }



        protected void clear_Click(object sender, EventArgs e)
        {
            code.Text = "";
            name.Text = "";
            edate.Text = "";
            company.Text = "";
            amt.Text = "";
            status.ClearSelection();
            ecategory.ClearSelection();

        }
        public string getsalary()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select Sum(salary) from emp ", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                string price = dt.Rows[0][0].ToString();
                return price;
            }

        }
        protected void ecategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ecategory.SelectedItem.Text == "Employee Salary")
            {
               amt.Text= getsalary();
            }
            else
            {
                amt.Text = "";
            }
        }
    }
}
