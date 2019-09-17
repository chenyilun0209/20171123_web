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
    public partial class WebForm7 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;
        string commText;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvShoplist.DataSource = ezCart.GetBuyCart();
                gvShoplist.DataBind();
                lblcount.Text = ezCart.Total();
                lblcountPrice.Text = ezCart.TotalPrice();  
            }
            if(ezCart.GetBuyCart() == null)
            {
                Response.Write("<script>alert('購物車無商品!'); location.href='homepage.aspx'; </script>");
            }
            
            //if (RadioButton1.Checked)
            //{
            //    RadBtnList(1);
            //}
            //else if (RadioButton2.Checked)
            //{
            //    RadBtnList(2);
            //}
            //else if (RadioButton3.Checked)
            //{
            //    RadBtnList(3);
            //}
            //else if (RadioButton4.Checked)
            //{
            //    RadBtnList(4);
            //}
            //else
            //{
            //    lblShipCost.Text = "尚未選擇";
            //}
            
            if(RadioButtonList2.SelectedIndex == -1)
            {
                lblShipCost.Text = "尚未選擇";
            }
            else
            {
                RadBtnList(int.Parse(RadioButtonList2.SelectedValue.ToString()));
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ContentPlaceHolder1_RadioButtonList2", "$('#ContentPlaceHolder1_RadioButtonList2').addClass('list-group');", true);
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ContentPlaceHolder1_RadioButtonList2", "$('#ContentPlaceHolder1_RadioButtonList2').addClass('list-group-flush');", true);
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ContentPlaceHolder1_RadioButtonList2 li", "$('#ContentPlaceHolder1_RadioButtonList2 li').addClass('list-group-item');", true);
            }
            
            
            totalprice();

        }

        //總金額
        private void totalprice()
        {
            int total = 0;
            if (lblShipCost.Text == "尚未選擇")
            {
                lbltotal.Text = lblcountPrice.Text;
            }
            else
            {
                total = int.Parse(lblcountPrice.Text) + int.Parse(lblShipCost.Text);
                lbltotal.Text = total.ToString();
            }
        }
        
        //運費
        private void RadBtnList(int value)
        {
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn.ConnectionString = connString.ConnectionString();
            conn.Open();
            cmd.Connection = conn; //連接
            cmd.CommandText = "SELECT * FROM deliverType WHERE dtNo = @dtNo";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@dtNo", value);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lblShipCost.Text = dr["price"].ToString();
                }

            }

            dr.Close();
            conn.Close();
        }

        private void GetMasterGrid()
        {
            GridView gvCart = (GridView)Master.FindControl("GridView1");
            gvCart.DataSource = ezCart.GetBuyCart();
            gvCart.DataBind();
            Label lblCartTotal = (Label)Master.FindControl("lblCartTotal");
            lblCartTotal.Text = ezCart.Total();
            UpdatePanel updatePanel = (UpdatePanel)Master.FindControl("UpdatePanel1");
            updatePanel.Update();
            //UpdatePanel updatePane2 = (UpdatePanel)Master.FindControl("UpdatePanel2");
            //updatePane2.Update();
        }
        protected void gvShoplist_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "ImgGoDetail")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string lblpNo = ((Label)gvShoplist.Rows[index].FindControl("lblpNo")).Text;
                Session["pNo"] = lblpNo;
                Response.Redirect("goodsDetail.aspx", true);
            }
            if (e.CommandName == "ImgDelete")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string lblRowid = ((Label)gvShoplist.Rows[index].FindControl("lblRowid")).Text;
                ezCart.DeleteCart(lblRowid);       
                gvShoplist.DataSource = ezCart.GetBuyCart();
                gvShoplist.DataBind();
                lblcount.Text = ezCart.Total();
                lblcountPrice.Text = ezCart.TotalPrice();
                totalprice();
                GetMasterGrid();
            }
            if (e.CommandName == "QtyLess")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string lblRowid = ((Label)gvShoplist.Rows[index].FindControl("lblRowid")).Text;
                string txtQty = ((TextBox)gvShoplist.Rows[index].FindControl("txtQty")).Text;
                if (Int32.Parse(txtQty) > 1)
                {
                    int value = int.Parse(txtQty) - 1;
                    ((TextBox)gvShoplist.Rows[index].FindControl("txtQty")).Text = value.ToString();
                    ezCart.UpdateCart(lblRowid, value);
                }  
                gvShoplist.DataSource = ezCart.GetBuyCart();
                gvShoplist.DataBind();
                lblcount.Text = ezCart.Total();
                lblcountPrice.Text = ezCart.TotalPrice();
                totalprice();
                GetMasterGrid();
            }
            if (e.CommandName == "QtyAdd")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string lblRowid = ((Label)gvShoplist.Rows[index].FindControl("lblRowid")).Text;  
                string txtQty = ((TextBox)gvShoplist.Rows[index].FindControl("txtQty")).Text;
                if (Int32.Parse(txtQty) < 10)
                {
                    int value = int.Parse(txtQty) + 1;
                    ((TextBox)gvShoplist.Rows[index].FindControl("txtQty")).Text = value.ToString();
                    ezCart.UpdateCart(lblRowid, value);
                }
                    
                gvShoplist.DataSource = ezCart.GetBuyCart();
                gvShoplist.DataBind();
                lblcount.Text = ezCart.Total();
                lblcountPrice.Text = ezCart.TotalPrice();
                totalprice();
                GetMasterGrid();
            }
            
        }

        protected void gvShoplist_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)

            {
                ImageButton ImageButton2 = (ImageButton)e.Row.FindControl("ImageButton2");
                ImageButton2.CommandArgument = e.Row.RowIndex.ToString();
                ImageButton imgDelete = (ImageButton)e.Row.FindControl("imgDelete");
                imgDelete.CommandArgument = e.Row.RowIndex.ToString();
                Button btnAmount2 = (Button)e.Row.FindControl("btnAmount2");
                btnAmount2.CommandArgument = e.Row.RowIndex.ToString();
                Button btnAmount1 = (Button)e.Row.FindControl("btnAmount1");
                btnAmount1.CommandArgument = e.Row.RowIndex.ToString(); 

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(RadioButtonList2.SelectedIndex == -1)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyScript", "alert('付款方式尚未選擇!');", true);
            }
            else
            {
                formlist.Visible = true;
                Image1.Visible = false;
                Image2.Visible = true;
                payment.Visible = false;
                cartStep1.Visible = false;
                cartStep2.Visible = true;
                if (Session["user"] == null)
                {
                    tableReg.Visible = true;
                }
                else
                {
                    tableReg.Visible = false;
                }
            }
            
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            cartStep1.Visible = true;
            cartStep2.Visible = false;
            formlist.Visible = false;
            Image1.Visible = true;
            Image2.Visible = false;
            payment.Visible = true;
        }
    }
}