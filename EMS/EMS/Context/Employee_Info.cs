//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EMS.Context
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Employee_Info
    {
        public int Id { get; set; }
        
        public string EmployeeName { get; set; }
        
        public string BranchName { get; set; }
        
        public string DepartmentName { get; set; }
        
        public string EmployeeType { get; set; }
        
        public string SupervisorName { get; set; }
        
        public string SupervisorDesignation { get; set; }
    }
}
