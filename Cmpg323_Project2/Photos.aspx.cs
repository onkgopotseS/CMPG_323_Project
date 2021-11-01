using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cmpg323_Project2
{
    public partial class Photos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if( DropDownList2.SelectedItem.Text == "Upload Photos")
            {
                Response.Redirect("Upload.aspx");
            }
            else if(DropDownList2.SelectedItem.Text == "View Shared Photos")
            {
                Response.Redirect("Shared_Photos.aspx");
            }
        }
    }
}