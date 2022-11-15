using Microsoft.AspNetCore.Mvc;
using SGPI.Models;

namespace SGPI.Controllers
{
    public class CoordinadorController : Controller
    {

        SGPIDBContext context = new SGPIDBContext();

        public IActionResult BuscarEstudiante()
        {
            ViewBag.documento = context.Documentos.ToList();
            return View();
        }

        [HttpPost]
        public IActionResult BuscarEstudiante(Usuario usuario)
        {
            var us = context.Usuarios
            .Where(u => u.NumeroDocumento == usuario.NumeroDocumento
            && u.IdDoc == usuario.IdDoc).FirstOrDefault();

            if (us != null)
            {

                ViewBag.documento = context.Documentos.ToList();

                return View(us);
            }
            else
            {
                ViewBag.documento = context.Documentos.ToList();
                return View();
            }
            return View();
        }
        public IActionResult ProgramarAsignatura()
        {

            ViewBag.programa = context.Programas.ToList();
            ViewBag.asignatura = context.Asignaturas.ToList();
            ViewBag.usuario = context.Usuarios.ToList();
            return View();
        }

        [HttpPost]
        public IActionResult ProgramarAsignatura(Programacion programacion)
        {
            context.Programacions.Add(programacion);
            context.SaveChanges();

            ViewBag.programa = context.Programas.ToList();
            ViewBag.asignatura = context.Asignaturas.ToList();
            ViewBag.usuario = context.Usuarios.ToList();
            return View();
        }

        public IActionResult Homologacion()
        {
            return View();
        }
        public IActionResult EntrevistasAdmisiones(int? IdUsuario)
        {
            Usuario usr = context.Usuarios.Find(IdUsuario);
            ViewBag.estudiante = context.Estudiantes.ToList();
            return View();

        }
        public IActionResult PagoEstudiante()
        {
            return View();

        }
        public IActionResult Reportes()
        {
            return View();

        }
    }
}