using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using ezapp;

namespace _20171123_web
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;
        string commText;

        private void show_ListView(string commText, string param, int paramValue)
        {
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn.ConnectionString = connString.ConnectionString();
            conn.Open();
            cmd.Connection = conn; //連接
            cmd.CommandText = commText;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue(param, paramValue);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                ListView1.DataSource = dr;
                ListView1.DataSourceID = "";
                ListView1.DataBind();
            }

            dr.Close();
            conn.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (lblptDetail.Text == "0")
                {
                    if (Session["ptDetailNo"] != null)
                    {
                        commText = "SELECT * FROM products WHERE ptDetailNo = @ptDetailNo";
                        show_ListView(commText, "@ptDetailNo", Int32.Parse(Session["ptDetailNo"].ToString()));
                    }
                    else
                    {
                        if (Session["LinkTop"] == null)
                        {
                            Session["LinkTop"] = 1;
                        }
                        commText = "SELECT * FROM products INNER JOIN productType_Detail ON products.ptDetailNo=productType_Detail.ptDetailNo WHERE ptNo = @ptNo";
                        show_ListView(commText, "@ptNo", Int32.Parse(Session["LinkTop"].ToString()));
                    }
                    
                }
            }
            
            
        }

        int count = 0;
        string commTextForBullet = "SELECT * FROM products WHERE ptDetailNo = @ptDetailNo";
        protected void BulletedList1_Click(object sender, BulletedListEventArgs e)
        {
            lblptDetail.Text = (e.Index + 1).ToString();
            show_ListView(commTextForBullet, "@ptDetailNo", Int32.Parse(lblptDetail.Text));
        }

        protected void BulletedList2_Click(object sender, BulletedListEventArgs e)
        {
            count = BulletedList1.Items.Count;
            lblptDetail.Text = (e.Index + 1 + count).ToString();
            show_ListView(commTextForBullet, "@ptDetailNo", Int32.Parse(lblptDetail.Text));
        }

        protected void BulletedList3_Click(object sender, BulletedListEventArgs e)
        {
            count = BulletedList1.Items.Count + BulletedList2.Items.Count;
            lblptDetail.Text = (e.Index + 1 + count).ToString();
            show_ListView(commTextForBullet, "@ptDetailNo", Int32.Parse(lblptDetail.Text));
        }

        protected void BulletedList4_Click(object sender, BulletedListEventArgs e)
        {
            count = BulletedList1.Items.Count + BulletedList2.Items.Count + BulletedList3.Items.Count;
            lblptDetail.Text = (e.Index + 1 + count).ToString();
            show_ListView(commTextForBullet, "@ptDetailNo", Int32.Parse(lblptDetail.Text));
        }

        List<String> ptDetailList = new List<String>();
        private void BulletedList(int value)
        {
            ptDetailList.Clear();
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn.ConnectionString = connString.ConnectionString();
            conn.Open();
            cmd.Connection = conn; //連接
            cmd.CommandText = "SELECT * FROM productType_Detail WHERE ptNo = @ptNo";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@ptNo", value);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    ptDetailList.Add(dr.GetValue(2).ToString());
                    //BulletedList1.Items.Add(dr.GetValue(2).ToString());
                }

            }
            
            dr.Close();
            conn.Close();
        }

        protected void BulletedList1_Load(object sender, EventArgs e)
        {
            BulletedList(1);
            BulletedList1.DataSource = ptDetailList;
            BulletedList1.DataBind();
        }

        protected void BulletedList2_Load(object sender, EventArgs e)
        {
            BulletedList(2);
            BulletedList2.DataSource = ptDetailList;
            BulletedList2.DataBind();
        }

        protected void BulletedList3_Load(object sender, EventArgs e)
        {
            BulletedList(3);
            BulletedList3.DataSource = ptDetailList;
            BulletedList3.DataBind();
        }

        protected void BulletedList4_Load(object sender, EventArgs e)
        {
            BulletedList(4);
            BulletedList4.DataSource = ptDetailList;
            BulletedList4.DataBind();
        }


        private void ptNolist(int value)
        {
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn.ConnectionString = connString.ConnectionString();
            conn.Open();
            cmd.Connection = conn; //連接
            cmd.CommandText = "SELECT ptNo FROM productType_Detail WHERE ptDetailNo = @ptDetailNo";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@ptDetailNo", value);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    string ptNo = dr["ptNo"].ToString();
                    switch (ptNo)
                    {
                        case "1":
                            Session["productSize"] = "productSize_Top";
                            break;
                        case "2":
                            Session["productSize"] = "productSize_Bottom";
                            break;
                        case "3":
                            Session["productSize"] = "productSize_Outter";
                            break;
                        case "4":
                            Session["productSize"] = "productSize_Accessories";
                            break;
                        default:
                            break;
                    }
                }

            }

            dr.Close();
            conn.Close();
        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if(e.CommandName == "imgPost")
            {
                Session["pNo"] = ((Label)e.Item.FindControl("pNo")).Text;
                string ptDetailNo = ((Label)e.Item.FindControl("ptDetailNo")).Text;
                ptNolist(Int32.Parse(ptDetailNo));
                //Session["pName"] = ((Label)e.Item.FindControl("pName")).Text;
                //Session["pPrice"] = ((Label)e.Item.FindControl("pPrice")).Text;
                Session["pPicUrl"] = ((ImageButton)e.Item.FindControl("ImageButton1")).ImageUrl.ToString();
                Response.Redirect("goodsDetail.aspx", true);
            }
        }
    }
}