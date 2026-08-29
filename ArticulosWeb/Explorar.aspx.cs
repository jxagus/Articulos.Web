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
            if (lista == null) return;

            filtro = filtro.ToLower();

            List<Articulo> filtrada = lista.FindAll(a =>
                (a.Nombre != null && a.Nombre.ToLower().Contains(filtro)) ||
                (a.Marca != null && a.Marca.Descripcion != null && a.Marca.Descripcion.ToLower().Contains(filtro)) ||
                (a.Categoria != null && a.Categoria.Descripcion != null && a.Categoria.Descripcion.ToLower().Contains(filtro))
            );

            RepExplorar.DataSource = filtrada;
            RepExplorar.DataBind();
        }

        private void CargarCategorias()
        {
            List<Articulo> lista = (List<Articulo>)Session["ListaArticulos"];
            if (lista == null) return;

            var categorias = lista
                .Where(a => a.Categoria != null)
                .GroupBy(a => a.Categoria.Descripcion)
                .Select(g => new CategoriaContada
                {
                    Descripcion = g.Key,
                    Cantidad = g.Count()
                }).ToList();

            RepCategorias.DataSource = categorias;
            RepCategorias.DataBind();
        }

        protected void RepCategorias_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "FiltrarCategoria")
            {
                string categoriaSeleccionada = e.CommandArgument.ToString();
                List<Articulo> lista = (List<Articulo>)Session["ListaArticulos"];

                if (lista != null)
                {
                    List<Articulo> filtrada = lista.FindAll(a =>
                        a.Categoria != null &&
                        a.Categoria.Descripcion.Equals(categoriaSeleccionada, StringComparison.OrdinalIgnoreCase)
                    );

                    RepExplorar.DataSource = filtrada;
                    RepExplorar.DataBind();

                    btnQuitarFiltro.Visible = true;
                    btnQuitarFiltro.Text = $"{categoriaSeleccionada} <span class='fw-bold' style='font-size:11px;'>✕</span>";
                }
            }
        }

        protected void btnQuitarFiltro_Click(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["ListaArticulos"];
            if (lista != null)
            {
                RepExplorar.DataSource = lista;
                RepExplorar.DataBind();
            }

            btnQuitarFiltro.Visible = false;
        }

        protected void ddlOrdenar_SelectedIndexChanged(object sender, EventArgs e)
        {
            string criterio = ddlOrdenar.SelectedValue;
            List<Articulo> articulos = (List<Articulo>)Session["ListaArticulos"];
            if (articulos == null) return;

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