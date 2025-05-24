﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using NegocioArticulo;

namespace ArticulosWeb
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                imgAvatar.ImageUrl = "~/Img/usuarioDefault.jpg";

                // Páginas que no requieren sesión
                if (!(Page is Login || Page is Registro || Page is Explorar || Page is Preguntas || Page is Error || Page is Default))
                {
                    if (!Seguridad.sesionActiva(Session["usuario"]))
                    {
                        Response.Redirect("Login.aspx", false);
                        return;
                    }
                }

                // Si hay sesión activa, mostrar usuario e imagen
                if (Seguridad.sesionActiva(Session["usuario"]))
                {
                    Usuario user = (Usuario)Session["usuario"];
                    lblUser.Text = user.Nombre;

                    if (!string.IsNullOrEmpty(user.ImagenPerfil))
                        imgAvatar.ImageUrl = "~/Img/Perfil" + user.ImagenPerfil;
                }
            }
        }
        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}