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
            List<CarritoItem> carrito = Session["Carrito"] as List<CarritoItem>;
            if (carrito != null && carrito.Count > 0)
            {
                rptCarrito.DataSource = carrito;
                rptCarrito.DataBind();

                decimal total = carrito.Sum(x => x.Subtotal);
                lblTotal.Text = "Total: $" + total.ToString("N2");
            }
            else
            {
                //pnlCarritoVacio.Visible = false;
                lblTotal.Text = "El carrito está vacío.";
            }
        }
    }
}
