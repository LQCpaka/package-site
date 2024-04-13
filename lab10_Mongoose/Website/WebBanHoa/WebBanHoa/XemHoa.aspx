<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemHoa.aspx.cs" Inherits="WebBanHoa.XemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" runat="server">
    <div class="form-inline">
        Chọn danh mục loại<asp:DropDownList ID="ddlLoai" AutoPostBack="true" runat="server" DataSourceID="dsLoai"></asp:DropDownList>
    </div>
    <div class="row">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="">
            <ItemTemplate>
                <div class="col-md-3">
                    <a href="#">
                        <img src="hinh_san_pham/<%# Eval("hinh") %>"style="width:100px"/>
                    </a> <br />

                    <%# Eval("TenHoa") %> <br />
                    Giá bán: <%# Eval("gia") %> <br />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <asp:Repeater ID="rpHoa" runat="server" DataSourceID="dsLoai"></asp:Repeater>

    <asp:SqlDataSource ID="dsLoai" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" 
        OnSelecting="dsLoai_Selecting" ProviderName="<%$ 
        ConnectionStrings:HoaTuoiDBConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>
</asp:Content>
