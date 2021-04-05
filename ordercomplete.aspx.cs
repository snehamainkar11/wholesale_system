using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wholesale
{
    public partial class ordercomplete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["ID"]);
            label1.Text = PID.ToString();
        }
    }
}