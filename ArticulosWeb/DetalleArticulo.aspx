<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleArticulo.aspx.cs" Inherits="ArticulosWeb.DetalleArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FullWidthContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Detalle del articulo</h2>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-5">
                <img src="<%: ObtenerUrlImagen(ArticuloDetalle.ImagenUrl) %>"
                    class="img-fluid rounded border"
                    alt="Imagen del artículo" />
            </div>
            <div class="col-md-7">
                <h2 class="fw-bold text-dark"><%: ArticuloDetalle.Nombre %></h2>
                <h4 class="text-success mt-3">$<%: ArticuloDetalle.Precio.ToString("N2") %></h4>
                <hr />
                <h5 class="text-secondary">Descripción del producto</h5>
                <p><%: ArticuloDetalle.Descripcion %></p>


                <asp:Label ID="lblStockDisponible" runat="server" CssClass="text-muted" />
                <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control mt-2" TextMode="Number" Text="1"></asp:TextBox>
                <asp:Button ID="btnComprar" runat="server" CssClass="btn btn-success mt-3"
                    Text="Comprar" OnClick="btnComprar_Click" />

            </div>
        </div>
    </div>
    <!-- test relacionados -->
    <br />
    <h3>Articulos Relacionados</h3>
    <asp:Repeater ID="rptRelacionados" runat="server">
        <HeaderTemplate>
            <div class="grid grid-cols-4 gap-4">
        </HeaderTemplate>
        <ItemTemplate>
            <div class="border border-gray-300 rounded-lg p-4 text-center">
                <img src='<%# Eval("ImagenUrl") %>' alt='<%# Eval("Nombre") %>' class="w-full h-32 object-cover rounded" />
                <h4 class="mt-2 font-semibold text-lg"><%# Eval("Nombre") %></h4>
                <p class="text-green-600 font-bold mt-1">$<%# string.Format("{0:N2}", Eval("Precio")) %></p>
                <a href='DetalleArticulo.aspx?id=<%# Eval("Id") %>'
                    class="inline-block px-4 py-2 text-white bg-blue-600 rounded-lg hover:bg-blue-700 transition">Ver Detalles</a>
            </div>
        </ItemTemplate>
        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:Repeater>


</asp:Content>
