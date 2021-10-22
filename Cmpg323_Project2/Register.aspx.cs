using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace Cmpg323_Project2
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        String con = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Onkgopotse Senye\Desktop\CMPG323\Cmpg323_Project2\Cmpg323_Project2\App_Data\PhotoDatabase.mdf;Integrated Security=True";
        SqlConnection com;
        SqlCommand comm;
        SqlDataAdapter adap;
        //DataSet set;
        //SqlDataReader big;
        protected void Button1_Click(object sender, EventArgs e)
        {
            try {    
                com = new SqlConnection(con);
                com.Open();
                string sss = $"INSERT INTO Register (FName, LName, Email_Address, Password) VALUES ('{TextBox1.Text}', '{TextBox2.Text}', '{TextBox3.Text}', '{TextBox4.Text}')";
                comm = new SqlCommand(sss, com);
                adap = new SqlDataAdapter();
                adap.InsertCommand = comm;
                adap.InsertCommand.ExecuteNonQuery();
                com.Close();
                Response.Redirect("Login.aspx");


            }

                catch
            {
                  Console.WriteLine("Error processing Table to the gridview");
            }
        }
    }
}