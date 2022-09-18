SELECT AspNetUsers.Email AS Email,max(Amount) AS MaxAmount FROM (SELECT * FROM Bid WHERE AuctionId=1) SelectBid INNER JOIN AspNetUsers ON SelectBid.UserId=AspNetUsers.Id GROUP BY AspNetUsers.Email ORDER BY MaxAmount DESC
GO
