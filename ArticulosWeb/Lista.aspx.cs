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
    public partial class Lista : System.Web.UI.Page
    {
        public bool FiltroAvanzado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["usuario"];
            if (!Seguridad.sesionActiva(Session["usuario"]) )
            {
                Session.Add("error", "No tiene permisos para acceder a esta sección");
                Response.Redirect("Explorar.aspx", false);
                return;
            }
            if (!Seguridad.esAdmin(Session["usuario"]))
            {
                Session.Add("error", "acceso denegado");
                Response.Redirect("Error.aspx");
                return;
            }

            if (!IsPostBack)
            {
                pnlFiltroAvanzado.Visible = chkAvanzado.Checked;

                Negocio articulo = new Negocio();
                List<Articulo> lista = articulo.listarConSP();
                Session["listaArticulos"] = lista;
                dgvLista.DataSource = lista;
                dgvLista.DataBind();

                // Si el filtro avanzado esta activo, inicializamos el criterio
                if (chkAvanzado.Checked)
                {
                    ddlCampo.SelectedIndex = 0; // Precio
                    ddlCampo_SelectedIndexChanged(null, null); // Poblamos criterios
                }
            }

            pnlFiltroAvanzado.Visible = chkAvanzado.Checked;
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
        protected void DgvLista_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvLista.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioArticulo.aspx?id=" + id);
        }
        protected void Filtro_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];
            //toUpper para las mayus/minusculas
            List<Articulo> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            dgvLista.DataSource = listaFiltrada;
            dgvLista.DataBind();
        }
        protected void chkAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            pnlFiltroAvanzado.Visible = chkAvanzado.Checked;

            if (chkAvanzado.Checked)
            {
                ddlCampo.SelectedIndex = 0;
                ddlCampo_SelectedIndexChanged(null, null);
            }
        }
        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();
            if (ddlCampo.SelectedItem.ToString() == "Precio")
            {
                ddlCriterio.Items.Add("Igual a");
                ddlCriterio.Items.Add("Mayor a");
                ddlCriterio.Items.Add("Menor a");
            }
            else
            {
                ddlCriterio.Items.Add("Contiene");
                ddlCriterio.Items.Add("Comienza con");
                ddlCriterio.Items.Add("Termina con");
            }
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                string campo = ddlCampo.SelectedItem?.Text;
                string criterio = ddlCriterio.SelectedItem?.Text;
                string filtro = txtFiltroAvanzado.Text;

                dgvLista.DataSource = Negocio.filtrar(campo, criterio, filtro);
                dgvLista.DataBind();
            }
            catch (Exception ex)
            {
                Session["error"] = ex.ToString();
                Response.Redirect("Error.aspx");
            }
        }


    }
}