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
    public partial class WebForm8 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;
        string commText;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] == null)
                {
                    Response.Write("<script>alert('請先登入!'); location.href='homepage.aspx'; </script>");
                }
                else
                {
                    orderList(Session["user"].ToString());
                    memberInfo(Session["user"].ToString());
                }
            }
            
            
        }
        private void orderList(string value)
        {
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn.ConnectionString = connString.ConnectionString();
            conn.Open();
            cmd.Connection = conn; //連接
            cmd.CommandText = "SELECT [dbo].[order].price as oPrice, * FROM deliverType INNER JOIN ( orderType INNER JOIN [dbo].[order] ON [dbo].[order].otNo = orderType.otNo ) ON [dbo].[order].dtNo = deliverType.dtNo WHERE mNo = @mNo ORDER BY [dbo].[order].oDate DESC";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@mNo", value);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                GridView1.DataSource = dr;
                GridView1.DataBind();

            }

            dr.Close();
            conn.Close();
        }
        private void memberInfo(string value)
        {
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn.ConnectionString = connString.ConnectionString();
            conn.Open();
            cmd.Connection = conn; //連接
            cmd.CommandText = "SELECT * FROM member WHERE mEmail = @mEmail";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@mEmail", value);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    txtName.Text = dr["name"].ToString();
                    if(dr["gender"].ToString() == "m")
                    {
                        RadioButtonList1.Items[0].Selected = true;
                    }
                    else
                    {
                        RadioButtonList1.Items[1].Selected = true;
                    }
                    txtMail.Text = dr["mEmail"].ToString();
                    txtPhone.Text = dr["phone"].ToString();
                    txtAddress.Text = dr["address"].ToString();

                }

            }

            dr.Close();
            conn.Close();
        }

        private bool CheckMember()
        {
            bool bln_checked = true;

            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn.ConnectionString = connString.ConnectionString();
            conn.Open();
            cmd.Connection = conn; //連接
            cmd.CommandText = "SELECT * FROM member WHERE mEmail = @mEmail";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@mEmail", Session["user"].ToString());
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                
                bln_checked = false;
            }

            dr.Close();
            conn.Close();
            return bln_checked;
        }
        private void updateMember(string mail, string name, string gender, string phone,string address)
        {
            if (CheckMember())
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyScript", "alert('此信箱已有人使用!');", true);
            }
            else
            {
                //conn.ConnectionString = WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
                conn.ConnectionString = connString.ConnectionString();
                conn.Open();
                cmd.Connection = conn; //連接
                cmd.CommandText = "UPDATE member SET mEmail = @NewmEmail, name = @name, gender = @gender, phone = @phone, address = @address WHERE mEmail = @mEmail";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@mEmail", Session["user"].ToString());
                cmd.Parameters.AddWithValue("@NewmEmail", mail);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@gender", gender);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@address", address);
                cmd.ExecuteNonQuery();

                if (cmd.ExecuteNonQuery() == 0)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyScript", "alert('修改會員資料失敗，請重新輸入!');", true);
                }
                else
                {
                    Session["user"] = txtMail.Text;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyScript", "alert('修改成功!');", true);
                }

                dr.Close();
                conn.Close();
            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            updateMember(txtMail.Text, txtName.Text, RadioButtonList1.SelectedValue, txtPhone.Text, txtAddress.Text );
        }

        
        private void updatePwd(string mail, string pwd, string NewPwd)
        {
            if (txtNowPwd.Text != Session["pwd"].ToString())
            {
                Response.Write("<script>alert('目前密碼輸入錯誤!'); </script>");
            }
            else
            {
                //conn.ConnectionString = WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
                conn.ConnectionString = connString.ConnectionString();
                conn.Open();
                cmd.Connection = conn; //連接
                cmd.CommandText = "UPDATE member SET mPassword = @NewmPassword WHERE mPassword = @mPassword AND mEmail = @mEmail";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@mEmail", mail);
                cmd.Parameters.AddWithValue("@mPassword", pwd);
                cmd.Parameters.AddWithValue("@NewmPassword", NewPwd);
                cmd.ExecuteNonQuery();

                if (cmd.ExecuteNonQuery() < 0)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyScript", "alert('修改密碼失敗，請重新輸入!');", true);
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyScript", "alert('修改密碼成功!');", true);
                    txtNowPwd.Text = "";
                    txtPwd.Text = "";
                    txtPwd2.Text = "";
                }
                conn.Close();
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            updatePwd(Session["user"].ToString(), txtNowPwd.Text, txtPwd.Text);
        }

        private void gvShoplist_show(string value)
        {
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn.ConnectionString = connString.ConnectionString();
            conn.Open();
            cmd.Connection = conn; //連接
            cmd.CommandText = "SELECT [products_order].price as pPrice, * FROM [dbo].[order] INNER JOIN ([dbo].[products_order] INNER JOIN [dbo].[products] ON [dbo].[products_order].pNo=[dbo].[products].pNo) ON [dbo].[order].oNo=[dbo].[products_order].oNo WHERE [dbo].[order].oNo = @oNo";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@oNo", value);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                gvShoplist.DataSource = dr;
                gvShoplist.DataBind();

            }

            dr.Close();
            conn.Close();
        }
        private void totallist_show(string value)
        {
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn.ConnectionString = connString.ConnectionString();
            conn.Open();
            cmd.Connection = conn; //連接
            cmd.CommandText = "SELECT [dbo].[deliverType].[price] as dtPrice, [dbo].[order].[price] as oPrice, [dbo].[products_order].price as pPrice, * FROM [dbo].[deliverType] INNER JOIN ([dbo].[order] INNER JOIN ([dbo].[products_order] INNER JOIN [dbo].[products] ON [dbo].[products_order].pNo=[dbo].[products].pNo) ON [dbo].[order].oNo=[dbo].[products_order].oNo) ON [dbo].[deliverType].dtNo=[dbo].[order].dtNo WHERE [dbo].[order].oNo = @oNo";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@oNo", value);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lblcount.Text = dr["oCount"].ToString();
                    lblShipCost.Text = dr["dtPrice"].ToString();
                    lbltotal.Text = dr["oPrice"].ToString();
                }

                int total = int.Parse(lbltotal.Text) - int.Parse(lblShipCost.Text);
                lblcountPrice.Text = total.ToString();
            }

            dr.Close();
            conn.Close();
        }
        private void tablePayment_show(string value)
        {
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn.ConnectionString = connString.ConnectionString();
            conn.Open();
            cmd.Connection = conn; //連接
            cmd.CommandText = "SELECT  * FROM [dbo].[deliverType] INNER JOIN ( [dbo].[order] INNER JOIN [dbo].[member] ON [dbo].[order].mNo=[dbo].[member].mEmail ) ON [dbo].[order].dtNo=[dbo].[deliverType].dtNo WHERE [dbo].[order].oNo = @oNo";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@oNo", value);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lblpay.Text = dr["deliverType"].ToString();
                    lblpayName.Text = dr["name"].ToString();
                    lblpayAddress.Text = dr["deliverAddress"].ToString();
                }
            }

            dr.Close();
            conn.Close();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "SelectONO")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string oNo = ((LinkButton)GridView1.Rows[index].FindControl("oNo")).Text;
                orderlist.Visible = false; //訂單列表
                orderdetailList.Visible = true; //單筆訂單明細
                lblPno.Text = oNo;
                gvShoplist_show(oNo);
                totallist_show(oNo);
                tablePayment_show(oNo);
            }
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton oNo = (LinkButton)e.Row.FindControl("oNo");
                oNo.CommandArgument = e.Row.RowIndex.ToString();
            }
        }
    }
}