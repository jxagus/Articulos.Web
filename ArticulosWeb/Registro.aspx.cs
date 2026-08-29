using System;
using System.Web.UI;
using Dominio;
using NegocioArticulo;

namespace ArticulosWeb
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            try
            {
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                string email = txtEmail.Text.Trim();
                string pass = txtPass.Text;
                string confirmarPass = txtConfirmarPass.Text;

                // Validar campos obligatorios
                if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(pass) || string.IsNullOrWhiteSpace(confirmarPass))
                {
                    lblError.Text = "Todos los campos son obligatorios.";
                    lblError.Visible = true;
                    return;
                }

                // Validar si el email ya existe
                if (usuarioNegocio.emailExiste(email))
                {
                    lblError.Text = "Ese correo ya está registrado. Probá con otro.";
                    lblError.Visible = true;
                    return;
                }

                // Validar si las contraseñas coinciden
                if (pass != confirmarPass)
                {
                    lblError.Text = "Las contraseñas no coinciden.";
                    lblError.Visible = true;
                    return;
                }

                // Si todo esta bien, registrar usuario
                Dominio.Usuario usuario = new Dominio.Usuario();
                EmailService emailService = new EmailService();

                usuario.Email = email;
                usuario.Pass = pass;
                usuario.Id = usuarioNegocio.insertarNuevo(usuario);
                Session.Add("usuario", usuario);

                emailService.armarCorreo(usuario.Email, "Bienvenidos a ArticulosWeb", "Te damos la bienvenida rey 👑");
                emailService.enviarEmail();

                Response.Redirect("Default.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
            }
        }
    }
}
