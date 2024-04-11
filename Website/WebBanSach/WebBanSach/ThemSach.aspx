<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ThemSach.aspx.cs" Inherits="WebBanSach.ThemSach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <h2>TRANG THÊM SÁCH MỚI</h2>
    <hr />

    <div class="row">
        <div class="form-group">
            <label>Tên Sách:</label>
            <asp:TextBox ID="txtTen" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Giá Bán</label>
            <asp:TextBox ID="txtDonGia" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Ảnh bìa</label>
            <asp:FileUpload ID="FHinh" runat="server" />
        </div>
        <div class="form-group">
            <label>Chủ Đề</label>
            <asp:DropDownList ID="DDLChuDe" runat="server"></asp:DropDownList>
        </div>
        <div class="form-group">
            <label>Nhà Sản Xuất</label>
            <asp:DropDownList ID="DLLNhaSX" runat="server"></asp:DropDownList>
        </div>
        <div class="form-group">
            <label>Ngày Cập Nhật</label>
            <asp:TextBox ID="ngaycapnhat" TextMode="DATE" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </div>
    <asp:SqlDataSource ID="dsSach" runat="server"></asp:SqlDataSource>
</asp:Content>
