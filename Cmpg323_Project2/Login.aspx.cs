using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace Cmpg323_Project2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        String con = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Onkgopotse Senye\Desktop\CMPG323\Cmpg323_Project2\Cmpg323_Project2\App_Data\PhotoDatabase.mdf;Integrated Security=True";
        SqlConnection com;
        SqlCommand comm;
        SqlDataAdapter adap;
        DataSet set;
        SqlDataReader big;
        protected void Button1_Click(object sender, EventArgs e)
        {


            Session["Value1"] = TextBox1.Text;

            try
            {
                com = new SqlConnection(con);
                com.Open();
                adap = new SqlDataAdapter();
                string sss = $"SELECT * FROM Register";
                comm = new SqlCommand(sss, com);
                big = comm.ExecuteReader();
                while (big.Read())
                {
                    if (big[0].ToString() == TextBox1.Text && big[3].ToString() == TextBox2.Text)
                    {
                        Response.Redirect("Photos.aspx");
                    }
                    else
                    {
                        Label3.Text = "incorrect username or password";
                    }


                }

                com.Close();
            }
            catch
            {
                Console.WriteLine("Error occured while checking the existance of the user");
            }

        }
    }
}