SET NOCOUNT ON
SELECT albu.AuctionId,albu.Name,SUM(albu.Amount) AS Total FROM (SELECT alb.UserId,alb.AuctionId,alb.Name,MAX(alb.Amount) AS Amount FROM (SELECT Bid.UserId,al.AuctionId,al.Name,Bid.Amount FROM (SELECT AuctionId,l.Name FROM (SELECT * FROM [dbo].[AuctionLocalized] WHERE LanguageId=1) l INNER JOIN [dbo].[Auction] ON l.AuctionId=Auction.Id) al INNER JOIN [dbo].[Bid] ON al.AuctionId=Bid.AuctionId) alb INNER JOIN [dbo].[AspNetUsers] ON alb.UserId=AspNetUsers.Id GROUP BY alb.UserId,alb.AuctionId,alb.Name) albu GROUP BY albu.AuctionId,albu.Name
FOR JSON PATH, ROOT('Earnings');
GO
