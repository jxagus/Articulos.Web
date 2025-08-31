using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ArticulosWeb
{
    public partial class Carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCarrito();
            }
        }

        private void CargarCarrito()
        {
            // Ejemplo: obtener carrito desde sesión
            var carrito = Session["Carrito"] as List<ItemCarrito>;

            if (carrito != null && carrito.Count > 0)
            {
                // Mostrar lista de productos
                rptCarrito.DataSource = carrito;
                rptCarrito.DataBind();

                rptCarrito.Visible = true;
                pnlCarritoVacio.Visible = false;

                // Calcular total
                decimal total = carrito.Sum(x => x.Subtotal);
                lblTotal.Text = "Total: $" + total.ToString("N2");
            }
            else
            {
                // Si está vacío
                rptCarrito.Visible = false;
                pnlCarritoVacio.Visible = true;
                lblTotal.Text = "";
            }
        }
    }
}
