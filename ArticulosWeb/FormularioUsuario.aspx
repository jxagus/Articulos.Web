<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioUsuario.aspx.cs" Inherits="ArticulosWeb.FormularioUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FullWidthContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <!-- Columna del formulario -->
        <div class="col-6">
            <div class="mb-3">
                <label for="txtId" class="form-label">Id
                </label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtApellido" class="form-label">Apellido</label>
                <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary"  />
                <a href="Lista.aspx" class="btn btn-secondary ms-2">Cancelar</a>
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar"   CssClass="btn btn-danger" />

                <!-- <asp:Button ID="btnInactivar" runat="server" Text="Inactivar" CssClass="btn btn-warning" OnClick="btnInactivar_Click" /> -->

            </div>
            <asp:Label ID="lblError" runat="server" ForeColor="Red" />

        </div>
</asp:Content>
