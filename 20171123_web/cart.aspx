<%@ Page Title="" Language="C#" MasterPageFile="~/fontpage.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="_20171123_web.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--font Awesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style>
        #cart .top {
            width:60%;
            margin:auto;
            margin-Top:30px;
            margin-bottom:60px;
        }
        #cart .top img{
            width:100%;
        }
        #cart .middle {
            width:80%;
            margin:auto;
            margin-bottom:60px;
        }
        #cart .bottom {
            width:80%;
            margin:auto;
            margin-bottom:60px;
        }
        #cart .btnList {
            width:80%;
            margin:auto;
            margin-bottom:60px;
        }
        #cart .formlist {
            width:80%;
            margin:auto;
            margin-bottom:60px;
        }
        #ContentPlaceHolder1_gvShoplist th {
            text-align:center;
        }
        #table_total td{
            padding:10px;
        }
        #cart .formlist table td{
            padding:10px;
        }
        #ContentPlaceHolder1_RadioButtonList2 li{
            list-style:none;
        }
    </style>
    <script src="jquery-1.12.4.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.form-control').popover({
                trigger: 'focus'
            })
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#ContentPlaceHolder1_RadioButtonList2').addClass("list-group");
            $('#ContentPlaceHolder1_RadioButtonList2').addClass("list-group-flush");
            $('#ContentPlaceHolder1_RadioButtonList2 li').addClass("list-group-item");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid clearfix" id="cart">
        <div class="wrapper">
            <div class="top text-center">
                <asp:Image ID="Image1" runat="server" Visible="true" ImageUrl="img/cartList01.png" />
                <asp:Image ID="Image2" ImageUrl="img/cartList02.png" Visible="false" runat="server" />
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>
           <%-- <div class="middle" runat="server" id="payment" visible="true">
                <div class="card">
                    <h3 style="margin-top:20px; margin-left:20px;"><span class="fa fa-truck mr-2 mb-3"></span>付款方式</h3>
                 
  <ul class="list-group list-group-flush">
    <li class="list-group-item">
        <span>
        <asp:RadioButton ID="RadioButton1" runat="server" GroupName="rdbPay" CssClass="mr-2" Text="" AutoPostBack="True" />
        超商取貨付款 - 7-11
        </span><i class="fa fa-hand-o-right ml-2 mr-2" aria-hidden="true"></i>
        <span>7-11取貨付款，將酌收 60 元物流費。若單筆購物滿 1000 元，即享有免運費優惠。</span>
    </li>
    <li class="list-group-item">
        <span>
        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="rdbPay" CssClass="mr-2" Text="" AutoPostBack="True" />
            超商取貨付款 - CVS
        </span><i class="fa fa-hand-o-right ml-2 mr-2" aria-hidden="true"></i>
        <span>全家、萊爾富、OK取貨付款，將酌收 60 元物流費。若單筆購物滿 1000 元，即享有免運費優惠。</span>
    </li>
    <li class="list-group-item">
        <span>
        <asp:RadioButton ID="RadioButton3" runat="server" GroupName="rdbPay" CssClass="mr-2" Text="" AutoPostBack="True" />
            宅配貨到付款
        </span> <i class="fa fa-hand-o-right ml-2 mr-2" aria-hidden="true"></i>
        <span>宅配貨到付款，將酌收 80 元物流費。若單筆購物滿 1500 元，即享有免運費優惠。</span>
    </li>
    <li class="list-group-item">
        <span>
        <asp:RadioButton ID="RadioButton4" runat="server" GroupName="rdbPay" CssClass="mr-2" Text="" AutoPostBack="True" />
            信用卡線上刷卡
        </span><i class="fa fa-hand-o-right ml-2 mr-2" aria-hidden="true"></i>
        <span>信用卡宅配到府，將酌收 80 元物流費。若單筆購物滿 1500 元，即享有免運費優惠。</span>
    </li>
  </ul>
</div></div>--%>
                            <div class="middle" runat="server" id="payment" visible="true">
                <div class="card">
                    <h3 style="margin-top:20px; margin-left:20px;"><span class="fa fa-truck mr-2 mb-3"></span>付款方式</h3>
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatLayout="UnorderedList" AutoPostBack="True">
                               <asp:ListItem Value="1"> 
                                   <span class="ml-2"> 超商取貨付款 - 7-11 </span>
                                    <i class="fa fa-hand-o-right ml-2 mr-2" aria-hidden="true"></i>
                                     <span style="font-size:12px;">7-11取貨付款，將酌收 60 元物流費。若單筆購物滿 1000 元，即享有免運費優惠。</span>
                               </asp:ListItem>
                                    <asp:ListItem Value="2"> 
                                        <span class="ml-2"> 超商取貨付款 - CVS </span>
                                        <i class="fa fa-hand-o-right ml-2 mr-2" aria-hidden="true"></i>
                                      <span style="font-size:12px;">全家、萊爾富、OK取貨付款，將酌收 60 元物流費。若單筆購物滿 1000 元，即享有免運費優惠。</span>
                                    </asp:ListItem>
                                <asp:ListItem Value="3">
                                    <span class="ml-2"> 宅配貨到付款 </span>
                                    <i class="fa fa-hand-o-right ml-2 mr-2" aria-hidden="true"></i>
                                  <span style="font-size:12px;">宅配貨到付款，將酌收 80 元物流費。若單筆購物滿 1500 元，即享有免運費優惠。</span>
                                </asp:ListItem>
                                <asp:ListItem Value="4">
                                    <span class="ml-2"> 信用卡線上刷卡 </span>
                                    <i class="fa fa-hand-o-right ml-2 mr-2" aria-hidden="true"></i>
                                 <span style="font-size:12px;">信用卡宅配到府，將酌收 80 元物流費。若單筆購物滿 1500 元，即享有免運費優惠。</span>
                                </asp:ListItem>
                            </asp:RadioButtonList>
                            </div></div>
                            
            <div class="bottom" runat="server" visible="true">
                <div class="card" style="padding:20px;"> 
                    <h3><span class="fa fa-shopping-bag mr-2 mb-3"></span>購物清單</h3>
               
                    
