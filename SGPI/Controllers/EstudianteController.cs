using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SGPI.Models;

namespace SGPI.Controllers
{
  
    public class EstudianteController : Controller
    {
        SGPIDBContext context = new SGPIDBContext();
        public IActionResult ActualizarEstudiante(int? IdUsuario)
        {
            Usuario usuario = context.Usuarios.Find(IdUsuario);
            if (usuario != null)
            {
                ViewBag.genero = context.Generos.ToList();
                ViewBag.rol = context.Rols.ToList();
                ViewBag.documento = context.Documentos.ToList();
                ViewBag.programa = context.Programas.ToList();
                
                
                return View(usuario);
            }
            else
                return View();
        }
        [HttpPost]
        public IActionResult ActualizarEstudiante(Usuario usuario)
        {
            var usract = context.Usuarios.Where(consulta => consulta.IdUsuario == usuario.IdUsuario).FirstOrDefault();

            usract.IdDoc = usuario.IdDoc;
            usract.IdGenero = usuario.IdGenero;
            usract.IdPrograma = usuario.IdPrograma;
            usract.PrimerNombre = usuario.PrimerNombre;
            usract.SegundoNombre = usuario.SegundoNombre;
            usract.PrimerApellido = usuario.PrimerApellido;
            usract.SegundoApellido = usuario.SegundoApellido;
            usract.NumeroDocumento = usuario.NumeroDocumento;
            usract.Email = usuario.Email;
            usract.Password = usuario.Password;

            context.Update(usract);
            context.SaveChanges();

            ViewBag.genero = context.Generos.ToList();
            ViewBag.rol = context.Rols.ToList();
            ViewBag.documento = context.Documentos.ToList();
            ViewBag.programa = context.Programas.ToList();
            ViewBag.idusuario = usract.IdUsuario;

            return View(usract);
        }


        public IActionResult Pagos(int? IdUsuario)
        {
            Pago us = new Pago();
            Usuario usuario = new Usuario();
            var usr = context.Usuarios.Where(consulta => consulta.IdUsuario == IdUsuario).FirstOrDefault();
            ViewBag.idusuario = usr.IdUsuario;
            List<Pago> listpago = new List<Pago>();
            listpago = context.Pagos.ToList();
            ViewBag.listapgs = listpago;
            return View(us);
        }

        [HttpPost]
        public IActionResult Pagos(int? IdUsuario, Pago pago)
        {
            
            Usuario usr = context.Usuarios.Find(IdUsuario);


            context.Pagos.Add(pago);
            context.SaveChanges();

            Estudiante est = new Estudiante();
            est.Archivo = null;
            est.IdUsuario = usr.IdUsuario;
            est.IdPago = pago.IdPago;
            est.Egreado = true;

            context.Estudiantes.Add(est);
            context.SaveChanges();

            Usuario usuario = new Usuario();
            var usrc = context.Usuarios.Where(consulta => consulta.IdUsuario == IdUsuario).FirstOrDefault();
            ViewBag.idusuario = usrc.IdUsuario;

            List<Pago> listpago = new List<Pago>();
            listpago = context.Pagos.ToList();
            ViewBag.listapgs = listpago;

            return View();
        }

    }
}