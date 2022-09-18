using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using Test03.Models;

namespace Test03.Repositories
{
    public class AuctionRepository
    {
        public IList<Bid> GetMaxUserBids(int auctionId)
        {
            var bidList = new List<Bid>();

            // TODO: Implement test solution here

            return bidList;
        }
    }
}