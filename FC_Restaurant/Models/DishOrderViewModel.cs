using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FC_Restaurant.Models
{
    public class DishOrderViewModel
    {
        public MenuViewModel MenuViewModel { get; set; }
        [Range(1, 100)]
        public int  Quantity { get; set; }
        public int TableId { get; set; }
    }
}