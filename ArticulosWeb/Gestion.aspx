<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gestion.aspx.cs" Inherits="ArticulosWeb.Gestion" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión de Usuarios</title>
    <style>
        .contador {
            font-weight: bold;
            color: darkblue;
        }
        .seleccion {
            margin-top: 10px;
            font-style: italic;
            color: green;
        }
    </style>
    <script type="text/javascript">
        function toggleSelectAll(source) {
            var checkboxes = document.querySelectorAll("[id*='chkSeleccionado']");
            checkboxes.forEach(function (chk) {
                chk.checked = source.checked;
            });
            updateSeleccionLabel();
        }

        function updateSeleccionLabel() {
            var checkboxes = document.querySelectorAll("[id*='chkSeleccionado']");
            var total = checkboxes.length;
            var seleccionados = 0;

            checkboxes.forEach(function (chk) {
                if (chk.checked) seleccionados++;
            });

            var lbl = document.getElementById("<%= lblSeleccion.ClientID %>");
            if (seleccionados === total && total > 0) {
                lbl.innerText = "✅ Todos los usuarios están seleccionados.";
            } else if (seleccionados > 0) {
                lbl.innerText = "⚠ " + seleccionados + " usuario(s) seleccionado(s).";
            } else {
                lbl.innerText = "❌ Ningún usuario seleccionado.";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Gestión de Usuarios</h2>

            <p class="contador">Usuarios registrados: <asp:Label ID="lblUsuarios" runat="server" Text="0"></asp:Label></p>
            <p class="contador">Artículos registrados: <asp:Label ID="lblArticulos" runat="server" Text="0"></asp:Label></p>

            <asp:GridView ID="dgvLista" runat="server" AutoGenerateColumns="false" CssClass="table"
                DataKeyNames="Id" AllowPaging="true" PageSize="5"
                OnPageIndexChanging="DgvLista_PageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="Seleccionar">
                        <HeaderTemplate>
                            <asp:CheckBox ID="chkSelectAll" runat="server" onclick="toggleSelectAll(this)" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSeleccionado" runat="server" onclick="updateSeleccionLabel()" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                </Columns>
            </asp:GridView>

            <asp:Button ID="btnEnviar" runat="server" Text="Enviar Mensaje" CssClass="btn btn-primary" OnClick="btnEnviar_Click" />
            <br />
            <asp:TextBox ID="txtMensaje" runat="server" TextMode="MultiLine" Rows="4" Columns="50" Placeholder="Escribí tu mensaje..."></asp:TextBox>
            <br />
            <asp:Label ID="lblSeleccion" runat="server" CssClass="seleccion" Text="❌ Ningún usuario seleccionado."></asp:Label>
        </div>
    </form>
</body>
</html>