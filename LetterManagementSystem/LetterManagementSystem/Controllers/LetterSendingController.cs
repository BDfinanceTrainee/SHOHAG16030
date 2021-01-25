using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.Net.Mail;
using LetterManagementSystem.Models;
using LetterManagementSystem.Context;
using System.IO;

namespace LetterManagementSystem.Controllers
{
    public class LetterSendingController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        // GET: LetterSending
        [HttpGet]
        public ActionResult IncomingLetter()
        {
            return View();
        }
        [HttpPost]
        public  ActionResult IncomingLetter(Letter model)
        {
            if (ModelState.IsValid)
            {
                string fileName = Path.GetFileNameWithoutExtension(model.ImageFile.FileName);
                string extension = Path.GetExtension(model.ImageFile.FileName);
                fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                model.ScannedImage = "~/UploadedFiles/" + fileName;
                fileName = Path.Combine(Server.MapPath("~/UploadedFiles/"), fileName);
                model.ImageFile.SaveAs(fileName);
                using(LetterManagementDBEntities db= new LetterManagementDBEntities())
                {
                    db.Letters.Add(model);
                    db.SaveChanges();
                }
            }
            ModelState.Clear();
             return View();           
        }
        [HttpGet]
        public ActionResult ViewAllIncomingLetter()
        {           
            using (LetterManagementDBEntities dc = new LetterManagementDBEntities())
            {   
                var IncomingLetters = dc.Letters.OrderBy(a => a.SenderId).ToList();
                return Json(new { data = IncomingLetters }, JsonRequestBehavior.AllowGet);

            }

        }

    }
}
