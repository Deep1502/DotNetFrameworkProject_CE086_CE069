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
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            string query = "INSERT INTO Users (FName, LName, Email, Password, Role) VALUES(@Fname, @Lname, @Email, @Password, @Role)";
            try
            {
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@Fname", tbFName.Text);
                        cmd.Parameters.AddWithValue("@Lname", tbLName.Text);
                        cmd.Parameters.AddWithValue("@Email", tbEmail.Text);
                        cmd.Parameters.AddWithValue("@Password", tbPassword.Text);
                        cmd.Parameters.AddWithValue("@Role", "Client");
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                Response.Write("Registered successfully!!!");
            }
            catch (Exception ex)
            {
                Response.Write("Errors: " + ex.Message);
            }
        }
    }
}