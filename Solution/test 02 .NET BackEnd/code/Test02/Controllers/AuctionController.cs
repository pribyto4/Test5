using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Test02.Models;
using Microsoft.EntityFrameworkCore;
using Test02.Repositories;

namespace Test02.Controllers
{
    public class AuctionController : Controller
    {
        public ActionResult Detail(int id)
        {
            var repository = new AuctionRepository();
            var bids = repository.GetMaxUserBids(id);

            ViewBag.AuctionId = id;

            return View(bids);
        }    
    }
}