local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("p2p", function(source)
    TriggerClientEvent("BodyCam:Toggle", source)
end)