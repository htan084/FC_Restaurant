using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FC_Restaurant.Models
{
    public class MenuViewModel
    {
        public int DishId { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int DishCatagoryId { get; set; }
        public string Descripition { get; set; }
    }
}