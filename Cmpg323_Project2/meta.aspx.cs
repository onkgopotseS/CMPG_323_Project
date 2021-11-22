using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cmpg323_Project2
{
    public partial class meta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            System.Drawing.Image img = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);
            
            int height = img.Height;
            int width = img.Width;
            decimal size = Math.Round(((decimal)FileUpload1.PostedFile.ContentLength / (decimal)1024), 2);
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert( 'size: " + size + "KB\\nHeight:" + height + "\\nWidth:" + width + "');", true);

        }
    }
}