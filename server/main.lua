QBCore = nil

QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback("qb-vendingmachine:money_check", function(source, callback)
	local player = QBCore.Functions.GetPlayer(source)

	if player then
		if player.PlayerData.money['cash'] >= Config.price then
			player.Functions.RemoveMoney('cash', Config.price)
			

			callback(true)
		else
			callback(false)
		end
	else
		callback(false)
	end
end)

RegisterNetEvent("VendingMachine:server:update_thirst", function(amount)
    local src = source
	local newThirst
	local oldThirst
	local Player = QBCore.Functions.GetPlayer(src)
	oldThirst = Player.PlayerData.metadata['thirst']

	if oldThirst < 100 then
		newThirst = Player.PlayerData.metadata['thirst'] + amount
		Player.Functions.SetMetaData('thirst', newThirst)
	else
		Player.Functions.SetMetaData('thirst', 100)
	end
end)
