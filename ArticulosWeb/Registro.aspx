<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="ArticulosWeb.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- estilos bonitos-->
    <style>
        .registro-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .form-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }

        .btn-custom {
            width: 100%;
        }

        .form-text {
            font-size: 0.875rem;
            color: #6c757d;
        }

        a.cancel-link {
            display: inline-block;
            margin-top: 10px;
            color: #6c757d;
            text-decoration: none;
        }

        a.cancel-link:hover {
                text-decoration: underline;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FullWidthContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="registro-container">
        <div class="form-title">Registrarse</div>

        <div class="mb-3">
            <label class="form-label">Correo electrónico</label>
            <asp:TextBox runat="server" ID="txtEmail" placeholder="Email" CssClass="form-control" />
            <div id="emailHelp" class="form-text">Nunca compartiremos tu correo electrónico con nadie.</div>
        </div>
        <asp:Label ID="Label1" runat="server" CssClass="text-danger" Visible="false" />

        <div class="mb-3">
            <label class="form-label">Contraseña</label>
            <asp:TextBox runat="server" placeholder="*****" ID="txtPass" CssClass="form-control" TextMode="Password" />
        </div>
        <div class="mb-3">
            <label class="form-label">Confirmar contraseña</label>
            <asp:TextBox runat="server" placeholder="*****" ID="txtConfirmarPass" CssClass="form-control" TextMode="Password" />
        </div>

        <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="false" />


        <asp:Button Text="Registrarme" runat="server" ID="btnIngresar" OnClick="btnIngresar_Click" CssClass="btn btn-primary btn-custom" />

        <a href="Default.aspx" class="cancel-link">Cancelar</a>
    </div>
</asp:Content>

