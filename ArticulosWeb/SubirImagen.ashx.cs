using System;
using System.Web;
using System.IO;

namespace ArticulosWeb
{
    public class SubirImagen : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";

            var file = context.Request.Files["upload"];
            if (file != null && file.ContentLength > 0)
            {
                string nombreArchivo = Path.GetFileName(file.FileName);
                string carpetaRelativa = "~/ImagenesUploads/";
                string rutaRelativa = carpetaRelativa + nombreArchivo;
                string rutaFisica = context.Server.MapPath(rutaRelativa);

                Directory.CreateDirectory(context.Server.MapPath(carpetaRelativa));
                file.SaveAs(rutaFisica);

                string urlImagen = $"{context.Request.Url.GetLeftPart(UriPartial.Authority)}{context.Request.ApplicationPath.TrimEnd('/')}/ImagenesUploads/{nombreArchivo}";

                context.Response.Write("{ \"uploaded\": 1, \"fileName\": \"" + nombreArchivo + "\", \"url\": \"" + urlImagen + "\" }");
            }
            else
            {
                context.Response.Write("{ \"uploaded\": 0, \"error\": { \"message\": \"No se recibió imagen\" } }");
            }
        }

        public bool IsReusable => false;
    }
}
