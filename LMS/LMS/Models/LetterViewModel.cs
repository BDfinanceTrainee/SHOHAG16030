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
        public string Sender { get; set; }
        public string Responsible { get; set; }
        public string Subject { get; set; }
        public string ReferenceNo { get; set; }
        [DataType(DataType.Date)]
        public System.DateTime LetterDate { get; set; }
        [DataType(DataType.Date)]
        public System.DateTime ReceiveDate { get; set; }
        public HttpPostedFileBase ImageFile { get; set; }
        public string Type { get; set; }
        public string StatusOfLetter { get; set; }
        public string ScannedImage { get; set; }
        //public int DesignationId { get; set; }
        //public int  LetterStatusId { get; set; }
        //public int LetterTypeId { get; set; }
        //public int LetterFromId { get; set; }
    }
}