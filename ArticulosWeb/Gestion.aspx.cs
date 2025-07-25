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
                UsuarioNegocio negocio = new UsuarioNegocio(); 
                List<Usuario> lista = negocio.ListarConSP();   
                Session["ListaUsuario"] = lista;
                dgvLista.DataSource = lista;
                dgvLista.DataBind();

                //para conteo
                UsuarioNegocio negocioUsuarios = new UsuarioNegocio();
                List<Usuario> listaUsuarios = negocioUsuarios.ListarConSP();
                lblUsuarios.Text = listaUsuarios.Count.ToString();

                Negocio negocioArticulos = new Negocio();
                List<Articulo> listaArticulos = negocioArticulos.listarConSP();
                lblArticulos.Text = listaArticulos.Count.ToString();
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
 
            dgvLista.DataBind();
        }
        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            List<string> emails = new List<string>();

            foreach (GridViewRow row in dgvLista.Rows)
            {
                CheckBox chk = (CheckBox)row.FindControl("chkSeleccionado");
                if (chk != null && chk.Checked)
                {
                    string email = row.Cells[1].Text; // Email es la segunda columna
                    emails.Add(email);
                }
            }

            string mensaje = txtMensaje.Text;

            if (emails.Count > 0 && !string.IsNullOrWhiteSpace(mensaje))
            {
                // Acá podés usar tu EmailService.cs si lo tenés ya armado
                foreach (string email in emails)
                {
                    // new EmailService().Enviar(email, "Mensaje del administrador", mensaje);
                }

                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mensaje enviado a los usuarios seleccionados.');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Debés seleccionar al menos un usuario y escribir un mensaje.');", true);
            }
        }

    }
}