using System;
using System.Collections.Generic;
using System.Linq;
using Dominio;
using NegocioArticulo;

namespace ArticulosWeb
{
    public partial class DetalleArticulo : System.Web.UI.Page
    {
        //Propiedad en memoria para el ciclo actual de la pg
        public Articulo ArticuloDetalle { get; private set; }
        public List<Articulo> articulosRelacionados;

        protected void Page_Load(object sender, EventArgs e)
        {
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

            if (Request.QueryString["descuento"] != null && decimal.TryParse(Request.QueryString["descuento"], out decimal desc))
            {
                articulo.PrecioDescuento = desc;
            }

            ArticuloDetalle = articulo; 

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

                // Relacionados
                var relacionados = negocio.listar()
                    .Where(a => a.Categoria != null && articulo.Categoria != null &&
                                a.Categoria.Id == articulo.Categoria.Id &&
                                a.Id != articulo.Id)
                    .Take(4)
                    .ToList();

                if (relacionados != null && relacionados.Count > 0)
                {
                    rptRelacionados.DataSource = relacionados;
                    rptRelacionados.DataBind();
                    rptRelacionados.Visible = true;
                    pnlSinRelacionados.Visible = false;
                }
                else
                {
                    rptRelacionados.Visible = false;
                    pnlSinRelacionados.Visible = true;
                }
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
            if (ArticuloDetalle == null)
            {
                if (!int.TryParse(Request.QueryString["id"], out int id)) return;
                var negocio = new Negocio();
                ArticuloDetalle = negocio.BuscarPorId(id);
                if (ArticuloDetalle == null) return;

                if (Request.QueryString["descuento"] != null && decimal.TryParse(Request.QueryString["descuento"], out decimal desc))
                {
                    ArticuloDetalle.PrecioDescuento = desc;
                }
            }

            int cantidad = 1;
            int.TryParse(txtCantidad.Text, out cantidad);
            if (cantidad < 1) cantidad = 1;

            decimal precioFinal = ArticuloDetalle.Precio;
            if (ArticuloDetalle.PrecioDescuento.HasValue && ArticuloDetalle.PrecioDescuento.Value > 0 && ArticuloDetalle.PrecioDescuento.Value < ArticuloDetalle.Precio)
            {
                precioFinal = ArticuloDetalle.PrecioDescuento.Value;
            }

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
                    Precio = precioFinal,
                    Cantidad = cantidad
                });
            }

            Session["Carrito"] = carrito;

            lblStockDisponible.Text = "Producto agregado al carrito ✔️";
            lblStockDisponible.CssClass = "text-green-600 font-bold";
        }
    }
}