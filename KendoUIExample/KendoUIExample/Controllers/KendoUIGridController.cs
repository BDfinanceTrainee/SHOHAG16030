using KendoUIExample.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KendoUIExample.Controllers
{
    public class KendoUIGridController : Controller
    {
        // GET: KendoUIGrid
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetEmployees()
        {
            using (EmployeeInfoDBEntities dc = new EmployeeInfoDBEntities())
            {
                var emoloyees = dc.Employees.OrderBy(a => a.Name).ToList();
                return Json(new { data = emoloyees }, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult KendoUIGrid()
        {
            return View();
        }
        public ActionResult kendoScheduler()
        {
            return View();
        }
        public ActionResult KendoUIAlert()
        {
            return View();
        }
        public ActionResult AppBar()
        {
            return View();
        }
        public ActionResult Dialog()
        {
            return View();
        }

        public ActionResult NavigationBreadcrumb()
        {
            return View();
        }
    }
}