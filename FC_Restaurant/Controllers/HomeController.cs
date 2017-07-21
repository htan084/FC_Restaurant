using FC_Restaurant.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FC_Restaurant.Controllers
{
    public class HomeController : Controller
    {
        private FT_RestaurantEntities db = new FT_RestaurantEntities();

        public ActionResult FCMainPage()
        {
            return View();
        }

        public ActionResult StaffManagement()
        {
            var staffList = db.Employees.ToList();
            var staffModelList = ConvertToEmployeeViewModelList(staffList);
            return View(staffModelList);
        }

        public ActionResult TableManagementage()
        {
            return View();
        }

        public ActionResult SupplierMangement()
        {
            return View();
        }

        public List<EmployeeViewModel> ConvertToEmployeeViewModelList(List<Employee> employees)
        {
            var employeeModelList = new List<EmployeeViewModel>();
            foreach (var employee in employees)
            {
                var employeeModel = new EmployeeViewModel
                {
                    StaffId = employee.StaffId,
                    PersonId = employee.PersonId,
                    
                };
                employeeModelList.Add(employeeModel);
            }
            return employeeModelList;
        }
    }
}