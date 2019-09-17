<%@ Page Title="" Language="C#" MasterPageFile="~/fontpage.Master" AutoEventWireup="true" CodeBehind="memberCenter.aspx.cs" Inherits="_20171123_web.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--font Awesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style>
        #memberCenter #myTabContent {
            padding-top:30px;
        }
        #memberCenter #myTab a{
            color:#808080;
        }
        #memberCenter #contact table td {
            padding:10px;
        }
        #memberCenter #pwd table td {
            padding:10px;
        }
        
        #ContentPlaceHolder1_GridView1 th {
            text-align:center;
            border-bottom:2px solid #bcbcbc;
        }

        #ContentPlaceHolder1_GridView1 {
            margin:auto;
        }
        /*#myTabContent #orderlist table td{
            padding:20px;
        }*/
        #ContentPlaceHolder1_gvShoplist th {
            text-align:center;
        }
        #ContentPlaceHolder1_GridView1 td {
            padding:20px;
        }
        
        #table_total td{
            padding:10px;
        }
        #cart .formlist table td{
            padding:10px;
        }
        #tablePayment td{
            padding:10px;
        }
    </style>
    <script>
        $(document).ready(function () {
            function check() {
                if (document.getElementById('textbox1').value == "") {
                    alert("Can't Null");
                    return false;
                }
                else {
                    return true;
                }
            }
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid clearfix mt-3 mb-5" id="memberCenter">
        <div class="wrapper">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
      <asp:LinkButton ID="LinkButton1" CssClass="nav-link active" href="#home"  data-toggle="tab"  role="tab" aria-controls="home" aria-selected="true" runat="server" CausesValidation="False" OnClientClick="location.href='memberCenter.aspx';">訂單資料</asp:LinkButton>
    <%--<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">訂單資料</a>--%>
  </li>
                
  <li class="nav-item">
    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">會員資料</a>
  </li>
                <li class="nav-item">
    <a class="nav-link" id="pwd-tab" data-toggle="tab" href="#pwd" role="tab" aria-controls="pwd" aria-selected="false">修改密碼</a>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
      <div class="card mb-4" style="padding:30px;" id="orderlist" runat="server" visible="true">
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" OnRowCommand="GridView1_RowCommand" OnRowCreated="GridView1_RowCreated">
              
              <AlternatingRowStyle BackColor="White" ForeColor="Black" />
              
              <Columns>
                  <asp:BoundField HeaderText="訂購日期" DataField="oDate" DataFormatString="{0:d}" />
                  <asp:TemplateField HeaderText="訂單編號">
                      <ItemTemplate>
                          <asp:LinkButton ID="oNo" runat="server" CommandName="SelectONO" Text='<%# Eval("oNo") %>'></asp:LinkButton>
                          
                      </ItemTemplate>
                  </asp:TemplateField>
                  
                  <asp:BoundField HeaderText="付款方式" DataField="deliverType" />
                  <asp:BoundField HeaderText="處理進度" DataField="orderType" />
                  <asp:BoundField HeaderText="預計出貨日期" DataField="shippingDate" DataFormatString="{0:d}" />
                  <asp:BoundField HeaderText="應付金額" DataField="oPrice" />
                  <asp:BoundField HeaderText="訂單取消 / 退貨辦理" DataField="" />
                  <asp:BoundField HeaderText="發票" DataField="" />
              </Columns>
              <EditRowStyle BackColor="#999999" />
              <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="#013d7e" />
              <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
              <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
              <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
              <SortedAscendingCellStyle BackColor="#E9E7E2" />
              <SortedAscendingHeaderStyle BackColor="#506C8C" />
              <SortedDescendingCellStyle BackColor="#FFFDF8" />
              <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
          </asp:GridView>
      </div>

      <div runat="server" id="orderdetailList" visible="false">
      <div class="card mb-4" style="padding:30px;" id="orderDetal">
          <h3 style="border-bottom:1px solid #bcbcbc"><span class="fa fa-shopping-bag mr-2 mb-3"></span>購物明細</h3>
               <p>您的訂單編號為：<asp:Label ID="lblPno" runat="server" Text="Label"></asp:Label></p>
                    
<asp:GridView ID="gvShoplist" runat="server" AutoGenerateColumns="False" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                    <Columns>
                                <asp:TemplateField HeaderText="商品">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" CssClass="float-left mr-2" ImageUrl='<%# "img/product/"+Eval("pic") %>' Width="100" />
                                        
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("poName") %>'></asp:Label><br />
                                        尺寸：<asp:Label ID="Label3" runat="server" Text='<%# Bind("poSize") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="單價">
                                      <ItemTemplate>
                                          NT$<asp:Label ID="Label4" runat="server" Text='<%# Bind("pPrice") %>'></asp:Label>
                                      </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="數量" ItemStyle-HorizontalAlign="Center">
                                     <ItemTemplate>
                                         <asp:Label ID="Label5" runat="server" Text='<%# Bind("amount") %>'></asp:Label>
                                  
                                   </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="小計">
                                      <ItemTemplate>
                                          NT$<asp:Label ID="Label6" runat="server" Text='<%# Bind("subtotal") %>'></asp:Label>
                                      </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                
                                
                            </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#eaf9ff" Font-Bold="True" ForeColor="#013d7e" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>

                    <div>
                        <table id="table_total" class="float-right">
                            <tr>
                                <td>共<asp:Label ID="lblcount" runat="server" Text="0"></asp:Label>件商品</td>
                                <td>商品金額</td>
                                <td>NT$<asp:Label ID="lblcountPrice" runat="server" Text="100"></asp:Label></td>
                            </tr>
                            <tr style="border-bottom:solid 1px #808080">
                                <td colspan="2" class="text-right">運費小計</td>
                                <td>
                                    NT$<asp:Label ID="lblShipCost" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-right">總計</td>
                                <td style="color:red; font-size:22px;">
                                    NT$<asp:Label ID="lbltotal" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
      </div> 
       <div class="card mb-4" style="padding:30px;" id="orderPayment">
          <h3 style="border-bottom:1px solid #bcbcbc"><span class="fa fa-truck mr-2 mb-3"></span>付款方式與寄送資料</h3>
           <table id="tablePayment">
               <tr>
                   <td>付款方式</td>
                   <td>
                       <asp:Label ID="lblpay" runat="server" Text="Label"></asp:Label></td>
               </tr>
               <tr>
                   <td>訂購姓名</td>
                   <td>
                       <asp:Label ID="lblpayName" runat="server" Text="Label"></asp:Label></td>
               </tr>
               <tr>
                   <td>收貨門市/地址</td>
                   <td>
                       <asp:Label ID="lblpayAddress" runat="server" Text="Label"></asp:Label></td>
               </tr>
               <tr>
                   <td>發票類型</td>
                   <td>
                       <asp:Label ID="lblpayReceipt" runat="server" Text="二聯式"></asp:Label></td>
               </tr>
           </table>
       </div>

      </div>
   </div>
    
  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
      <div class="card" style="padding:30px;">
          <h4 style="border-bottom:1px solid #d3d3d3;"><span class="fa fa-address-book-o mr-2 mb-3"></span>會員資料修改</h4>
          <table>
                        <tr>
                            <td>姓名</td>
                            <td>
                                <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox></td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="m">先生</asp:ListItem>
                                    <asp:ListItem Value="f">小姐</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>電子郵件</td>
                            <td>
                                <asp:TextBox ID="txtMail" CssClass="form-control" runat="server"></asp:TextBox></td>
                        </tr>
              <tr>
                            <td>手機號碼</td>
                            <td>
                                <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server"></asp:TextBox></td>
                        </tr>
              
              <tr>
                            <td>聯絡地址</td>
                            <td colspan="2">
                                <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox></td>
                        </tr>
                    </table>
      </div>
      <div class="btnList text-center">
                <asp:Button ID="Button1" CssClass="mt-3" Width="160" Height="40" BorderStyle="None" ForeColor="White" BackColor="#476881" runat="server" Text="送出" OnClick="Button1_Click" ValidationGroup="confirmMember" />
            </div>
  </div>

    <div class="tab-pane fade" id="pwd" role="tabpanel" aria-labelledby="pwd-tab">
        <div class="card" style="padding:30px;">
          <h4 style="border-bottom:1px solid #d3d3d3;"><span class="fa fa-address-book-o mr-2 mb-3"></span>會員密碼修改</h4>
        <table>
              <tr>
                  <td>目前密碼</td>
                  <td>
                                <asp:TextBox ID="txtNowPwd" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox></td>
              </tr>
                        <tr>
                            <td>修改密碼</td>
                            
                            <td>
                                <asp:TextBox ID="txtPwd" CssClass="form-control txtPwd" runat="server" TextMode="Password"></asp:TextBox></td>
                        </tr>
              
              <tr>
                            <td>密碼確認</td>
                            <td>
                                <asp:TextBox ID="txtPwd2" CssClass="form-control" runat="server" ValidationGroup="confirmPwd" TextMode="Password"></asp:TextBox></td>
                             <td>
                                 <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*密碼不一致" ControlToValidate="txtPwd" ControlToCompare="txtPwd2" ForeColor="Red" ValidationGroup="confirmPwd"></asp:CompareValidator></td>
                        </tr>

                    </table>
            </div>
        <div class="btnList text-center">
                <asp:Button ID="Button2" CssClass="mt-3" Width="160" Height="40" BorderStyle="None" ForeColor="White" BackColor="#476881" runat="server" Text="送出" ValidationGroup="confirmPwd" OnClick="Button2_Click" />
            </div>
    </div>
    </div>
</div>
    
            </div>
        
</asp:Content>
