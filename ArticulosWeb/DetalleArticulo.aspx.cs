using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using NegocioArticulo;

namespace ArticulosWeb
{
    public partial class DetalleArticulo : System.Web.UI.Page
    {
        public Articulo ArticuloDetalle { get; set; }

        public List<Articulo> articulosRelacionados;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int id))
                {
                    Negocio negocio = new Negocio();
                    Articulo articulo = negocio.BuscarPorId(id);

                    if (articulo != null)
                    {
                        ArticuloDetalle = articulo;  // Asigno el artículo para la vista

                        // Artículos relacionados (máximo 4)
                        List<Articulo> relacionados = negocio.listar()
                            .FindAll(a => a.Categoria.Id == articulo.Categoria.Id && a.Id != articulo.Id)
                            .Take(4)
                            .ToList();

                        rptRelacionados.DataSource = relacionados;
                        rptRelacionados.DataBind();
                    }
                    else
                    {
                        Response.Redirect("Default.aspx");
                    }
                }
                else
                {
                    Response.Redirect("Default.aspx");
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
            int id = Convert.ToInt32(Request.QueryString["id"]);
            int cantidad = 1;

            if (!int.TryParse(txtCantidad.Text, out cantidad) || cantidad < 1)
            {
                // Si cantidad no es válida, usar 1
                cantidad = 1;
            }

            Response.Redirect($"Carrito.aspx?id={id}&cantidad={cantidad}");
        }

    }
}