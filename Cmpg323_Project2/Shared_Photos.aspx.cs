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
using System.Drawing.Imaging;

namespace Cmpg323_Project2
{
    public partial class Shared_Photos : System.Web.UI.Page
    {
        //System.Web.UI.WebControls.Image img = new System.Drawing.Image();
        System.Web.UI.WebControls.Image img = new System.Web.UI.WebControls.Image();


        SqlDataAdapter da;
        DataSet ds;
        string LoginConnectionString = ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString;
        SqlConnection conn;
        // System.Drawing.Image img = new System.Drawing.Image();
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!this.IsPostBack)
            {
                //string LoginConnectionString = ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(LoginConnectionString))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Photos", conn))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gvImages.DataSource = dt;
                        gvImages.DataBind();
                        ImageData();
                    }
                }
            }
        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["Data"]);

                (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
            }
        }
        protected void ImageData()
        {
            conn = new SqlConnection(LoginConnectionString);
            conn.Open();
            da = new SqlDataAdapter("SELECT * FROM Photos", conn);
            ds = new DataSet();
            da.Fill(ds);
            gvImages.DataSource = ds;
            gvImages.DataBind();
        }

        protected void gvImage_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvImages.EditIndex = -1;
            ImageData();
        }
        protected void gvImages_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)gvImages.Rows[e.RowIndex];
            Label Id = (Label)row.FindControl("lblId");
            Label name = (Label)row.FindControl("lblname");
            SqlConnection conn = new SqlConnection(LoginConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("delete FROM Photos where Id='" + Convert.ToInt32(gvImages.DataKeys[e.RowIndex].Value.ToString()) + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            //ImageDeleteFromFolder(name.Text);
            ImageData();
        }
        protected void gvImages_RowEditing(object sender, GridViewDeleteEventArgs e)
        {
           
        }
    

        /* protected void ImageDeleteFromFolder(string Images)
         {
             string file_name = Images;
             string path = Server.MapPath("~/uploads/");
             FileInfo file = new FileInfo(path + file_name);
             if (file.Exists)
             {
                 file.Delete();
                 lblResult.Text = " file deleted successfully";
                 lblResult.ForeColor = System.Drawing.Color.Green;
             }
             else
             {
                 lblResult.Text = " This file does not exists ";
                 lblResult.ForeColor = System.Drawing.Color.Red;
             }
         }*/

        protected void DownloadFile(object sender, EventArgs e)
        {
            int id = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string fileName, contentType;
            string LoginConnectionString = ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(LoginConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select ContentType,Data,Name from Photos where Id=@Id";
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Connection = conn;
                    conn.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        bytes = (byte[])sdr["Data"];
                        contentType = sdr["ContentType"].ToString();
                        fileName = sdr["Name"].ToString();
                        


                    }
                    conn.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
           
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }
        protected void gvImages_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }
        private void Upload(decimal size,  int height, int width)
        {
            System.Drawing.Image img = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);
            height = img.Height;
            width = img.Width;
            size = Math.Round(((decimal)FileUpload1.PostedFile.ContentLength / (decimal)1024), 2);
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('size: " + size + "KB\\nHeight:" + height + "\\nWidth:" + width + "');", true);
            string sql = "INSERT INTO Photos VALUES( @size,@Width,@Height)";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@size", size);
                cmd.Parameters.AddWithValue("@Width", width);
                cmd.Parameters.AddWithValue("@Height", height);
            }
        }
        protected void btnUpload_Click(object sender, EventArgs e)
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
                   // Upload();

                    conn.Open();
                    
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    
                }
                string alert = "alert('Image saved in album');";
                ScriptManager.RegisterStartupScript(this, GetType(), "JScript", alert, true);
                


            }

         

            Response.Redirect(Request.Url.AbsoluteUri);
            

        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }
        
    }
}