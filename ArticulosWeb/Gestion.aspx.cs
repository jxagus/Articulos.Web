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
    using NegocioArticulo; // Asegurate de tener este using arriba

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
                    string email = row.Cells[1].Text.Trim(); // Email está en la 2da columna (índice 1)
                    emails.Add(email);
                }
            }

            string mensaje = txtMensaje.Text.Trim();

            if (emails.Count > 0 && !string.IsNullOrWhiteSpace(mensaje))
            {
                try
                {
                    foreach (string emailDestino in emails)
                    {
                        EmailService emailService = new EmailService();
                        emailService.armarCorreo(
                            emailDestino,
                            "Mensaje del Administrador - Artículos Web",
                            $"<p>{mensaje}</p><br><hr><small>Este mensaje fue enviado automáticamente desde el panel de administración.</small>"
                        );
                        emailService.enviarEmail();
                    }

                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mensaje enviado correctamente.');", true);
                    txtMensaje.Text = ""; // Limpiar mensaje
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('Error al enviar emails: {ex.Message}');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Seleccioná al menos un usuario y escribí un mensaje.');", true);
            }
        }

    }
}