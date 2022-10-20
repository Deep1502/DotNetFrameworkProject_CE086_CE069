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
    public partial class airlines : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PanelManageAirline.Visible = false;
            PanelAddAirlineButton.Visible = true;
        }

        protected void ShowAirlines()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            try
            {
                using (con)
                {
                    string command = "SELECT * FROM Airline";
                    SqlCommand cmd = new SqlCommand(command, con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    //GridViewAirlines.DataSource = rdr;
                    GridViewAirlines.DataBind();
                    rdr.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("Errors: " + ex.Message);
            }
        }

        protected void btnAddAirline_Click(object sender, EventArgs e)
        {
            PanelAddAirlineButton.Visible=false;
            PanelManageAirline.Visible=true;

        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
                string query = "INSERT INTO Airline (Name, Seats, AvailableSeats, Price, Source, STime, Destination, DTime) VALUES(@Name, @Seats, @Available, @Price, @Source, @STime, @Destination, @DTime)";
                try
                {
                    using (con)
                    {
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.Parameters.AddWithValue("@Name", AirlineName.Text);
                            cmd.Parameters.AddWithValue("@Seats", AirlineSeats.Text);
                            cmd.Parameters.AddWithValue("@Available", AirlineAvailableSeats.Text);
                            cmd.Parameters.AddWithValue("@Price", AirlinePrice.Text);
                            cmd.Parameters.AddWithValue("@Source", AirlineSource.Text);
                            cmd.Parameters.AddWithValue("@STime", Convert.ToDateTime(AirlineSTime.Text));
                            cmd.Parameters.AddWithValue("@Destination", AirlineDestination.Text);
                            cmd.Parameters.AddWithValue("@DTime", Convert.ToDateTime(AirlineDTime.Text));
                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Errors: " + ex.Message);
                }
                finally
                {
                    AirlineName.Text = String.Empty;
                    AirlineSeats.Text = String.Empty;
                    AirlineAvailableSeats.Text = String.Empty;
                    AirlinePrice.Text = String.Empty;
                    AirlineSource.Text = String.Empty;
                    AirlineSTime.Text = String.Empty;
                    AirlineDestination.Text = String.Empty;
                    AirlineDTime.Text = String.Empty;
                    PanelAddAirlineButton.Visible = true;
                    PanelManageAirline.Visible = false;
                }
                    ShowAirlines();
        }

        /*protected void btnShowAirline_Click(object sender, EventArgs e)
        {
            ShowAirlines();
        }*/


    }
}