using FC_Restaurant.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FC_Restaurant.Controllers
{
    public class OrderController : Controller
    {
        private FT_RestaurantEntities db = new FT_RestaurantEntities();

        public ActionResult TableManagement()
        {           
            return View();
        }

        public ActionResult GetOrderList()
        {
            var orders = db.Orders.ToList();
            var orderModelList = ConvertToOrderViewModelList(orders);
            return View(orderModelList);
        }

        public ActionResult ShowMenuDropdownList(string catagoryId)
        {
            ViewBag.catagoryId = catagoryId;
            return View();
        }

        public List<OrderViewModel> ConvertToOrderViewModelList(List<Order> orders)
        {
            var orderModelList = new List<OrderViewModel>();
            foreach (var order in orders)
            {
                var orderModel = new OrderViewModel
                {
                    OrderId = order.OrderId,
                    OrderNumber = order.OrderNumber,
                    StaffId = order.StaffId,
                    OrderDate = order.OrderDate.ToString("d"),
                    CustomerId = order.CustomerId
                };
                orderModelList.Add(orderModel);
            }
            return orderModelList;
        }

        public ActionResult getAvaliabeTables()
        {
            var tableList = new List<Table>();
            var avaliableTables = db.Tables.Where(x => x.TableAvaibility == true || x.TableAvaibility == null).ToList();
            if (avaliableTables != null && avaliableTables.Any())
            {
                avaliableTables.ForEach(m => tableList.Add(new Table
                {
                    TableId = m.TableId,
                    TableNumber = m.TableNumber
                }));
            }
                var dropdownList = (from m in tableList
                                    select new
                                    {
                                        TableId = m.TableId,
                                        TableNumber = m.TableNumber
                                    });          
            return Json(dropdownList, JsonRequestBehavior.AllowGet);

        }
        public ActionResult GetDishType()
        {
            var catagoryList = new List<DishType>();
            var catagory = db.DishTypes.ToList();
            if (catagory != null && catagory.Any())
            {
                catagory.ForEach(m => catagoryList.Add(new DishType
                {
                    DishCatagoryId = m.DishCatagoryId,
                    Name = m.Name
                }));
            }
            var dropdownList = (from m in catagoryList
                                select new
                                {
                                    DishCatagoryId = m.DishCatagoryId,
                                    DishcatagoryName = m.Name
                                });
            return Json(dropdownList, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ShowMenuDetail(int dishId)
        {
            var dish = db.Menus.Single(x => x.DishId == dishId);
            var dishModel = ConvertToMenuViewModel(dish);
            return View(dishModel);
        }

        public ActionResult GetDishes(int? catagoryId)
        {
            var dishList = new List<Menu>();
            List<Menu> dishes = null;
            if (catagoryId == null || catagoryId == 0)
            {
                dishes = db.Menus.ToList();
            }
            else
            {
                dishes = db.Menus.Where(x => x.DishCatagoryId == catagoryId).ToList();
            }
            if (dishes != null && dishes.Any())
            {
                dishes.ForEach(x => dishList.Add(new Menu
                {
                    DishId = x.DishId,
                    Name = x.Name
                }));
            }
            var dropdownList = (from m in dishList
                                select new
                                {
                                    dishId = m.DishId,
                                    dishName = m.Name
                                });
            return Json(dropdownList, JsonRequestBehavior.AllowGet);
        }

        public void AddDish(int dishId,int quantity)
        {           
            var dish = db.Menus.Single(x => x.DishId == dishId);
            var dishModel = ConvertToMenuViewModel(dish);
            var dishOrderModel = new DishOrderViewModel
            {
                MenuViewModel = dishModel,
                Quantity = quantity
                
            };
            if(Session["OrderMenu"] == null)
            {
                var dishOrderModelList = new List<DishOrderViewModel>();
                dishOrderModelList.Add(dishOrderModel);
                Session["OrderMenu"] = dishOrderModelList;
            }
            else
            {
                var dishOrderModelList = (List<DishOrderViewModel>)Session["OrderMenu"];
                int index = IsExsiting(dishId, dishOrderModelList);
                if(index != -1)
                {
                    dishOrderModelList[index].Quantity += quantity;
                }
                else
                {
                    dishOrderModelList.Add(dishOrderModel);
                }
                Session["OrderMenu"] = dishOrderModelList;
            }
        }

        public ActionResult FinaliseOrder(int tableId)
        {
           
            Random rad = new Random();
            Order order = new Order
            {
                CustomerId = 1,
                OrderDate = DateTime.Now.Date,
                OrderNumber = rad.Next(10000, 99999),
                StaffId = 5,               
            };
            db.Orders.Add(order);
            db.SaveChanges();

            var dishOrderModelList = (List<DishOrderViewModel>)Session["OrderMenu"];
            foreach (var item in dishOrderModelList)
            {
                OrderMenuDetial orderMebuDetail = new OrderMenuDetial
                {
                    DishId = item.MenuViewModel.DishId,
                    OrderId = order.OrderId,
                    Description = item.MenuViewModel.Descripition,
                    Quantity = item.Quantity
                };
                db.OrderMenuDetials.Add(orderMebuDetail);
            }

            TableOrder tableOrder = new TableOrder
            {
                OrderId = order.OrderId,
                TableId = tableId,
                StartTime = DateTime.Now
            };
            db.TableOrders.Add(tableOrder);

            var table = db.Tables.Single(x => x.TableId == tableId);
            table.TableAvaibility = false;
            db.SaveChanges();
            Session["OrderMenu"] = null;
            return Content("<script> alert('Congratulations!your order has been sent')");
        }

        public void EditDishOrder(int dishId, int quantity)
        {
            var dishOrderModelList = (List<DishOrderViewModel>)Session["OrderMenu"];
            foreach (var item in dishOrderModelList)
            {
                if(item.MenuViewModel.DishId == dishId)
                {
                    item.Quantity = quantity;
                }
            }
            Session["OrderMenu"] = dishOrderModelList;
        }

        public ActionResult ViewOrderedDish()
        {
            var dishOrderModelList = (List<DishOrderViewModel>)Session["OrderMenu"];
            return View(dishOrderModelList);
        }

        private int IsExsiting(int dishId, List<DishOrderViewModel> dishOrderModelList)
        {
            int index = -1;
            for (int i = 0; i < dishOrderModelList.Count(); i++)
            {
                if(dishOrderModelList[i].MenuViewModel.DishId == dishId)
                {
                    index = i;
                }
            }
            return index;
        }

        public MenuViewModel ConvertToMenuViewModel(Menu dish)
        {
            var dishModel = new MenuViewModel
            {
                DishId = dish.DishId,
                Descripition = dish.Descripition,
                DishCatagoryId = dish.DishCatagoryId,
                Name = dish.Name,
                Price = dish.Price
            };
            return dishModel;
        }
    }
}