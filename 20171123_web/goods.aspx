<%@ Page Title="" Language="C#" MasterPageFile="~/fontpage.Master" AutoEventWireup="true" CodeBehind="goods.aspx.cs" Inherits="_20171123_web.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--CSS-->
    <link rel="stylesheet" href="css/goods.css" />

    <style>
        #goods .sideL .sidebarUp a {
           font-size: 18px;
        }
        #goodContent {
            margin-top:20px;
            margin-bottom:20px;
        }
        .header {
            margin-bottom:20px;
        }
        .ptDetail {
            text-decoration:none;
            list-style:none;
            
            padding:0;
        }
        #goods .sideR .header .headerImg {
             width: 100%;
             height:100%;
         }
        #goods .sideL .sidebarDown a {
    text-decoration: none;
    color: #ff9700;
    font-weight: 700;
    font-size: 18px;
}
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container-fluid clearfix" id="goods">
        <div class="wrapper clearfix">
            <div class="sideL">
            <!-- Sidebar -->
                <div class="sidebarUp">
                    <ul class="sidebar-nav">
                <li>
                    <a href="#">新商品</a>
                </li>
                <li>
                    <a href="#">本周特價</a>
                </li>
                <li>
                    <a href="#">期間限定商品</a>
                </li>
                <li>
                    <a href="#">超值推薦</a>
                </li>
            </ul>
                </div>
                <div class="sidebarDown">
                    <ul class="sidebar-nav">
                
                <li>
                <a data-toggle="collapse" href="#collapseTop" aria-expanded="false" aria-controls="collapseTop"><label>上裝</label><span class="fa fa-chevron-down"></span></a>
                </li>
                <div class="card">
                    <div class="collapse show" id="collapseTop">
                        <div class="card-body clearfix">
                           <asp:BulletedList ID="BulletedList1" CssClass="ptDetail" runat="server" DisplayMode="LinkButton" OnClick="BulletedList1_Click" OnLoad="BulletedList1_Load"></asp:BulletedList>
                            <%--<li><a href="#"><label>上裝1</label></a></li>
                            <li><a href="#"><label>上裝2</label></a></li>
                            <li><a href="#"><label>上裝3</label></a></li>
                            <li><a href="#"><label>上裝4</label></a></li>--%>


                        </div>
                    </div>
                </div>
                <li>
                <a data-toggle="collapse" href="#collapseBottom" aria-expanded="false" aria-controls="collapseBottom"><label>下裝</label><span class="fa fa-chevron-down"></span></a>
                </li>
                <div class="card">
                    <div class="collapse show" id="collapseBottom">
                        <div class="card-body clearfix">
                            <asp:BulletedList ID="BulletedList2" CssClass="ptDetail" runat="server" DisplayMode="LinkButton" OnClick="BulletedList2_Click" OnLoad="BulletedList2_Load"></asp:BulletedList>
                            <%--<li><a href="#"><label>下裝1</label></a></li>
                            <li><a href="#"><label>下裝2</label></a></li>
                            <li><a href="#"><label>下裝3</label></a></li>
                            <li><a href="#"><label>下裝4</label></a></li>--%>


                        </div>
                    </div>
                </div>
                <li>
                <a data-toggle="collapse" href="#collapseOutter" aria-expanded="false" aria-controls="collapseOutter"><label>外套</label><span class="fa fa-chevron-down"></span></a>
                </li>
                <div class="card">
                    <div class="collapse show" id="collapseOutter">
                        <div class="card-body clearfix">
                            <asp:BulletedList ID="BulletedList3" CssClass="ptDetail" runat="server" DisplayMode="LinkButton" OnClick="BulletedList3_Click" OnLoad="BulletedList3_Load"></asp:BulletedList>
                            <%--<li><a href="#"><label>外套1</label></a></li>
                            <li><a href="#"><label>外套2</label></a></li>
                            <li><a href="#"><label>外套3</label></a></li>
                            <li><a href="#"><label>外套4</label></a></li>--%>


                        </div>
                    </div>
                </div>
                <li>
                <a data-toggle="collapse" href="#collapseOther" aria-expanded="false" aria-controls="collapseOther"><label>配件</label><span class="fa fa-chevron-down"></span></a>
                </li>
                <div class="card">
                    <div class="collapse show" id="collapseOther">
                        <div class="card-body clearfix">
                            <asp:BulletedList ID="BulletedList4" CssClass="ptDetail" runat="server" DisplayMode="LinkButton" OnClick="BulletedList4_Click" OnLoad="BulletedList4_Load"></asp:BulletedList>
                            <%--<li><a href="#"><label>配件1</label></a></li>
                            <li><a href="#"><label>配件2</label></a></li>
                            <li><a href="#"><label>配件3</label></a></li>
                            <li><a href="#"><label>配件4</label></a></li>--%>

                        </div>
                    </div>
                </div>
                
            </ul>
               
                </div>

            
            </div>
            <div class="sideR">
                <div class="header">
                    <%--<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>--%>
                    <asp:Image ID="Image1" runat="server" CssClass="headerImg" ImageUrl="img/slider_02.jpg" />
                </div>
                <asp:Label ID="lblptDetail" runat="server" Text="0" Visible="false"></asp:Label>
                <div runat="server" id="goodContent">
                    
                        
                       
                        <asp:ListView ID="ListView1" runat="server" DataKeyNames="rowid" DataSourceID="SqlDataSource1" GroupItemCount="4" OnItemCommand="ListView1_ItemCommand">
                            <AlternatingItemTemplate>
                                <div class="card" style="margin-bottom:20px;">
                                    <asp:Label ID="pNo" runat="server" Text='<%# Eval("pNo") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="ptDetailNo" runat="server" Text='<%# Eval("ptDetailNo") %>' Visible="false"></asp:Label>
                                    <asp:ImageButton ID="ImageButton1" CssClass="card-img-top" runat="server" ImageUrl='<%# "img/product/"+ Eval("pic") %>' CausesValidation="False" CommandName="imgPost" />
