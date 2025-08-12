using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web;

namespace ArticulosWeb
{
    public partial class Carrito : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MostrarCarrito();
            }
        }

        private void MostrarCarrito()
        {
            var carrito = Session["Carrito"] as List<ItemCarrito>;

            if (carrito == null || carrito.Count == 0)
            {
                pnlCarritoVacio.Visible = true;
                pnlCarritoLleno.Visible = false;
            }
            else
            {
                pnlCarritoVacio.Visible = false;
                pnlCarritoLleno.Visible = true;

                rptCarrito.DataSource = carrito;
                rptCarrito.DataBind();
            }
        }

        // Método estático para agregar un producto (lo llamaremos por AJAX)
        [System.Web.Services.WebMethod]
        public static int AgregarAlCarrito(int id, string nombre, decimal precio, int cantidad)
        {
            var carrito = HttpContext.Current.Session["Carrito"] as List<ItemCarrito> ?? new List<ItemCarrito>();

            var existente = carrito.Find(p => p.Id == id);
            if (existente != null)
                existente.Cantidad += cantidad;
            else
                carrito.Add(new ItemCarrito { Id = id, Nombre = nombre, Precio = precio, Cantidad = cantidad });

            HttpContext.Current.Session["Carrito"] = carrito;

            return carrito.Count; // Devuelve el total de productos distintos
        }
    }

    public class ItemCarrito
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public decimal Precio { get; set; }
        public int Cantidad { get; set; }
    }
}
