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

namespace wholesale
{
    public partial class employeelist : System.Web.UI.Page
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
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(s))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from emp", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvemp.DataSource = dtbl;
                gvemp.DataBind();
                lblSuccessMessage.Text = "";
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvemp.DataSource = dtbl;
                gvemp.DataBind();
                gvemp.Rows[0].Cells.Clear();
                gvemp.Rows[0].Cells.Add(new TableCell());
                gvemp.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvemp.Rows[0].Cells[0].Text = "No Data Found ..!";
                gvemp.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }




        protected void gvemp_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvemp.EditIndex = -1;
            PopulateGridview();

            panel1.Visible = false;
            panel.Visible = false;
        }

        protected void gvemp_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvemp.EditIndex = e.NewEditIndex;
            PopulateGridview();

            panel1.Visible = false;
            panel.Visible = false;
        }

        protected void gvemp_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            try
            {


                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    sqlCon.Open();
                    SqlCommand cmd = new SqlCommand("update Emp set ename=@ename,position=@position,salary=@salary,address=@address,contact=@contact,eoj=@eoj,doj=@doj,etype=@etype,zip=@zip where Id=@id", sqlCon);

                    cmd.Parameters.AddWithValue("@ename", (gvemp.Rows[e.RowIndex].FindControl("txtename") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@position", (gvemp.Rows[e.RowIndex].FindControl("position") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@salary", (gvemp.Rows[e.RowIndex].FindControl("salary") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@address", (gvemp.Rows[e.RowIndex].FindControl("addr") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@contact", (gvemp.Rows[e.RowIndex].FindControl("contact") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@etype", (gvemp.Rows[e.RowIndex].FindControl("etype") as DropDownList).SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@doj", (gvemp.Rows[e.RowIndex].FindControl("doj") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@eoj", (gvemp.Rows[e.RowIndex].FindControl("eoj") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@zip", (gvemp.Rows[e.RowIndex].FindControl("txtzip") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvemp.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();


                }

                gvemp.EditIndex = -1;
                PopulateGridview();

                panel.Visible = true;
                panel1.Visible = false;
                lblSuccessMessage.Text = "Selected Record Updated";
                lblErrorMessage.Text = "";
            }

            catch (Exception ex)
            {

                panel1.Visible = true;
                panel.Visible = false;
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }
        protected void clear()
        {
            txtaddress.Text = "";
            txtcontact.Text = "";
            txtfname.Text = "";
            endcontract.Text = "";
            startcontract.Text = "";
            etype.ClearSelection();
            txtzip.Text = "";
            pos.Text = "";
            salary.Text = "";
        }
        protected void gvemp_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(s))
                {


                    sqlCon.Open();
                    string query = "DELETE FROM emp where Id = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvemp.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();


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

        protected void btnemp_Click(object sender, EventArgs e)
        {
            if (txtcontact.Text != "" && txtfname.Text != "" &&  salary.Text != "" && pos.Text != "" && etype.Text != "")
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(s))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("insert into Emp Values(@sname,@gstno,@company,@address,@contact,@email,@city,@state,@zip)", con);

                        cmd.Parameters.AddWithValue("@sname", txtfname.Text);
                        cmd.Parameters.AddWithValue("@gstno", pos.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@company", txtcontact.Text);
                        cmd.Parameters.AddWithValue("@address", salary.Text);
                        cmd.Parameters.AddWithValue("@contact", txtaddress.Text);
                        cmd.Parameters.AddWithValue("@email", txtzip.Text);
                        cmd.Parameters.AddWithValue("@city", etype.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@state", startcontract.Text);
                        cmd.Parameters.AddWithValue("@zip", endcontract.Text);
                        cmd.ExecuteNonQuery();
                        PopulateGridview();

                        panel.Visible = true;
                        panel1.Visible = false;
                        lblSuccessMessage.Text = "Record Added Successfully!!";
                        lblErrorMessage.Text = "";
                        this.clear();
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
            else
            {
                panel1.Visible = true;
                panel.Visible = false;
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = "Please Enter Valid Details";

            }
        }
    }
}