﻿<%@ Page Title="Explorar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Explorar.aspx.cs" Inherits="ArticulosWeb.Explorar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Lista de artículos</h1>
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <asp:Label ID="Filtrar" runat="server" Text="Filtro Rapido" />
                <asp:TextBox ID="txtFiltro" runat="server" AutoPostBack="true" OnTextChanged="Filtro_TextChanged" CssClass="form-control" />
            </div>
        </div>
    </div>
    <!--tailwind-->
    <div class="flex flex-wrap gap-6 justify-start">
        <asp:Repeater ID="RepExplorar" runat="server">
            <ItemTemplate>
                <div class="w-72 bg-white rounded-2xl shadow-md hover:shadow-lg transition transform hover:-translate-y-1 overflow-hidden">
                    <img src='<%# ObtenerUrlImagen(Eval("ImagenUrl")) %>' alt="Imagen del artículo"
                        class="w-full h-48 object-contain bg-gray-100" />

                    <div class="p-4">
                        <h5 class="text-lg font-semibold text-gray-900 mb-2"><%# Eval("Nombre") %></h5>
                        <p class="text-gray-700 text-sm mb-4">$<%# Eval("Precio") %></p>
                        <a href='DetalleArticulo.aspx?id=<%# Eval("Id") %>'
                            class="inline-block px-4 py-2 text-white bg-blue-600 rounded-lg hover:bg-blue-700 transition">Ver Detalles
                        </a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
