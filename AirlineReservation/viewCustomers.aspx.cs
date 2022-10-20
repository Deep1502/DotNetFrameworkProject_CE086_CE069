using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AirlineReservation
{
    public partial class viewCustomers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            try
            {
                using (con)
                {
                    string command = "SELECT * FROM Users";
                    SqlCommand cmd = new SqlCommand(command, con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    GridViewCustomers.DataSource = rdr;
                    GridViewCustomers.DataBind();
                    rdr.Close();
                }
            }
            catch(Exception ex)
            {
                Response.Write("Errors: " + ex.Message);
            }
        }
    }
}