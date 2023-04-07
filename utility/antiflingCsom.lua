-- // Constants \\ --
-- [ Services ] --
local Services = setmetatable({}, {__index = function(Self, Index)
local NewService = game.GetService(game, Index)
if NewService then
Self[Index] = NewService
end
return NewService
end})

wait(3)
-- [ LocalPlayer ] --
local LocalPlayer = Services.Players.LocalPlayer
local canFling = false
local mouse = LocalPlayer:GetMouse()



-- // Functions \\ --
local function PlayerAdded(Player)
   local Detected = false
   local Character;
   local PrimaryPart;

   local function CharacterAdded(NewCharacter)
       Character = NewCharacter
       repeat
           wait()
           PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart")
       until PrimaryPart
       Detected = false
   end

   CharacterAdded(Player.Character or Player.CharacterAdded:Wait())
   Player.CharacterAdded:Connect(CharacterAdded)
   Services.RunService.Heartbeat:Connect(function()
       if (Character and Character:IsDescendantOf(workspace)) and (PrimaryPart and PrimaryPart:IsDescendantOf(Character)) then
           if PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 or PrimaryPart.AssemblyLinearVelocity.Magnitude > 100 then
               if Detected == false then
                   game.StarterGui:SetCore("ChatMakeSystemMessage", {
                       Text = "[Warn] A fling exploit was detected from: " .. tostring(Player).. ". This could be a false positive.";
                       Color = Color3.fromRGB(255, 200, 0);
                   })
               end
               Detected = true
               for i,v in ipairs(Character:GetDescendants()) do
                   if v:IsA("BasePart") then
                       v.CanCollide = false
                       v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                       v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                       v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                   end
               end
               PrimaryPart.CanCollide = false
               PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
           end
       end
   end)
end

local ui = Instance.new("ScreenGui")
ui.Parent = game.CoreGui
local text = Instance.new("TextLabel")
text.Position = UDim2.new(0.914, 0, 0.902, 0)
text.Size = UDim2.new(0.086, 0, 0.04, 0)
text.BackgroundTransparency = 1
text.TextColor3 = Color3.fromRGB(0, 170, 0)
text.Font = Enum.Font.RobotoCondensed
text.TextStrokeTransparency = 0.5
text.Text = "ANTIFLING"
text.TextScaled = true
text.Parent = ui

Services.Players.PlayerAdded:Connect(PlayerAdded)
mouse.KeyDown:Connect(function(key)
    if key == "f" then
        if canFling == false then
            canFling = true
            game.StarterGui:SetCore("ChatMakeSystemMessage", {
               Text = "You have disabled your fling protection.";
               Color = Color3.fromRGB(255, 0, 0);
           })
            text.Visible = false
       else
           canFling = false
            game.StarterGui:SetCore("ChatMakeSystemMessage", {
               Text = "You have enabled your fling protection.";
               Color = Color3.fromRGB(0, 200, 0);
           })
            text.Visible = true
        end
    end
end)


local LastPosition = nil
Services.RunService.Heartbeat:Connect(function()
   pcall(function()
       local PrimaryPart = LocalPlayer.Character.PrimaryPart
       if PrimaryPart.AssemblyLinearVelocity.Magnitude > 250 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 250 then
           if canFling == false then
           PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
           PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
           PrimaryPart.CFrame = LastPosition

           game.StarterGui:SetCore("ChatMakeSystemMessage", {
               Text = "You were flung but your velocity was neutralized.";
               Color = Color3.fromRGB(255, 0, 0);
           })
           end
       elseif PrimaryPart.AssemblyLinearVelocity.Magnitude < 50 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 then
           LastPosition = PrimaryPart.CFrame
       end
   end)
end)
local clientHumanoid = LocalPlayer.Character.Humanoid
Services.RunService.Heartbeat:Connect(function()
        if (clientHumanoid) then
            local state = clientHumanoid:GetState().Name
            if (state == 'FallingDown' or state == 'Ragdoll') then
                if canFling == false then
                clientHumanoid:ChangeState(10) 
                end
            end
        end
    end)


LocalPlayer.CharacterAdded:Connect(function(char)
    if char:WaitForChild("Humanoid") then
        char.Humanoid.StateChanged:Connect(function(_oldState, newState)
            if newState == Enum.HumanoidStateType.Ragdoll or newState == Enum.HumanoidStateType.FallingDown then
                if canFling == false then
                    char.Humanoid:ChangeState(10)
                end
            end
        end)
    end
end)

game.StarterGui:SetCore("ChatMakeSystemMessage", {
  Text = "Anti fling script initialized. Your fling protection is ON.";
  Color = Color3.fromRGB(0, 170, 0);
})

-- // CASSETTE PLAYER REMOVAL \\ --

local function removeCassette()
for i,v in ipairs(Services.Players:GetPlayers()) do
    if v ~= LocalPlayer then
        if v.Character then
        for _,item in pairs(v.Character:GetChildren()) do
            if item.Name == "Cassette Player" or item.Name == "Cassette Tape" then
                  game.StarterGui:SetCore("ChatMakeSystemMessage", {
                  Text = "[Warn] "..v.Name.. " equipped a cassette player. It has been removed from their character.";
                  Color = Color3.fromRGB(255, 200, 0);
                  })
                item:Destroy()
            end
        end
        end
    end
end
   end

while task.wait(.5) do
   removeCassette()
end


-- // Event Listeners \\ --
for i,v in ipairs(Services.Players:GetPlayers()) do
   if v ~= LocalPlayer then
       PlayerAdded(v)
   end
end



