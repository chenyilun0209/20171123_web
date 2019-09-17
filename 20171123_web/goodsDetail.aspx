<%@ Page Title="" Language="C#" MasterPageFile="~/fontpage.Master" AutoEventWireup="true" CodeBehind="goodsDetail.aspx.cs" Inherits="_20171123_web.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--CSS-->
    <link rel="stylesheet" href="css/goodsDetail.css" />
    <style>
        #goods .sideL .sidebarUp a {
           font-size: 18px;
        }
        #goods .sideL .sidebarDown a {
    text-decoration: none;
    color: #838383;
    font-weight: 700;
    font-size: 18px;
}
        .ptDetail {
            text-decoration:none;
            list-style:none;
            padding:0;
        }
        .datalistImg {
            width:40px;
            margin-right:10px;
        }
        #goodsinfo .price {
           text-align:right;
         }
        #goodsinfo .select {
              margin-top: 10px;
              margin-bottom: 10px;
          }
        .sideR #goodsPic .goodsPic {
             width: 90%;
        }
        #myTabContent {
    padding: 10px;
    border-bottom: 1px solid #dbdbdb;
    border-left: 1px solid #dbdbdb;
    border-right: 1px solid #dbdbdb;
    
}

    #myTab li a {
        color: #000000;
        
    }
    #sizeBlock {
    width: 60%;
    height: 400px;
    overflow-y: scroll;
}
    #goodsinfo .contentBox .btnAdd {
            border: 0;
            width: 100%;
            height: 35px;
            color: white;
            background-color: #5282a5;
        }
    </style>
    <script>
        $(document).ready(function() {
            ////.find("a")找到#thumbs的<a>,點擊後
            //$("#colorBlock a").click(function(e) {
            //    console.log(e);
            //    //宣告i,存放點擊後，抓取的src值
            //    var i = $(this).children("img").attr("src");
            //    var i_start = i.slice(0, 28); //擷取img/
            //    var i_end = i.slice(-4); //截取.jpg
            //    var i_final = i_start + i_end; //組合起來
            //    console.log(i_start);
            //    console.log(i_end);
            //    //抓取#gallery的<img>的src,置換成i_final
            //    $("#goodsPic").find("img").attr("src", i_final);
            //});
        });
    </script>
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
                    <div class="collapse" id="collapseTop">
                        <div class="card-body clearfix">
                           <asp:BulletedList ID="BulletedList1" CssClass="ptDetail" runat="server" DisplayMode="LinkButton" OnClick="BulletedList1_Click" OnLoad="BulletedList1_Load"></asp:BulletedList>
                        </div>
                    </div>
                </div>
                <li>
                <a data-toggle="collapse" href="#collapseBottom" aria-expanded="false" aria-controls="collapseBottom"><label>下裝</label><span class="fa fa-chevron-down"></span></a>
                </li>
                <div class="card">
                    <div class="collapse" id="collapseBottom">
                        <div class="card-body clearfix">
                            <asp:BulletedList ID="BulletedList2" CssClass="ptDetail" runat="server" DisplayMode="LinkButton" OnClick="BulletedList2_Click" OnLoad="BulletedList2_Load"></asp:BulletedList>

                        </div>
                    </div>
                </div>
                <li>
                <a data-toggle="collapse" href="#collapseOutter" aria-expanded="false" aria-controls="collapseOutter"><label>外套</label><span class="fa fa-chevron-down"></span></a>
                </li>
                <div class="card">
                    <div class="collapse" id="collapseOutter">
                        <div class="card-body clearfix">
                            <asp:BulletedList ID="BulletedList3" CssClass="ptDetail" runat="server" DisplayMode="LinkButton" OnClick="BulletedList3_Click" OnLoad="BulletedList3_Load"></asp:BulletedList>


                        </div>
                    </div>
                </div>
                <li>
                <a data-toggle="collapse" href="#collapseOther" aria-expanded="false" aria-controls="collapseOther"><label>配件</label><span class="fa fa-chevron-down"></span></a>
                </li>
                <div class="card">
                    <div class="collapse" id="collapseOther">
                        <div class="card-body clearfix">
                            <asp:BulletedList ID="BulletedList4" CssClass="ptDetail" runat="server" DisplayMode="LinkButton" OnClick="BulletedList4_Click" OnLoad="BulletedList4_Load"></asp:BulletedList>
      
                        </div>
                    </div>
                </div>
                
            </ul>
               
                </div>

            
            </div>
            <div class="sideR">
                <div class="sideRTop clearfix">
                    <div id="goodsPic">
                        <asp:Image ID="Image1" runat="server" AlternateText="img" CssClass="goodsPic" />
                        <%--<a data-fancybox="pic" href="images/product/001-skirt.jpg"><img alt="" src="img/product/bottom/001-skirt.jpg"></a>--%>
                    </div>

                    <div id="goodsinfo">
                        <div class="top clearfix">
                            <div class="info">
                                <h3><asp:Label ID="lblPName" runat="server" Text="TITLE"></asp:Label></h3>
                                <p style="font-size:12px;">商品編號:<asp:Label ID="lblPNo" runat="server" Text=""></asp:Label></p>
                                <p><asp:Label ID="lblStyle" Font-Size="12" runat="server" Text=""></asp:Label></p>
                            </div>
                            <div class="price">
                                <h2><span style="color:red; font-size:12px;">NT</span><asp:Label ID="lblPPrice" runat="server" Text="" ForeColor="Red"></asp:Label></h2>
                            </div>
                        </div>
                        <div class="bottom">
                            <div id="colorBlock">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn2 %>" SelectCommand="SELECT * FROM [prouductStyle] WHERE ([pNo] = @pNo)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblPNo" Name="pNo" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:Label ID="lblStyleNo" runat="server" Text="" Visible="false"></asp:Label>
                               
                                <asp:ListView ID="ListView1" runat="server" DataKeyNames="rowid" DataSourceID="SqlDataSource1" GroupItemCount="4" OnItemCommand="ListView1_ItemCommand">
                                    <AlternatingItemTemplate>
                                        <td runat="server" style="">
                                            <asp:Label ID="Label1" runat="server" Text='<%# "img/product/"+ Eval("pStylePic") %>' Visible="false"></asp:Label>
                                           <asp:Label ID="lblpStyleNo" runat="server" Text='<%# Eval("pStyleNo") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblpStyle" runat="server" Text='<%# Eval("pStyle") %>' Visible="false"></asp:Label>
                                            <asp:ImageButton ID="ImageButton1" CssClass="datalistImg" runat="server" CommandName="Select" ImageUrl='<%# "img/product/"+ Eval("pStylePicBlock") %>' CausesValidation="False" />
                                        </td>
                                    </AlternatingItemTemplate>
                                    <EditItemTemplate>
                                        <td runat="server" style="">rowid:
                                            <asp:Label ID="rowidLabel1" runat="server" Text='<%# Eval("rowid") %>' />
                                            <br />pStyleNo:
                                            <asp:TextBox ID="pStyleNoTextBox" runat="server" Text='<%# Bind("pStyleNo") %>' />
                                            <br />pStyle:
                                            <asp:TextBox ID="pStyleTextBox" runat="server" Text='<%# Bind("pStyle") %>' />
                                            <br />pStylePic:
                                            <asp:TextBox ID="pStylePicTextBox" runat="server" Text='<%# Bind("pStylePic") %>' />
                                            <br />pStylePicBlock:
                                            <asp:TextBox ID="pStylePicBlockTextBox" runat="server" Text='<%# Bind("pStylePicBlock") %>' />
                                            <br />pNo:
                                            <asp:TextBox ID="pNoTextBox" runat="server" Text='<%# Bind("pNo") %>' />
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
                                        <td runat="server" style="">pStyleNo:
                                            <asp:TextBox ID="pStyleNoTextBox" runat="server" Text='<%# Bind("pStyleNo") %>' />
                                            <br />pStyle:
                                            <asp:TextBox ID="pStyleTextBox" runat="server" Text='<%# Bind("pStyle") %>' />
                                            <br />pStylePic:
                                            <asp:TextBox ID="pStylePicTextBox" runat="server" Text='<%# Bind("pStylePic") %>' />
                                            <br />pStylePicBlock:
                                            <asp:TextBox ID="pStylePicBlockTextBox" runat="server" Text='<%# Bind("pStylePicBlock") %>' />
                                            <br />pNo:
                                            <asp:TextBox ID="pNoTextBox" runat="server" Text='<%# Bind("pNo") %>' />
                                            <br />
                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                                            <br />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                                            <br /></td>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <td runat="server" style="">
                                            <asp:Label ID="Label1" runat="server" Text='<%# "img/product/"+ Eval("pStylePic") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="lblpStyleNo" runat="server" Text='<%# Eval("pStyleNo") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblpStyle" runat="server" Text='<%# Eval("pStyle") %>' Visible="false"></asp:Label>
                                        <asp:ImageButton ID="ImageButton1" CssClass="datalistImg" runat="server" CommandName="Select" ImageUrl='<%# "img/product/"+ Eval("pStylePicBlock") %>' CausesValidation="False" />
                                        </td>
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
                                        <td runat="server" style="">
                                            <asp:ImageButton ID="ImageButton2" CssClass="datalistImg" runat="server" BorderStyle="Groove" BorderWidth="4" BackColor="Black" ImageUrl='<%# "img/product/"+ Eval("pStylePicBlock") %>' CausesValidation="False" />
                                        </td>
                                    </SelectedItemTemplate>
                                </asp:ListView>
                                
                            </div>
                            <div class="select">
                                <div class="row">
    <div class="col-md-6 mb-3">
      <asp:DropDownList ID="SizeDDL" runat="server" CssClass="form-control"></asp:DropDownList>
    </div>
    <div class="col-md-6 mb-3">
       <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                 <asp:Button ID="btnAmount1" runat="server" Text="-" CssClass="input-group-addon" CausesValidation="False" OnClick="btnAmount1_Click" />
                                   <asp:TextBox ID="txtAmount" CssClass="form-control text-center" Text="" runat="server"></asp:TextBox>
                                   <asp:Button ID="btnAmount2" runat="server" Text="+" CssClass="input-group-addon" CausesValidation="False" OnClick="btnAmount2_Click" />
                                   <%--<button class="input-group-addon">-</button>
                                       <input type="text" class="form-control" id="inlineFormInputGroupUsername2" placeholder="Username">
                                   <button class="input-group-addon">+</button>--%>
                                    </div>
    </div>
  </div>
                                
                               
                               
                                
                            </div>
                            <div class="goodsContent">
                                <div class="contentBox">
                                    <a data-fancybox data-src="#sizeBlock" href="javascript:;">尺寸表</a>
                                </div>
                                <div class="contentBox">
                                    <asp:Button ID="btnAdd" runat="server" CssClass="btnAdd" Text="加入購物車" OnClick="btnAdd_Click" CausesValidation="False" />
                                </div>
