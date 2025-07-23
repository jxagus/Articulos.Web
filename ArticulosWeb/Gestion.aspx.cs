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
    public partial class Gestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Negocio articulo = new Negocio();
                List<Articulo> lista = articulo.listarConSP();
                Session["listaArticulos"] = lista;
                dgvLista.DataSource = lista;
                dgvLista.DataBind();

                // Si el filtro avanzado esta activo, inicializamos el criterio

            }
        }
        protected void DgvLista_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvLista.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioArticulo.aspx?id=" + id);
        }
        protected void DgvLista_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvLista.PageIndex = e.NewPageIndex;
            if (chkAvanzado.Checked)
            {
                // Filtro avanzado
                dgvLista.DataSource = Negocio.filtrar(
                    ddlCampo.SelectedItem.ToString(),
                    ddlCriterio.SelectedItem.ToString(),
                    txtFiltroAvanzado.Text);
            }
            else if (!string.IsNullOrEmpty(txtFiltro.Text))
            {
                // Filtro simple
                List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];
                List<Articulo> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
                dgvLista.DataSource = listaFiltrada;
            }
            else
            {
                // Sin filtro
                List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];
                dgvLista.DataSource = lista;
            }

            dgvLista.DataBind();
        }
    }
}