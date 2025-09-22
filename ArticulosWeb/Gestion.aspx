<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gestion.aspx.cs" Inherits="ArticulosWeb.Gestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        // Seleccionar/deseleccionar todos los checkboxes
        function seleccionarTodosJs() {
            var checkboxes = document.querySelectorAll('[id$=chkSeleccionado]');
            var allChecked = true;

            // Verificar si ya están todos seleccionados
            for (var i = 0; i < checkboxes.length; i++) {
                if (!checkboxes[i].checked) {
                    allChecked = false;
                    break;
                }
            }

            // Si ya estaban todos seleccionados → desmarcar
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = !allChecked;
            }
        }
    </script>

    <!-- TinyMCE para el mensaje -->
    <script src="https://cdn.tiny.cloud/1/3haqc06nbbet87r9z4vz1onrrkfg1kdemtsqhr2r33dxo9zc/tinymce/8/tinymce.min.js" referrerpolicy="origin" crossorigin="anonymous"></script>
    <script>
        tinymce.init({
            selector: 'textarea',
            plugins: [
                'anchor', 'autolink', 'charmap', 'codesample', 'emoticons',
                'image', 'link', 'lists', 'media', 'searchreplace', 'table',
                'visualblocks', 'wordcount', 'checklist', 'mediaembed',
                'casechange', 'formatpainter', 'pageembed', 'a11ychecker',
                'tinymcespellchecker', 'permanentpen', 'powerpaste',
                'advtable', 'advcode', 'editimage', 'advtemplate',
                'mentions', 'tinycomments', 'tableofcontents',
                'footnotes', 'mergetags', 'autocorrect', 'typography',
                'markdown', 'importword', 'exportword', 'exportpdf'
            ],
            toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline | link image media table | align lineheight | checklist numlist bullist indent outdent | removeformat',
            tinycomments_mode: 'embedded',
            fixed_toolbar_container: 'body'
        });
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .tox { z-index: 9999 !important; position: relative; }
        body { overflow: visible !important; }

        .dashboard {
            display: flex; gap: 20px; justify-content: center;
            margin: 40px 0; flex-wrap: wrap;
        }
        .card {
