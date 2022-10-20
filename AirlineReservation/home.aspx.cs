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
    public partial class home : System.Web.UI.Page
    {
        int totalCost = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = (int)Session["Id"];
            string role = Session["Role"].ToString();
            PanelForm.Visible = false;
            PanelButton.Visible = true;
            if (id == 0)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["Id"] = 0;
            Session["Role"] = "";
            Response.Redirect("login.aspx");
        }

        protected void BookTicket_Click(object sender, EventArgs e)
        {
            PanelForm.Visible = true;
            PanelButton.Visible = false;
        }

        protected void AddEntry()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            string query = "SELECT AvailableSeats FROM Airline WHERE Id = " + ddlFlightId.SelectedValue;
            try
            {
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        int seats = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                        if (seats == 0)
                        {
                            LabelError.Text = "Flight already booked!!";
                        }
                        else
                        {
                            string query1 = "INSERT INTO Ticket (UserId, Name, Age, Gender, FlightId) VALUES(@UserId, @Name, @Age, @Gender, @FlightId)";
                            SqlCommand cmd1 = new SqlCommand(query1);
                            cmd1.Parameters.AddWithValue("@UserId", Convert.ToInt32(Session["Id"]));
                            cmd1.Parameters.AddWithValue("@Name", tbName.Text);
                            cmd1.Parameters.AddWithValue("@Age", Convert.ToInt32(tbAge.Text));
                            cmd1.Parameters.AddWithValue("@Gender", DropDownListGender.SelectedValue);
                            cmd1.Parameters.AddWithValue("@FlightId", Convert.ToInt32(ddlFlightId.SelectedValue));
                            cmd1.Connection = con;
                            cmd1.ExecuteNonQuery();
                            string query2 = "update Airline set AvailableSeats = " + seats + " - 1 where Id =" + ddlFlightId.SelectedValue;
                            SqlCommand cmd2 = new SqlCommand(query2);
                            cmd2.Connection = con;
                            cmd2.ExecuteNonQuery();
                            string query3 = "SELECT Price FROM Airline WHERE Id = " + ddlFlightId.SelectedValue;
                            SqlCommand cmd3 = new SqlCommand(query3, con);
                            int price = Convert.ToInt32(cmd3.ExecuteScalar().ToString());
                            totalCost += price;
                            Response.Write("Total cost was: " + totalCost.ToString());
                        }
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Errors: " + ex.Message);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            AddEntry();
            totalCost = 0;
        }
    }
}