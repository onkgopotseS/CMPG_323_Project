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
namespace Cmpg323_Project2
{
    public partial class Shared_Photos : System.Web.UI.Page
    {
        
        
        SqlDataAdapter da;
        DataSet ds;
        string LoginConnectionString = ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString;
        SqlConnection conn;
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
         }
         protected void gvImage_RowEditing(object sender, GridViewEditEventArgs e)
         {
             gvImages.EditIndex = e.NewEditIndex;
             ImageData();
         }*/
        protected void DownloadFile(object sender, EventArgs e)
        {
            int id = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string fileName, contentType,Author;
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
    }
}