using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NegocioArticulo;
using Dominio;
using System.Web.UI.HtmlControls;

namespace ArticulosWeb
{
    public partial class Explorar : Page
    {
        public List<Articulo> ListaArticulos { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["txtBuscar"] != null)
                {
                    TextBox txtBuscarNav = (TextBox)Master.FindControl("txtBuscarNav");
                    if (txtBuscarNav != null)
                    {
                        txtBuscarNav.Text = Session["txtBuscar"].ToString();
                    }

                    string filtro = Session["txtBuscar"].ToString().ToLower();
                    List<Articulo> lista = (List<Articulo>)Session["ListaArticulos"];
                    List<Articulo> filtrada = lista.FindAll(a =>
                        a.Nombre.ToLower().Contains(filtro) ||
                        a.Marca.Descripcion.ToLower().Contains(filtro) ||
                        a.Categoria.Descripcion.ToLower().Contains(filtro)
                    );

                    RepExplorar.DataSource = filtrada;
                    RepExplorar.DataBind();
                }
                else
                {
                    Negocio Articulos = new Negocio();
                    ListaArticulos = Articulos.listarConSP();
                    Session["ListaArticulos"] = ListaArticulos;
                    RepExplorar.DataSource = ListaArticulos;
                    RepExplorar.DataBind();
                }
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