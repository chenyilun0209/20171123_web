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
    public partial class WebForm4 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;
        string commText;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (Session["pNo"] != null)
                {
                    lblPNo.Text = Session["pNo"].ToString();
                    Image1.ImageUrl = Session["pPicUrl"].ToString();
                    productDetail(lblPNo.Text);                    

                    SizeDDL.Items.Insert(0, "尚未選擇樣式");

                    
                    
                }
                else
                {
                    Response.Redirect("homepage.aspx", true);
                }
            }
            
            
        }

        private void productDetail(string value)
        {
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn.ConnectionString = connString.ConnectionString();
            conn.Open();
            cmd.Connection = conn; //連接
            cmd.CommandText = "SELECT * FROM products WHERE pNo = @pNo";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@pNo", value);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lblPName.Text = dr["name"].ToString();
                    lblPPrice.Text = dr["price2"].ToString();
                    lblpContent.Text = dr["pContent"].ToString();
                    lblpContent2.Text = dr["pContent2"].ToString();
                    lblpContent3.Text = dr["pContent3"].ToString();

                }

            }

            dr.Close();
            conn.Close();
        }

        //尺寸下拉選單
        private void productDropDown(string productSize,string value)
        {
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn.ConnectionString = connString.ConnectionString();
            conn.Open();
            cmd.Connection = conn; //連接
            cmd.CommandText = "SELECT * FROM prouductStyle INNER JOIN (pStyle_pSize INNER JOIN ( "+ productSize + " INNER JOIN size ON " + productSize + ".sizeNo = size.sizeNo) ON pStyle_pSize.pSizeNo = " + productSize + ".pSizeNo) ON pStyle_pSize.pStyleNo = prouductStyle.pStyleNo WHERE prouductStyle.pStyleNo = @pStyleNo";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@pStyleNo", value);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                int j = 0;
                //int i = 0;
                while (dr.Read())
                {
                    SizeDDL.Items.Insert(j, dr["size"].ToString());
                    j++;
                }
            }

            dr.Close();
            conn.Close();
        }

        //側邊攔
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

        int count = 0;
        protected void BulletedList1_Click(object sender, BulletedListEventArgs e)
        {
            Session["ptDetailNo"] = e.Index + 1;
            Response.Redirect("goods.aspx", true);
        }

        protected void BulletedList2_Click(object sender, BulletedListEventArgs e)
        {
            count = BulletedList1.Items.Count;
            Session["ptDetailNo"] = e.Index + 1 + count;
            Response.Redirect("goods.aspx", true);
        }

        protected void BulletedList3_Click(object sender, BulletedListEventArgs e)
        {
            count = BulletedList1.Items.Count + BulletedList2.Items.Count;
            Session["ptDetailNo"] = e.Index + 1 + count;
            Response.Redirect("goods.aspx", true);
        }

        protected void BulletedList4_Click(object sender, BulletedListEventArgs e)
        {
            count = BulletedList1.Items.Count + BulletedList2.Items.Count + BulletedList3.Items.Count;
            Session["ptDetailNo"] = e.Index + 1 + count;
            Response.Redirect("goods.aspx", true);
        }

        //尺寸表
        private void pSizeList(string productSize, string value)
        {
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn.ConnectionString = connString.ConnectionString();
            conn.Open();
            cmd.Connection = conn; //連接
            cmd.CommandText = "SELECT size," + productSize + ".* FROM prouductStyle INNER JOIN (pStyle_pSize INNER JOIN ( " + productSize + " INNER JOIN size ON " + productSize + ".sizeNo = size.sizeNo) ON pStyle_pSize.pSizeNo = " + productSize + ".pSizeNo) ON pStyle_pSize.pStyleNo = prouductStyle.pStyleNo WHERE prouductStyle.pStyleNo = @pStyleNo";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@pStyleNo", value);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                switch(productSize)
                {
                    case "productSize_Top":
                        GridView1.DataSource = dr;
                        GridView1.DataBind();
                        break;
                    case "productSize_Bottom":
                        GridView2.DataSource = dr;
                        GridView2.DataBind();
                        break;
                    case "productSize_Outter":
                        GridView3.DataSource = dr;
                        GridView3.DataBind();
                        break;
                    case "productSize_Accessories":
                        GridView4.DataSource = dr;
                        GridView4.DataBind();
                        break;
                    default:
                        break;
                }
                
                
            }

            dr.Close();
            conn.Close();
        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                Label2.Visible = false;
                SizeDDL.Items.Clear();
                Image1.ImageUrl = ((Label)e.Item.FindControl("Label1")).Text;
                lblStyle.Text = ((Label)e.Item.FindControl("lblpStyle")).Text;
                lblStyleNo.Text = ((Label)e.Item.FindControl("lblpStyleNo")).Text;

                productDropDown(Session["productSize"].ToString(), lblStyleNo.Text);
                pSizeList(Session["productSize"].ToString(), lblStyleNo.Text);

                txtAmount.Text = "1";

            }
        }

        int amount = 0;
        protected void btnAmount1_Click(object sender, EventArgs e)
        {  

            if (Int32.Parse(txtAmount.Text) > 1)
            {
                amount = Int32.Parse(txtAmount.Text) - 1;
                txtAmount.Text = amount.ToString();
            }
            
        }

        protected void btnAmount2_Click(object sender, EventArgs e)
        {         
            if (Int32.Parse(txtAmount.Text) < 10)
            {
                amount = Int32.Parse(txtAmount.Text) + 1;
                txtAmount.Text = amount.ToString();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if(lblStyle.Text != "")
            {
                //if(Session["user"] != null)
                //{

                //}
                //else
                //{
                    string str_pNo = lblPNo.Text;
                    string str_pName = lblPName.Text;
                    string str_pStyle = lblStyle.Text;
                    string str_size = SizeDDL.SelectedValue;
                    string str_img = Image1.ImageUrl.ToString();
                    int int_qty = int.Parse(txtAmount.Text);
                    int int_price = int.Parse(lblPPrice.Text);

                    if (!string.IsNullOrEmpty(str_pNo) && int_qty > 0 && int_price > 0)
                    {
                        ezCart.AddRow(str_pNo, str_img, str_pName, str_pStyle, str_size, int_qty, int_price, Session["CartID"].ToString());
                        GridView gvCart = (GridView)Master.FindControl("GridView1");
                        gvCart.DataSource = ezCart.GetBuyCart();
                        gvCart.DataBind();

                        Button btnBuy = (Button)Master.FindControl("btnBuy");
                        btnBuy.Visible = true;
                        Label lblCart = (Label)Master.FindControl("lblCart");
                        lblCart.Visible = false;
                        Label lblCartTotal = (Label)Master.FindControl("lblCartTotal");
                        lblCartTotal.Text = ezCart.Total();
                    }
                //}
                
            }    
            else
            {
                Response.Write("<Script language='Javascript'>");
                Response.Write("alert('尚未選擇樣式')");
                Response.Write("</" + "Script>");
            }


        }
    }
}