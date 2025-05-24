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
    public partial class Default : Page
    {
        public List<Articulo> ListaArticulos { get; set; } // Todos
        public List<Articulo> ListaCelulares { get; set; } // Solo celulares
        public List<Articulo> ListaSinCelulares { get; set; } // Solo no celulares

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Negocio negocio = new Negocio();
                ListaArticulos = negocio.listarConSP();
                ListaCelulares = negocio.ListarCelulares(); 
                ListaSinCelulares = negocio.ListarSinCelulares(); 

            }
        }
    }
}