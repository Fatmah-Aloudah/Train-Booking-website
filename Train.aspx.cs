//this file was formated using https://htmlformatter.com/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Train_Railway
{
    public partial class Train : System.Web.UI.Page
    {
        private string abc = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(abc);
            try
            {
                con.Open();
                //Response.Write("<script language='javascript'> alert('Connection Eastablished successfully'); </script>");
            }
            catch (Exception ex)
            {
                //Response.Write("<script language='javascript'> alert('Problem in Connection'); </script>");
            }
            finally
            {
                con.Close();
                //Response.Write("<script language='javascript'> alert('Connection is Closed now'); </script>");
            }

            if (!this.IsPostBack)
            {
                SqlCommand cmd = new SqlCommand("select * from Users order by name", con);
                SqlDataReader reader;
                try
                {
                    con.Open();
                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        DropDownList1.Items.Add(reader["name"].ToString());
                    }
                }
                catch (Exception ex) { }
                finally
                {
                    con.Close();
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(abc);
            SqlCommand cmd = new SqlCommand("select * from Users where Name='" +
                DropDownList1.SelectedItem + "'", con);
            SqlDataReader reader;

            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                reader.Read();
                ListBox1.Items.Clear();
                ListBox1.Items.Add("Name: " + reader["Name"]);
                ListBox1.Items.Add("Father Name: " + reader["FatherName"]);
                ListBox1.Items.Add("Family Name: " + reader["FamilyName"]);
            }
            catch (Exception ex) { }
            finally
            {
                con.Close();
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length == 10)
                args.IsValid = true;

            else
                args.IsValid = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(abc);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Trains where id='" + TextBox3.Text + "'", con);
                SqlDataReader reader;
                reader = cmd.ExecuteReader();
                reader.Read();
                ListBox1.Items.Add("National ID: " + TextBox1.Text);
                ListBox1.Items.Add(" Age: " + TextBox2.Text);
                ListBox1.Items.Add(" Train ID: " + reader["Id"]);
                ListBox1.Items.Add(" Train Name: " + reader["Name"]);
                ListBox1.Items.Add(" Day: " + reader["Day"]);
                ListBox1.Items.Add(" From: " + reader["From"]);
                ListBox1.Items.Add(" Destination: " + reader["To"]);
                ListBox1.Items.Add(" Time Leaving: " + reader["Leaving"]);
                ListBox1.Items.Add(" Time Arriving to Destination: " + reader["Arriving"]);
            }
            catch (Exception er)
            {
                //Response.Write("<script language='javascript'> alert('Problemm Connected'); </script>");
            }
            finally
            {
                con.Close();
                //Response.Write("<script language='javascript'> alert('Close'); </script>");
            }

        }
    }
}