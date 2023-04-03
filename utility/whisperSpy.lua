local function send(colorz, msg)
    local bc = BrickColor.new(colorz)
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = msg;
        Color = bc.Color;
    })
end

function loadStalk(plr)
plr.Chatted:Connect(function(msg)
warn("--------------------------------")
print("[" .. plr.Name .. "]: " .. msg)
if string.find(msg, "/w ") then
for i=4,1000 do
if string.sub(msg,i,i) == " " then
send("Really red", "[" .. plr.Name .. " -> " .. string.sub(msg,4,i-1) .. "]:" .. string.sub(msg,i))
wait()
break
end
end
end
if string.find(msg, "/whisper ") then
for i=4,1000 do
if string.sub(msg,i,i) == " " then
send("Really red", "[" .. plr.Name .. " to " .. string.sub(msg,10,i-1) .. "]:" .. string.sub(msg,i))
wait()
break
end
end
end
if string.find(msg, "/e ") then
send("Tr. Yellow", "[" .. plr.Name .. "]: " .. msg)
wait()
end
if string.find(msg, "/t ") then
if plr.Team ~= game.Players.LocalPlayer.Team then
for i=4,1000 do
if string.sub(msg,i,i) == " " then
send("Light blue", "[" .. plr.Name .. " TEAM -> " .. tostring(plr.Team) .. "]:" .. string.sub(msg,i))
wait()
break
end
end
end
end
if string.find(msg, "/team ") then
if plr.Team ~= game.Players.LocalPlayer.Team then
for i=7,1000 do
if string.sub(msg,i,i) == " " then
send("Light blue", "[" .. plr.Name .. " TEAM -> " .. tostring(plr.Team) .. "]:" .. string.sub(msg,i))
wait()
break
end
end
end
end
end)
end

local players = game.Players:GetPlayers()
for i=1,#players do
--if players[i].Name ~= game.Players.LocalPlayer.Name then
loadStalk(players[i])
--end
end

game:GetService("Players").PlayerAdded:Connect(function(plr)
loadStalk(plr)
end)