<div class="contentBox">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="pContent-tab" data-toggle="tab" href="#pContent" role="tab" aria-controls="pContent" aria-selected="true">商品資訊</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="pContent2-tab" data-toggle="tab" href="#pContent2" role="tab" aria-controls="pContent2" aria-selected="false">商品描述</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="pContent3-tab" data-toggle="tab" href="#pContent3" role="tab" aria-controls="pContent3" aria-selected="false">洗滌方式</a>
  </li>

</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="pContent" role="tabpanel" aria-labelledby="pContent-tab">
                                            <asp:Label ID="lblpContent" runat="server" Text="Label"></asp:Label>
                                        </div>
                                        <div class="tab-pane fade" id="pContent2" role="tabpanel" aria-labelledby="pContent2-tab">
                                            <asp:Label ID="lblpContent2" runat="server" Text="Label"></asp:Label>
                                        </div>
                                        <div class="tab-pane fade" id="pContent3" role="tabpanel" aria-labelledby="pContent3-tab">
                                            <asp:Label ID="lblpContent3" runat="server" Text="Label"></asp:Label>
                                        </div>

</div>
                    </div>
                                

                            </div>
                        </div>


                    </div>
                </div>
                <div class="sideRBottom">
                    <hr/>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn2 %>" SelectCommand="SELECT * FROM [productsPic] WHERE ([pNo] = @pNo)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblPNo" Name="pNo" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ListView ID="ListView2" runat="server" DataKeyNames="rowid" DataSourceID="SqlDataSource2">
                        <AlternatingItemTemplate>
                            <span style="">
                                <asp:Image ID="Image2" runat="server" Width="100%" ImageUrl='<%# "img/product/"+Eval("picUrl") %>' />
                            
                            <br />
                            </span>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <span style="">rowid:
                            <asp:Label ID="rowidLabel1" runat="server" Text='<%# Eval("rowid") %>' />
                            <br />
                            pPicNo:
                            <asp:TextBox ID="pPicNoTextBox" runat="server" Text='<%# Bind("pPicNo") %>' />
                            <br />
                            picName:
                            <asp:TextBox ID="picNameTextBox" runat="server" Text='<%# Bind("picName") %>' />
                            <br />
                            picUrl:
                            <asp:TextBox ID="picUrlTextBox" runat="server" Text='<%# Bind("picUrl") %>' />
                            <br />
                            pNo:
                            <asp:TextBox ID="pNoTextBox" runat="server" Text='<%# Bind("pNo") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                            <br /><br /></span>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <span>未傳回資料。</span>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <span style="">pPicNo:
                            <asp:TextBox ID="pPicNoTextBox" runat="server" Text='<%# Bind("pPicNo") %>' />
                            <br />picName:
                            <asp:TextBox ID="picNameTextBox" runat="server" Text='<%# Bind("picName") %>' />
                            <br />picUrl:
                            <asp:TextBox ID="picUrlTextBox" runat="server" Text='<%# Bind("picUrl") %>' />
                            <br />pNo:
                            <asp:TextBox ID="pNoTextBox" runat="server" Text='<%# Bind("pNo") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                            <br /><br /></span>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <span style="">
                                <asp:Image ID="Image2" runat="server" Width="100%" ImageUrl='<%# "img/product/"+Eval("picUrl") %>' />
                            <br />
                            </span>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="">
                            </div>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <span style="">rowid:
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                            <br />
                            pPicNo:
                            <asp:Label ID="pPicNoLabel" runat="server" Text='<%# Eval("pPicNo") %>' />
                            <br />
                            picName:
                            <asp:Label ID="picNameLabel" runat="server" Text='<%# Eval("picName") %>' />
                            <br />
                            picUrl:
                            <asp:Label ID="picUrlLabel" runat="server" Text='<%# Eval("picUrl") %>' />
                            <br />
                            pNo:
                            <asp:Label ID="pNoLabel" runat="server" Text='<%# Eval("pNo") %>' />
                            <br />
