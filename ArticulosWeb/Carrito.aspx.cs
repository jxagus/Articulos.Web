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
            var carrito = Session["Carrito"] as List<Articulo>; // tu lista de artículos

            if (carrito != null && carrito.Count > 0)
            {
                rptCarrito.DataSource = carrito;
                rptCarrito.DataBind();

                rptCarrito.Visible = true;
                pnlCarritoVacio.Visible = false;

                // Total: si usás precio con descuento lo prioriza
                decimal total = carrito.Sum(x => x.PrecioConDescuento > 0 ? x.PrecioConDescuento : x.Precio);
                lblTotal.Text = "Total: $" + total.ToString("N2");
            }
            else
            {
                rptCarrito.Visible = false;
                pnlCarritoVacio.Visible = true;
                lblTotal.Text = "";
            }
        }


        private List<Articulo> ObtenerCarrito()
        {
            // ⚠️ Este método es solo un placeholder.
            // Acá deberías traer el carrito real de tu lógica
            // por ejemplo desde la BD, Session, o lo que ya usás.
            return new List<Articulo>();
        }
    }
}
