<div class="flex flex-col md:flex-row gap-6 p-6 bg-gray-100 min-h-screen">
    
    <!-- Carrito vacío -->
    <asp:Panel ID="pnlCarritoVacio" runat="server" Visible="false" CssClass="flex-1 bg-white rounded-lg shadow p-6 flex flex-col items-center justify-center">
        <img src="Img/cart-empty.svg" alt="Carrito vacío" class="w-16 h-16 mb-4" />
        <p class="text-gray-700 mb-4">Agregá productos para armar tu carrito</p>
        <a href="Default.aspx" class="px-6 py-2 border border-black rounded hover:bg-gray-50 font-medium">
            Continuar comprando
        </a>
    </asp:Panel>

    <!-- Carrito con productos -->
    <asp:Panel ID="pnlCarritoLleno" runat="server" Visible="false" CssClass="flex-1 bg-white rounded-lg shadow p-6">
        <asp:Repeater ID="rptCarrito" runat="server">
            <HeaderTemplate>
                <table class="w-full">
                    <thead>
                        <tr>
                            <th class="text-left">Producto</th>
                            <th>Cantidad</th>
                            <th>Precio</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("Nombre") %></td>
                    <td><%# Eval("Cantidad") %></td>
                    <td>$<%# Eval("Precio", "{0:N2}") %></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                    </tbody>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </asp:Panel>

    <!-- Resumen de compra -->
    <div class="w-full md:w-1/3 bg-white rounded-lg shadow p-6">
        <h3 class="text-lg font-semibold mb-2">Resumen de compra</h3>
        <p class="text-gray-400 text-sm">Acá verás los importes de tu compra una vez que agregues productos.</p>
    </div>
</div>

