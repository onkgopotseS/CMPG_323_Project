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

using System.Web.Services;

namespace Cmpg323_Project2
{
    public partial class Shared_Photos : System.Web.UI.Page
    {
        


        SqlDataAdapter da;
        DataSet ds;
        string LoginConnectionString = ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString;
        SqlConnection conn;
       
        private static int PageSize = 2;
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!this.IsPostBack)
            {
                //string LoginConnectionString = ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(LoginConnectionString))
                {
                    using ( da = new SqlDataAdapter("SELECT * FROM Photos", conn))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        gvImages.DataSource = dt;
                        gvImages.DataBind();
                        ImageData();
                        //BindDummyRow();
                        

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
        /*private void BindDummyRow()
        {
            DataTable dummy = new DataTable();
            dummy.Columns.Add("Id");
            dummy.Columns.Add("Name");
            dummy.Columns.Add("Data");
            dummy.Rows.Add();
            gvImages.DataSource = dummy;
            gvImages.DataBind();
        }*/

        [WebMethod]
        public static string GetFiles(string searchTerm, int pageIndex)
        {
            string query = "[Files_GetFiles_Pager]";
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SearchTerm", searchTerm);
            cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
            cmd.Parameters.AddWithValue("@PageSize", PageSize);
            cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
            return GetData(cmd, pageIndex).GetXml();
        }

        private static DataSet GetData(SqlCommand cmd, int pageIndex)
        {
            string strConnString = ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = conn;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        sda.Fill(ds, "Files");
                        DataTable dt = new DataTable("Pager");
                        dt.Columns.Add("PageIndex");
                        dt.Columns.Add("PageSize");
                        dt.Columns.Add("RecordCount");
                        dt.Rows.Add();
                        dt.Rows[0]["PageIndex"] = pageIndex;
                        dt.Rows[0]["PageSize"] = PageSize;
                        dt.Rows[0]["RecordCount"] = cmd.Parameters["@RecordCount"].Value;
                        ds.Tables["Files"].Columns.Add("Image");
                        for (int i = 0; i < ds.Tables["Files"].Rows.Count; i++)
                        {
                            byte[] imgBytes = (byte[])ds.Tables["Files"].Rows[i]["Data"];
                            string base64String = Convert.ToBase64String(imgBytes, 0, imgBytes.Length);
                            ds.Tables["Files"].Rows[i]["Image"] = "data:image/png;base64," + base64String;
                        }
                        ds.Tables.Add(dt);
                        return ds;
                    }
                }
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
            
            ImageData();
        }
        protected void gvImages_RowEditing(object sender, GridViewDeleteEventArgs e)
        {
           
        }
    

        

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
        /*private void Upload(decimal size,  int height, int width)
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
        }*/
        

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }
        
    }
}