<%--<img class="card-img-top" src='<%# "img/product/"+ Eval("pic") %>' alt="Card image cap">--%>
<div class="card-body">                                       
<div class="title"><asp:Label ID="pName" runat="server" Text='<%# Eval("name") %>' /></div>
<div class="price">NT$ <asp:Label ID="pPrice" runat="server" Text='<%# Eval("price2") %>' /></div>
</div>
</div>
                              
                               
                                
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <td runat="server" style="">rowid:
                                    <asp:Label ID="rowidLabel1" runat="server" Text='<%# Eval("rowid") %>' />
                                    <br />
                                    pNo:
                                    <asp:TextBox ID="pNoTextBox" runat="server" Text='<%# Bind("pNo") %>' />
                                    <br />
                                    ptDetailNo:
                                    <asp:TextBox ID="ptDetailNoTextBox" runat="server" Text='<%# Bind("ptDetailNo") %>' />
                                    <br />
                                    name:
                                    <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                                    <br />
                                    onDate:
                                    <asp:TextBox ID="onDateTextBox" runat="server" Text='<%# Bind("onDate") %>' />
                                    <br />
                                    price1:
                                    <asp:TextBox ID="price1TextBox" runat="server" Text='<%# Bind("price1") %>' />
                                    <br />
                                    price2:
                                    <asp:TextBox ID="price2TextBox" runat="server" Text='<%# Bind("price2") %>' />
                                    <br />
                                    pContent:
                                    <asp:TextBox ID="pContentTextBox" runat="server" Text='<%# Bind("pContent") %>' />
                                    <br />
                                    remark:
                                    <asp:TextBox ID="remarkTextBox" runat="server" Text='<%# Bind("remark") %>' />
                                    <br />
                                    pic:
                                    <asp:TextBox ID="picTextBox" runat="server" Text='<%# Bind("pic") %>' />
                                    <br />
                                    display:
                                    <asp:TextBox ID="displayTextBox" runat="server" Text='<%# Bind("display") %>' />
                                    <br />
                                    aNo:
                                    <asp:TextBox ID="aNoTextBox" runat="server" Text='<%# Bind("aNo") %>' />
                                    <br />
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                                    <br />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                                    <br />
                                </td>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <table runat="server" style="">
                                    <tr>
                                        <td>未傳回資料。</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <EmptyItemTemplate>
                                <td runat="server" />
                            </EmptyItemTemplate>
                            <GroupTemplate>
                                <div class="card-deck" id="itemPlaceholderContainer" runat="server">
