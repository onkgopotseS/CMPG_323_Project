using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using ExifLib;
using System.Drawing.Imaging;
using System.Windows.Forms;

namespace Cmpg323_Project2
{
    public partial class Upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                Label2.Text = "" + Context.User.Identity.Name;
            }
            else
            {
                Label2.Text = "hii";
            }
        }




        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {


            string folderPath = Server.MapPath("~/Images/");

            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists Create it.
                Directory.CreateDirectory(folderPath);
            }

            //Save the File to the Directory (Folder).
            FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));

            //Display the Picture in Image control.
            Image1.ImageUrl = "~/Images/" + Path.GetFileName(FileUpload1.FileName);


            if (!String.IsNullOrEmpty(Image1.ImageUrl))
            {
                // Showing a notification of success after uploading.  
                string alert = "alert('Image uploaded successfully');";
                ScriptManager.RegisterStartupScript(this, GetType(), "JScript", alert, true);
            }
            System.Drawing.Image img = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);
            int height = img.Height;
            int width = img.Width;
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Height:" + height + "\\nWidth:" + width + "');", true);
        }
        
        protected void Button2_Click(object sender, EventArgs e)
        {
            byte[] bytes;
            using (BinaryReader br = new BinaryReader(FileUpload1.PostedFile.InputStream))
            {
                bytes = br.ReadBytes(FileUpload1.PostedFile.ContentLength);
            }
            
            string LoginConnectionString = ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(LoginConnectionString))
            {
                string sql = "INSERT INTO Photos VALUES( @ContentType, @Data, @Name)";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    ///cmd.Parameters.AddWithValue("@Name", Path.GetFileName(FileUpload1.PostedFile.FileName));
                    cmd.Parameters.AddWithValue("@ContentType", FileUpload1.PostedFile.ContentType);
                    cmd.Parameters.AddWithValue("@Data", bytes);
                    cmd.Parameters.AddWithValue("@Name", Path.GetFileName(FileUpload1.PostedFile.FileName));
                    
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
                string alert = "alert('Image saved in album');";
                ScriptManager.RegisterStartupScript(this, GetType(), "JScript", alert, true);
            }
            
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void Button4_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }

        protected void Button5_Click(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }
    }

}