<br /></span>
                        </SelectedItemTemplate>
                    </asp:ListView>
                </div>
            </div>
           <%------------------------ 尺寸表---------------------------------------------%>
            <div class="container" style="display: none;" id="sizeBlock">
                <div class="wrapper clearfix">
                    <h2>尺寸表</h2>
                    <hr>
                    <p>商品尺寸</p>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="尺碼">
                                <ItemTemplate>
                                    <asp:Label ID="lblSizeT" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="肩寬">
                                <ItemTemplate>
                                    <asp:Label ID="lblshoulder" runat="server" Text='<%# Bind("shoulder") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="胸寬">
                                <ItemTemplate>
                                    <asp:Label ID="lblchest" runat="server" Text='<%# Bind("chest") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="袖長">
                                <ItemTemplate>
                                    <asp:Label ID="lblsLength" runat="server" Text='<%# Bind("sleeveLength") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="袖口寬">
                                <ItemTemplate>
                                    <asp:Label ID="lblsOpening" runat="server" Text='<%# Bind("sleeveOpening") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="衣長">
                                <ItemTemplate>
                                    <asp:Label ID="lblLength" runat="server" Text='<%# Bind("length") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        
                    </asp:GridView>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="尺碼">
                                <ItemTemplate>
                                    <asp:Label ID="lblSizeT" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="腰圍">
                                <ItemTemplate>
                                    <asp:Label ID="lblwaist" runat="server" Text='<%# Bind("waist") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="臀圍">
                                <ItemTemplate>
                                    <asp:Label ID="lblhip" runat="server" Text='<%# Bind("hip") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="大腿圍">
                                <ItemTemplate>
                                    <asp:Label ID="lblthigh" runat="server" Text='<%# Bind("thigh") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="褲/裙口寬">
                                <ItemTemplate>
                                    <asp:Label ID="lblopenning" runat="server" Text='<%# Bind("openning") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="褲/裙長">
                                <ItemTemplate>
                                    <asp:Label ID="lblLength" runat="server" Text='<%# Bind("length") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                     <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="尺碼">
                                <ItemTemplate>
                                    <asp:Label ID="lblSizeT" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="肩寬">
                                <ItemTemplate>
                                    <asp:Label ID="lblshoulder" runat="server" Text='<%# Bind("shoulder") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="胸寬">
                                <ItemTemplate>
                                    <asp:Label ID="lblchest" runat="server" Text='<%# Bind("chest") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="袖長">
                                <ItemTemplate>
                                    <asp:Label ID="lblsLength" runat="server" Text='<%# Bind("sleeveLength") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="袖口寬">
                                <ItemTemplate>
                                    <asp:Label ID="lblsOpening" runat="server" Text='<%# Bind("sleeveOpening") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="衣長">
                                <ItemTemplate>
                                    <asp:Label ID="lblLength" runat="server" Text='<%# Bind("length") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        
                    </asp:GridView>
                     <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="尺碼">
                                <ItemTemplate>
                                    <asp:Label ID="lblSizeT" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="高">
                                <ItemTemplate>
                                    <asp:Label ID="lblheight" runat="server" Text='<%# Bind("height") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="寬">
                                <ItemTemplate>
                                    <asp:Label ID="lblwidth" runat="server" Text='<%# Bind("width") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <p>
                        <asp:Label ID="Label2" runat="server" Text="請先選擇樣式!" Visible="true"></asp:Label></p>
                    <p>※ 本尺寸表會因商品素材不同，可能與實際尺寸略有誤差。</p>
                    <%--<hr>
                    <p>試穿報告</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium quis hic</p>
                    <hr>
                    <p>模特兒參考</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium quis hic</p>--%>
                </div>
            </div>
           

        </div>
   </div>
</asp:Content>