<div id="itemPlaceholder" runat="server"></div>
</div>
                            </GroupTemplate>
                            <InsertItemTemplate>
                                <td runat="server" style="">pNo:
                                    <asp:TextBox ID="pNoTextBox" runat="server" Text='<%# Bind("pNo") %>' />
                                    <br />
                                    ptDetailNo:
                                    <asp:TextBox ID="ptDetailNoTextBox" runat="server" Text='<%# Bind("ptDetailNo") %>' />
                                    <br />
                                    name:
                                    <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                                    <br />
                                    onDate:
                                    <asp:TextBox ID="onDateTextBox" runat="server" Text='<%# Bind("onDate") %>' />
                                    <br />
                                    price1:
                                    <asp:TextBox ID="price1TextBox" runat="server" Text='<%# Bind("price1") %>' />
                                    <br />
                                    price2:
                                    <asp:TextBox ID="price2TextBox" runat="server" Text='<%# Bind("price2") %>' />
                                    <br />
                                    pContent:
                                    <asp:TextBox ID="pContentTextBox" runat="server" Text='<%# Bind("pContent") %>' />
                                    <br />
                                    remark:
                                    <asp:TextBox ID="remarkTextBox" runat="server" Text='<%# Bind("remark") %>' />
                                    <br />
                                    pic:
                                    <asp:TextBox ID="picTextBox" runat="server" Text='<%# Bind("pic") %>' />
                                    <br />
                                    display:
                                    <asp:TextBox ID="displayTextBox" runat="server" Text='<%# Bind("display") %>' />
                                    <br />
                                    aNo:
                                    <asp:TextBox ID="aNoTextBox" runat="server" Text='<%# Bind("aNo") %>' />
                                    <br />
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                                    <br />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                                    <br />
                                </td>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <div class="card" style="margin-bottom:20px;">
                                    <asp:Label ID="pNo" runat="server" Text='<%# Eval("pNo") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="ptDetailNo" runat="server" Text='<%# Eval("ptDetailNo") %>' Visible="false"></asp:Label>
                                    <asp:ImageButton ID="ImageButton1" CssClass="card-img-top" runat="server" ImageUrl='<%# "img/product/"+ Eval("pic") %>' CausesValidation="False" CommandName="imgPost" />
<%--<img class="card-img-top" src='<%# "img/product/"+ Eval("pic") %>' alt="Card image cap">--%>
<div class="card-body">
<div class="title"><asp:Label ID="pName" runat="server" Text='<%# Eval("name") %>' /></div>
<div class="price">NT$ <asp:Label ID="pPrice" runat="server" Text='<%# Eval("price2") %>' /></div>
</div>
</div>
  
                            </ItemTemplate>
                            <LayoutTemplate>
                                <div id="groupPlaceholderContainer" runat="server">
                                    <div id="groupPlaceholder" runat="server"></div>
                                </div>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <td runat="server" style="">rowid:
                                    <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                                    <br />
                                    pNo:
                                    <asp:Label ID="pNoLabel" runat="server" Text='<%# Eval("pNo") %>' />
                                    <br />
                                    ptDetailNo:
                                    <asp:Label ID="ptDetailNoLabel" runat="server" Text='<%# Eval("ptDetailNo") %>' />
                                    <br />
                                    name:
                                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                    <br />
                                    onDate:
                                    <asp:Label ID="onDateLabel" runat="server" Text='<%# Eval("onDate") %>' />
                                    <br />
                                    price1:
                                    <asp:Label ID="price1Label" runat="server" Text='<%# Eval("price1") %>' />
                                    <br />
                                    price2:
                                    <asp:Label ID="price2Label" runat="server" Text='<%# Eval("price2") %>' />
                                    <br />
                                    pContent:
                                    <asp:Label ID="pContentLabel" runat="server" Text='<%# Eval("pContent") %>' />
                                    <br />
                                    remark:
                                    <asp:Label ID="remarkLabel" runat="server" Text='<%# Eval("remark") %>' />
                                    <br />
                                    pic:
                                    <asp:Label ID="picLabel" runat="server" Text='<%# Eval("pic") %>' />
                                    <br />
                                    display:
                                    <asp:Label ID="displayLabel" runat="server" Text='<%# Eval("display") %>' />
                                    <br />
                                    aNo:
                                    <asp:Label ID="aNoLabel" runat="server" Text='<%# Eval("aNo") %>' />
                                    <br />
                                </td>
                            </SelectedItemTemplate>
                        </asp:ListView>
                    
                </div>
            </div>
               
        </div>
   </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT * FROM [products] WHERE ([ptDetailNo] = @ptDetailNo)">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblptDetail" Name="ptDetailNo" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    
</asp:Content>
