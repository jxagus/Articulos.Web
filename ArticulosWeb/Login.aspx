<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ArticulosWeb.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="d-flex justify-content-center align-items-center" style="min-height: 70vh;">
        <div class="card shadow p-4" style="width: 100%; max-width: 380px; border-radius: 12px;">
            <h2 class="text-center mb-4">Iniciar Sesión</h2>

            <div class="mb-3">

                <label for="<%= txtUser.ClientID %>" class="form-label">Usuario</label>
                <asp:TextBox runat="server" ID="txtUser" placeholder="Ingrese su usuario" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label for="<%= txtPassword.ClientID %>" class="form-label">Contraseña</label>
                <asp:TextBox runat="server" ID="txtPassword" placeholder="Ingrese su contraseña" CssClass="form-control" TextMode="Password" />
            </div>

            <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-primary w-100" OnClick="btnIngresar_Click" />

            <div class="mt-3 text-center">
                <a href="Default.aspx" class="text-decoration-none">Cancelar</a> |
                <a href="Registro.aspx" class="text-decoration-none">Registrarse</a>
            </div>
        </div>
    </div>

</asp:Content>
