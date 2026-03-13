using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using NegocioArticulo;
using Dominio;

namespace ArticulosWeb
{
    public partial class Explorar : Page
    {
        public List<Articulo> ListaArticulos { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarArticulos();

                // Ordenamiento inicial o por búsqueda
                if (Session["txtBuscar"] != null)
                {
                    TextBox txtBuscarNav = (TextBox)Master.FindControl("txtBuscarNav");
                    if (txtBuscarNav != null)
                        txtBuscarNav.Text = Session["txtBuscar"].ToString();

                    AplicarFiltro(Session["txtBuscar"].ToString());
                }

                CargarCategorias();
            }
        }

        private void CargarArticulos()
        {
            Negocio negocio = new Negocio();
            ListaArticulos = negocio.listarConSP();
            Session["ListaArticulos"] = ListaArticulos;

            RepExplorar.DataSource = ListaArticulos;
            RepExplorar.DataBind();
        }

        private void AplicarFiltro(string filtro)
        {
            List<Articulo> lista = (List<Articulo>)Session["ListaArticulos"];
            filtro = filtro.ToLower();

            List<Articulo> filtrada = lista.FindAll(a =>
                a.Nombre.ToLower().Contains(filtro) ||
                a.Marca.Descripcion.ToLower().Contains(filtro) ||
                a.Categoria.Descripcion.ToLower().Contains(filtro)
            );

            RepExplorar.DataSource = filtrada;
            RepExplorar.DataBind();
        }

        private void CargarCategorias()
        {
            List<Articulo> lista = (List<Articulo>)Session["ListaArticulos"];

            var categorias = lista
                .GroupBy(a => a.Categoria.Descripcion)
                .Select(g => new CategoriaContada
                {
                    Descripcion = g.Key,
                    Cantidad = g.Count()
                }).ToList();

            RepCategorias.DataSource = categorias;
            RepCategorias.DataBind();
        }

        protected void ddlOrdenar_SelectedIndexChanged(object sender, EventArgs e)
        {
            string criterio = ddlOrdenar.SelectedValue;
            List<Articulo> articulos = (List<Articulo>)Session["ListaArticulos"];

            switch (criterio)
            {
                case "mayor":
                    articulos = articulos.OrderByDescending(a => a.Precio).ToList();
                    break;
                case "menor":
                    articulos = articulos.OrderBy(a => a.Precio).ToList();
                    break;
                default:
                    break;
            }

            RepExplorar.DataSource = articulos;
            RepExplorar.DataBind();
        }

        public string ObtenerUrlImagen(object imagen)
        {
            string url = imagen?.ToString();
            if (string.IsNullOrEmpty(url) || !url.StartsWith("https"))
                return "Img/NoDisponible.jpg";
            return url;
        }
    }

    public class CategoriaContada
    {
        public string Descripcion { get; set; }
        public int Cantidad { get; set; }
    }
}
