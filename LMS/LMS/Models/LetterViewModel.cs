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
        [Required]
        public int Id { get; set; }
        [Required(ErrorMessage = "Invalid Input")]
        [StringLength(20,ErrorMessage ="Sender not be exceed")]
        public string Sender { get; set; }
        [Required(ErrorMessage = "Invalid Input")]
        [StringLength(20, ErrorMessage = "Responsible not be exceed")]
        public string Responsible { get; set; }
        [Required(ErrorMessage = "Invalid Input")]
        [StringLength(20, ErrorMessage = "Subject not be exceed")]
        public string Subject { get; set; }
        [Required(ErrorMessage = "Invalid Input")]
        [StringLength(20, ErrorMessage = "ReferenceNo not be exceed")]
        public string ReferenceNo { get; set; }
        [Required(ErrorMessage = "Invalid Input")]
        [DataType(DataType.Date)]
        public System.DateTime LetterDate { get; set; }
        [Required(ErrorMessage = "Invalid Input")]
        [DataType(DataType.Date)]
        public System.DateTime ReceiveDate { get; set; }
        public HttpPostedFileBase ImageFile { get; set; }
        [Required(ErrorMessage = "Invalid Input")]
        [StringLength(20, ErrorMessage = "Type not be exceed")]
        public string Type { get; set; }
        [Required(ErrorMessage = "Invalid Input")]
        [StringLength(20, ErrorMessage = "StatusOfLetter not be exceed")]
        public string StatusOfLetter { get; set; }
        [Required(ErrorMessage = "Invalid Input")]
        [StringLength(20, ErrorMessage = "ScannedImage not be exceed")]
        public string ScannedImage { get; set; }
        public int DesignationId { get; set; }
        public int LetterStatusId { get; set; }
        public int LetterTypeId { get; set; }
        public int LetterFromId { get; set; }
    }
}