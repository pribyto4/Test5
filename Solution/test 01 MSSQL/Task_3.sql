CREATE PROCEDURE [dbo].[IncreaseBid] @AuctionId [int], @UserId [nvarchar](128), @TicketsCount [int]
AS
DECLARE @NumberOfBids int;
DECLARE @MaxAmount money;
DECLARE @Step money;
DECLARE @NewAmount money;
SELECT @NumberOfBids = COUNT(AuctionId) FROM [dbo].[Bid] WHERE AuctionId = @AuctionId AND UserId = @UserId GROUP BY UserId
IF (@NumberOfBids IS NOT NULL)
BEGIN
SELECT @MaxAmount = MAX(Amount) FROM [dbo].[Bid] WHERE AuctionId = @AuctionId AND UserId = @UserId GROUP BY UserId
SELECT @Step = Step FROM [dbo].[BidRange] WHERE AuctionId = @AuctionId AND @MaxAmount>=AmountFrom AND @MaxAmount<AmountTo
SET @NewAmount = @MaxAmount+@Step;
END
ELSE
SELECT @NewAmount = MIN(AmountFrom) FROM [dbo].[BidRange] WHERE AuctionId = @AuctionId
INSERT INTO [dbo].[Bid] (AuctionId, UserId, Amount, TicketsCount, State, Created, CreatedBy, Modified, ModifiedBy) VALUES (@AuctionId, @UserId, @NewAmount, @TicketsCount, 1, GETUTCDATE(),  NEWID(), GETUTCDATE(), NEWID());
