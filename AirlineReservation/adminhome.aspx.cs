using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AirlineReservation
{
    public partial class adminhome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = (int)Session["Id"];
            string role = Session["Role"].ToString();
            if(id == 0)
            {
                Response.Redirect("login.aspx");
            }
            else if(role == "Client")
            {
                Response.Redirect("home.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["Id"] = 0;
            Session["Role"] = "";
            Response.Redirect("login.aspx");
        }
    }
}