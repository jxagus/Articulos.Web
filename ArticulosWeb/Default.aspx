<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ArticulosWeb.Default" %>

<asp:Content ID="ContenidoFuera" ContentPlaceHolderID="OutsideContainer" runat="server">
    <!-- ***** Main Banner Area Start ***** -->
    <div class="swiper-container h-[60vh] w-full overflow-hidden" id="top">
        <div class="swiper-wrapper h-full">
            
            <div class="swiper-slide h-full bg-cover bg-center" style="background-image: url('Content/assets/images/slide1.png')">
                <div class="container h-full flex items-center">
                    <div class="row w-full">
                        <div class="col-12 col-lg-8">
                            <div class="header-text text-white p-4 rounded-lg bg-black/30 backdrop-blur-sm">
                                <h2 class="text-3xl md:text-5xl font-bold mb-3">
                                    Descubrí el nuevo <em class="text-amber-400 not-italic">iPhone 16</em><br>
                                    &amp; potencia <em class="text-amber-400 not-italic">sin límites</em>
                                </h2>
                                <div class="w-16 h-1 bg-amber-400 my-4"></div>
                                <p class="text-base md:text-lg mb-6">Innovación, diseño y rendimiento al alcance de tu mano. Disponible ahora.</p>
                                <div class="buttons">
                                    <a href="Explorar.aspx" class="inline-block bg-amber-500 hover:bg-amber-600 text-white font-semibold py-2 px-6 rounded-lg transition duration-200">Explorar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="swiper-slide h-full bg-cover bg-center" style="background-image: url('Content/assets/images/slide-02.jpg')">
                <div class="container h-full flex items-center">
                    <div class="row w-full">
                        <div class="col-12 col-lg-8">
                            <div class="header-text text-white p-4 rounded-lg bg-black/30 backdrop-blur-sm">
                                <h2 class="text-3xl md:text-5xl font-bold mb-3">
                                    Registrate ahora <em class="text-emerald-400 not-italic">gratis</em><br>
                                    &amp; recibí <em class="text-emerald-400 not-italic">ofertas imperdibles</em>
                                </h2>
                                <div class="w-16 h-1 bg-emerald-400 my-4"></div>
                                <p class="text-base md:text-lg mb-6">No te pierdas los mejores precios antes que nadie. ¡Solo para clientes!</p>
                                <div class="buttons">
                                    <a href="Login.aspx" class="inline-block bg-emerald-500 hover:bg-emerald-600 text-white font-semibold py-2 px-6 rounded-lg transition duration-200">Ingresar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="swiper-slide h-full bg-cover bg-center" style="background-image: url('Content/assets/images/slide2.png')">
                <div class="container h-full flex items-center">
                    <div class="row w-full">
                        <div class="col-12 col-lg-8">
                            <div class="header-text text-white p-4 rounded-lg bg-black/30 backdrop-blur-sm">
                                <h2 class="text-3xl md:text-5xl font-bold mb-3">
                                    Comprá con <em class="text-amber-400 not-italic">garantía oficial</em><br>
                                    &amp; cuotas <em class="text-amber-400 not-italic">sin interés</em>
                                </h2>
                                <div class="w-16 h-1 bg-amber-400 my-4"></div>
                                <p class="text-base md:text-lg mb-6">Elegí con confianza: todos nuestros productos están garantizados y en 6 cuotas sin recargo.</p>
                                <div class="buttons flex gap-3">
                                    <a href="#" class="inline-block bg-emerald-500 hover:bg-emerald-600 text-white font-semibold py-2 px-6 rounded-lg transition duration-200">Descubrir Más</a>
                                    <a href="#" class="inline-block bg-amber-500 hover:bg-amber-600 text-white font-semibold py-2 px-6 rounded-lg transition duration-200">Contacto</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- Controles Swiper -->
        <div class="swiper-button-next !text-white"></div>
        <div class="swiper-button-prev !text-white"></div>
    </div>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Sección 1: Celulares -->
    <h2 class="text-2xl md:text-3xl font-bold mb-6 border-b pb-2 text-gray-800">
        Nuestros celulares
    </h2>

    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6 mb-12">
        <% 
            foreach (Dominio.Articulo item in ListaCelulares)
            {
                string imagenUrl = string.IsNullOrEmpty(item.ImagenUrl) ? "Img/NoDisponible.jpg" : item.ImagenUrl;
                if (!imagenUrl.StartsWith("https"))
                {
                    imagenUrl = "Img/NoDisponible.jpg";
                }
        %>
        <a href='DetalleArticulo.aspx?id=<%: item.Id %>' class="group no-underline text-inherit block">
            <div class="h-full bg-white rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition-all duration-300 overflow-hidden flex flex-col group-hover:-translate-y-1">
                <div class="w-full h-48 bg-gray-50 flex items-center justify-center p-4">
                    <img src="<%: imagenUrl %>" alt="<%: item.Nombre %>" class="max-h-full max-w-full object-contain" />
                </div>
                <div class="p-5 flex flex-col flex-grow justify-between">
                    <h5 class="text-base font-semibold text-gray-800 group-hover:text-amber-600 transition duration-200 line-clamp-2 mb-2"><%: item.Nombre %></h5>
                    <p class="text-lg font-bold text-gray-900">
                        $<%: item.Precio.ToString("N2", new System.Globalization.CultureInfo("es-AR")) %>
                    </p>
                </div>
            </div>
        </a>
        <% } %>
    </div>


    <!-- Sección 2: Productos destacados -->
    <h2 class="text-2xl md:text-3xl font-bold mb-6 border-b pb-2 text-gray-800">
        Otros de nuestros productos
    </h2>

    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6 mb-12">
        <asp:Repeater ID="RepExplorar" runat="server">
            <ItemTemplate>
                <a href='DetalleArticulo.aspx?id=<%# Eval("Id") %>' class="group no-underline text-inherit block">
                    <div class="h-full bg-white rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition-all duration-300 overflow-hidden flex flex-col group-hover:-translate-y-1">
                        <div class="w-full h-48 bg-gray-50 flex items-center justify-center p-4">
                            <img src='<%# ObtenerUrlImagen(Eval("ImagenUrl")) %>' alt='<%# Eval("Nombre") %>' class="max-h-full max-w-full object-contain" />
                        </div>
                        <div class="p-5 flex flex-col flex-grow justify-between">
                            <h5 class="text-base font-semibold text-gray-800 group-hover:text-amber-600 transition duration-200 line-clamp-2 mb-2"><%# Eval("Nombre") %></h5>
                            <div>
                                <%# 
                                Eval("PrecioDescuento") != DBNull.Value 
                                && Eval("PrecioDescuento") != null 
                                && Convert.ToDecimal(Eval("PrecioDescuento")) < Convert.ToDecimal(Eval("Precio")) 
                                ? "<div class='flex items-center gap-2 mb-1'><span class='bg-emerald-100 text-emerald-700 text-xs font-bold px-2 py-0.5 rounded'>-" 
                                    + Math.Round((1 - (Convert.ToDecimal(Eval("PrecioDescuento")) / Convert.ToDecimal(Eval("Precio")))) * 100) + "%</span>"
                                    + "<span class='line-through text-gray-400 text-sm'>$" 
                                    + Convert.ToDecimal(Eval("Precio")).ToString("N2", new System.Globalization.CultureInfo("es-AR")) + "</span></div>"
                                    + "<span class='text-lg font-bold text-gray-900'>$"    
                                    + Convert.ToDecimal(Eval("PrecioDescuento")).ToString("N2", new System.Globalization.CultureInfo("es-AR")) + "</span>"
                                : "<span class='text-lg font-bold text-gray-900'>$" 
                                    + Convert.ToDecimal(Eval("Precio")).ToString("N2", new System.Globalization.CultureInfo("es-AR")) + "</span>"
                                %>
                            </div>
                        </div>
                    </div>
                </a>
            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>