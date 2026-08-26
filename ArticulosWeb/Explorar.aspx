<%@ Page Title="Explorar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Explorar.aspx.cs" Inherits="ArticulosWeb.Explorar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container py-5">

        <div class="d-flex flex-column flex-lg-row justify-content-between align-items-lg-center mb-5">

            <div>
                <h1 class="fw-bold mb-1">Todos los productos</h1>
                <p class="text-muted mb-0">Encontrá el producto ideal para vos.</p>
            </div>

            <div class="d-flex align-items-center mt-3 mt-lg-0">

                <label class="me-2 fw-semibold">Ordenar:</label>

                <asp:DropDownList
                    ID="ddlOrdenar"
                    runat="server"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="ddlOrdenar_SelectedIndexChanged"
                    CssClass="form-select">

                    <asp:ListItem Text="Más relevantes" Value="relevante" />
                    <asp:ListItem Text="Mayor precio" Value="mayor" />
                    <asp:ListItem Text="Menor precio" Value="menor" />

                </asp:DropDownList>

            </div>

        </div>

        <div class="row">

            <!-- Sidebar -->
            <aside class="col-lg-3 mb-4">
                <div class="bg-white rounded-4 shadow-sm p-4">

                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h5 class="fw-bold mb-0">Categorías</h5>

                        <!-- Botón de quitar filtro (solo visible al filtrar) -->
                        <asp:LinkButton
                            ID="btnQuitarFiltro"
                            runat="server"
                            OnClick="btnQuitarFiltro_Click"
                            Visible="false"
                            CssClass="badge rounded-pill bg-danger text-white text-decoration-none d-flex align-items-center gap-1 px-2 py-1"
                            ToolTip="Quitar filtro">
                <span>Filtro activo</span>
                <span class="fw-bold" style="font-size: 11px;">✕</span>
                        </asp:LinkButton>
                    </div>

                    <asp:Repeater ID="RepCategorias" runat="server" OnItemCommand="RepCategorias_ItemCommand">
                        <ItemTemplate>
                            <div class="d-flex justify-content-between border-bottom py-2 align-items-center">
                                <asp:LinkButton
                                    ID="btnFiltrarCat"
                                    runat="server"
                                    CommandName="FiltrarCategoria"
                                    CommandArgument='<%# Eval("Descripcion") %>'
                                    CssClass="text-decoration-none text-dark fw-semibold hover:text-primary">
                        <%# Eval("Descripcion") %>
                                </asp:LinkButton>

                                <span class="text-muted small">(<%# Eval("Cantidad") %>)
                                </span>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </aside>

            <!-- Productos -->

            <div class="col-lg-9">

                <div class="row g-4">

                    <asp:Repeater ID="RepExplorar" runat="server">

                        <ItemTemplate>

                            <div class="col-sm-6 col-xl-4">

                                <a href='DetalleArticulo.aspx?id=<%# Eval("Id") %>' class="product-link">

                                    <div class="product-card">

                                        <div class="product-image">

                                            <img src='<%# ObtenerUrlImagen(Eval("ImagenUrl")) %>' />

                                        </div>

                                        <div class="product-body">

                                            <h5 class="product-title">
                                                <%# Eval("Nombre") %>
                                            </h5>

                                            <p class="product-description">
                                                <%# Eval("Descripcion") %>
                                            </p>

                                            <%#
                                        Eval("PrecioDescuento") != DBNull.Value
                                        && Eval("PrecioDescuento") != null
                                        && Convert.ToDecimal(Eval("PrecioDescuento")) < Convert.ToDecimal(Eval("Precio"))

                                        ?

                                        "<div class='discount-badge'>"

                                        + Math.Round((1-(Convert.ToDecimal(Eval("PrecioDescuento"))/Convert.ToDecimal(Eval("Precio"))))*100)

                                        + "% OFF</div>"

                                        +

                                        "<div class='product-old-price'>$"

                                        + Convert.ToDecimal(Eval("Precio")).ToString("N2", new System.Globalization.CultureInfo("es-AR"))

                                        + "</div>"

                                        +

                                        "<div class='product-price'>$"

                                        + Convert.ToDecimal(Eval("PrecioDescuento")).ToString("N2", new System.Globalization.CultureInfo("es-AR"))

                                        + "</div>"

                                        :

                                        "<div class='product-price'>$"

                                        + Convert.ToDecimal(Eval("Precio")).ToString("N2", new System.Globalization.CultureInfo("es-AR"))

                                        + "</div>"

                                            %>
                                        </div>

                                    </div>

                                </a>

                            </div>

                        </ItemTemplate>

                    </asp:Repeater>

                </div>

            </div>

        </div>

    </div>

</asp:Content>
