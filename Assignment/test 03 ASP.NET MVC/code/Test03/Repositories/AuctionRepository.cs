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

            string connectionString = ConfigurationManager.ConnectionStrings["Auctions"].ConnectionString;

            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string sqlCommandText = 
                  @"SELECT 
                        u.Email, 
                        MAX(b.Amount) AS MaxAmount 
                    FROM 
                        Bid AS b
                    INNER JOIN
                        AspNetUsers AS u ON b.UserId = u.Id
                    WHERE 
                        b.AuctionId = @AuctionId
                    GROUP BY 
                        u.Email 
                    ORDER BY 
                        MaxAmount DESC";

                using (var command = new SqlCommand(sqlCommandText, connection))
                {
                    command.Parameters.AddWithValue("AuctionId", auctionId);

                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var bid = new Bid();
                            bid.Email = reader.GetString(0);
                            bid.Amount = reader.GetDecimal(1);

                            bidList.Add(bid);
                        }
                    }
                }
            }

            return bidList;
        }
    }
}