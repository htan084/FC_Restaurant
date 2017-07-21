using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FC_Restaurant.Models
{
    public class EmployeeViewModel
    {
        public int StaffId { get; set; }
        public int EmployeeTypeId { get; set; }
        public Nullable<int> Salary { get; set; }
        public Nullable<int> PersonId { get; set; }


    }
}