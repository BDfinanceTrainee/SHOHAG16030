using EMS.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EMS.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Employee
        db_testEntities dbobj = new db_testEntities();
        public ActionResult Employee(VisitDetail obj)
        {
            if (obj != null)
                return View(obj);
            else
                return View();
        }
        [HttpPost]
        public ActionResult AddVisitDetail(VisitDetail model)
        {
            if (ModelState.IsValid)
            {
                VisitDetail obj = new VisitDetail();
                obj.Id = model.Id;
                obj.DateOfVisit = model.DateOfVisit;
                obj.NextVistDate = model.NextVistDate;
                obj.VisitType = model.VisitType;
                obj.Lead_Conversion = model.Lead_Conversion;
                obj.DuscussedProduct = model.DuscussedProduct;
                obj.DepositeAmount = model.DepositeAmount;
                obj.Comments = model.Comments;
                obj.TypeOfClient = model.TypeOfClient;
                obj.ClientsName = model.ClientsName;
                obj.ClientsOrganization = model.ClientsOrganization;
                obj.ConcernedPerson = model.ConcernedPerson;
                obj.ClientsDesignation = model.ClientsDesignation;
                obj.TelephoneNo = model.TelephoneNo;
                obj.MobileNo = model.MobileNo;
                obj.Address = model.Address;
                obj.DateOfVisit = model.DateOfVisit;
                if (model.Id == 0)
                {
                    dbobj.VisitDetails.Add(obj);
                    dbobj.SaveChanges();
                }
                else
                {
                    dbobj.Entry(obj).State = System.Data.Entity.EntityState.Modified;
                    dbobj.SaveChanges();
                }
            }
            ModelState.Clear();          
            return View("Employee");
        }

        public ActionResult AllVisitDetailList()
        {
            var res = dbobj.VisitDetails.ToList();
            return View(res);
        }

        public ActionResult Delete(int id)
        {
            var res = dbobj.VisitDetails.Where(x => x.Id == id).First();
            dbobj.VisitDetails.Remove(res);
            dbobj.SaveChanges();
            var list = dbobj.VisitDetails.ToList();
     
            return View("AllVisitDetailList",list);
        }

    }
}