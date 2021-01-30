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
using System.Data.Entity;

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
        public  ActionResult IncomingLetter(LetterViewModel model)
        {
            if (ModelState.IsValid)
            {

                Letter letter = new Letter();
                letter.LetterFrom = model.LetterFrom;
                letter.Responsible = model.Responsible;
                letter.Subject = model.Subject;
                letter.ReferenceNo = model.ReferenceNo;
                letter.LetterDate = model.LetterDate;
                letter.ReceiveDate = model.ReceiveDate;
                letter.BranchName = model.BranchName;
                letter.LetterType = model.LetterType;
                letter.LetterStatus = model.LetterStatus;

                string fileName = Path.GetFileNameWithoutExtension(model.ImageFile.FileName);
                string extension = Path.GetExtension(model.ImageFile.FileName);
                fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                letter.ScannedImage = "~/UploadedFiles/" + fileName;
                fileName = Path.Combine(Server.MapPath("~/UploadedFiles/"), fileName);
                model.ImageFile.SaveAs(fileName);


                using (LetterManagementDBEntities db= new LetterManagementDBEntities())
                {
                    db.Letters.Add(letter);
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
                //var IncomingLetters = dc.Letters.AsQueryable().Include(a => a.Feedbacks).OrderBy(a => a.LetterFrom).AsNoTracking().ToList();
                var IncomingLetters = dc.Letters.ToList();

                foreach (var item in IncomingLetters)
                {
                    if (item.Feedbacks == null || item.Feedbacks.Count == 0) item.Feedbacks = new List<Feedback>();
                    //else item.Feedbacks = item.Feedbacks.ToList();
                }
                return Json(new { data = IncomingLetters }, JsonRequestBehavior.AllowGet);

            }

        }
        [HttpGet]
        public ActionResult Commentpopup(int id)
        {
            using (LetterManagementDBEntities db = new LetterManagementDBEntities())
            {
                Letter letter = new Letter();
                //letter = db.Letters.Where(x => x.Id == id);
                return View();               
            }

        }
        [HttpPost]
        public ActionResult Commentpopup(Feedback model)
        {
            if (ModelState.IsValid)
            {
               
                using (LetterManagementDBEntities db = new LetterManagementDBEntities())
                {
                    Letter pastLtter = db.Letters.Where(x => x.Id == model.Id).FirstOrDefault();
                    Feedback feedback = new Feedback();
                    feedback.LetterStatus = model.LetterStatus;
                    feedback.Assign = model.Assign;
                    feedback.Comment = model.Comment;
                    feedback.Responsible =pastLtter.Responsible;
                    feedback.Date = DateTime.Now;
                    feedback.LetterId = model.Id;
                                       
                    db.Feedbacks.Add(feedback);
                    db.SaveChanges();
                }
                using (LetterManagementDBEntities db = new LetterManagementDBEntities())
                {
                    Letter pastLtter = db.Letters.Where(x => x.Id == model.Id).FirstOrDefault();
                    pastLtter.Responsible = model.Assign;
                    db.SaveChanges();
                }
           }
            ModelState.Clear();
            return View();
        }
        [HttpGet]
        public ActionResult AllFeedBack(int id)
        {
            using (LetterManagementDBEntities dc = new LetterManagementDBEntities())
            {
                var data = dc.Letters
                                 .Join(
                                     dc.Feedbacks,
                                     letter => letter.Id,
                                     fedback => fedback.LetterId,
                                     (letter, fedback) => new
                                     {
                                         referenceno = letter.ReferenceNo,
                                         responsible = fedback.Responsible,
                                         comment = fedback.Comment

                                     }
                                 ).ToList();

            }
            return View();

        }
        public ActionResult LetterPreview()
        {
            return View();
        }   

    }
}
