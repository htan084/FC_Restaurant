using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FC_Restaurant.Models
{
    public class OrderViewModel
    {
        public int OrderId { get; set; }
        public string OrderDate { get; set; }
        public int StaffId { get; set; }
        public int OrderNumber { get; set; }
        public Nullable<int> CustomerId { get; set; }
    }
}