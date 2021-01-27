using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.Net.Mail;
using LMS.Models;
using System.IO;
using LMS.Context;

namespace LMS.Controllers
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
            using (LetterManagementDBEntities db = new LetterManagementDBEntities())
            {
                ViewBag.Employees = db.Employees.ToList();             
                return View();
            }
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
                var IncomingLetters = dc.Letters.OrderBy(a => a.LetterFrom).ToList();
                return Json(new { data = IncomingLetters }, JsonRequestBehavior.AllowGet);

            }

        }
        [HttpGet]
        public ActionResult Commentpopup()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Commentpopup(Feedback model)
        {
            if (ModelState.IsValid)
            {
               
                using (LetterManagementDBEntities db = new LetterManagementDBEntities())
                {
                    Feedback feedback = new Feedback();
                    feedback.Date = DateTime.Today;
                    feedback.Assign = model.Assign;
                    feedback.Comments = model.Comments;
                    db.Feedbacks.Add(model);
                    db.SaveChanges();
                }
            }
            ModelState.Clear();
            return View();
        }
        [HttpPost]
        public ActionResult Feedbackpopup()
        {
            return View();
        }
        [HttpGet]
        public ActionResult AllFeedBack(string referenceNo)
          {
            using (LetterManagementDBEntities dc = new LetterManagementDBEntities())
            {
                var data = dc.Letters
                                 .Join(
                                     dc.Feedbacks,
                                     author => author.ReferenceNo,
                                     book => book.ReferenceNo,
                                     (author, book) => new
                                     {
                                         date = book.Date.ToString(),
                                         referenceno = book.ReferenceNo,
                                         responsible = book.Responsible,
                                         comments = book.Comments                                        
                                         
                                     }
                                 ).ToList();

            }
            return View();

        }        

    }
}
