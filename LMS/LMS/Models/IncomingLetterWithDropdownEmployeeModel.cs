using LMS.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LMS.Models
{
    public class IncomingLetterWithDropdownEmployeeModel
    {
        public LetterViewModel LetterViewModel { get; set; }
        public Designation Designation { get; set; }
    }
}