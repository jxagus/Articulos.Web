<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gestion.aspx.cs" Inherits="ArticulosWeb.Gestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FullWidthContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* dashload admin gestion*/
        .dashboard {
            display: flex;
            gap: 20px;
            justify-content: center;
            margin: 40px 0;
            flex-wrap: wrap;
        }

        .card {
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            padding: 30px;
            width: 250px;
            text-align: center;
            transition: transform 0.2s ease;
        }

            .card:hover {
                transform: translateY(-5px);
            }

        .card-title {
            font-size: 18px;
            color: #555;
            margin-bottom: 10px;
        }

        .card-value {
            font-size: 36px;
            font-weight: bold;
            color: #333;
        }
    </style>
    
    <div class="container" style="max-width: 800px; margin-top: 30px;">
        <h2 id="title" class="text-center mb-4">Bienvenido Admin</h2>
        </div>

    <div class="dashboard">
        <div class="card">
            <div class="card-title">👤 Usuarios registrados</div>
            <div class="card-value">
                <asp:Label ID="lblUsuarios" runat="server" Text="0" />
            </div>
        </div>

        <div class="card">
            <div class="card-title">📦 Artículos publicados</div>
            <div class="card-value">
                <asp:Label ID="lblArticulos" runat="server" Text="0" />
            </div>
        </div>
    </div>

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

