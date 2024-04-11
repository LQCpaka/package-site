<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="QTSach.aspx.cs" Inherits="WebBanSach.QTSach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <h2>TRANG QUẢN TRỊ SÁCH</h2>
  <hr />

    <div class="row">
         <div class="col-md-6">
               <div class="form-inline">
                    Tên sách <asp:TextBox ID="txtTen" runat="server" CssClass="form-control"></asp:TextBox>
                   <asp:Button ID="btTraCuu" runat="server" Text="Tra cứu" CssClass="btn btn-secondary" />
               </div>
         </div>
        <div class="col-md-6 text-right">
              <a href="ThemSach.aspx" class="btn btn-success">Thêm sách</a>
         </div>
    </div>

    <asp:GridView ID="gvSach" runat="server" CssClass="table table-bordered mt-2" AutoGenerateColumns="False"
        DataKeyNames="MaSach" DataSourceID="dsSach" AllowPaging="true" PageSize="5">
        <Columns>            
            <asp:BoundField DataField="TenSach" HeaderText="Tên sách" ReadOnly="true" SortExpression="TenSach" />   
            <asp:ImageField DataImageUrlField="hinh" DataImageUrlFormatString="bia_sach/{0}" ReadOnly="true"  HeaderText="Ảnh bìa" SortExpression="Hinh" />
            <asp:BoundField DataField="Dongia" DataFormatString="{0: #,##0} đồng " HeaderText="Đơn giá" SortExpression="Dongia" />           
            <asp:BoundField DataField="Ngaycapnhat" DataFormatString="{0:dd/MM/yyyy}" ReadOnly="true" HeaderText="Ngày cập nhật" SortExpression="Ngaycapnhat" />
            <asp:TemplateField ItemStyle-Wrap="false">
                 <ItemTemplate>
                     <asp:Button ID="btSua" runat="server" CssClass="btn btn-success" CommandName="Edit" Text="Sửa" />
                     <asp:Button ID="btXoa" OnClientClick="return confirm('Bạn có muốn xoá sách này?')" runat="server" CssClass="btn btn-danger" CommandName="Delete" Text="Xoá" />
                 </ItemTemplate>
                <EditItemTemplate>
                       <asp:Button ID="btCapnhat" runat="server" CssClass="btn btn-success" CommandName="Update" Text="Ghi" />
                       <asp:Button ID="btKhong" runat="server" CssClass="btn btn-warning" CommandName="Cancel" Text="Không" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
             <div class="alert alert-info">
                  Không có dữ liệu
             </div>
        </EmptyDataTemplate>       
    </asp:GridView>


    <asp:SqlDataSource ID="dsSach" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" 
        DeleteCommand="DELETE FROM [Sach] WHERE [MaSach] = @MaSach" 
        InsertCommand="INSERT INTO [Sach] ([TenSach], [MaCD], [MaNXB], [Dongia], [Hinh], [Ngaycapnhat]) VALUES (@TenSach, @MaCD, @MaNXB, @Dongia, @Hinh, @Ngaycapnhat)"
        SelectCommand="SELECT * FROM [Sach] WHERE ([TenSach] LIKE '%' + @TenSach + '%')" 
        UpdateCommand="UPDATE [Sach] SET dongia= @Dongia WHERE [MaSach] = @MaSach">
        <DeleteParameters>
            <asp:Parameter Name="MaSach" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TenSach" Type="String" />
            <asp:Parameter Name="MaCD" Type="Int32" />
            <asp:Parameter Name="MaNXB" Type="Int32" />
            <asp:Parameter Name="Dongia" Type="Decimal" />
            <asp:Parameter Name="Hinh" Type="String" />
            <asp:Parameter Name="Ngaycapnhat" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtTen" DefaultValue="a" Name="TenSach" PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenSach" Type="String" />
            <asp:Parameter Name="MaCD" Type="Int32" />
            <asp:Parameter Name="MaNXB" Type="Int32" />
            <asp:Parameter Name="Dongia" Type="Decimal" />
            <asp:Parameter Name="Hinh" Type="String" />
            <asp:Parameter Name="Ngaycapnhat" Type="DateTime" />
            <asp:Parameter Name="MaSach" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource> 
</asp:Content>