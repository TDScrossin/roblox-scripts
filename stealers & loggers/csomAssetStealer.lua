local players = game:GetService("Players")
local player = players.LocalPlayer
local tweenService = game:GetService("TweenService")

-- UI CORE COMPONENTS
local UI = Instance.new("ScreenGui")
UI.Parent = game.CoreGui
local backgroundFrame = Instance.new("Frame")
local textToCopy = ""
local minimized = false
local debounce = false

-- UI LOADING COMPONENTS
local loadingHolder = Instance.new("Frame")
local loadingTitle = Instance.new("TextLabel")
local loadingSub = Instance.new("TextLabel")
local loadingText = Instance.new("TextLabel")
local barHolder = Instance.new("Frame")
local barLoad = Instance.new("Frame")

-- UI AFTERLOAD COMPONENTS
local topBar = Instance.new("Frame")
local closeButton = Instance.new("TextButton")
local minButton = Instance.new("TextButton")
local assetHolder = Instance.new("Frame")
local accessoryScroll = Instance.new("ScrollingFrame")
local template = Instance.new("TextLabel")
local copyClipboard = Instance.new("TextButton")
local uiCorner = Instance.new("UICorner")
local scrollerUILayout = Instance.new("UIListLayout")
local shirtLabel = Instance.new("TextLabel")
local pantsLabel = Instance.new("TextLabel")
local assetTitle = Instance.new("TextLabel")
local accessoriesTitle = Instance.new("TextLabel")
local rpName = Instance.new("TextLabel")
local searchBox = Instance.new("TextBox")
local topbarTitle = Instance.new("TextLabel")


