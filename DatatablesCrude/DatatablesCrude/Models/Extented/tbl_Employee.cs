using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DatatablesCrude.Models
{
    [MetadataType(typeof(tbl_EmployeeMetadata))]
    public partial class tbl_Employee
    {
    }
    public class tbl_EmployeeMetadata
    {
        [Required(AllowEmptyStrings = false,ErrorMessage ="Please Provide First name")]
        public string FirstName { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "Please Provide Last name")]
        public string LastName { get; set; }


    }
}