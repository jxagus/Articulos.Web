<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ArticulosWeb.Default" %>


<asp:Content ID="ContenidoFuera" ContentPlaceHolderID="OutsideContainer" runat="server">

    <!-- ***** Main Banner Area Start ***** -->
    <div class="swiper-container" id="top">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <div class="slide-inner" style="background-image: url(Content/assets/images/slide-01.jpg)">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="header-text">
                                    <h2>Descubrí el nuevo <em>iPhone 16</em><br>
                                        &amp; potencia <em>sin límites</em></h2>

                                    <div class="div-dec"></div>
                                    <p>Innovación, diseño y rendimiento al alcance de tu mano. Disponible ahora.</p>
                                    <div class="buttons">
                                        <%--                    <div class="green-button"><a href="Explorar.aspx">Explorar</a></div>--%>
                                        <div class="orange-button"><a href="Explorar.aspx">Explorar</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="slide-inner" style="background-image: url(Content/assets/images/slide-02.jpg)">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="header-text">
                                    <h2>Registrate ahora <em>gratis</em><br>
                                        &amp; recibí <em>ofertas imperdibles</em></h2>

                                    <div class="div-dec"></div>
                                    <p>No te pierdas los mejores precios antes que nadie. ¡Solo para clientes!</p>
                                    <div class="buttons">
                                        <div class="green-button"><a href="Login.aspx">Ingresar</a></div>
                                        <%--                    <div class="orange-button"><a href="#">Contact Us</a></div>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="slide-inner" style="background-image: url(Content/assets/images/slide-03.jpg)">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="header-text">
                                    <h2>Comprá con <em>garantía oficial</em><br>
                                        &amp; cuotas <em>sin interés</em></h2>

                                    <div class="div-dec"></div>
                                    <p>Elegí con confianza: todos nuestros productos están garantizados y en 6 cuotas sin recargo.</p>
                                    <div class="buttons">
                                        <div class="green-button"><a href="#">Discover More</a></div>
                                        <div class="orange-button"><a href="#">Contact Us</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Flechas -->
        <div class="swiper-button-next swiper-button-white"></div>
        <div class="swiper-button-prev swiper-button-white"></div>
    </div>

</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<!-- Ofertas únicas en Iphones -->
<h2 class="text-2xl font-bold mb-4">Nuestros celulares</h2>
<div class="flex flex-wrap gap-6 justify-start">
    <% 
        foreach (Dominio.Articulo item in ListaCelulares)
        {
            string imagenUrl = string.IsNullOrEmpty(item.ImagenUrl) ? "Img/NoDisponible.jpg" : item.ImagenUrl;
            if (!imagenUrl.StartsWith("https"))
            {
                imagenUrl = "Img/NoDisponible.jpg";
            }
    %>
    <a href='DetalleArticulo.aspx?id=<%: item.Id %>' class="no-underline text-black">
        <div class="w-72 bg-white rounded-2xl shadow-md hover:shadow-lg transition transform hover:-translate-y-1 overflow-hidden cursor-pointer">
            <img src="<%: imagenUrl %>" alt="Imagen del artículo"
                class="w-full h-48 object-contain bg-gray-100" />
            <div class="p-4">
                <h5 class="text-lg font-semibold text-gray-900 mb-2"><%: item.Nombre %></h5>

                <% 
                    if (item.PrecioDescuento.HasValue && item.PrecioDescuento.Value < item.Precio)
                    {
                %>
                    <span class='text-green-600 font-bold'>
                        -<%: Math.Round((1 - (item.PrecioDescuento.Value / item.Precio)) * 100) %>%
                    </span><br/>
                    <span class='line-through text-gray-400 text-sm'>
                        $<%: item.Precio.ToString("N2", new System.Globalization.CultureInfo("es-AR")) %>
                    </span><br/>
                    <span class='text-gray-600 text-lg'>
                        $<%: item.PrecioDescuento.Value.ToString("N2", new System.Globalization.CultureInfo("es-AR")) %>
                    </span>
                <%
                    }
                    else
                    {
                %>
                    <span class='text-gray-600 text-lg'>
                        $<%: item.Precio.ToString("N2", new System.Globalization.CultureInfo("es-AR")) %>
                    </span>
                <% 
                    }
                %>
            </div>
        </div>
    </a>
    <% } %>
</div>
<br />


    <!-- Nuestros productos destacados -->
<h2 class="text-2xl font-bold mb-4">Otros de nuestros productos</h2>
<div class="flex flex-wrap gap-6 justify-start">
    <asp:Repeater ID="RepExplorar" runat="server">
        <ItemTemplate>
            <a href='DetalleArticulo.aspx?id=<%# Eval("Id") %>' class="no-underline text-black">
                <div class="w-72 bg-white rounded-2xl shadow-md hover:shadow-lg transition transform hover:-translate-y-1 overflow-hidden cursor-pointer">
                    <img src='<%# ObtenerUrlImagen(Eval("ImagenUrl")) %>' alt="Imagen del artículo"
                        class="w-full h-48 object-contain bg-gray-100" />
                    <div class="p-4">
                        <h5 class="text-lg font-semibold text-gray-900 mb-2"><%# Eval("Nombre") %></h5>

                        <%# 
                            Eval("PrecioDescuento") != DBNull.Value 
                            && Eval("PrecioDescuento") != null 
                            && Convert.ToDecimal(Eval("PrecioDescuento")) < Convert.ToDecimal(Eval("Precio")) 
                            ? "<span class='text-green-600 font-bold'> -" 
                                + Math.Round((1 - (Convert.ToDecimal(Eval("PrecioDescuento")) / Convert.ToDecimal(Eval("Precio")))) * 100) + "%</span><br/>"
                                + "<span class='line-through text-gray-400 text-sm'>$" 
                                + Convert.ToDecimal(Eval("Precio")).ToString("N2", new System.Globalization.CultureInfo("es-AR")) + "</span><br/>"
                                + "<span class='text-black font-bold text-lg'>$" 
                                + Convert.ToDecimal(Eval("PrecioDescuento")).ToString("N2", new System.Globalization.CultureInfo("es-AR")) + "</span>"
                            : "<span class='text-black font-bold text-lg'>$" 
                                + Convert.ToDecimal(Eval("Precio")).ToString("N2", new System.Globalization.CultureInfo("es-AR")) + "</span>"
                        %>
                    </div>
                </div>
            </a>
        </ItemTemplate>
    </asp:Repeater>
</div>

</asp:Content>

