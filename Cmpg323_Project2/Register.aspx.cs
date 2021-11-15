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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
            con.Open();
            string checkuser = "select count(*) from Register where FName='" + TextBox1.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, con);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

            if (temp == 1)
            {
                Response.Write("User already Exists");
            }
            con.Close();

        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void btn_register_Click(object sender, EventArgs e)
        {
            
        }
       
    }
    
}