-- UI FUNCTIONS
local function loadUI()
    -- ESTABLISH UI ATTRIBUTES
    backgroundFrame.BackgroundColor3 = Color3.fromRGB(127,122,118)
    backgroundFrame.BorderSizePixel = 0
    backgroundFrame.Position = UDim2.new(0.381, 0, 0.362, 0)
    backgroundFrame.Size = UDim2.new(0,0,0,0)
   
    loadingHolder.BackgroundTransparency = 1
    loadingHolder.Size = UDim2.new(1,0,1,0)
    
    loadingTitle.Font = Enum.Font.Roboto
    loadingTitle.TextColor3 = Color3.fromRGB(255,255,255)
    loadingTitle.TextScaled = true
    loadingTitle.RichText = true
    loadingTitle.Position = UDim2.new(0,0,0.085,0)
    loadingTitle.Size = UDim2.new(1,0,0.198,0)
    loadingTitle.Text = "<b>ASSET LOGGER</b>"
    loadingTitle.TextTransparency = 1
    loadingTitle.BackgroundTransparency = 1
    
    loadingSub.Font = Enum.Font.Roboto
    loadingSub.TextColor3 = Color3.fromRGB(255,255,255)
    loadingSub.TextScaled = false
    loadingSub.Position = UDim2.new(0.286,0,0.283,0)
    loadingSub.Size = UDim2.new(0.425,0,0.094,0)
    loadingSub.TextSize = 14
    loadingSub.Text = "for all your CSOM needs"
    loadingSub.TextTransparency = 1
    loadingSub.BackgroundTransparency = 1
    
    loadingText.Font = Enum.Font.Roboto
    loadingText.TextColor3 = Color3.fromRGB(255,255,255)
    loadingText.TextScaled = false
    loadingText.Position = UDim2.new(0.286,0,0.589,0)
    loadingText.Size = UDim2.new(0.425,0,0.094,0)
    loadingText.TextSize = 14
    loadingText.Text = "Loading UI..."
    loadingText.TextTransparency = 1
    loadingText.BackgroundTransparency = 1
    
    barHolder.BorderSizePixel = 0
    barHolder.Position = UDim2.new(0.257, 0, 0.769, 0)
    barHolder.Size = UDim2.new(0,0,0.085,0)
    
    barLoad.BackgroundColor3 = Color3.fromRGB(85,170,255)
    barLoad.BorderSizePixel = 0
    barLoad.Position = UDim2.new(0,0,0,0)
    barLoad.Size = UDim2.new(0,0,1,0)

    local initialLoadTween = tweenService:Create(backgroundFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Size = UDim2.new(0.236, 0, 0.274, 0)})
    local uiLoadTween1 = tweenService:Create(loadingTitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {TextTransparency = 0});
    local uiLoadTween2 = tweenService:Create(loadingSub, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {TextTransparency = 0});
    local uiLoadTween3 = tweenService:Create(barHolder, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Size = UDim2.new(0.483, 0, 0.085, 0)});
    local uiLoadTween4 = tweenService:Create(loadingText, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {TextTransparency = 0});

    local bar25 = tweenService:Create(barLoad, TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Size = UDim2.new(0.359,0,1,0)});
    local bar70 = tweenService:Create(barLoad, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Size = UDim2.new(0.755,0,1,0)});
    local bar100 = tweenService:Create(barLoad, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Size = UDim2.new(1,0,1,0)});

    backgroundFrame.Parent = UI
    loadingHolder.Parent = backgroundFrame
    barHolder.Parent = loadingHolder
    barLoad.Parent = barHolder
    loadingSub.Parent = loadingHolder
    loadingText.Parent = loadingHolder
    loadingTitle.Parent = loadingHolder
    
    initialLoadTween:Play()
    
    initialLoadTween.Completed:connect(function()
        initialLoadTween:Destroy()
        uiLoadTween1:Play()
    end)
    
    uiLoadTween1.Completed:connect(function()
        uiLoadTween1:Destroy()
        uiLoadTween2:Play()
    end)
    
    uiLoadTween2.Completed:connect(function()
        uiLoadTween2:Destroy()
        uiLoadTween3:Play()
    end)
    
    uiLoadTween3.Completed:connect(function()
        uiLoadTween3:Destroy()
        uiLoadTween4:Play()
    end)
    
    uiLoadTween4.Completed:connect(function()
        uiLoadTween4:Destroy()
        bar25:Play()
    end)
    
    -- ESTABLISH UI AFTERLOAD ELEMENT ATTRIBUTES
    backgroundFrame.ClipsDescendants = true
    
    assetHolder.Position = UDim2.new(1, 0, 0.239, 0)
    assetHolder.Size = UDim2.new(0.971, 0, 0.725, 0)
    assetHolder.BackgroundColor3 = Color3.fromRGB(49,47,46)
    assetHolder.BackgroundTransparency = 0.3
    assetHolder.BorderSizePixel = 0
    assetHolder.Parent = backgroundFrame
    
    accessoryScroll.BackgroundTransparency = 1
    accessoryScroll.Position = UDim2.new(0.464, 0, 0.44, 0)
    accessoryScroll.Size = UDim2.new(0.489, 0, 0.522, 0)
    accessoryScroll.AutomaticCanvasSize = Enum.AutomaticSize.XY
    accessoryScroll.CanvasSize = UDim2.new(0,0,0.3,0)
    accessoryScroll.Parent = assetHolder
    scrollerUILayout.Parent = accessoryScroll
    
    template.BackgroundTransparency = 1
    template.Size = UDim2.new(0, 397, 0, 50)
    template.Font = Enum.Font.Roboto
    template.TextScaled = true
    template.TextColor3 = Color3.new(1,1,1)
    
    copyClipboard.BackgroundColor3 = Color3.fromRGB(127,122,118)
    copyClipboard.Font = Enum.Font.Roboto
    copyClipboard.RichText = true
    copyClipboard.Text = "<b>Copy Assets to Clipboard</b>"
    copyClipboard.TextColor3 = Color3.new(1,1,1)
    copyClipboard.TextScaled = true
    copyClipboard.Position = UDim2.new(0.08, 0, 0.769, 0)
    copyClipboard.Size = UDim2.new(0.286, 0, 0.162, 0)
    copyClipboard.Visible = false
    copyClipboard.Parent = assetHolder
    
    local newUI = uiCorner:Clone()
    newUI.Parent = copyClipboard
    newUI.CornerRadius = UDim.new(1,0)
    
    shirtLabel.BackgroundTransparency = 1
    shirtLabel.Font = Enum.Font.Roboto
    shirtLabel.TextSize = 30
    shirtLabel.TextWrapped = true
    shirtLabel.TextTruncate = Enum.TextTruncate.AtEnd
    shirtLabel.TextColor3 = Color3.new(1,1,1)
    shirtLabel.Position = UDim2.new(0.026, 0, 0.321, 0)
    shirtLabel.Size = UDim2.new(0.393, 0, 0.165, 0)
    shirtLabel.Visible = false
    shirtLabel.Parent = assetHolder
    
    pantsLabel.BackgroundTransparency = 1
    pantsLabel.Font = Enum.Font.Roboto
    pantsLabel.TextSize = 30
    pantsLabel.TextWrapped = true
    pantsLabel.TextTruncate = Enum.TextTruncate.AtEnd
    pantsLabel.TextColor3 = Color3.new(1,1,1)
    pantsLabel.Position = UDim2.new(0.026, 0, 0.55, 0)
    pantsLabel.Size = UDim2.new(0.393, 0, 0.165, 0)
    pantsLabel.Visible = false
    pantsLabel.Parent = assetHolder
    
    assetTitle.BackgroundTransparency = 1
    assetTitle.Font = Enum.Font.Roboto
    assetTitle.TextSize = 30
    assetTitle.TextScaled = true
    assetTitle.TextColor3 = Color3.new(1,1,1)
    assetTitle.Position = UDim2.new(0.296, 0, 0, 0)
    assetTitle.Size = UDim2.new(0.41, 0, 0.129, 0)
    assetTitle.Visible = false
    assetTitle.Parent = assetHolder
    
    accessoriesTitle.BackgroundTransparency = 1
    accessoriesTitle.Font = Enum.Font.Roboto
    accessoriesTitle.TextSize = 30
    accessoriesTitle.TextScaled = true
    accessoriesTitle.TextColor3 = Color3.new(1,1,1)
    accessoriesTitle.Position = UDim2.new(0.503, 0, 0.296, 0)
    accessoriesTitle.Size = UDim2.new(0.41, 0, 0.129, 0)
    accessoriesTitle.Visible = false
    accessoriesTitle.Text = "Accessories"
    accessoriesTitle.Parent = assetHolder
    
    rpName.BackgroundTransparency = 1
    rpName.Font = Enum.Font.Roboto
    rpName.TextSize = 30
    rpName.TextWrapped = true
    rpName.TextTruncate = Enum.TextTruncate.AtEnd
    rpName.TextColor3 = Color3.new(1,1,1)
    rpName.Position = UDim2.new(0.304, 0, 0.149, 0)
    rpName.Size = UDim2.new(0.393, 0, 0.082, 0)
    rpName.Visible = false
    rpName.Parent = assetHolder
    
    topBar.BackgroundColor3 = Color3.fromRGB(98, 94, 91)
    topBar.BorderSizePixel = 0
    topBar.Position = UDim2.new(0,0,-0.1, 0)
    topBar.Size = UDim2.new(1, 0, 0.037, 0)
    topBar.Parent = UI
    topBar.Visible = false
    
    closeButton.BackgroundColor3 = Color3.fromRGB(98, 94, 91)
    closeButton.BorderSizePixel = 0
    closeButton.Position = UDim2.new(0.96, 0, 0, 0)
    closeButton.Size = UDim2.new(0.04, 0, 1, 0)
    closeButton.Font = Enum.Font.Roboto
    closeButton.RichText = true
    closeButton.Text = "<b>X</b>"
    closeButton.TextColor3 = Color3.new(1,1,1)
    closeButton.TextScaled = true
    closeButton.Parent = topBar
    
    minButton.BackgroundColor3 = Color3.fromRGB(98, 94, 91)
    minButton.BorderSizePixel = 0
    minButton.Position = UDim2.new(0.92, 0, 0, 0)
    minButton.Size = UDim2.new(0.04, 0, 1, 0)
    minButton.Font = Enum.Font.Roboto
    minButton.RichText = true
    minButton.Text = "<b>-</b>"
    minButton.TextColor3 = Color3.new(1,1,1)
    minButton.TextScaled = true
    minButton.Parent = topBar
    
    
    topbarTitle.BackgroundTransparency = 1
    topbarTitle.Position = UDim2.new(0.309, 0, 0,0)
    topbarTitle.Size = UDim2.new(0.393, 0, 1, 0)
    topbarTitle.RichText = true
    topbarTitle.Font = Enum.Font.Roboto
    topbarTitle.TextScaled = true
    topbarTitle.Text = "<b>Asset Stealer</b>"
    topbarTitle.TextColor3 = Color3.new(1,1,1)
    topbarTitle.TextTransparency = 1
    topbarTitle.Parent = topBar
    
    searchBox.BackgroundColor3 = Color3.fromRGB(98, 94, 91)
    searchBox.Position = UDim2.new(1, 0, 0.084, 0)
    searchBox.Size = UDim2.new(0.636, 0, 0.093, 0)
    searchBox.TextColor3 = Color3.new(1,1,1)
    searchBox.TextScaled = true
    searchBox.PlaceholderText = "Type username here (not case sensitive)"
    searchBox.Text = ""
    searchBox.Parent = backgroundFrame
    uiCorner.Parent = searchBox
    uiCorner.CornerRadius = UDim.new(1,0)
    
    
    
    bar25.Completed:Connect(function()
        bar25:Destroy()
        task.wait(.5)
        loadingText.Text = "Fetching players..."
        bar70:Play()
    end)
    
    bar70.Completed:Connect(function()
        bar70:Destroy()
       
        loadingText.Text = "Finishing up..."
         task.wait(0.2)
        bar100:Play()
    end)
    
    
    bar100.Completed:Connect(function()
        bar100:Destroy()
        loadingText.Text = "Finished!"
        task.wait(1)
        for i,v in pairs (loadingHolder:GetDescendants()) do
            if v:IsA("TextLabel") then
                tweenService:Create(v, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {TextTransparency = 1}):Play()
            end
        end
        task.wait(.4)
        local barFinalize = tweenService:Create(barHolder, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 0, 0.085, 0)})
        local uiLoadLast = tweenService:Create(backgroundFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Size = UDim2.new(0.236, 0, 0, 0)});
        local uiLoadLast2 = tweenService:Create(topBar, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Size = UDim2.new(0.61, 0, 0.035, 0)});
        
        local assetTween = tweenService:Create(assetHolder, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Position = UDim2.new(0.014, 0, 0.239, 0)})
        local searchTween = tweenService:Create(searchBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Position = UDim2.new(0.182, 0, 0.084, 0)})
        local topbarTween = tweenService:Create(backgroundFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Size = UDim2.new(1, 0, 21.046, 0)})
        local topbarTitleTween = tweenService:Create(topbarTitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {TextTransparency = 0})
       
        barFinalize.Completed:Connect(function()
            barFinalize:Destroy()
            task.wait(0.2)
            loadingHolder:Destroy()
            uiLoadLast:Play()
            --UI:Destroy()
        end)
        barFinalize:Play()
        
        uiLoadLast.Completed:Connect(function()
            uiLoadLast:Destroy()
            topBar.ClipsDescendants = true
            backgroundFrame.Parent = topBar
            backgroundFrame.Size = UDim2.new(1, 0, 0, 0)
            backgroundFrame.Position = UDim2.new(0,0, 0.984, 0)
            topBar.Parent = UI
            topBar.Size = UDim2.new(0, 0, 0.035, 0)
            topBar.Position = UDim2.new(0.195, 0, 0.168, 0)
            topBar.Visible = true
            uiLoadLast2:Play()
        end)
        
        uiLoadLast2.Completed:Connect(function()
            uiLoadLast2:Destroy()
            topBar.ClipsDescendants = false
            topbarTween:Play()
            task.wait(0.6)
            assetTween:Play()
            task.wait(0.3)
            searchTween:Play()
            task.wait(0.3)
            topbarTitleTween:Play()
            assetTween:Destroy()
            searchTween:Destroy()
            topbarTween:Destroy()
            topbarTitleTween:Destroy()
        end)
    end)
