<%@ Page Title="Explorar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Explorar.aspx.cs" Inherits="ArticulosWeb.Explorar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-bold">Todos los productos</h1>

        <div class="flex items-center gap-2">
            <label for="ddlOrdenar" class="font-medium">Ordenar por:</label>
            <asp:DropDownList ID="ddlOrdenar" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlOrdenar_SelectedIndexChanged" CssClass="border px-2 py-1 rounded">
                <asp:ListItem Text="Más relevantes" Value="relevante" />
                <asp:ListItem Text="Mayor precio" Value="mayor" />
                <asp:ListItem Text="Menor precio" Value="menor" />
            </asp:DropDownList>
        </div>
    </div>

    <div class="flex">
        <!-- Sidebar filtros -->
        <div class="w-1/4 pr-6">
            <h2 class="text-lg font-bold mb-4">Categorías</h2>
            <asp:Repeater ID="RepCategorias" runat="server">
                <ItemTemplate>
                    <div class="flex justify-between text-gray-700 mb-2">
                        <span><%# Eval("Descripcion") %></span>
                        <span>(<%# Eval("Cantidad") %>)</span>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- Cards productos -->
<div class="w-3/4 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
    <asp:Repeater ID="RepExplorar" runat="server">
        <ItemTemplate>
            <a href='DetalleArticulo.aspx?id=<%# Eval("Id") %>' class="no-underline text-black">
                <div class="bg-white rounded-2xl shadow-md hover:shadow-lg transition transform hover:-translate-y-1 overflow-hidden cursor-pointer h-full flex flex-col">
                    <img src='<%# ObtenerUrlImagen(Eval("ImagenUrl")) %>' alt="Imagen del artículo" 
                         class="w-full h-48 object-contain bg-gray-100" />
                    <div class="p-4 flex-grow flex flex-col justify-between">
                        <h5 class="text-lg font-semibold text-gray-900 mb-1"><%# Eval("Nombre") %></h5>
                        <p class="text-gray-500 text-sm mb-2"><%# Eval("Descripcion") %></p>

                        <%# 
                            Eval("PrecioDescuento") != DBNull.Value 
                            && Eval("PrecioDescuento") != null 
                            && Convert.ToDecimal(Eval("PrecioDescuento")) < Convert.ToDecimal(Eval("Precio")) 
                            ? "<span class='text-green-600 font-semibold'> -" 
                                + Math.Round((1 - (Convert.ToDecimal(Eval("PrecioDescuento")) / Convert.ToDecimal(Eval("Precio")))) * 100) + "%</span><br/>"
                                + "<span class='line-through text-gray-400 text-sm'>$" 
                                + Convert.ToDecimal(Eval("Precio")).ToString("N2", new System.Globalization.CultureInfo("es-AR")) + "</span><br/>"
                                + "<span class='text-gray-500 text-sm'>$" 
                                + Convert.ToDecimal(Eval("PrecioDescuento")).ToString("N2", new System.Globalization.CultureInfo("es-AR")) + "</span>"
                            : "<span class='text-gray-500 text-sm'>$" 
                                + Convert.ToDecimal(Eval("Precio")).ToString("N2", new System.Globalization.CultureInfo("es-AR")) + "</span>"
                        %>
                    </div>
                </div>
            </a>
        </ItemTemplate>
    </asp:Repeater>
</div>


    </div>
</asp:Content>
