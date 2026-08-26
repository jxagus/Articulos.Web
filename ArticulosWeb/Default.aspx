<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ArticulosWeb.Default" %>

<asp:Content ID="ContenidoFuera" ContentPlaceHolderID="OutsideContainer" runat="server">
    <style>
        /* Gradientes bitonales de texto con fallback garantizado */
        .gradient-text-blue {
            background: linear-gradient(135deg, #38bdf8 0%, #c084fc 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: inline-block;
        }
        .gradient-text-green {
            background: linear-gradient(135deg, #34d399 0%, #38bdf8 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: inline-block;
        }
        .gradient-text-purple {
            background: linear-gradient(135deg, #c084fc 0%, #f472b6 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: inline-block;
        }

        /* Botones estilo píldora con resplandor neón */
        .btn-glow-cyan {
            background: linear-gradient(90deg, #0284c7 0%, #06b6d4 100%);
            box-shadow: 0 0 15px rgba(6, 182, 212, 0.6);
            border-radius: 9999px;
        }
        .btn-glow-cyan:hover {
            box-shadow: 0 0 25px rgba(6, 182, 212, 0.9);
            transform: translateY(-2px);
        }

        .btn-glow-emerald {
            background: linear-gradient(90deg, #059669 0%, #10b981 100%);
            box-shadow: 0 0 15px rgba(16, 185, 129, 0.6);
            border-radius: 9999px;
        }
        .btn-glow-emerald:hover {
            box-shadow: 0 0 25px rgba(16, 185, 129, 0.9);
            transform: translateY(-2px);
        }

        .btn-glow-pink {
            background: linear-gradient(90deg, #c026d3 0%, #db2777 100%);
            box-shadow: 0 0 15px rgba(219, 39, 119, 0.6);
            border-radius: 9999px;
        }
        .btn-glow-pink:hover {
            box-shadow: 0 0 25px rgba(219, 39, 119, 0.9);
            transform: translateY(-2px);
        }

        /* Badge de descuento siempre activo */
        .badge-discount {
            background-color: #10b981;
            color: #ffffff;
            font-weight: 900;
            padding: 2px 8px;
            border-radius: 6px;
            display: inline-block;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
    </style>

    <!-- ***** Main Banner Area Start ***** -->
    <div class="swiper-container h-[60vh] w-full overflow-hidden relative" id="top">
        <div class="swiper-wrapper h-full">
            
            <!-- Slide 1 -->
            <div class="swiper-slide h-full bg-cover bg-center" style="background-image: url('Content/assets/images/slide1.png')">
                <div class="container h-full flex items-center">
                    <div class="row w-full">
                        <div class="col-12 col-lg-8">
                            <div class="header-text p-6 max-w-2xl">
                                <h2 class="text-4xl md:text-6xl font-black tracking-tight mb-4 gradient-text-blue">
                                    Descubrí el nuevo iPhone 16 <br />
                                    &amp; potencia sin límites
                                </h2>
                                <p class="text-gray-100 text-base md:text-lg mb-8 font-medium drop-shadow">
                                    Innovación, diseño y rendimiento al alcance de tu mano. Disponible ahora.
                                </p>
                                <div class="buttons">
                                    <a href="Explorar.aspx" class="inline-block px-8 py-3 text-white font-bold transition-all duration-300 btn-glow-cyan">
                                        Explorar
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Slide 2 -->
            <div class="swiper-slide h-full bg-cover bg-center" style="background-image: url('Content/assets/images/slide-02.jpg')">
                <div class="container h-full flex items-center">
                    <div class="row w-full">
                        <div class="col-12 col-lg-8">
                            <div class="header-text p-6 max-w-2xl">
                                <h2 class="text-4xl md:text-6xl font-black tracking-tight mb-4 gradient-text-green">
                                    Registrate ahora gratis <br />
                                    &amp; recibí ofertas imperdibles
                                </h2>
                                <p class="text-gray-100 text-base md:text-lg mb-8 font-medium drop-shadow">
                                    No te pierdas los mejores precios antes que nadie. ¡Exclusivo para clientes!
                                </p>
                                <div class="buttons">
                                    <a href="Login.aspx" class="inline-block px-8 py-3 text-white font-bold transition-all duration-300 btn-glow-emerald">
                                        Ingresar
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Slide 3 -->
            <div class="swiper-slide h-full bg-cover bg-center" style="background-image: url('Content/assets/images/slide2.png')">
                <div class="container h-full flex items-center">
                    <div class="row w-full">
                        <div class="col-12 col-lg-8">
                            <div class="header-text p-6 max-w-2xl">
                                <h2 class="text-4xl md:text-6xl font-black tracking-tight mb-4 gradient-text-purple">
                                    Comprá con garantía oficial <br />
                                    &amp; cuotas sin interés
                                </h2>
                                <p class="text-gray-100 text-base md:text-lg mb-8 font-medium drop-shadow">
                                    Elegí con confianza: todos nuestros productos están garantizados y en 6 cuotas sin recargo.
                                </p>
                                <div class="buttons flex gap-4">
                                    <a href="Explorar.aspx" class="inline-block px-8 py-3 text-white font-bold transition-all duration-300 btn-glow-pink">
                                        Ver Productos
                                    </a>
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
            <div class="h-full bg-white rounded-3xl shadow-sm border border-gray-100 hover:shadow-xl transition-all duration-300 overflow-hidden flex flex-col group-hover:-translate-y-1">
                <div class="w-full h-48 bg-gray-50 flex items-center justify-center p-4">
                    <img src="<%: imagenUrl %>" alt="<%: item.Nombre %>" class="max-h-full max-w-full object-contain" />
                </div>
                <div class="p-5 flex flex-col flex-grow justify-between">
                    <h5 class="text-base font-semibold text-gray-800 group-hover:text-cyan-600 transition duration-200 line-clamp-2 mb-2"><%: item.Nombre %></h5>
                    <p class="text-xl font-black text-gray-900">
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
                    <div class="h-full bg-white rounded-3xl shadow-sm border border-gray-100 hover:shadow-xl transition-all duration-300 overflow-hidden flex flex-col group-hover:-translate-y-1">
                        <div class="w-full h-48 bg-gray-50 flex items-center justify-center p-4">
                            <img src='<%# ObtenerUrlImagen(Eval("ImagenUrl")) %>' alt='<%# Eval("Nombre") %>' class="max-h-full max-w-full object-contain" />
                        </div>
                        <div class="p-5 flex flex-col flex-grow justify-between">
                            <h5 class="text-base font-semibold text-gray-800 group-hover:text-cyan-600 transition duration-200 line-clamp-2 mb-2"><%# Eval("Nombre") %></h5>
                            <div>
                                <%# 
                                Eval("PrecioDescuento") != DBNull.Value 
                                && Eval("PrecioDescuento") != null 
                                && Convert.ToDecimal(Eval("PrecioDescuento")) < Convert.ToDecimal(Eval("Precio")) 
                                ? "<div class='flex items-center gap-2 mb-1.5'>"
                                    + "<span class='badge-discount text-xs'>-" 
                                    + Math.Round((1 - (Convert.ToDecimal(Eval("PrecioDescuento")) / Convert.ToDecimal(Eval("Precio")))) * 100) + "%</span>"
                                    + "<span class='line-through text-gray-400 text-sm font-medium'>$" 
                                    + Convert.ToDecimal(Eval("Precio")).ToString("N2", new System.Globalization.CultureInfo("es-AR")) + "</span>"
                                    + "</div>"
                                    + "<span class='text-xl font-black text-gray-900'>$"    
                                    + Convert.ToDecimal(Eval("PrecioDescuento")).ToString("N2", new System.Globalization.CultureInfo("es-AR")) + "</span>"
                                : "<span class='text-xl font-black text-gray-900'>$" 
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