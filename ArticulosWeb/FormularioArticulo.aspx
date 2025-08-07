<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioArticulo.aspx.cs" Inherits="ArticulosWeb.FormularioArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="max-w-6xl mx-auto px-4 py-8 bg-white shadow-lg rounded-2xl">
        <h1 class="text-2xl font-bold mb-6 text-gray-800">Formulario de Artículo</h1>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">

            <!-- Formulario izquierdo -->
            <div class="space-y-4">
                <div>
                    <label for="txtNombre" class="block text-sm font-medium text-gray-700">Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="mt-1 block w-full px-4 py-2 border rounded-md shadow-sm focus:ring focus:ring-indigo-200" />
                </div>

                <div>
                    <label for="txtCodigo" class="block text-sm font-medium text-gray-700">Código</label>
                    <asp:TextBox runat="server" ID="txtCodigo" CssClass="mt-1 block w-full px-4 py-2 border rounded-md shadow-sm focus:ring focus:ring-indigo-200" />
                </div>

                <div>
                    <label for="ddlMarca" class="block text-sm font-medium text-gray-700">Marca</label>
                    <asp:DropDownList ID="ddlMarca" runat="server" CssClass="mt-1 block w-full px-4 py-2 border rounded-md shadow-sm focus:ring focus:ring-indigo-200 bg-white" />
                </div>

                <div>
                    <label for="ddlCategoria" class="block text-sm font-medium text-gray-700">Categoría</label>
                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="mt-1 block w-full px-4 py-2 border rounded-md shadow-sm focus:ring focus:ring-indigo-200 bg-white" />
                </div>

                <div>
                    <label for="txtPrecio" class="block text-sm font-medium text-gray-700">Precio</label>
                    <asp:TextBox runat="server" ID="txtPrecio" CssClass="mt-1 block w-full px-4 py-2 border rounded-md shadow-sm focus:ring focus:ring-indigo-200" />
                </div>

                <div>
                    <label for="txtPrecioDescuento" class="block text-sm font-medium text-gray-700">Precio con descuento (opcional)</label>
                    <asp:TextBox runat="server" ID="txtPrecioDescuento" CssClass="mt-1 block w-full px-4 py-2 border rounded-md shadow-sm focus:ring focus:ring-indigo-200" />
                </div>
            </div>

            <!-- Columna derecha: descripción e imagen -->
            <div class="space-y-4">
                <div>
                    <label for="txtDescripcion" class="block text-sm font-medium text-gray-700">Descripción</label>
                    <asp:TextBox runat="server" ID="txtDescripcion" TextMode="MultiLine" Rows="4" CssClass="mt-1 block w-full px-4 py-2 border rounded-md shadow-sm focus:ring focus:ring-indigo-200" />
                </div>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div>
                            <label for="txtImagenUrl" class="block text-sm font-medium text-gray-700">Link de imagen</label>
                            <asp:TextBox ID="txtImagenUrl" CssClass="mt-1 block w-full px-4 py-2 border rounded-md shadow-sm focus:ring focus:ring-indigo-200" runat="server" AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" />
                        </div>
                        <div class="mt-4">
                            <asp:Image ID="imgArticulo" runat="server" ImageUrl="Img/Foto.png" CssClass="w-full h-64 object-contain border rounded-md bg-gray-100" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

        <!-- Botones -->
        <div class="mt-8 flex flex-wrap gap-4">
            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="px-6 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-md shadow" OnClick="btnAceptar_Click" />
            <a href="Lista.aspx" class="px-6 py-2 bg-gray-400 hover:bg-gray-500 text-white rounded-md shadow">Cancelar</a>
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" CssClass="px-6 py-2 bg-red-600 hover:bg-red-700 text-white rounded-md shadow" />
        </div>

        <!-- Mensaje de error -->
        <div class="mt-4">
            <asp:Label ID="lblError" runat="server" ForeColor="Red" CssClass="text-red-600 text-sm font-semibold" />
        </div>

        <!-- Confirmación de eliminación -->
        <% if (ConfirmarEliminacion) { %>
            <div class="mt-6 flex items-center gap-4">
                <asp:CheckBox ID="chkConfirmaEliminacion" runat="server" Text="Confirmar eliminación" CssClass="text-sm text-gray-700" />
                <asp:Button ID="btnConfirmacionEliminacion" OnClick="btnConfirmacionEliminacion_Click" runat="server" Text="Eliminar" CssClass="px-6 py-2 bg-red-100 hover:bg-red-200 text-red-700 border border-red-400 rounded-md shadow" />
            </div>
        <% } %>
    </div>
</asp:Content>
