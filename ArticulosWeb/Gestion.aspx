<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gestion.aspx.cs" Inherits="ArticulosWeb.Gestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Checkbox "Seleccionar todos" -->
    <script>
        function seleccionarTodos(source) {
            var checkboxes = document.querySelectorAll('[id$=chkSeleccionado]');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = source.checked;
            }
        }
    </script>

    <!-- CKEditor full con subida de imágenes habilitada -->
    <script src="https://cdn.ckeditor.com/4.25.1-lts/full/ckeditor.js"></script>
    <script>
        window.onload = function () {
            CKEDITOR.replace('<%= txtMensaje.ClientID %>', {
                extraPlugins: 'uploadimage,image2',
                removePlugins: 'image',
                height: 300,
                filebrowserUploadUrl: 'SubirImagen.ashx',  // Handler para guardar la imagen
                filebrowserUploadMethod: 'form'
            });
        };
    </script>
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="FullWidthContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .dashboard {
            display: flex;
            gap: 20px;
            justify-content: center;
            margin: 40px 0;
            flex-wrap: wrap;
        }

        .card {
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            padding: 30px;
            width: 250px;
            text-align: center;
            transition: transform 0.2s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-title {
            font-size: 18px;
            color: #555;
            margin-bottom: 10px;
        }

        .card-value {
            font-size: 36px;
            font-weight: bold;
            color: #333;
        }

        .textarea-box {
            width: 100%;
            max-width: 800px;
            margin: 40px auto;
        }
    </style>

    <div class="container" style="max-width: 800px; margin-top: 30px;">
        <h2 id="title" class="text-center mb-4">Bienvenido Admin</h2>
    </div>

    <div class="dashboard">
        <div class="card">
            <div class="card-title">👤 Usuarios registrados</div>
            <div class="card-value">
                <asp:Label ID="lblUsuarios" runat="server" Text="0" />
            </div>
        </div>

        <div class="card">
            <div class="card-title">📦 Artículos publicados</div>
            <div class="card-value">
                <asp:Label ID="lblArticulos" runat="server" Text="0" />
            </div>
        </div>
    </div>

    <asp:GridView ID="dgvLista" runat="server" DataKeyNames="Id"
        CssClass="table-auto w-full border border-gray-300 mb-6"
        AutoGenerateColumns="false"
        AllowPaging="True"
        PageSize="5"
        PagerStyle-CssClass="pagination"
        PagerStyle-HorizontalAlign="Center"
        OnSelectedIndexChanged="DgvLista_SelectedIndexChanged"
        OnPageIndexChanging="DgvLista_PageIndexChanging">
         <Columns>
            <asp:TemplateField HeaderText='<input type="checkbox" onclick="seleccionarTodos(this)" />'>
                <ItemTemplate>
                    <asp:CheckBox ID="chkSeleccionado" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField HeaderText="Email" DataField="Email" />
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
            <asp:BoundField HeaderText="Admin" DataField="Admin" />
            <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText="✍️" />
        </Columns>
    </asp:GridView>

    <div class="textarea-box">
        <label for="txtMensaje" class="block text-gray-700 font-semibold mb-2">Mensaje para los usuarios seleccionados:</label>
        <asp:TextBox ID="txtMensaje" runat="server" TextMode="MultiLine" CssClass="w-full border border-gray-300 p-3 rounded-lg h-40" />
        <asp:Button ID="btnEnviar" runat="server" Text="Enviar mensaje"
            CssClass="mt-4 bg-blue-600 text-white px-5 py-2 rounded hover:bg-blue-700 transition"
            OnClick="btnEnviar_Click" />
    </div>

    <a href="FormularioArticulo.aspx" class="btn bg-green-600 text-white px-4 py-2 rounded mt-4 hover:bg-green-700 block text-center w-40 mx-auto">Agregar artículo</a>
</asp:Content>
