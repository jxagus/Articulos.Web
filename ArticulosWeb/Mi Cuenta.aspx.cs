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
	public partial class MiCuenta : System.Web.UI.Page
	{
        //	if (Seguridad.sesionActiva(Session["usuario"]))
        //	Response.Redirect("Login.aspx", false);
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Seguridad.sesionActiva(Session["usuario"]))
                    {
                        Usuario user = (Usuario)Session["usuario"];
                        txtEmail.Text = user.Email;
                        txtEmail.ReadOnly = true;
                        txtNombre.Text = user.Nombre;
                        txtApellido.Text = user.Apellido;
                        txtFechaNacimiento.Text = user.FechaNacimiento.ToString("yyyy-MM-dd");
                        if (!string.IsNullOrEmpty(user.ImagenPerfil))
                            imgNuevoPerfil.ImageUrl = "./Img/Perfil" + user.ImagenPerfil;
                    }
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {

                Page.Validate();
                if (!Page.IsValid)
                    return;

                UsuarioNegocio negocio = new UsuarioNegocio();
                Usuario user = (Usuario)Session["usuario"];
                //Escribir img si se cargó algo.
                if (txtImagen.PostedFile.FileName != "")
                {
                    string ruta = Server.MapPath("./Img/Perfil");
                    txtImagen.PostedFile.SaveAs(ruta + "perfil-" + user.Id + ".jpg");
                    user.ImagenPerfil = "perfil-" + user.Id + ".jpg";
                }

                user.Nombre = txtNombre.Text;
                user.Apellido = txtApellido.Text;
                user.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);

                //guardar datos perfil
                negocio.actualizar(user);

                //leer img
                Image img = (Image)Master.FindControl("imgAvatar");
                img.ImageUrl = "~/Img/Perfil" + user.ImagenPerfil;

                //mensaje
                lblMensaje.Text = "Todo listo, datos guardados correctamente 👍";
                lblMensaje.Visible = true;

                //redirect
                string script = "setTimeout(function(){ window.location.href = 'Explorar.aspx'; }, 2000);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect", script, true);

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }

    }
}