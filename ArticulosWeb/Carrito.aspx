<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="ArticulosWeb.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="flex flex-col md:flex-row gap-6 p-6 bg-gray-100 min-h-screen">
        
        <!-- Carrito vacío -->
        <div class="flex-1 bg-white rounded-lg shadow p-6 flex flex-col items-center justify-center">
            <img src="Img/cart-empty.svg" alt="Carrito vacío" class="w-16 h-16 mb-4" />
            <p class="text-gray-700 mb-4">Agregá productos para armar tu carrito</p>
            <a href="Default.aspx" class="px-6 py-2 border border-black rounded hover:bg-gray-50 font-medium">
                Continuar comprando
            </a>
        </div>

        <!-- Resumen de compra -->
        <div class="w-full md:w-1/3 bg-white rounded-lg shadow p-6">
            <h3 class="text-lg font-semibold mb-2">Resumen de compra</h3>
            <p class="text-gray-400 text-sm">Acá verás los importes de tu compra una vez que agregues productos.</p>
        </div>
    </div>
</asp:Content>
