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
            //Label2.Text = Session[""]
        }




        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        /*private void Uploads()
        {
            string LoginConnectionString = ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(LoginConnectionString);
            System.Drawing.Image img = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);
            int height = img.Height;
            int width = img.Width;
            decimal size = Math.Round(((decimal)FileUpload1.PostedFile.ContentLength / (decimal)1024), 2);
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('size: " + size + "KB\\nHeight:" + height + "\\nWidth:" + width + "');", true);
            string sql = "INSERT INTO Photos VALUES( @size,@Width,@Height)";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@size", size);
                cmd.Parameters.AddWithValue("@Width", width);
                cmd.Parameters.AddWithValue("@Height", height);
            }
        }*/
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            try
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

                        cmd.Parameters.AddWithValue("@ContentType", FileUpload1.PostedFile.ContentType);
                        cmd.Parameters.AddWithValue("@Data", bytes);
                        cmd.Parameters.AddWithValue("@Name", Path.GetFileName(FileUpload1.PostedFile.FileName));
                        
                        
                        conn.Open();

                        cmd.ExecuteNonQuery();
                        conn.Close();

                    }
                   
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
            }

            
        }

       
    }   
    
}