end

local function getPlayer(name)
    for i,v in pairs (players:GetPlayers()) do
        if name:lower() == v.Name:lower() then
            return v
        end
    end
end

local function getAssets(plr)
    local playerToGet = getPlayer(plr)
    
    if not playerToGet then
        return;
    end
    
    local character = playerToGet.Character
    if not character then
        return;
    end
    
    for i,v in pairs (accessoryScroll:GetChildren()) do
        if v:IsA("TextLabel") then
            v:Destroy()
        end
    end
    
    
    
    assetTitle.Text = "Assets for ".. playerToGet.DisplayName
    rpName.Text = "(@"..playerToGet.Name..")"
    local shirtAsset = playerToGet.Character.Shirt.ShirtTemplate
    local pantsAsset = playerToGet.Character.Pants.PantsTemplate
    
    local thingTable = {}

    for i,v in pairs (playerToGet.Character:GetChildren()) do
        if v:IsA("Accessory") then
            if v.Handle:FindFirstChild("SpecialMesh") then
                table.insert(thingTable, v.Name.. " - MeshAsset: ".. v.Handle.SpecialMesh.MeshId.. " - TextID: " ..v.Handle.SpecialMesh.TextureId)
            else
                table.insert(thingTable, v.Name.. " - MeshAsset: ".. v.Handle.Mesh.MeshId.. " - TextID: " ..v.Handle.Mesh.TextureId)
            end
        end
    end
    
    
    shirtLabel.Text = "Current Shirt:\n"..shirtAsset
    pantsLabel.Text = "Current Pants:\n"..pantsAsset
    
    for i,v in pairs (thingTable) do
        local newTemplate = template:Clone()
        newTemplate.Text = v
        newTemplate.Parent = accessoryScroll
    end
    
    textToCopy =  "-------------------------------------------\n"..playerToGet.Name.." asset dump:\nShirt: " .. shirtAsset.."\nPants: ".. pantsAsset.."\n\nAccessories:\n" .. table.concat(thingTable, "\n\n").. "\n-------------------------------------------"
     
    assetTitle.Visible = true
    shirtLabel.Visible = true
    pantsLabel.Visible = true
    accessoriesTitle.Visible = true
    assetTitle.Visible = true
    rpName.Visible = true
    copyClipboard.Visible = true
