<%@ Page Title="Preguntas Frecuentes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Preguntas.aspx.cs" Inherits="ArticulosWeb.Preguntas" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div class="container" style="max-width: 800px; margin-top: 30px;">
            <h2 id="title" class="text-center mb-4"><%: Title %></h2>

            <!-- Acordeón -->
            <div class="accordion accordion-flush mb-5" id="accordionFlushExample">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                            ¿Cómo comprar?
                        </button>
                    </h2>
                    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne"
                        data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                            <h6>Temporalmente esta deshabilitada esta opcion</h6>Para realizar una compra debe dirigirse a la sección de "Explorar" o desde el mismo "Inicio", seleccionar el producto deseado
                        y presionar en "Agregar al carrito".
                        Luego, desde el ícono del carrito podrá finalizar la compra. 
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                            ¿Qué formas de pago aceptan?
                        </button>
                    </h2>
                    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo"
                        data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                            Aceptamos pagos con tarjetas de débito, crédito, Mercado Pago y transferencias bancarias.
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                            ¿Realizan envíos?
                        </button>
                    </h2>
                    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree"
                        data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                            Sí, realizamos envíos a todo el país a través de Correo Argentino y Andreani.
                        </div>
                    </div>
                </div>
            </div>

            <!-- Formulario de contacto -->
            <div class="contact-form mb-5">
                <h5 class="text-center mb-3">Si desea hacer una pregunta en particular, puede escribirnos a soporte técnico</h5>

                <div class="mb-3">
                    <label for="txtEmail" class="form-label">Escriba su email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="name@example.com" TextMode="Email"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label class="form-label">Asunto</label>
                    <asp:TextBox runat="server" ID="txtAsunto" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label for="txtMensaje" class="form-label">Escriba un mensaje</label>
                    <asp:TextBox ID="txtMensaje" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                </div>

                <div class="mb-3 text-center">
                    <asp:Button ID="btnEnviar" runat="server" Text="Enviar" CssClass="btn btn-primary" OnClick="btnEnviar_Click" />
                    <asp:Label ID="lblEnviar" runat="server" Text="" CssClass="form-text text-success d-block mt-2"></asp:Label>
                </div>
            </div>
        </div>
    </main>

</asp:Content>
