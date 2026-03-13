using System;
using System.Web.UI;
using Dominio;
using NegocioArticulo;

namespace ArticulosWeb
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Dominio.Usuario usuario = new Dominio.Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();

            try
            {
                if(Validacion.ValidaTextoVacio(txtUser) ||Validacion.ValidaTextoVacio(txtPassword)) //completa ambos campos capo
                {
                    Session.Add("error", "Completa los campos porfavor");
                    //Response.Redirect("Error.aspx", false);
                    return;
                }
                
                usuario.Email = txtUser.Text;
                usuario.Pass = txtPassword.Text;
                if (negocio.Loguear(usuario))
                {
                    Session.Add("usuario", usuario); //guardamos en session
                    Response.Redirect("Default.aspx", false);
                }
                else
                {
                    Session.Add("error", "user o pass incorrectos");
                    //Response.Redirect("Error.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
        private void Page_Error(object sender, EventArgs e)
        {
            Exception exc = Server.GetLastError();


            Session.Add("error", exc.ToString());
            //Response.Redirect("Error.aspx");
            Server.Transfer("Error.aspx");
        }

    }
}
