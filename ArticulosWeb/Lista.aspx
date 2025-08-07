<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lista.aspx.cs" Inherits="ArticulosWeb.Lista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Lista de Articulos</h1>
    <div class="col-6">
        <div class="mb-3">
            <asp:Label ID="Filtrar" runat="server" Text="Buscar" />
            <asp:TextBox ID="txtFiltro" runat="server" AutoPostBack="true" OnTextChanged="Filtro_TextChanged" CssClass="" />
        </div>
    </div>
    <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end;">
        <div class="mb-3">
            <asp:CheckBox Text="Filtro Avanzado"
                CssClass="" ID="chkAvanzado" runat="server"
                AutoPostBack="true"
                OnCheckedChanged="chkAvanzado_CheckedChanged" />
        </div>
    </div>
    <!-- filtro avanzado -->
    <asp:Panel ID="pnlFiltroAvanzado" runat="server" DefaultButton="btnBuscar" Visible="false">
        <div class="row">
            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Campo" ID="lblCampo" runat="server" />
                    <asp:DropDownList runat="server" AutoPostBack="true" CssClass="form-control" ID="ddlCampo" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                        <asp:ListItem Text="Precio" />
                        <asp:ListItem Text="Nombre" />
                        <asp:ListItem Text="Descripcion" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Criterio" runat="server" />
                    <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Filtro" runat="server" />
                    <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-3">
                <div class="mb-3">
                    <asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary" ID="btnBuscar" OnClick="btnBuscar_Click" />
                </div>
            </div>
        </div>
    </asp:Panel>


    <style>
        .pagination a, .pagination span {
            display: inline-block;
            padding: .5rem .75rem;
            margin-left: -1px;
            line-height: 1.25;
            color: #007bff;
            background-color: #fff;
            border: 1px solid #dee2e6;
            text-decoration: none;
        }

        .pagination span {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }

        .pagination {
            justify-content: flex-start !important;
            margin-left: 0 !important;
            display: flex;
            list-style: none;
            padding-left: 0;
        }

        #dgvLista .pagination {
            justify-content: center !important;
        }
    </style>

    <!-- dgv dentro del UpdatePanel -->
    <asp:GridView ID="dgvLista" runat="server" DataKeyNames="Id"
        CssClass="table"
        AutoGenerateColumns="false"
        AllowPaging="True"
        PageSize="5"
        PagerStyle-CssClass="pagination"
        PagerStyle-HorizontalAlign="Center"
        OnSelectedIndexChanged="DgvLista_SelectedIndexChanged"
        OnPageIndexChanging="DgvLista_PageIndexChanging">
        <Columns>
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Categoria" DataField="Categoria.Descripcion" />
            <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
            <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:C}" />
            <asp:TemplateField HeaderText="Descuento">
                <ItemTemplate>
                    <%# Eval("DescuentoPorcentaje") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Precio final">
                <ItemTemplate>
                    <%# 
            Eval("PrecioDescuento") != DBNull.Value && Eval("PrecioDescuento") != null
            ? string.Format(System.Globalization.CultureInfo.GetCultureInfo("es-AR"), "{0:C}", Eval("PrecioDescuento"))
            : string.Format(System.Globalization.CultureInfo.GetCultureInfo("es-AR"), "{0:C}", Eval("Precio"))
                    %>
                </ItemTemplate>
            </asp:TemplateField>


            <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="✍️" />
        </Columns>
    </asp:GridView>


    <a href="FormularioArticulo.aspx" class="btn btn-primary">Agregar</a>


</asp:Content>

