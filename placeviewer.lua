local DiscordLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt"))()
local win = DiscordLib:Window("Universe Viewer")
local serv = win:Server("Places of " .. tostring(game.GameId), "http://www.roblox.com/asset/?id=6031075938")
local MarketplaceService = game:GetService("MarketplaceService")
local placename = MarketplaceService:GetProductInfo(game.PlaceId).Name
local AssetService = game:GetService("AssetService")
local pages = AssetService:GetGamePlacesAsync()

repeat
    for _, v in pairs(pages:GetCurrentPage()) do
        local placename = v.Name
        local placeid = v.PlaceId
        local subplace = serv:Channel(placename)
        subplace:Label("Place Name: " .. placename)
        subplace:Label("Place ID: " .. tostring(placeid))
        subplace:Seperator()
        subplace:Button("Teleport", function()
            game:GetService("TeleportService"):Teleport(placeid)
        end)
        subplace:Button("Copy Teleport Script", function()
            setclipboard('game:GetService("TeleportService"):Teleport(' .. tostring(placeid) .. ')')
        end)
    end
    if pages.IsFinished then
        break
    end
    pages:AdvanceToNextPageAsync()
until pages.IsFinished
