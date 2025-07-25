using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ArticulosWeb
{
    /// <summary>
    /// Descripción breve de SubirImagen
    /// </summary>
    public class SubirImagen : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write("Hola a todos");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}