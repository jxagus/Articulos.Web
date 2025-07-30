<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ArticulosWeb.Default" %>
<%--<%@ Page Language="C#" MasterPageFile="~/Landing.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ArticulosWeb.Default" %>--%>
   
<!-- Aca va a ocurrir la magia neneee -->
<asp:Content ID="ContenidoFuera" ContentPlaceHolderID="OutsideContainer" runat="server">
    <div class="hero-home text-center p-5 text-white" style="background-color: #007bff;">
        <h1>Bienvenido a la página principal</h1>
        <p>Este contenido está fuera del `.container`, ideal para banners o portadas</p>
    </div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="hero-section" style="margin-top: 5px;">
        <div class="hero-overlay">
            <div class="hero-content">
                <h1 class="display-4 fw-bold">Articles Shop</h1>
                <p class="lead">Bienvenidos a la página número 1# de venta de artículos de la Argentina</p>
                <a href="Explorar.aspx" class="btn btn-danger btn-lg mt-3">Ver ahora mismo</a>
            </div>
        </div>
    </div>

    <!-- Ofertas unicas en Iphones -->
    <h2 class="text-2xl font-bold mb-4">Nuestros celulares</h2>
    <div class="flex flex-wrap gap-6 justify-start">
        <% foreach (Dominio.Articulo item in ListaCelulares)
            {
                string imagenUrl = string.IsNullOrEmpty(item.ImagenUrl) ? "Img/NoDisponible.jpg" : item.ImagenUrl;
                if (!imagenUrl.StartsWith("https"))
                {
                    imagenUrl = "Img/NoDisponible.jpg";
                }
        %>
        <div class="w-72 bg-white rounded-2xl shadow-md hover:shadow-lg transition transform hover:-translate-y-1 overflow-hidden">
            <img src="<%: imagenUrl %>" alt="Imagen del artículo"
                class="w-full h-48 object-contain bg-gray-100" />

            <div class="p-4">
                <h5 class="text-lg font-semibold text-gray-900 mb-2"><%: item.Nombre %></h5>
                <p class="text-gray-700 text-sm mb-4"><%: "$" + (Math.Truncate(item.Precio * 100) / 100m).ToString("F2") %></p>
                <a href='DetalleArticulo.aspx?id=<%: item.Id %>'
                    class="inline-block px-4 py-2 text-white bg-blue-600 rounded-lg hover:bg-blue-700 transition">Ver Detalles
                </a>
            </div>
        </div>
        <% } %>
    </div>
    <br />
    <!-- Nuestros productos destacados -->
    <h2 class="text-2xl font-bold mb-4">Otros de nuestros productos</h2>
    <div class="flex flex-wrap gap-6 justify-start">
        <asp:Repeater ID="RepExplorar" runat="server">
            <ItemTemplate>
                <div class="w-72 bg-white rounded-2xl shadow-md hover:shadow-lg transition transform hover:-translate-y-1 overflow-hidden">
                    <img src='<%# ObtenerUrlImagen(Eval("ImagenUrl")) %>' alt="Imagen del artículo"
                        class="w-full h-48 object-contain bg-gray-100" />

                    <div class="p-4">
                        <h5 class="text-lg font-semibold text-gray-900 mb-2"><%# Eval("Nombre") %></h5>
                        <p class="text-gray-700 text-sm mb-4"><%# "$" + (Math.Truncate(Convert.ToDecimal(Eval("Precio")) * 100) / 100m).ToString("F2") %></p>
                        <a href='DetalleArticulo.aspx?id=<%# Eval("Id") %>'
                            class="inline-block px-4 py-2 text-white bg-blue-600 rounded-lg hover:bg-blue-700 transition">Ver Detalles
                        </a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
 
</asp:Content>
