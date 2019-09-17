 <%@ Page Title="" Language="C#" MasterPageFile="~/fontpage.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="_20171123_web.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <!--fancybox CSS-->
    <link rel="stylesheet" href="fancybox/jquery.fancybox.css" /> 
    <!--slick css-->
    <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
    <!--CSS-->
    <link rel="stylesheet" href="css/homepage.css" />
    <style>
        #list #goodsList a{
            text-decoration: none;
            display: block;
            color: #476881;
            border-bottom: 2px solid #476881;
        }
        #list #goodsList .row a{
            text-decoration: none;
            border:0;
        }
        #list #goodsList .card{
            border-color:#476881;
        }
    </style>
    <!--jquery-->
    <script src="jquery-1.12.4.min.js"></script>
    <!--fancybox js-->    
    <script src="fancybox/jquery.fancybox.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.carousel').carousel({
                interval: 4000
            })
        });
    </script>
    <script>
        $(document).ready(function () {
            
        });

    </script>
   
    <!--slick js-->
    <script type="text/javascript" src="slick/slick.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.card-deck.slider').slick({
                    slidesToShow: 3,
                    slidesToScroll: 1,
                    autoplay: true,
                    autoplaySpeed: 4000,
                });
            });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid clearfix" id="slider">
      <div class="wrapper">
          <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="img/slider_01.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="img/slider_02.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="img/slider_03.jpg" alt="Third slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="img/slider_04.jpg" alt="Four slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
   </div>
      </div>
       
<!----------------------------------------------------------------------->
    <div class="container-fluid" id="list">
        <div class="wrapper clearfix">
            <div class="card-group text-center" id="goodsList">
  <div class="card">
    <div class="card-body">
      <a href="#"><h2>新商品</h2></a>
                
                <p>看看這週有什麼新商品!</p>
        <div class="row">
            <a class="col-3" href="#">上裝</a>
            <a class="col-3" href="#">下裝</a>
            <a class="col-3" href="#">外套</a>
            <a class="col-3" href="#">配件</a>
        </div>
    </div>
  </div>
  <div class="card">
    <div class="card-body">
      <a href="#"><h2>本週特價</h2></a>
                <p>划算到不行!</p>
        <div class="row">
            <a class="col-3" href="#">上裝</a>
            <a class="col-3" href="#">下裝</a>
            <a class="col-3" href="#">外套</a>
            <a class="col-3" href="#">配件</a>
        </div>
    </div>
  </div>
  <div class="card">
    <div class="card-body">
       <a href="#"><h2>期間限定商品</h2></a>
                
                <p>錯過就沒有了！</p>
        <div class="row">
            <a class="col-3" href="#">上裝</a>
            <a class="col-3" href="#">下裝</a>
            <a class="col-3" href="#">外套</a>
            <a class="col-3" href="#">配件</a>
        </div>
    </div>
  </div>
      <div class="card">
    <div class="card-body">
     <a href="#"><h2>超值推薦</h2></a>
                
                <p>划算到不行!</p>
        <div class="row">
            <a class="col-3" href="#">上裝</a>
            <a class="col-3" href="#">下裝</a>
            <a class="col-3" href="#">外套</a>
            <a class="col-3" href="#">配件</a>
        </div>
    </div>
  </div>
</div>
            
        </div>

    </div>
<!----------------------------------------------------------------------->
    <div class="container-fluid mt-3" id="menu"> 
        <div class="wrapper">
            <div class="card-deck slider" id="product2">
  <div class="card">
    <img class="card-img-top" src="img/product/Cards-01.jpg" alt="Card image cap">
      <%--<img class="card-img-top" src="img/product/colorBlock-01.png" alt="Card image cap" />--%>
    <div class="card-body">
      <div class="title"><label>TITLE</label></div>
     <div class="price">NT$<label>590</label></div>
    </div>
  </div>
  <div class="card">
    <img class="card-img-top" src="img/product/Cards-02.jpg" alt="Card image cap">
    
    <div class="card-body">
      <div class="title"><label>TITLE</label></div>
     <div class="price">NT$<label>590</label></div>
    </div>
  </div>
  <div class="card">
   <img class="card-img-top" src="img/product/Cards-03.jpg" alt="Card image cap">
    <div class="card-body">
      <div class="title"><label>TITLE</label></div>
     <div class="price">NT$<label>590</label></div>
    </div>
  </div>
  <div class="card">
    <img class="card-img-top" src="img/product/Cards-04.jpg" alt="Card image cap">
    <div class="card-body">
      <div class="title"><label>TITLE</label></div>
     <div class="price">NT$<label>590</label></div>
    </div>
  </div>
  <div class="card">
    <img class="card-img-top" src="img/product/Cards-05.jpg" alt="Card image cap">
    <div class="card-body">
      <div class="title"><label>TITLE</label></div>
     <div class="price">NT$<label>590</label></div>
    </div>
  </div>
