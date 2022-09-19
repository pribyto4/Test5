SELECT AspNetUsers.Email AS Email,max(Amount) AS MaxAmount FROM (SELECT * FROM [dbo].[Bid] WHERE AuctionId=1) b INNER JOIN [dbo].[AspNetUsers] ON b.UserId=AspNetUsers.Id GROUP BY AspNetUsers.Email ORDER BY MaxAmount DESC
GO
