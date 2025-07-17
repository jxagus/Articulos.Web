using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
                Negocio Articulos = new Negocio();
                ListaArticulos = Articulos.listarConSP();

                string filtro = Request.QueryString["buscar"];
                if (!string.IsNullOrEmpty(filtro))
                {
                    ListaArticulos = ListaArticulos
                        .Where(a => a.Nombre.ToLower().Contains(filtro.ToLower()))
                        .ToList();
                }

                Session["ListaArticulos"] = ListaArticulos;
                RepExplorar.DataSource = ListaArticulos;
                RepExplorar.DataBind();
            }
        }

        protected void Filtro_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["ListaArticulos"];
            List<Articulo> listaFiltrada = lista.FindAll(x => x.Nombre.ToLower().Contains(txtFiltro.Text.ToLower()) ||
            x.Codigo.ToLower().Contains(txtFiltro.Text.ToLower()));

            RepExplorar.DataSource = listaFiltrada;
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
}