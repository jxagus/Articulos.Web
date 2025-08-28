using System;
using System.Collections.Generic;
using System.Linq;
using Dominio;
using NegocioArticulo;

namespace ArticulosWeb
{
    public partial class DetalleArticulo : System.Web.UI.Page
    {
        // Solo propiedad en memoria para el ciclo actual de la página (NO ViewState)
        public Articulo ArticuloDetalle { get; private set; }
        public List<Articulo> articulosRelacionados;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Siempre obtener el id y el artículo (postback y no postback)
            if (!int.TryParse(Request.QueryString["id"], out int id))
            {
                Response.Redirect("Default.aspx");
                return;
            }

            var negocio = new Negocio();
            var articulo = negocio.BuscarPorId(id);
            if (articulo == null)
            {
                Response.Redirect("Default.aspx");
                return;
            }

            ArticuloDetalle = articulo; // disponible para el .aspx y para el btnComprar_Click

            //Solo inicializaciones de UI en el primer load
            if (!IsPostBack)
            {
                lblStockDisponible.Text = $"Stock disponible: {articulo.Stock}";

                if (articulo.Stock == 0)
                {
                    txtCantidad.Text = "0";
                    txtCantidad.Enabled = false;
                    btnComprar.Enabled = false;
                    btnComprar.Text = "Sin stock";
                }
                else
                {
                    txtCantidad.Text = "1";
                    txtCantidad.Attributes["max"] = articulo.Stock.ToString();
                    txtCantidad.Attributes["min"] = "1";
                }

                // Relacionados (máx 4)
                var relacionados = negocio.listar()
                    .Where(a => a.Categoria.Id == articulo.Categoria.Id && a.Id != articulo.Id)
                    .Take(4)
                    .ToList();

                rptRelacionados.DataSource = relacionados;
                rptRelacionados.DataBind();
            }
        }

        public string ObtenerUrlImagen(object imagen)
        {
            string url = imagen?.ToString();
            if (string.IsNullOrEmpty(url) || !url.StartsWith("https"))
                return "Img/NoDisponible.jpg";
            return url;
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            // ArticuloDetalle ya está seteado en Page_Load (también en postback)
            if (ArticuloDetalle == null)
            {
                // Fallback por las dudas
                if (!int.TryParse(Request.QueryString["id"], out int id)) return;
                var negocio = new Negocio();
                ArticuloDetalle = negocio.BuscarPorId(id);
                if (ArticuloDetalle == null) return;
            }

            int cantidad = 1;
            int.TryParse(txtCantidad.Text, out cantidad);
            if (cantidad < 1) cantidad = 1;

            // Carrito en Session
            List<CarritoItem> carrito = Session["Carrito"] as List<CarritoItem> ?? new List<CarritoItem>();

            var existente = carrito.FirstOrDefault(x => x.Id == ArticuloDetalle.Id);
            if (existente != null)
            {
                existente.Cantidad += cantidad;
            }
            else
            {
                carrito.Add(new CarritoItem
                {
                    Id = ArticuloDetalle.Id,
                    Nombre = ArticuloDetalle.Nombre,
                    ImagenUrl = ObtenerUrlImagen(ArticuloDetalle.ImagenUrl),
                    Precio = ArticuloDetalle.Precio,
                    Cantidad = cantidad
                });
            }

            Session["Carrito"] = carrito;

            lblStockDisponible.Text = "Producto agregado al carrito ✔️";
            lblStockDisponible.CssClass = "text-green-600";
        }
    }
}
