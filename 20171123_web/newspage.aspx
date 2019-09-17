<%@ Page Title="" Language="C#" MasterPageFile="~/fontpage.Master" AutoEventWireup="true" CodeBehind="newspage.aspx.cs" Inherits="_20171123_web.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <!--Animate.Css-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css" />

    <style>
        .box {
            width: 400px;
            margin:5px;
        }
        
        img {
            width:100%;
        }
        #ContentPlaceHolder1_ListView1_groupPlaceholderContainer {
            margin:auto;
        }
    </style>
    <!--jquery-->
    <script src="js/jquery-1.12.4.min.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/masonry.pkgd.min.js"></script>
   
    <script type="text/javascript">
    $(document).ready(function(){

        $("#ContentPlaceHolder1_ListView1_groupPlaceholderContainer").imagesLoaded(function(){
            $("#ContentPlaceHolder1_ListView1_groupPlaceholderContainer").masonry({
                isFitWidth:true,
            });
        })
    });
  </script>
    <!--WOW.js-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid clearfix" id="news">
        <div class="wrapper clearfix">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn2 %>" SelectCommand="SELECT * FROM [news_web_pic]"></asp:SqlDataSource>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="rowid" DataSourceID="SqlDataSource1" GroupItemCount="3">
                <AlternatingItemTemplate>
                    <div class="box wow fadeIn">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "img/news/"+ Eval("picUrl") %>' />
                        </div>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <td runat="server" style="">rowid:
                        <asp:Label ID="rowidLabel1" runat="server" Text='<%# Eval("rowid") %>' />
                        <br />nwpNo:
                        <asp:TextBox ID="nwpNoTextBox" runat="server" Text='<%# Bind("nwpNo") %>' />
                        <br />nwNo:
                        <asp:TextBox ID="nwNoTextBox" runat="server" Text='<%# Bind("nwNo") %>' />
                        <br />picName:
                        <asp:TextBox ID="picNameTextBox" runat="server" Text='<%# Bind("picName") %>' />
                        <br />picUrl:
                        <asp:TextBox ID="picUrlTextBox" runat="server" Text='<%# Bind("picUrl") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                        <br /></td>
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
                    <div id="itemPlaceholderContainer" runat="server">
                        <div id="itemPlaceholder" runat="server"></div>
                    </div>
                </GroupTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="">nwpNo:
                        <asp:TextBox ID="nwpNoTextBox" runat="server" Text='<%# Bind("nwpNo") %>' />
                        <br />nwNo:
                        <asp:TextBox ID="nwNoTextBox" runat="server" Text='<%# Bind("nwNo") %>' />
                        <br />picName:
                        <asp:TextBox ID="picNameTextBox" runat="server" Text='<%# Bind("picName") %>' />
                        <br />picUrl:
                        <asp:TextBox ID="picUrlTextBox" runat="server" Text='<%# Bind("picUrl") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                        <br /></td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="box wow fadeIn">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "img/news/"+ Eval("picUrl") %>'  />
                        </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="groupPlaceholderContainer" runat="server">
                                    <div id="groupPlaceholder" runat="server"></div>
                                </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    
                        
                        
                </SelectedItemTemplate>
            </asp:ListView>
            <div class="box">
                <img src="img/010.jpg" alt="">
            </div>
        </div>
    </div>
</asp:Content>
