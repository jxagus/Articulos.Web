<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gestion.aspx.cs" Inherits="ArticulosWeb.Gestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FullWidthContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Bienvenido Admin</h2>
    <h3>Proximadamente agregaremos un panel administrativo para usted 😋</h3>

    <!-- dgv -->
    <asp:GridView ID="dgvLista" runat="server" DataKeyNames="Id"
        CssClass="table"
        AutoGenerateColumns="false"
        AllowPaging="True"
        PageSize="5"
        PagerStyle-CssClass="pagination"
        PagerStyle-HorizontalAlign="Center"
        OnSelectedIndexChanged="DgvLista_SelectedIndexChanged"
        OnPageIndexChanging="DgvLista_PageIndexChanging">
        <Columns>
            <asp:BoundField HeaderText="Email" DataField="Email" />
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
            <asp:BoundField HeaderText="Admin" DataField="Admin" />
            <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText="✍️" />
        </Columns>
    </asp:GridView>
    <a href="FormularioArticulo.aspx" class="btn btn-primary">Agregar</a>

</asp:Content>

