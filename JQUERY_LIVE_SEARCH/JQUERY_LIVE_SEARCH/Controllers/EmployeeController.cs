using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace JQUERY_LIVE_SEARCH.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Employee
        public ActionResult Index()
        {
            EmployeeDBEntities EmpDb = new EmployeeDBEntities();
            var data = EmpDb.tbl_Employee.ToList();
            ViewBag.result = data;
            return View(); 
        }
    }
}