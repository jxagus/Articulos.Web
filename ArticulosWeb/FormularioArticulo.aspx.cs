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
	public partial class FormularioArticulo : System.Web.UI.Page
	{
        public bool ConfirmarEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ConfirmarEliminacion = false;

            try
            {
                if (!IsPostBack)
                {
                    Negocio negocio = new Negocio();

                    ddlCategoria.DataSource = negocio.listarElementoDesdeTabla("Categorias");
                    ddlCategoria.DataValueField = "id";
                    ddlCategoria.DataTextField = "Descripcion";
                    ddlCategoria.DataBind();

                    ddlMarca.DataSource = negocio.listarElementoDesdeTabla("Marcas");
                    ddlMarca.DataValueField = "id";
                    ddlMarca.DataTextField = "Descripcion";
                    ddlMarca.DataBind();

                    string id = Request.QueryString["id"];

                    if (!string.IsNullOrEmpty(id))
                    {
                        Articulo seleccionado = negocio.listar(id)[0];

                        txtNombre.Text = seleccionado.Nombre;
                        txtCodigo.Text = seleccionado.Codigo;
                        txtImagenUrl.Text = seleccionado.ImagenUrl;
                        txtPrecio.Text = seleccionado.Precio.ToString("N2", new System.Globalization.CultureInfo("es-AR"));
                        txtDescripcion.Text = seleccionado.Descripcion;

                        if (seleccionado.PrecioDescuento.HasValue)
                            txtPrecioDescuento.Text = seleccionado.PrecioDescuento.Value.ToString("N2", new System.Globalization.CultureInfo("es-AR"));

                        ddlCategoria.SelectedValue = seleccionado.Categoria.Id.ToString();
                        ddlMarca.SelectedValue = seleccionado.Marca.Id.ToString();

                        txtImagenUrl_TextChanged(sender, e);
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                decimal? precioDescuento = null;

                Articulo nuevo = new Articulo();
                Negocio Articulo = new Negocio();

                nuevo.Nombre = txtNombre.Text;
                nuevo.Codigo = txtCodigo.Text;
                nuevo.Descripcion = txtDescripcion.Text;

                if (!decimal.TryParse(txtPrecio.Text.Replace(",", "."), out decimal precio))
                {
                    lblError.Text = "Precio inválido.";
                    return;
                }

                nuevo.Precio = precio;
                nuevo.ImagenUrl = txtImagenUrl.Text;

                nuevo.Marca = new Elemento();
                nuevo.Marca.Id = int.Parse(ddlMarca.SelectedValue);

                nuevo.Categoria = new Elemento();
                nuevo.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);

                // Validar y asignar PrecioDescuento si aplica
                if (!string.IsNullOrEmpty(txtPrecioDescuento.Text))
                {
                    if (!decimal.TryParse(txtPrecioDescuento.Text, out decimal tempDescuento))
                    {
                        lblError.Text = "El precio con descuento es inválido.";
                        return;
                    }

                    if (tempDescuento >= precio)
                    {
                        lblError.Text = "El precio con descuento debe ser menor al precio original.";
                        return;
                    }

                    precioDescuento = tempDescuento;
                }

                nuevo.PrecioDescuento = precioDescuento;

                if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int id))
                {
                    nuevo.Id = id;
                    Articulo.modificar(nuevo);
                }
                else
                {
                    Articulo.agregar(nuevo);
                }

                Response.Redirect("Lista.aspx", false);
            }
            catch (Exception ex)
            {
                lblError.Text = "Error: " + ex.Message;
            }
        }

        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
		{
            imgArticulo.ImageUrl = txtImagenUrl.Text;
		}
        protected void btnEliminar_Click(object sender, EventArgs e)
		{
			ConfirmarEliminacion = true;
		}

        protected void btnConfirmacionEliminacion_Click(object sender, EventArgs e)
        {
			try
			{
				if (chkConfirmaEliminacion.Checked)
				{
					Negocio negocio = new Negocio();
                    int id = int.Parse(Request.QueryString["id"]);
                    negocio.eliminar(id);
                    Response.Redirect("Lista.aspx");
				}
			}
			catch (Exception ex)
			{

				Session.Add("errrrror", ex);
			}
        }

        protected void btnInactivar_Click(object sender, EventArgs e)
        {
			try
			{
                Negocio negocio = new Negocio();
                int id = int.Parse(Request.QueryString["id"]);
                Response.Redirect("Lista.aspx");
            }
            catch (Exception ex)
			{

                Session.Add("errrrror", ex);
            }
        }
    }
}