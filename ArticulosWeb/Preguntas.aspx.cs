﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NegocioArticulo;


namespace ArticulosWeb
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            EmailService emailService = new EmailService();
            emailService.armarCorreo(txtEmail.Text, txtAsunto.Text, txtMensaje.Text);

            try
            {
                emailService.enviarEmail();

                lblEnviar.Text = "Gracias por enviarnos mensaje, en breve solucionaremos tus dudas 😊";
                lblEnviar.Visible = true;

                string script = "<script>setTimeout(function() { document.getElementById('" + lblEnviar.ClientID + "').style.display = 'none'; }, 5000);</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "HideLabel", script);
            }
            catch (Exception ex)
            {
                // Mostrar el error
                //lblEnviar.Text = "Error al enviar el email: " + ex.Message;
                lblEnviar.ForeColor = System.Drawing.Color.Red;
                lblEnviar.Visible = true;
            }
        }

    }
}