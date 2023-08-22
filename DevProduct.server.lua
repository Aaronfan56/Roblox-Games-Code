local MarketplaceService  = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

local productFunction = {}

-- ProductId 1234 Give Your Players something
productFunction[1234] = function(receipt, player)
	--[[
		Your code here, and remove the comment





	--]]
	return true
end

local function processReceipt(receiptInfo)
	local userId = receiptInfo.PlayerId
	local productId = receiptInfo.ProductId

	local player = Players:GetPlayerByUserId(userId)
	if player then
		-- Get the handler function associated with the developer product ID and attempt to run it
		local handler = productFunctions[productId]
		local success, result = pcall(handler, receiptInfo, player)
		if success then
			-- The user has received their benefits!
			-- return PurchaseGranted to confirm the transaction.
			return Enum.ProductPurchaseDecision.PurchaseGranted
		else
			warn("Failed to process receipt:", receiptInfo, result)
		end
	end

	-- the user's benefits couldn't be awarded.
	-- return NotProcessedYet to try again next time the user joins.
	return Enum.ProductPurchaseDecision.NotProcessedYet
end

-- Set the callback; this can only be done once by one script on the server!
MarketplaceService.ProcessReceipt = processReceipt