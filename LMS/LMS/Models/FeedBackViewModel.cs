using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LMS.Models
{
    public class FeedBackViewModel
    {
        public int Id { get; set; }
        [DataType(DataType.Date)]
        public System.DateTime Date { get; set; }
        public string LetterStatus { get; set; }
        public string ReferenceNo { get; set; }
        public string Responsible { get; set; }
        public string Assign { get; set; }
        public string Comment { get; set; }
    }
    //public enum LetterStatus
    //{
    //    InProcess,
    //    Closed
    //}
}