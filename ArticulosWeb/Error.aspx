<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="ArticulosWeb.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FullWidthContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container d-flex justify-content-center align-items-center" style="min-height: 70vh;">
        <div class="text-center bg-dark text-light p-5 rounded-4 shadow-lg" style="max-width: 500px; width: 100%;">
            <h1 class="mb-4">Ocurrió un error</h1>
            <asp:Label ID="lblError" runat="server" Text="Ha ocurrido un error inesperado." CssClass="d-block mb-4 fw-light fs-5 text-warning"></asp:Label>
            <asp:Button ID="btnVolver" runat="server" Text="Volver al inicio" CssClass="btn btn-outline-light px-4" OnClick="btnVolver_Click" />
        </div>
    </div>
</asp:Content>

