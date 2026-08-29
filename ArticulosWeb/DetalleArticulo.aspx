<%@ Page Title="Detalle del Producto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleArticulo.aspx.cs" Inherits="ArticulosWeb.DetalleArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .product-main-img {
            max-height: 420px;
            object-fit: contain;
            width: 100%;
        }

        .relacionados-img {
            height: 180px;
            object-fit: contain;
            width: 100%;
            padding: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-4">

        <!-- Tarjeta Principal del Producto -->
        <div class="bg-white rounded-3xl shadow-sm border border-gray-100 p-6 p-md-8 mb-5">
            <div class="row g-4 align-items-center">

                <!-- Imagen Principal -->
                <div class="col-12 col-md-6 text-center bg-gray-50 rounded-2xl p-4 flex items-center justify-center">
                    <img src="<%: ObtenerUrlImagen(ArticuloDetalle.ImagenUrl) %>"
                        class="img-fluid product-main-img"
                        alt="<%: ArticuloDetalle.Nombre %>" />
                </div>

                <!-- Información de Venta -->
                <div class="col-12 col-md-6 flex flex-col justify-between">
                    <div>
                        <span class="text-xs uppercase font-bold tracking-wider text-gray-400 mb-2 block">
                            <%: ArticuloDetalle.Marca != null ? ArticuloDetalle.Marca.Descripcion : "Producto" %>
                        </span>

                        <h1 class="text-2xl md:text-3xl font-black text-gray-900 mb-3 leading-tight">
                            <%: ArticuloDetalle.Nombre %>
                        </h1>

                        <!-- Bloque de Precio -->
                        <div class="my-4">
                            <% if (ArticuloDetalle.PrecioDescuento != null && Convert.ToDecimal(ArticuloDetalle.PrecioDescuento) > 0 && Convert.ToDecimal(ArticuloDetalle.PrecioDescuento) < ArticuloDetalle.Precio) { %>
                            <div class="flex items-center gap-2 mb-1">
                                <span class="bg-emerald-500 text-white text-xs font-black px-2 py-0.5 rounded-md shadow-sm">-<%: Math.Round((1 - (Convert.ToDecimal(ArticuloDetalle.PrecioDescuento) / ArticuloDetalle.Precio)) * 100) %>% OFF
                                </span>
                                <span class="line-through text-gray-400 text-base font-medium">$<%: ArticuloDetalle.Precio.ToString("N2", new System.Globalization.CultureInfo("es-AR")) %>
                                </span>
                            </div>
                            <div class="text-3xl md:text-4xl font-black text-gray-900">
                                $<%: Convert.ToDecimal(ArticuloDetalle.PrecioDescuento).ToString("N2", new System.Globalization.CultureInfo("es-AR")) %>
                            </div>
                            <% }
                                else { %>
                            <div class="text-3xl md:text-4xl font-black text-gray-900">
                                $<%: ArticuloDetalle.Precio.ToString("N2", new System.Globalization.CultureInfo("es-AR")) %>
                            </div>
                            <% } %>
                        </div>

                        <div class="bg-blue-50/60 border border-blue-100 rounded-2xl p-4 mb-5 text-sm text-blue-900">
                            <div class="flex items-center gap-2 mb-1 font-semibold">
                                <span>💳 Hasta 6 cuotas sin interés</span>
                            </div>
                            <div class="flex items-center gap-2 text-gray-600">
                                <span>🛡️ Garantía oficial del fabricante</span>
                            </div>
                        </div>

                        <div class="mb-5">
                            <h6 class="text-xs font-bold text-gray-400 uppercase tracking-wider mb-2">Descripción</h6>
                            <p class="text-gray-600 leading-relaxed text-sm md:text-base">
                                <%: ArticuloDetalle.Descripcion %>
                            </p>
                        </div>
                    </div>

                    <!-- Formulario de Compra -->
                    <div class="border-t pt-4">
                        <div class="flex items-center gap-4 mb-4">
                            <label class="font-bold text-gray-700 text-sm">Cantidad:</label>
                            <asp:TextBox ID="txtCantidad" runat="server" TextMode="Number" Text="1" min="1" max="99"
                                CssClass="form-control text-center font-bold" Style="width: 80px; border-radius: 12px;" />
                            <asp:Label ID="lblStockDisponible" runat="server" CssClass="text-xs text-gray-500 font-medium" />
                        </div>

                        <asp:Button ID="btnComprar" runat="server"
                            CssClass="w-full py-3 px-6 rounded-full text-white font-bold bg-gradient-to-r from-blue-600 to-cyan-500 hover:from-blue-500 hover:to-cyan-400 transition-all duration-300 shadow-md transform hover:-translate-y-0.5 border-0 cursor-pointer"
                            Text="Agregar al Carrito" OnClick="btnComprar_Click" />
                    </div>

                </div>
            </div>
        </div>

        <!-- Sección Productos Relacionados -->
        <div class="mt-8">
            <h3 class="text-xl md:text-2xl font-bold mb-6 text-gray-800 border-b pb-2">Productos relacionados
            </h3>

            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
                </HeaderTemplate>
                <ItemTemplate>
                    <a href='DetalleArticulo.aspx?id=<%# Eval("Id") %>' class="group no-underline text-inherit block">
                        <div class="h-full bg-white rounded-3xl shadow-sm border border-gray-100 hover:shadow-xl transition-all duration-300 overflow-hidden flex flex-col group-hover:-translate-y-1">
                            <div class="w-full bg-gray-50 flex items-center justify-center p-2">
                                <img src='<%# ObtenerUrlImagen(Eval("ImagenUrl")) %>' alt='<%# Eval("Nombre") %>' class="relacionados-img" />
                            </div>
                            <div class="p-4 flex flex-col flex-grow justify-between">
                                <h5 class="text-sm font-semibold text-gray-800 group-hover:text-cyan-600 transition duration-200 line-clamp-2 mb-2">
                                    <%# Eval("Nombre") %>
                                </h5>
                                <p class="text-lg font-black text-gray-900">
                                    $<%# Convert.ToDecimal(Eval("Precio")).ToString("N2", new System.Globalization.CultureInfo("es-AR")) %>
                                </p>
                            </div>
                        </div>
                    </a>
                </ItemTemplate>
                <FooterTemplate>
                    <%-- Si no hay ítems en el Repeater, mostramos este bloque automáticamente --%>
                    <% if (rptRelacionados.Items.Count == 0)
                        { %>
                    <div class="col-span-full bg-gray-50 border border-dashed border-gray-300 rounded-3xl p-8 text-center max-w-lg mx-auto my-4 w-100">
                        <p class="text-gray-500 font-medium mb-4">No hay más productos relacionados en esta categoría por el momento.</p>
                        <a href="Explorar.aspx" class="inline-flex items-center justify-center gap-2 bg-gray-900 hover:bg-black text-white font-bold py-3 px-6 rounded-full transition-all duration-200 text-sm no-underline shadow-sm">🔍 Explorar otros productos
                        </a>
                    </div>
                    <% } %>
            </div>
                </FooterTemplate>
            </asp:Repeater>
        </div>
        <!-- Lista de Relacionados -->
        <asp:Repeater ID="rptRelacionados" runat="server">
            <HeaderTemplate>
                <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
            </HeaderTemplate>
            <ItemTemplate>
                <a href='DetalleArticulo.aspx?id=<%# Eval("Id") %>' class="group no-underline text-inherit block">
                    <div class="h-full bg-white rounded-3xl shadow-sm border border-gray-100 hover:shadow-xl transition-all duration-300 overflow-hidden flex flex-col group-hover:-translate-y-1">
                        <div class="w-full bg-gray-50 flex items-center justify-center p-2">
                            <img src='<%# ObtenerUrlImagen(Eval("ImagenUrl")) %>' alt='<%# Eval("Nombre") %>' class="relacionados-img" />
                        </div>
                        <div class="p-4 flex flex-col flex-grow justify-between">
                            <h5 class="text-sm font-semibold text-gray-800 group-hover:text-cyan-600 transition duration-200 line-clamp-2 mb-2">
                                <%# Eval("Nombre") %>
                            </h5>
                            <p class="text-lg font-black text-gray-900">
                                $<%# Convert.ToDecimal(Eval("Precio")).ToString("N2", new System.Globalization.CultureInfo("es-AR")) %>
                            </p>
                        </div>
                    </div>
                </a>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>

        <!-- Card cuando NO hay productos relacionados -->
        <asp:Panel ID="pnlSinRelacionados" runat="server" Visible="false">
            <div class="bg-gray-50 border border-dashed border-gray-300 rounded-3xl p-8 text-center max-w-lg mx-auto my-6">
                <p class="text-gray-500 font-medium mb-4">No hay más productos en esta categoría por el momento.</p>
                <a href="Explorar.aspx" class="inline-flex items-center justify-center gap-2 bg-gray-900 hover:bg-black text-white font-bold py-3 px-6 rounded-full transition-all duration-200 text-sm no-underline shadow-sm">🔍 Explorar otros productos
                </a>
            </div>
        </asp:Panel>
    </div>

    </div>
</asp:Content>