end

local function copyAssetsToClipboard()
setclipboard(textToCopy)
end

local function minimize()
    if minimized == false then
        minimized = true
        tweenService:Create(backgroundFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Size = UDim2.new(1, 0, 0, 0)}):Play()
        task.wait(0.4)
        topBar.ClipsDescendants = true
        tweenService:Create(topBar, TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Size = UDim2.new(0.239, 0, 0.035, 0)}):Play()
    else
        minimized = false
        tweenService:Create(topBar, TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Size = UDim2.new(0.61, 0, 0.035, 0)}):Play()
        task.wait(0.7)
        topBar.ClipsDescendants = false
        tweenService:Create(backgroundFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Size = UDim2.new(1, 0, 21.046, 0)}):Play()
    end
end

local function exitUI()
     tweenService:Create(backgroundFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Size = UDim2.new(1, 0, 0, 0)}):Play()
        task.wait(0.3)
        topBar.ClipsDescendants = true
        tweenService:Create(topBar, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 0, 0.035, 0)}):Play()
        task.wait(0.7)
        UI:Destroy()
end


minButton.MouseButton1Click:Connect(function()
    if debounce == false then
        debounce = true
        minimize()
        task.wait(1)
        debounce = false
    end
end)

closeButton.MouseButton1Click:Connect(function()
    exitUI()
end)

copyClipboard.MouseButton1Click:Connect(function()
    copyAssetsToClipboard()
end)

--DRAGGING FUNCTION
local UserInputService = game:GetService("UserInputService")
local runService = (game:GetService("RunService"));

local gui = topBar

local dragging
local dragInput
local dragStart
local startPos

function Lerp(a, b, m)
	return a + (b - a) * m
end;

local lastMousePos
local lastGoalPos
local DRAG_SPEED = (25);
function Update(dt)
	if not (startPos) then return end;
	if not (dragging) and (lastGoalPos) then
		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
		return 
	end;

	local delta = (lastMousePos - UserInputService:GetMouseLocation())
	local xGoal = (startPos.X.Offset - delta.X);
	local yGoal = (startPos.Y.Offset - delta.Y);
	lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
	gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
end;

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position
		lastMousePos = UserInputService:GetMouseLocation()

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

runService.Heartbeat:Connect(Update)

local function onFocusLost(enterPressed)
    if enterPressed then
        getAssets(searchBox.Text)
    end
end

searchBox.FocusLost:Connect(onFocusLost)



loadUI()
