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
    public partial class fontpage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Session["CartID"] = ezCart.CartID;
                //Session["CartID"] = Guid.NewGuid().ToString();
                //ezCart.ChangeCartID();
            }
            if (Session["user"] != null)
            {
                userStar.Visible = true;
                imgbtnLogin.Visible = false;
                Label2.Text = Session["name"].ToString();
            }
            else
            {
                userStar.Visible = false;
                
            }
            Label1.Text = Session["CartID"].ToString();
            GridView1.DataSource = ezCart.GetBuyCart();
            GridView1.DataBind();
            lblCartTotal.Text = ezCart.Total();
            if(ezCart.BuyCart.Rows.Count > 0)
            {
                lblCart.Visible = false;
                btnBuy.Visible = true;
            }
            else
            {
                lblCart.Visible = true;
                btnBuy.Visible = false;
            }
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (CheckLogin())
            {
                lblLogin.Visible = false;
                //2.記錄使用者代號
                Session["user"] = txtEmail.Text;
                Session["pwd"] = txtPwd.Text;
                //3.登入正確即回到首頁
                GoToHome();
            }
            else
            {
                lblLogin.Visible = true;
                //Response.Write("<Script language='JavaScript'>alert('帳號或密碼錯誤!');</Script>");
                upModal.Update();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "loginModal", "$('#loginModal').modal();", true);
                //string someScript = "";
                //someScript = "<script language='javascript'>$('#loginModal').modal('show');</script>";
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", someScript);

            }
                
        }

        SqlConnection conn = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;

        private bool CheckLogin()
        {
            bool bln_checked = false;

            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn.ConnectionString = connString.ConnectionString();
            conn.Open();
            cmd.Connection = conn; //連接
            cmd.CommandText = "SELECT name FROM member WHERE mEmail = @mEmail AND mPassword = @mPassword";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@mEmail", txtEmail.Text);
            cmd.Parameters.AddWithValue("@mPassword", txtPwd.Text);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    Session["name"] = "Hi！" + dr["name"].ToString();
                    bln_checked = true;
                }         
                
            }
            dr.Close();
            conn.Close();
            return bln_checked;
        }
        private void GoToHome()
        {
            Response.Redirect("homepage.aspx", true);
        }

        protected void LinkTop_Click(object sender, EventArgs e)
        {
            Session["LinkTop"] = 1;
            Response.Redirect("goods.aspx", true);
        }

        protected void LinkBottom_Click(object sender, EventArgs e)
        {
            Session["LinkTop"] = 2;
            Response.Redirect("goods.aspx", true);
        }

        protected void LinkOutter_Click(object sender, EventArgs e)
        {
            Session["LinkTop"] = 3;
            Response.Redirect("goods.aspx", true);
        }

        protected void LinkAcc_Click(object sender, EventArgs e)
        {
            Session["LinkTop"] = 4;
            Response.Redirect("goods.aspx", true);
        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                divBuy.Visible = true;
                divP.Visible = false;
                upModal.Update();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "loginModal", "$('#loginModal').modal();", true);
            }
            else
            {
                Response.Redirect("cart.aspx", true);
            }
            
            

        }

        protected void imgbtnLogin_Click(object sender, ImageClickEventArgs e)
        {
            divBuy.Visible = false;
            divP.Visible = true;
            upModal.Update();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "loginModal", "$('#loginModal').modal();", true);
            
            
        }

        protected void modalGoBuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("cart.aspx", true);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Remove("user");
            Session.Remove("pwd");
            Response.Redirect("homepage.aspx", true);
        }
    }
}