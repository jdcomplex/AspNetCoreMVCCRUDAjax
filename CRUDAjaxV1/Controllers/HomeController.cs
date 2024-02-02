using CRUDAjaxV1.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace CRUDAjaxV1.Controllers
{
    public class HomeController : Controller
    {
        private IConfiguration _config;
        EmployeeDB empDB = new EmployeeDB();
        public HomeController( IConfiguration config)
        {
            _config = config;
            empDB.cs = _config.GetConnectionString("DefaultConnection");
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        [HttpGet]
        public JsonResult List()
        {
            return Json(empDB.ListAll());
        }
        [HttpPost]
        public JsonResult Add([FromBody] Employee emp)
        {
            return Json(empDB.Add(emp));
        }
        [HttpGet]
        public JsonResult GetbyID(int ID)
        {
            var Employee = empDB.ListAll().Find(x => x.EmployeeID.Equals(ID));
            return Json(Employee);
        }
        [HttpPost]
        public JsonResult Update([FromBody] Employee emp)
        {
            return Json(empDB.Update(emp));
        }
        [HttpPost]
        public JsonResult Delete(int ID)
        {
            return Json(empDB.Delete(ID));
        }
    }
}
