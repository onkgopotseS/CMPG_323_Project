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
        
        protected void Button1_Click(object sender, EventArgs e)
        {


            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
            con.Open();
            string checkuser = "select count(*) from Register where FName='" + TextBox1.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, con);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            con.Close();
            if (temp == 1)
            {
                
                con.Open();
                string checkPasswordQuery = "select Password from Register where FName='" + TextBox1.Text + "'";
                SqlCommand passComm = new SqlCommand(checkPasswordQuery, con);
                string password = passComm.ExecuteScalar().ToString().Replace(" ", "");

               
                if (password == TextBox2.Text)
                {
                    Session["New"] = TextBox1.Text;
                    Response.Write("Password is correct");
                    Response.Redirect("Photos.aspx");
                }
                else
                {
                    Response.Write("Password is not correct");
                }
            }
            else
            {
                Label4.Text= ("Username or Passowrd is not correct");
            }

        }
    }
}