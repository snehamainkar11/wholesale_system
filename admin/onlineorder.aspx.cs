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
    public partial class onlineorder : System.Web.UI.Page
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
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from custorder", sqlCon);
                sqlDa.Fill(dtbl);

            }
            if (dtbl.Rows.Count > 0)
            {
                gvmaterial.DataSource = dtbl;
                gvmaterial.DataBind();
                gvmaterial.FooterRow.Cells[3].Text = "Total:";
                gvmaterial.FooterRow.Cells[4].Text = dtbl.Compute("Sum(grandtotal)", "").ToString() + "  Rs";

                lblSuccessMessage.Text = "";
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvmaterial.DataSource = dtbl;
                gvmaterial.DataBind();
                gvmaterial.Rows[0].Cells.Clear();
                gvmaterial.Rows[0].Cells.Add(new TableCell());
                gvmaterial.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvmaterial.Rows[0].Cells[0].Text = "No Data Found ..!";
                gvmaterial.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }
        protected void gvmaterial_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvmaterial.EditIndex = -1;
            PopulateGridview();
            panel.Visible = false;
            panel1.Visible = false;
        }

        protected void gvmaterial_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvmaterial.EditIndex = e.NewEditIndex;
            PopulateGridview();
            panel.Visible = false;
            panel1.Visible = false;
        }
        protected void gvmaterial_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {


                using (SqlConnection sqlCon = new SqlConnection(s))
                {
                    sqlCon.Open();
                    SqlCommand cmd = new SqlCommand("update custorder  set shipstatus=@ship,paystatus=@pay where Id=@id", sqlCon);

                    cmd.Parameters.AddWithValue("@ship", (gvmaterial.Rows[e.RowIndex].FindControl("shipstatus") as DropDownList).SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@pay", (gvmaterial.Rows[e.RowIndex].FindControl("paystatus") as DropDownList).SelectedItem.Text);
                   
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvmaterial.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();


                    gvmaterial.EditIndex = -1;
                    PopulateGridview();
                    panel.Visible = true;
                    panel1.Visible = false;
                    lblSuccessMessage.Text = "Order Updated Successfully";
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