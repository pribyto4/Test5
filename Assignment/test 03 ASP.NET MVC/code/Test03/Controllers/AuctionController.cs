using System.Web.Mvc;
using Test03.Repositories;

namespace Test03.Controllers
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