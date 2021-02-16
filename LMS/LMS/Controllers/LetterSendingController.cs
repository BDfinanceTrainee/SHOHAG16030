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
            LetterViewModel letterviewmodel = new LetterViewModel();
            using (LetterManagementDBEntities db = new LetterManagementDBEntities())
            {
                List<LetterFrom> letterfrom = new List<LetterFrom>();
                letterfrom = db.LetterFroms.ToList();
                List<LetterType> lettertype = new List<LetterType>();
                lettertype = db.LetterTypes.ToList();
                List<Designation> desingnation = new List<Designation>();
                desingnation = db.Designations.ToList();
                List<LetterStatu> letterStatu = new List<LetterStatu>();
                letterStatu = db.LetterStatus.ToList();

                ViewBag.letterfromList = new SelectList(letterfrom, "LetterSender", "LetterSender");
                ViewBag.LettertypeList = new SelectList(lettertype, "TypeOfLetter", "TypeOfLetter");
                ViewBag.designationList = new SelectList(desingnation, "Name", "Name");
                ViewBag.letterStatusList = new SelectList(letterStatu, "Status", "Status");
            }
            return View();
        }
        [HttpPost]
        public  ActionResult IncomingLetter(LetterViewModel model)
        {
            if (ModelState.IsValid)
            {

                Letter letter = new Letter();
                letter.Sender = model.Sender;
                letter.Responsible = model.Responsible;
                letter.Subject = model.Subject;
                letter.ReferenceNo = model.ReferenceNo;
                letter.LetterDate = model.LetterDate;
                letter.ReceiveDate = model.ReceiveDate;
                letter.Type = model.Type;
                letter.StatusOfLetter = model.StatusOfLetter;

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
             return View("Index");           
        }
        [HttpGet]
        public ActionResult ViewAllIncomingLetter()
        {           
            using (LetterManagementDBEntities dc = new LetterManagementDBEntities())
            {   
                var IncomingLetters = dc.Letters.ToList();
                return Json(new { data = IncomingLetters }, JsonRequestBehavior.AllowGet);

            }

        }
        [HttpGet]
        public ActionResult Commentpopup(int id)
        {
            Letter letter = new Letter();
            using (LetterManagementDBEntities db = new LetterManagementDBEntities())
            {               
                letter = db.Letters.Where(x => x.Id == id).FirstOrDefault();
                ViewBag.ReferenceNo = letter.ReferenceNo;
                ViewBag.Responsible = letter.Responsible;
                ViewBag.DateOfToday = DateTime.Today;
                List<Designation> desingnation = new List<Designation>();
                desingnation = db.Designations.ToList();
                List<LetterStatu> letterStatu = new List<LetterStatu>();
                letterStatu = db.LetterStatus.ToList();
                ViewBag.designationList = new SelectList(desingnation, "Name", "Name");
                ViewBag.letterStatusList = new SelectList(letterStatu, "Status", "Status");
            }
           
            return View();

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
                    feedback.StatusOfLetter = model.StatusOfLetter;
                    feedback.Assign = model.Assign;
                    feedback.Comment = model.Comment;
                    feedback.Responsible =pastLtter.Responsible;
                    feedback.Date = DateTime.Now;
                    feedback.LetterId = model.Id;
                    feedback.Responsible = pastLtter.Responsible;                                      
                    db.Feedbacks.Add(feedback);

                    pastLtter.Responsible = model.Assign;
                    db.SaveChanges();                   
                }
           }
            ModelState.Clear();
            return View("Index");
        }
        [HttpGet]
        public ActionResult AllFeedBack(int id)
        {
            var listFeedBackList = new FeedBackViewModel();
            using (LetterManagementDBEntities dc = new LetterManagementDBEntities())
            {
                List<Feedback> feedback = new List<Feedback>();               
                feedback = dc.Feedbacks.Where(x=>x.LetterId == id).ToList();
                ViewBag.FeedbackList = feedback;
            }
            
            return View();
           
        }
        public ActionResult LetterPreview(int id)
        {
            var LetterImage = new Letter();
            using (LetterManagementDBEntities db = new LetterManagementDBEntities())
            {
                LetterImage = db.Letters.Where(x => x.Id == id).FirstOrDefault();
               
            }

            return View(LetterImage);
        }   

    }
}
