local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("bodycam", function(source)
    TriggerClientEvent("BodyCam:Toggle", source)
end)
