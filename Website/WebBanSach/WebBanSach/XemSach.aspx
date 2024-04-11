<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemSach.aspx.cs" Inherits="WebBanSach.XemSach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">

    <div class="row">
        <div class="col-md-3">

            <ul class="list-group">
                 <a class="list-group-item active">Chủ đề sách </a>
                <asp:Repeater ID="rptChuDe" runat="server" DataSourceID="dsChuDe">
                    <ItemTemplate>
                          <a href="XemSach.aspx?macd=<%# Eval("macd") %>" class="list-group-item list-group-item-action"><%# Eval("Tencd") %></a>
                    </ItemTemplate>
                </asp:Repeater>         
            </ul>

        </div>
        <div class="col-md-9">
            <asp:ListView ID="lvSach" runat="server" DataSourceID="dsSach">
                  <ItemTemplate>
                        <div class="col-md-3 text-center mb-2">
                             <a href="#"> 
                                   <img src="<%# Eval("hinh","bia_sach/{0}") %>"></img>
                              </a> 
                            <br />
                            <asp:Button ID="btDatMua" runat="server" Text="Đặt mua" CssClass="btn btn-success mt-2" /> <br />
                            <%# Eval("tensach") %>  <br />
                            Giá bán: <span class="text-danger"> <%# Eval("dongia","{0: #,##0} đồng") %></span>

                        </div>
                  </ItemTemplate>
                  <LayoutTemplate>
                       <div class="row">
                            <div id="itemPlaceHolder" runat="server">
                            </div>
                       </div>
                      <div class="row">
                           <div class="col-md-12 text-center">
                               <asp:DataPager ID="DataPager1" runat="server" PageSize="6">
                                   <Fields>
                                       <asp:NumericPagerField />
                                   </Fields>
                               </asp:DataPager>
                           </div>
                      </div>
                  </LayoutTemplate>
            </asp:ListView>          
        </div>
    </div>

    <asp:SqlDataSource ID="dsChuDe" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>"
        SelectCommand="SELECT * FROM [ChuDe]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsSach" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" 
        SelectCommand="SELECT * FROM [Sach] WHERE ([MaCD] = @MaCD)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="5" Name="MaCD" QueryStringField="macd" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>
