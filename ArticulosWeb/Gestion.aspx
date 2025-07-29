<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gestion.aspx.cs" Inherits="ArticulosWeb.Gestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function seleccionarTodos(source) {
            var checkboxes = document.querySelectorAll('[id$=chkSeleccionado]');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = source.checked;
            }
        }
    </script>

    <!-- Place the first <script> tag in your HTML's <head> -->
    <script src="https://cdn.tiny.cloud/1/3haqc06nbbet87r9z4vz1onrrkfg1kdemtsqhr2r33dxo9zc/tinymce/8/tinymce.min.js" referrerpolicy="origin" crossorigin="anonymous"></script>

    <!-- Place the following <script> and <textarea> tags your HTML's <body> -->
    <script>
        tinymce.init({
            selector: 'textarea',
            plugins: [
                // Core editing features
                'anchor', 'autolink', 'charmap', 'codesample', 'emoticons', 'image', 'link', 'lists', 'media', 'searchreplace', 'table', 'visualblocks', 'wordcount',
                // Your account includes a free trial of TinyMCE premium features
                // Try the most popular premium features until Aug 8, 2025:
                'checklist', 'mediaembed', 'casechange', 'formatpainter', 'pageembed', 'a11ychecker', 'tinymcespellchecker', 'permanentpen', 'powerpaste', 'advtable', 'advcode', 'editimage', 'advtemplate', 'ai', 'mentions', 'tinycomments', 'tableofcontents', 'footnotes', 'mergetags', 'autocorrect', 'typography', 'inlinecss', 'markdown', 'importword', 'exportword', 'exportpdf'
            ],
            toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
            tinycomments_mode: 'embedded',
            tinycomments_author: 'Author name',
            fixed_toolbar_container: 'body',
            mergetags_list: [
                { value: 'First.Name', title: 'First Name' },
                { value: 'Email', title: 'Email' },
            ],
            ai_request: (request, respondWith) => respondWith.string(() => Promise.reject('See docs to implement AI Assistant')),
        });
    </script>
</asp:Content>





<asp:Content ID="Content2" ContentPlaceHolderID="FullWidthContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Forzar z-index y overflow */
        .tox {
            z-index: 9999 !important;
            position: relative;
        }

        body {
            overflow: visible !important;
        }
        /*estilos para los botones taiwincss*/
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
