using LMS.Context;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LMS.Models
{
    public class LetterViewModel
    {
        public int Id { get; set; }
        public string LetterFrom { get; set; }
        public string Responsible { get; set; }
        public string Subject { get; set; }
        public string ReferenceNo { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:hh:mm tt}", ApplyFormatInEditMode = true)]
        [Display(Name = "Evening Showtime")]
        public System.DateTime LetterDate { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:hh:mm tt}", ApplyFormatInEditMode = true)]
        [Display(Name = "Evening Showtime")]
        public System.DateTime ReceiveDate { get; set; }
        public HttpPostedFileBase ImageFile { get; set; }
        public string BranchName { get; set; }
        public string LetterType { get; set; }
        public string LetterStatus { get; set; }
        public string ScannedImage { get; set; }
    }
}