</div>
           <%-- <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3">
                <AlternatingItemTemplate>
                    <td runat="server" style="">rowid:
                        <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        <br />nppNo:
                        <asp:Label ID="nppNoLabel" runat="server" Text='<%# Eval("nppNo") %>' />
                        <br />npNo:
                        <asp:Label ID="npNoLabel" runat="server" Text='<%# Eval("npNo") %>' />
                        <br />picName:
                        <asp:Label ID="picNameLabel" runat="server" Text='<%# Eval("picName") %>' />
                        <br />picUrl:
                        <asp:Label ID="picUrlLabel" runat="server" Text='<%# Eval("picUrl") %>' />
                        <br /></td>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <td runat="server" style="">rowid:
                        <asp:TextBox ID="rowidTextBox" runat="server" Text='<%# Bind("rowid") %>' />
                        <br />nppNo:
                        <asp:TextBox ID="nppNoTextBox" runat="server" Text='<%# Bind("nppNo") %>' />
                        <br />npNo:
                        <asp:TextBox ID="npNoTextBox" runat="server" Text='<%# Bind("npNo") %>' />
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
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="">rowid:
                        <asp:TextBox ID="rowidTextBox" runat="server" Text='<%# Bind("rowid") %>' />
                        <br />nppNo:
                        <asp:TextBox ID="nppNoTextBox" runat="server" Text='<%# Bind("nppNo") %>' />
                        <br />npNo:
                        <asp:TextBox ID="npNoTextBox" runat="server" Text='<%# Bind("npNo") %>' />
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
                    <td runat="server" style="">rowid:
                        <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        <br />nppNo:
                        <asp:Label ID="nppNoLabel" runat="server" Text='<%# Eval("nppNo") %>' />
                        <br />npNo:
                        <asp:Label ID="npNoLabel" runat="server" Text='<%# Eval("npNo") %>' />
                        <br />picName:
                        <asp:Label ID="picNameLabel" runat="server" Text='<%# Eval("picName") %>' />
                        <br />picUrl:
                        <asp:Label ID="picUrlLabel" runat="server" Text='<%# Eval("picUrl") %>' />
                        <br /></td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="">rowid:
                        <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        <br />nppNo:
                        <asp:Label ID="nppNoLabel" runat="server" Text='<%# Eval("nppNo") %>' />
                        <br />npNo:
                        <asp:Label ID="npNoLabel" runat="server" Text='<%# Eval("npNo") %>' />
                        <br />picName:
                        <asp:Label ID="picNameLabel" runat="server" Text='<%# Eval("picName") %>' />
                        <br />picUrl:
                        <asp:Label ID="picUrlLabel" runat="server" Text='<%# Eval("picUrl") %>' />
                        <br /></td>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn3 %>" SelectCommand="SELECT * FROM [news_products_pic]"></asp:SqlDataSource>--%>
        </div>

    
        
<!----------------------------------------------------------------------->
        
            
        
           <div class="wrapper">
            <div class="card-deck">
  <div class="card">
    <img class="card-img-top" src="img/illustrations-01.png" alt="Card image cap"/>
    <div class="discount">
        <div>10%</div>
        <div>OFF</div>
     </div>
    <div class="card-body">
      <div class="title"><label>TITLE</label></div>
     <div class="price">NT$<label>590</label></div>
    </div>
  </div>
  <div class="card">
     <img class="card-img-top" src="img/illustrations-02.png" alt="Card image cap"/>
    <div class="discount">
        <div>10%</div>
        <div>OFF</div>
     </div>
    <div class="card-body">
      <div class="title"><label>TITLE</label></div>
     <div class="price">NT$<label>590</label></div>
    </div>
  </div>
  <div class="card">
     <img class="card-img-top" src="img/illustrations-03.png" alt="Card image cap"/>
    <div class="discount">
        <div>10%</div>
        <div>OFF</div>
     </div>
    <div class="card-body">
      <div class="title"><label>TITLE</label></div>
     <div class="price">NT$<label>590</label></div>
    </div>
  </div>
  <div class="card">
     <img class="card-img-top" src="img/illustrations-04.png" alt="Card image cap"/>
    <div class="discount">
        <div>10%</div>
        <div>OFF</div>
     </div>
    <div class="card-body">
      <div class="title"><label>TITLE</label></div>
     <div class="price">NT$<label>590</label></div>
    </div>
  </div>
</div>
        </div>
        
        <div class="wrapper">
            <div class="card-deck">
  <div class="card">
     <img class="card-img-top" src="img/illustrations-05.png" alt="Card image cap"/>
    <div class="discount">
        <div>10%</div>
        <div>OFF</div>
     </div>
    <div class="card-body">
      <div class="title"><label>TITLE</label></div>
     <div class="price">NT$<label>590</label></div>
    </div>
  </div>
  <div class="card">
     <img class="card-img-top" src="img/illustrations-06.png" alt="Card image cap"/>
    <div class="discount">
        <div>10%</div>
        <div>OFF</div>
     </div>
    <div class="card-body">
      <div class="title"><label>TITLE</label></div>
     <div class="price">NT$<label>590</label></div>
    </div>
  </div>
  <div class="card">
     <img class="card-img-top" src="img/illustrations-07.png" alt="Card image cap"/>
    <div class="discount">
        <div>10%</div>
        <div>OFF</div>
     </div>
    <div class="card-body">
      <div class="title"><label>TITLE</label></div>
     <div class="price">NT$<label>590</label></div>
    </div>
  </div>
  <div class="card">
     <img class="card-img-top" src="img/illustrations-08.png" alt="Card image cap"/>
    <div class="discount">
        <div>10%</div>
        <div>OFF</div>
     </div>
    <div class="card-body">
     <div class="title"><label>TITLE</label></div>
     <div class="price">NT$<label>590</label></div>
    </div>
  </div>
</div>
        </div>
        
                        
    </div>
</asp:Content>