<asp:GridView ID="gvShoplist" runat="server" AutoGenerateColumns="False" Width="100%" OnRowCommand="gvShoplist_RowCommand" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnRowCreated="gvShoplist_RowCreated">
                    <Columns>
                                <asp:TemplateField HeaderText="商品">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="" Visible="false" CausesValidation="False"></asp:LinkButton>
                                        <asp:Label ID="lblRowid" runat="server" Text='<%# Bind("rowid") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="lblpNo" runat="server" Text='<%# Bind("pNo") %>' Visible="false"></asp:Label>
                                        <asp:ImageButton ID="ImageButton2" CommandName="ImgGoDetail" runat="server" ImageUrl='<%# Bind("pImg") %>' CssClass="float-left mr-2" Width="100" CausesValidation="False" />
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("pName") %>'></asp:Label> – 
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("pStyle") %>'></asp:Label><br />
                                        尺寸：<asp:Label ID="Label3" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="單價">
                                      <ItemTemplate>
                                          NT$<asp:Label ID="Label4" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                                      </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="數量" ItemStyle-HorizontalAlign="Center">
                                     <ItemTemplate>
                                         <div class="input-group" style="width:150px;">
                                 <asp:Button ID="btnAmount1" runat="server" CommandName="QtyLess" Text="–" CssClass="input-group-addon" CausesValidation="False" />
                                   <asp:TextBox ID="txtQty" CssClass="txtQty form-control text-center" Text='<%# Bind("qty") %>' runat="server"></asp:TextBox>
                                   <asp:Button ID="btnAmount2" runat="server" CommandName="QtyAdd" Text="＋" CssClass="input-group-addon" CausesValidation="False" />
                                    </div>
                                    </ItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="小計">
                                      <ItemTemplate>
                                          NT$<asp:Label ID="Label5" runat="server" Text='<%# Bind("amount") %>'></asp:Label>
                                      </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="刪除" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>

                                        <asp:ImageButton ID="imgDelete" runat="server" ImageUrl="~/icon/delete.png" CausesValidation="False" CommandName="ImgDelete" Width="20" />
                                    </ItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>
                                
                            </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#476881" Font-Bold="True" ForeColor="White" />
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
                                    NT$<asp:Label ID="lblShipCost" runat="server" Text="尚未選擇"></asp:Label></td>
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
                
                
            </div>
            
            </ContentTemplate>
                    </asp:UpdatePanel>
            <div class="formlist" runat="server" id="formlist" visible="false">
                <div class="card" style="padding:20px;" > 
                    <h3><span class="fa fa-file-text mr-2 mb-3"></span>訂購人資訊</h3>
                    <table>
                        <tr>
                            <td>姓名</td>
                            <td>
                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" data-content="請輸入中文全名。"></asp:TextBox></td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="0">先生</asp:ListItem>
                                    <asp:ListItem Value="1">小姐</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>手機號碼</td>
                            <td>
                                <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" data-content="輸入範例:0912345678"></asp:TextBox></td>
                            
                        </tr>
                    </table>
                    <table id="tableReg" runat="server" visible="true">
                        <tr>
                            <td>電子郵件</td>
                            <td>
                                <asp:TextBox ID="TextBox3" CssClass="form-control" data-content="訂單成立後，電子郵件即為您的衣舞衣飾會員帳號。" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>郵件確認</td>
                            <td>
                                <asp:TextBox ID="TextBox4" CssClass="form-control" data-content="請再輸入一次以做確認" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>密碼</td>
                            <td>
                                <asp:TextBox ID="TextBox5" CssClass="form-control" data-content="6個字元以上，須包含英文及數字。" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>密碼確認</td>
                            <td>
                                <asp:TextBox ID="TextBox6" CssClass="form-control" data-content="請再輸入一次以做確認" runat="server"></asp:TextBox></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="btnList text-center" id="cartStep1" visible="true" runat="server">
                <asp:Button ID="Button1" Width="120" Height="35" BorderStyle="None" ForeColor="White" BackColor="#476881" runat="server" Text="下一步" OnClick="Button1_Click" />
            </div>
            <div class="btnList text-center" id="cartStep2" visible="false" runat="server">
                <asp:Button ID="btnBack" Width="120" Height="35" BorderStyle="None" ForeColor="White" BackColor="#476881" runat="server" Text="上一步" OnClick="btnBack_Click" />
                <asp:Button ID="btnSend" Width="120" Height="35" BorderStyle="None" ForeColor="White" BackColor="#476881" runat="server" Text="送出" />
            </div>
        </div>
     </div>
</asp:Content>
