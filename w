repeat wait() until game:IsLoaded()
local gameid = game.PlaceId
--[[if gameid == 6381829480 or gameid == 4520749081 then
	game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Stats")
	game:GetService("Players").LocalPlayer:WaitForChild("PlayerStats")
end]]
repeat wait() until game:IsLoaded()
local RadientPaid = {}
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local HttpService = game:GetService("HttpService")
local pfp
local user
local tag
local userinfo = {}

_G.Key = ""
_G.Discord = ""

if game.CoreGui:FindFirstChild(_G.Key .."," .. _G.Discord) then
	game.CoreGui:FindFirstChild(_G.Key .."," .. _G.Discord):Destroy()
end
local ModuleSave = {}

local Config = setmetatable({},{__newindex=function(tables,key,value) rawset(tables,key,value) end})
local ConfigSetting = {FileName=game.Players.LocalPlayer.Name.."KL",Folder="Hyper",AutoSave=true}

function ModuleSave:Create()
	local FileName = ConfigSetting.FileName;
	local FolderName = ConfigSetting.Folder;
	if not isfolder(FolderName) then
		makefolder(FolderName);
	end
	if not isfile(FolderName.."/"..FileName..".json") then
		xpcall(function()
			writefile(FolderName.."/"..FileName..".json","{}")
		end,function(k)
			return {false,k}
		end)
	else
		return {true,"Folder Created."}
	end
end
function ModuleSave:Loadfile()
	local FileName = ConfigSetting.FileName;
	local FolderName = ConfigSetting.Folder;
	if not isfolder(FolderName) then
		ModuleSave:Create();
	end
	if isfile(FolderName.."/"..FileName..".json") then
		xpcall(function()
			local data = game:GetService("HttpService"):JSONDecode(readfile(FolderName..'/'..FileName..".json"))
			Config = data
			return {true,data}
		end,function(x)
			return {false,x}
		end)
	else
		do
			ModuleSave:Create();
		end
		return {false,"Somethings error in Line :"..debug.traceback()}
	end
end
function ModuleSave:SaveFile()
	local FileName = ConfigSetting.FileName;
	local FolderName = ConfigSetting.Folder;
	if not isfolder(FolderName) then
		ModuleSave:Create();
	end
	if isfile(FolderName.."/"..FileName..".json") then
		local Success,data = pcall(game.HttpService.JSONEncode,game.HttpService,Config)
			if not Success then
				return {false,"Somethings error pls try again."..debug.traceback()}
			end
			writefile(FolderName..'/'..FileName..".json",data)
			return {true,"Success to readfile"}
	else
		do
			ModuleSave:Create();
		end
		return {false,"Somethings error in Line :"..debug.traceback()}
	end
end
pcall(function()
	userinfo = HttpService:JSONDecode(readfile("Ex.txt"));
end)

pfp = userinfo["pfp"] or "https://www.roblox.com/headshot-thumbnail/image?userId=".. game.Players.LocalPlayer.UserId .."&width=420&height=420&format=png"
user =  userinfo["user"] or game.Players.LocalPlayer.Name
tag = userinfo["tag"] or tostring(math.random(1,10))

local function SaveInfo()
	userinfo["pfp"] = pfp
	userinfo["user"] = user
	userinfo["tag"] = tag
	writefile("Ex.txt", HttpService:JSONEncode(userinfo));
end

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(StartPosition.X.Scale,StartPosition.X.Offset + Delta.X,StartPosition.Y.Scale,StartPosition.Y.Offset + Delta.Y)
		local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						Dragging = false
					end
				end)
			end
		end)

	topbarobject.InputChanged:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				DragInput = input
			end
		end)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end)
end

local RadientPaidSC = Instance.new("ScreenGui")
RadientPaidSC.Name = _G.Key .."," .. _G.Discord
RadientPaidSC.Parent = game.CoreGui
RadientPaidSC.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

game:GetService("UserInputService").InputBegan:connect(function(inputObject, gameProcessedEvent)
	if inputObject.KeyCode == Enum.KeyCode.L then
		wait()
		RadientPaidSC.Enabled = not RadientPaidSC.Enabled
	end
end)

function RadientPaid:Window(text,maincolor)

	local currentservertoggled = ""
	local minimized = false
	local fs = false
	local settingsopened = false
	local MainFrame = Instance.new("Frame")
	local TopFrame = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local CloseBtn = Instance.new("TextButton")
	local CloseIcon = Instance.new("ImageLabel")
	local MinimizeBtn = Instance.new("TextButton")
	local MinimizeIcon = Instance.new("ImageLabel")
	local ServersHolder = Instance.new("Folder")
	local Userpad = Instance.new("Frame")
	local UserIcon = Instance.new("Frame")
	local UserIconCorner = Instance.new("UICorner")
	local Corner_1 = Instance.new("UICorner")
	local UserImage = Instance.new("ImageLabel")
	local UserCircleImage = Instance.new("ImageLabel")
	local UserName = Instance.new("TextLabel")
	local UserTag = Instance.new("TextLabel")
	local ServersHoldFrame = Instance.new("Frame")
	local ServersHold = Instance.new("ScrollingFrame")
	local ServersHoldLayout = Instance.new("UIListLayout")
	local ServersHoldPadding = Instance.new("UIPadding")
	local TopFrameHolder = Instance.new("Frame")
	local TopFramess = Instance.new("Frame")

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = RadientPaidSC
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(28,28,33)
	MainFrame.BackgroundTransparency = 1
	MainFrame.BorderSizePixel = 0
	MainFrame.ClipsDescendants = true
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.Size = UDim2.new(0, 611, 0, 396)

	Corner_1.CornerRadius = UDim.new(0, 7)
	Corner_1.Name = "UserIconCorner"
	Corner_1.Parent = MainFrame

	TopFrame.Name = "TopFrame"
	TopFrame.Parent = MainFrame
	TopFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
	TopFrame.BackgroundTransparency = 1
	TopFrame.BorderSizePixel = 0
	TopFrame.Position = UDim2.new(-0.000658480625, 0, 0, 0)
	TopFrame.Size = UDim2.new(0, 681, 0, 22)

	TopFramess.Name = "TopFramess"
	TopFramess.Parent = TopFrame
	TopFramess.BackgroundColor3 = Color3.fromRGB(255,255,255)
	TopFramess.BackgroundTransparency = 1
	TopFramess.BorderSizePixel = 0
	TopFramess.ZIndex = 99
	TopFramess.Position = UDim2.new(-0.2, 0, 1.3, 0)
	TopFramess.Size = UDim2.new(0, 681, 0, 22)

	TopFrameHolder.Name = "TopFrameHolder"
	TopFrameHolder.Parent = TopFrame
	TopFrameHolder.BackgroundColor3 = Color3.fromRGB(20,20,20)
	TopFrameHolder.BackgroundTransparency = 1.000
	TopFrameHolder.BorderSizePixel = 0
	TopFrameHolder.Position = UDim2.new(-0.000658480625, 0, 0, 0)
	TopFrameHolder.Size = UDim2.new(0, 20, 0, 22)


	Title.Name = "Title"
	Title.Parent = TopFrame
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0102790017, 0, 0, 0)
	Title.Size = UDim2.new(0, 192, 0, 23)
	Title.Font = Enum.Font.GothamBold
	Title.Text = text
	Title.TextTransparency = 0
	Title.TextColor3 = Color3.fromRGB(255,255,255)
	Title.TextSize = 13.000
	Title.TextXAlignment = Enum.TextXAlignment.Left

	CloseBtn.Name = "CloseBtn"
	CloseBtn.Parent = TopFrame
	CloseBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
	CloseBtn.BackgroundTransparency = 1
	CloseBtn.Position = UDim2.new(0.85, 0, 1.3, 0)
	CloseBtn.Size = UDim2.new(0, 28, 0, 22)
	CloseBtn.Font = Enum.Font.Gotham
	CloseBtn.Text = ""
	CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	CloseBtn.TextSize = 14.000
	CloseBtn.BorderSizePixel = 0
	CloseBtn.AutoButtonColor = false

	CloseIcon.Name = "CloseIcon"
	CloseIcon.Parent = CloseBtn
	CloseIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseIcon.BackgroundTransparency = 1.000
	CloseIcon.Position = UDim2.new(0.2, 0, 0.128935531, 0)
	CloseIcon.Size = UDim2.new(0, 17, 0, 17)
	CloseIcon.Image = "http://www.roblox.com/asset/?id=6035047409"
	CloseIcon.ImageColor3 = Color3.fromRGB(220, 221, 222)

	MinimizeBtn.Name = "MinimizeButton"
	MinimizeBtn.Parent = TopFrame
	MinimizeBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
	MinimizeBtn.BackgroundTransparency = 1
	MinimizeBtn.Position = UDim2.new(0.8, 0, 1.3, 0)
	MinimizeBtn.Size = UDim2.new(0, 28, 0, 22)
	MinimizeBtn.Font = Enum.Font.Gotham
	MinimizeBtn.Text = ""
	MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	MinimizeBtn.TextSize = 14.000
	MinimizeBtn.BorderSizePixel = 0
	MinimizeBtn.AutoButtonColor = false

	MinimizeIcon.Name = "MinimizeLabel"
	MinimizeIcon.Parent = MinimizeBtn
	MinimizeIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MinimizeIcon.BackgroundTransparency = 1.000
	MinimizeIcon.Position = UDim2.new(0.2, 0, 0.128935531, 0)
	MinimizeIcon.Size = UDim2.new(0, 17, 0, 17)
	MinimizeIcon.Image = "http://www.roblox.com/asset/?id=6035067836"
	MinimizeIcon.ImageColor3 = Color3.fromRGB(220, 221, 222)

	ServersHolder.Name = "ServersHolder"
	ServersHolder.Parent = TopFrameHolder

	Userpad.Name = "Userpad"
	Userpad.Parent = TopFrameHolder
	Userpad.BackgroundColor3 = Color3.fromRGB(20,20,20)
	Userpad.BorderSizePixel = 0
	Userpad.Position = UDim2.new(0.106243297, 0, 15.9807148, 0)
	Userpad.Size = UDim2.new(0, 179, 0, 43)

	UserIcon.Name = "UserIcon"
	UserIcon.Parent = Userpad
	UserIcon.BackgroundColor3 = Color3.fromRGB(20,20,20)
	UserIcon.BorderSizePixel = 0
	UserIcon.Position = UDim2.new(0.0340000018, 0, 0.123999998, 0)
	UserIcon.Size = UDim2.new(0, 32, 0, 32)

	UserIconCorner.CornerRadius = UDim.new(1, 8)
	UserIconCorner.Name = "UserIconCorner"
	UserIconCorner.Parent = UserIcon

	UserImage.Name = "UserImage"
	UserImage.Parent = UserIcon
	UserImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserImage.BackgroundTransparency = 1.000
	UserImage.Size = UDim2.new(0, 32, 0, 32)
	UserImage.Image = ""

	UserCircleImage.Name = "UserImage"
	UserCircleImage.Parent = UserImage
	UserCircleImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserCircleImage.BackgroundTransparency = 1.000
	UserCircleImage.Size = UDim2.new(0, 32, 0, 32)
	UserCircleImage.Image = "rbxassetid://4031889928"
	UserCircleImage.ImageColor3 = Color3.fromRGB(20,20,20)

	UserName.Name = "UserName"
	UserName.Parent = Userpad
	UserName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserName.BackgroundTransparency = 1.000
	UserName.BorderSizePixel = 0
	UserName.Position = UDim2.new(0.230000004, 0, 0.115999997, 0)
	UserName.Size = UDim2.new(0, 98, 0, 17)
	UserName.Font = Enum.Font.GothamSemibold
	UserName.TextSize = 13.000
	UserName.TextTransparency = 1
	UserName.TextXAlignment = Enum.TextXAlignment.Left
	UserName.ClipsDescendants = true

	UserTag.Name = "UserTag"
	UserTag.Parent = Userpad
	UserTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserTag.BackgroundTransparency = 1.000
	UserTag.BorderSizePixel = 0
	UserTag.Position = UDim2.new(0.230000004, 0, 0.275000013, 0)
	UserTag.Size = UDim2.new(0, 95, 0, 17)
	UserTag.Font = Enum.Font.GothamBold
	UserTag.TextColor3 = Color3.fromRGB(231,23,55)
	UserTag.TextSize = 13.000
	UserTag.TextTransparency = 0
	UserTag.TextXAlignment = Enum.TextXAlignment.Left

	UserName.Text = "Hyper"
	UserTag.Text = ""

	ServersHoldFrame.Name = "ServersHoldFrame"
	ServersHoldFrame.Parent = MainFrame
	ServersHoldFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ServersHoldFrame.BackgroundTransparency = 1.000
	ServersHoldFrame.BorderColor3 = Color3.fromRGB(20,20,20)
	ServersHoldFrame.Size = UDim2.new(0, 71, 0, 396)

	ServersHold.Name = "ServersHold"
	ServersHold.Parent = ServersHoldFrame
	ServersHold.Active = true
	ServersHold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ServersHold.BackgroundTransparency = 1.000
	ServersHold.BorderSizePixel = 0
	ServersHold.Position = UDim2.new(-0.000359333731, 0, 0.0580808073, 0)
	ServersHold.Size = UDim2.new(0, 71, 0, 373)
	ServersHold.ScrollBarThickness = 1
	ServersHold.ScrollBarImageTransparency = 1
	ServersHold.CanvasSize = UDim2.new(0, 0, 0, 0)

	ServersHoldLayout.Name = "ServersHoldLayout"
	ServersHoldLayout.Parent = ServersHold
	ServersHoldLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ServersHoldLayout.Padding = UDim.new(0, 7)

	ServersHoldPadding.Name = "ServersHoldPadding"
	ServersHoldPadding.Parent = ServersHold

	CloseBtn.MouseButton1Click:Connect(
		function()
			MainFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .5, true)
		end
	)

	CloseBtn.MouseEnter:Connect(
		function()
			CloseBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
		end
	)

	CloseBtn.MouseLeave:Connect(
		function()
			CloseBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
		end
	)

	MinimizeBtn.MouseEnter:Connect(
		function()
			MinimizeBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
		end
	)

	MinimizeBtn.MouseLeave:Connect(
		function()
			MinimizeBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
		end
	)

	MinimizeBtn.MouseButton1Click:Connect(
		function()
			if minimized == false then
				MainFrame:TweenSize(
					UDim2.new(0, 611, 0, 64),
					Enum.EasingDirection.Out,
					Enum.EasingStyle.Quart,
					.3,
					true
				)
			else
				MainFrame:TweenSize(
					UDim2.new(0, 611, 0, 396),
					Enum.EasingDirection.Out,
					Enum.EasingStyle.Quart,
					.3,
					true
				)
			end
			minimized = not minimized
		end
	)

	local SettingsOpenBtn = Instance.new("TextButton")
	local SettingsOpenBtnIco = Instance.new("ImageLabel")

	SettingsOpenBtn.Name = "SettingsOpenBtn"
	SettingsOpenBtn.Parent = Userpad
	SettingsOpenBtn.BackgroundColor3 = Color3.fromRGB(53, 56, 62)
	SettingsOpenBtn.BackgroundTransparency = 1.000
	SettingsOpenBtn.Position = UDim2.new(0.849161983, 0, 0.279069781, 0)
	SettingsOpenBtn.Size = UDim2.new(0, 0, 0, 0)
	SettingsOpenBtn.Font = Enum.Font.SourceSans
	SettingsOpenBtn.Text = ""
	SettingsOpenBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	SettingsOpenBtn.TextSize = 14.000

	SettingsOpenBtnIco.Name = "SettingsOpenBtnIco"
	SettingsOpenBtnIco.Parent = SettingsOpenBtn
	SettingsOpenBtnIco.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
	SettingsOpenBtnIco.BackgroundTransparency = 1.000
	SettingsOpenBtnIco.Size = UDim2.new(0, 0, 0, 0)
	SettingsOpenBtnIco.ImageTransparency = 1
	SettingsOpenBtnIco.Image = "http://www.roblox.com/asset/?id=6031280882"
	SettingsOpenBtnIco.ImageColor3 = Color3.fromRGB(220, 220, 220)
	local SettingsFrame = Instance.new("Frame")
	local Settings = Instance.new("Frame")
	local SettingsHolder = Instance.new("Frame")
	local CloseSettingsBtn = Instance.new("TextButton")
	local CloseSettingsBtnCorner = Instance.new("UICorner")
	local CloseSettingsBtnCircle = Instance.new("Frame")
	local CloseSettingsBtnCircleCorner = Instance.new("UICorner")
	local CloseSettingsBtnIcon = Instance.new("ImageLabel")
	local TextLabel = Instance.new("TextLabel")
	local UserPanel = Instance.new("Frame")
	local UserSettingsPad = Instance.new("Frame")
	local UserSettingsPadCorner = Instance.new("UICorner")
	local UsernameText = Instance.new("TextLabel")
	local UserSettingsPadUserTag = Instance.new("Frame")
	local UserSettingsPadUser = Instance.new("TextLabel")
	local UserSettingsPadUserTagLayout = Instance.new("UIListLayout")
	local UserSettingsPadTag = Instance.new("TextLabel")
	local EditBtn = Instance.new("TextButton")
	local EditBtnCorner = Instance.new("UICorner")
	local UserPanelUserIcon = Instance.new("TextButton")
	local UserPanelUserImage = Instance.new("ImageLabel")
	local UserPanelUserCircle = Instance.new("ImageLabel")
	local BlackFrame = Instance.new("Frame")
	local BlackFrameCorner = Instance.new("UICorner")
	local ChangeAvatarText = Instance.new("TextLabel")
	local SearchIcoFrame = Instance.new("Frame")
	local SearchIcoFrameCorner = Instance.new("UICorner")
	local SearchIco = Instance.new("ImageLabel")
	local UserPanelUserTag = Instance.new("Frame")
	local UserPanelUser = Instance.new("TextLabel")
	local UserPanelUserTagLayout = Instance.new("UIListLayout")
	local UserPanelTag = Instance.new("TextLabel")
	local UserPanelCorner = Instance.new("UICorner")
	local LeftFrame = Instance.new("Frame")
	local MyAccountBtn = Instance.new("TextButton")
	local MyAccountBtnCorner = Instance.new("UICorner")
	local MyAccountBtnTitle = Instance.new("TextLabel")
	local SettingsTitle = Instance.new("TextLabel")
	local DiscordInfo = Instance.new("TextLabel")
	local CurrentSettingOpen = Instance.new("TextLabel")

	SettingsFrame.Name = "SettingsFrame"
	SettingsFrame.Parent = MainFrame
	SettingsFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
	SettingsFrame.BackgroundTransparency = 1.000
	SettingsFrame.Size = UDim2.new(0, 681, 0, 396)
	SettingsFrame.Visible = false

	Settings.Name = "Settings"
	Settings.Parent = SettingsFrame
	Settings.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
	Settings.BorderSizePixel = 0
	Settings.Position = UDim2.new(0, 0, 0.0530303046, 0)
	Settings.Size = UDim2.new(0, 681, 0, 375)

	SettingsHolder.Name = "SettingsHolder"
	SettingsHolder.Parent = Settings
	SettingsHolder.AnchorPoint = Vector2.new(0.5, 0.5)
	SettingsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SettingsHolder.BackgroundTransparency = 1.000
	SettingsHolder.ClipsDescendants = true
	SettingsHolder.Position = UDim2.new(0.49926579, 0, 0.498666674, 0)
	SettingsHolder.Size = UDim2.new(0, 0, 0, 0)

	CloseSettingsBtn.Name = "CloseSettingsBtn"
	CloseSettingsBtn.Parent = SettingsHolder
	CloseSettingsBtn.AnchorPoint = Vector2.new(0.5, 0.5)
	CloseSettingsBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
	CloseSettingsBtn.Position = UDim2.new(0.952967286, 0, 0.0853333324, 0)
	CloseSettingsBtn.Selectable = false
	CloseSettingsBtn.Size = UDim2.new(0, 30, 0, 30)
	CloseSettingsBtn.AutoButtonColor = false
	CloseSettingsBtn.Font = Enum.Font.SourceSans
	CloseSettingsBtn.Text = ""
	CloseSettingsBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	CloseSettingsBtn.TextSize = 14.000

	CloseSettingsBtnCorner.CornerRadius = UDim.new(1, 0)
	CloseSettingsBtnCorner.Name = "CloseSettingsBtnCorner"
	CloseSettingsBtnCorner.Parent = CloseSettingsBtn

	CloseSettingsBtnCircle.Name = "CloseSettingsBtnCircle"
	CloseSettingsBtnCircle.Parent = CloseSettingsBtn
	CloseSettingsBtnCircle.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
	CloseSettingsBtnCircle.Position = UDim2.new(0.0879999995, 0, 0.118000001, 0)
	CloseSettingsBtnCircle.Size = UDim2.new(0, 24, 0, 24)

	CloseSettingsBtnCircleCorner.CornerRadius = UDim.new(1, 0)
	CloseSettingsBtnCircleCorner.Name = "CloseSettingsBtnCircleCorner"
	CloseSettingsBtnCircleCorner.Parent = CloseSettingsBtnCircle

	CloseSettingsBtnIcon.Name = "CloseSettingsBtnIcon"
	CloseSettingsBtnIcon.Parent = CloseSettingsBtnCircle
	CloseSettingsBtnIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseSettingsBtnIcon.BackgroundTransparency = 1.000
	CloseSettingsBtnIcon.Position = UDim2.new(0, 2, 0, 2)
	CloseSettingsBtnIcon.Size = UDim2.new(0, 19, 0, 19)
	CloseSettingsBtnIcon.Image = "http://www.roblox.com/asset/?id=6035047409"
	CloseSettingsBtnIcon.ImageColor3 = Color3.fromRGB(222, 222, 222)

	CloseSettingsBtn.MouseButton1Click:Connect(function()
		settingsopened = false
		TopFrameHolder.Visible = true
		ServersHoldFrame.Visible = true
		SettingsHolder:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
		TweenService:Create(
			Settings,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 1}
		):Play()
		for i,v in next, SettingsHolder:GetChildren() do
			TweenService:Create(
				v,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
		end
		wait(.3)
		SettingsFrame.Visible = false
	end)

	CloseSettingsBtn.MouseEnter:Connect(function()
		CloseSettingsBtnCircle.BackgroundColor3 = Color3.fromRGB(72,76,82)
	end)

	CloseSettingsBtn.MouseLeave:Connect(function()
		CloseSettingsBtnCircle.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
	end)

	UserInputService.InputBegan:Connect(
		function(io, p)
			if io.KeyCode == Enum.KeyCode.L then
				if settingsopened == true then
					settingsopened = false
					TopFrameHolder.Visible = true
					ServersHoldFrame.Visible = true
					SettingsHolder:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
					TweenService:Create(
						Settings,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
					for i,v in next, SettingsHolder:GetChildren() do
						TweenService:Create(
							v,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundTransparency = 1}
						):Play()
					end
					wait(.3)
					SettingsFrame.Visible = false
				end
			end
		end
	)

	TextLabel.Parent = CloseSettingsBtn
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(-0.0666666701, 0, 1.06666672, 0)
	TextLabel.Size = UDim2.new(0, 34, 0, 22)
	TextLabel.Font = Enum.Font.GothamSemibold
	TextLabel.Text = "rightctrl"
	TextLabel.TextColor3 = Color3.fromRGB(113, 117, 123)
	TextLabel.TextSize = 11.000

	UserPanel.Name = "UserPanel"
	UserPanel.Parent = SettingsHolder
	UserPanel.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
	UserPanel.Position = UDim2.new(0.365638763, 0, 0.130666673, 0)
	UserPanel.Size = UDim2.new(0, 362, 0, 164)

	UserSettingsPad.Name = "UserSettingsPad"
	UserSettingsPad.Parent = UserPanel
	UserSettingsPad.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
	UserSettingsPad.Position = UDim2.new(0.0331491716, 0, 0.568140388, 0)
	UserSettingsPad.Size = UDim2.new(0, 337, 0, 56)

	UserSettingsPadCorner.Name = "UserSettingsPadCorner"
	UserSettingsPadCorner.Parent = UserSettingsPad

	UsernameText.Name = "UsernameText"
	UsernameText.Parent = UserSettingsPad
	UsernameText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UsernameText.BackgroundTransparency = 1.000
	UsernameText.Position = UDim2.new(0.0419999994, 0, 0.154714286, 0)
	UsernameText.Size = UDim2.new(0, 65, 0, 19)
	UsernameText.Font = Enum.Font.GothamBold
	UsernameText.Text = "USERNAME"
	UsernameText.TextColor3 = Color3.fromRGB(126, 130, 136)
	UsernameText.TextSize = 11.000
	UsernameText.TextXAlignment = Enum.TextXAlignment.Left

	UserSettingsPadUserTag.Name = "UserSettingsPadUserTag"
	UserSettingsPadUserTag.Parent = UserSettingsPad
	UserSettingsPadUserTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserSettingsPadUserTag.BackgroundTransparency = 1.000
	UserSettingsPadUserTag.Position = UDim2.new(0.0419999994, 0, 0.493999988, 0)
	UserSettingsPadUserTag.Size = UDim2.new(0, 65, 0, 19)

	UserSettingsPadUser.Name = "UserSettingsPadUser"
	UserSettingsPadUser.Parent = UserSettingsPadUserTag
	UserSettingsPadUser.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserSettingsPadUser.BackgroundTransparency = 1.000
	UserSettingsPadUser.Font = Enum.Font.Gotham
	UserSettingsPadUser.TextColor3 = Color3.fromRGB(255, 255, 255)
	UserSettingsPadUser.TextSize = 13.000
	UserSettingsPadUser.TextXAlignment = Enum.TextXAlignment.Left
	UserSettingsPadUser.Text = user
	UserSettingsPadUser.Size = UDim2.new(0, UserSettingsPadUser.TextBounds.X + 2, 0, 19)

	UserSettingsPadUserTagLayout.Name = "UserSettingsPadUserTagLayout"
	UserSettingsPadUserTagLayout.Parent = UserSettingsPadUserTag
	UserSettingsPadUserTagLayout.FillDirection = Enum.FillDirection.Horizontal
	UserSettingsPadUserTagLayout.SortOrder = Enum.SortOrder.LayoutOrder

	UserSettingsPadTag.Name = "UserSettingsPadTag"
	UserSettingsPadTag.Parent = UserSettingsPadUserTag
	UserSettingsPadTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserSettingsPadTag.BackgroundTransparency = 1.000
	UserSettingsPadTag.Position = UDim2.new(0.0419999994, 0, 0.493999988, 0)
	UserSettingsPadTag.Size = UDim2.new(0, 65, 0, 19)
	UserSettingsPadTag.Font = Enum.Font.Gotham
	UserSettingsPadTag.Text = "#" .. tag
	UserSettingsPadTag.TextColor3 = Color3.fromRGB(184, 186, 189)
	UserSettingsPadTag.TextSize = 13.000
	UserSettingsPadTag.TextXAlignment = Enum.TextXAlignment.Left

	EditBtn.Name = "EditBtn"
	EditBtn.Parent = UserSettingsPad
	EditBtn.BackgroundColor3 = Color3.fromRGB(116, 127, 141)
	EditBtn.Position = UDim2.new(0.797671914, 0, 0.232142866, 0)
	EditBtn.Size = UDim2.new(0, 55, 0, 30)
	EditBtn.Font = Enum.Font.Gotham
	EditBtn.Text = "Edit"
	EditBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	EditBtn.TextSize = 14.000
	EditBtn.AutoButtonColor = false

	EditBtn.MouseEnter:Connect(function()
		TweenService:Create(
			EditBtn,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundColor3 = Color3.fromRGB(104,114,127)}
		):Play()
	end)

	EditBtn.MouseLeave:Connect(function()
		TweenService:Create(
			EditBtn,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundColor3 = Color3.fromRGB(116, 127, 141)}
		):Play()
	end)

	EditBtnCorner.CornerRadius = UDim.new(0, 3)
	EditBtnCorner.Name = "EditBtnCorner"
	EditBtnCorner.Parent = EditBtn

	UserPanelUserIcon.Name = "UserPanelUserIcon"
	UserPanelUserIcon.Parent = UserPanel
	UserPanelUserIcon.BackgroundColor3 = Color3.fromRGB(31, 33, 36)
	UserPanelUserIcon.BorderSizePixel = 0
	UserPanelUserIcon.Position = UDim2.new(0.0340000018, 0, 0.074000001, 0)
	UserPanelUserIcon.Size = UDim2.new(0, 71, 0, 71)
	UserPanelUserIcon.AutoButtonColor = false
	UserPanelUserIcon.Text = ""

	UserPanelUserImage.Name = "UserPanelUserImage"
	UserPanelUserImage.Parent = UserPanelUserIcon
	UserPanelUserImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelUserImage.BackgroundTransparency = 1.000
	UserPanelUserImage.Size = UDim2.new(0, 71, 0, 71)
	UserPanelUserImage.Image = pfp

	UserPanelUserCircle.Name = "UserPanelUserCircle"
	UserPanelUserCircle.Parent = UserPanelUserImage
	UserPanelUserCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelUserCircle.BackgroundTransparency = 1.000
	UserPanelUserCircle.Size = UDim2.new(0, 71, 0, 71)
	UserPanelUserCircle.Image = "rbxassetid://4031889928"
	UserPanelUserCircle.ImageColor3 = Color3.fromRGB(47, 49, 54)

	BlackFrame.Name = "BlackFrame"
	BlackFrame.Parent = UserPanelUserIcon
	BlackFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	BlackFrame.BackgroundTransparency = 0.400
	BlackFrame.BorderSizePixel = 0
	BlackFrame.Size = UDim2.new(0, 71, 0, 71)
	BlackFrame.Visible = false

	BlackFrameCorner.CornerRadius = UDim.new(1, 8)
	BlackFrameCorner.Name = "BlackFrameCorner"
	BlackFrameCorner.Parent = BlackFrame

	ChangeAvatarText.Name = "ChangeAvatarText"
	ChangeAvatarText.Parent = BlackFrame
	ChangeAvatarText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ChangeAvatarText.BackgroundTransparency = 1.000
	ChangeAvatarText.Size = UDim2.new(0, 71, 0, 71)
	ChangeAvatarText.Font = Enum.Font.GothamBold
	ChangeAvatarText.Text = "CHAGNE    AVATAR"
	ChangeAvatarText.TextColor3 = Color3.fromRGB(255, 255, 255)
	ChangeAvatarText.TextSize = 11.000
	ChangeAvatarText.TextWrapped = true

	SearchIcoFrame.Name = "SearchIcoFrame"
	SearchIcoFrame.Parent = UserPanelUserIcon
	SearchIcoFrame.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
	SearchIcoFrame.Position = UDim2.new(0.657999992, 0, 0, 0)
	SearchIcoFrame.Size = UDim2.new(0, 20, 0, 20)

	SearchIcoFrameCorner.CornerRadius = UDim.new(1, 8)
	SearchIcoFrameCorner.Name = "SearchIcoFrameCorner"
	SearchIcoFrameCorner.Parent = SearchIcoFrame

	SearchIco.Name = "SearchIco"
	SearchIco.Parent = SearchIcoFrame
	SearchIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SearchIco.BackgroundTransparency = 1.000
	SearchIco.Position = UDim2.new(0.150000006, 0, 0.100000001, 0)
	SearchIco.Size = UDim2.new(0, 15, 0, 15)
	SearchIco.Image = "http://www.roblox.com/asset/?id=6034407084"
	SearchIco.ImageColor3 = Color3.fromRGB(114, 118, 125)

	UserPanelUserIcon.MouseEnter:Connect(function()
		BlackFrame.Visible = true
	end)

	UserPanelUserIcon.MouseLeave:Connect(function()
		BlackFrame.Visible = false
	end)

	UserPanelUserIcon.MouseButton1Click:Connect(function()
		local NotificationHolder = Instance.new("TextButton")
		NotificationHolder.Name = "NotificationHolder"
		NotificationHolder.Parent = SettingsHolder
		NotificationHolder.BackgroundColor3 = Color3.fromRGB(22,22,22)
		NotificationHolder.Position = UDim2.new(-0.00881057233, 0, -0.00266666664, 0)
		NotificationHolder.Size = UDim2.new(0, 687, 0, 375)
		NotificationHolder.AutoButtonColor = false
		NotificationHolder.Font = Enum.Font.SourceSans
		NotificationHolder.Text = ""
		NotificationHolder.TextColor3 = Color3.fromRGB(0, 0, 0)
		NotificationHolder.TextSize = 14.000
		NotificationHolder.BackgroundTransparency = 1
		NotificationHolder.Visible = true
		TweenService:Create(
			NotificationHolder,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0.2}
		):Play()



		local AvatarChange = Instance.new("Frame")
		local UserChangeCorner = Instance.new("UICorner")
		local UnderBar = Instance.new("Frame")
		local UnderBarCorner = Instance.new("UICorner")
		local UnderBarFrame = Instance.new("Frame")
		local Text1 = Instance.new("TextLabel")
		local Text2 = Instance.new("TextLabel")
		local TextBoxFrame = Instance.new("Frame")
		local TextBoxFrameCorner = Instance.new("UICorner")
		local TextBoxFrame1 = Instance.new("Frame")
		local TextBoxFrame1Corner = Instance.new("UICorner")
		local AvatarTextbox = Instance.new("TextBox")
		local ChangeBtn = Instance.new("TextButton")
		local ChangeCorner = Instance.new("UICorner")
		local CloseBtn2 = Instance.new("TextButton")
		local Close2Icon = Instance.new("ImageLabel")
		local CloseBtn1 = Instance.new("TextButton")
		local CloseBtn1Corner = Instance.new("UICorner")
		local ResetBtn = Instance.new("TextButton")
		local ResetCorner = Instance.new("UICorner")


		AvatarChange.Name = "AvatarChange"
		AvatarChange.Parent = NotificationHolder
		AvatarChange.AnchorPoint = Vector2.new(0.5, 0.5)
		AvatarChange.BackgroundColor3 = Color3.fromRGB(20,20,20)
		AvatarChange.ClipsDescendants = true
		AvatarChange.Position = UDim2.new(0.513071597, 0, 0.4746176, 0)
		AvatarChange.Size = UDim2.new(0, 0, 0, 0)
		AvatarChange.BackgroundTransparency = 1

		AvatarChange:TweenSize(UDim2.new(0, 346, 0, 198), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
		TweenService:Create(
			AvatarChange,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0}
		):Play()


		UserChangeCorner.CornerRadius = UDim.new(0, 5)
		UserChangeCorner.Name = "UserChangeCorner"
		UserChangeCorner.Parent = AvatarChange

		UnderBar.Name = "UnderBar"
		UnderBar.Parent = AvatarChange
		UnderBar.BackgroundColor3 = Color3.fromRGB(25,25,25)
		UnderBar.Position = UDim2.new(-0.000297061284, 0, 0.945048928, 0)
		UnderBar.Size = UDim2.new(0, 346, 0, 13)

		UnderBarCorner.CornerRadius = UDim.new(0, 5)
		UnderBarCorner.Name = "UnderBarCorner"
		UnderBarCorner.Parent = UnderBar

		UnderBarFrame.Name = "UnderBarFrame"
		UnderBarFrame.Parent = UnderBar
		UnderBarFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
		UnderBarFrame.BorderSizePixel = 0
		UnderBarFrame.Position = UDim2.new(-0.000297061284, 0, -2.53846145, 0)
		UnderBarFrame.Size = UDim2.new(0, 346, 0, 39)

		Text1.Name = "Text1"
		Text1.Parent = AvatarChange
		Text1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text1.BackgroundTransparency = 1.000
		Text1.Position = UDim2.new(-0.000594122568, 0, 0.0202020202, 0)
		Text1.Size = UDim2.new(0, 346, 0, 68)
		Text1.Font = Enum.Font.GothamSemibold
		Text1.Text = "Change your avatar"
		Text1.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text1.TextSize = 20.000

		Text2.Name = "Text2"
		Text2.Parent = AvatarChange
		Text2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text2.BackgroundTransparency = 1.000
		Text2.Position = UDim2.new(-0.000594122568, 0, 0.141587839, 0)
		Text2.Size = UDim2.new(0, 346, 0, 63)
		Text2.Font = Enum.Font.Gotham
		Text2.Text = "Enter your new profile in a Roblox decal link."
		Text2.TextColor3 = Color3.fromRGB(171, 172, 176)
		Text2.TextSize = 14.000

		TextBoxFrame.Name = "TextBoxFrame"
		TextBoxFrame.Parent = AvatarChange
		TextBoxFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBoxFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
		TextBoxFrame.Position = UDim2.new(0.49710983, 0, 0.560606062, 0)
		TextBoxFrame.Size = UDim2.new(0, 319, 0, 38)

		TextBoxFrameCorner.CornerRadius = UDim.new(0, 3)
		TextBoxFrameCorner.Name = "TextBoxFrameCorner"
		TextBoxFrameCorner.Parent = TextBoxFrame

		TextBoxFrame1.Name = "TextBoxFrame1"
		TextBoxFrame1.Parent = TextBoxFrame
		TextBoxFrame1.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBoxFrame1.BackgroundColor3 = Color3.fromRGB(48, 51, 57)
		TextBoxFrame1.ClipsDescendants = true
		TextBoxFrame1.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextBoxFrame1.Size = UDim2.new(0, 317, 0, 36)

		TextBoxFrame1Corner.CornerRadius = UDim.new(0, 3)
		TextBoxFrame1Corner.Name = "TextBoxFrame1Corner"
		TextBoxFrame1Corner.Parent = TextBoxFrame1

		AvatarTextbox.Name = "AvatarTextbox"
		AvatarTextbox.Parent = TextBoxFrame1
		AvatarTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		AvatarTextbox.BackgroundTransparency = 1.000
		AvatarTextbox.Position = UDim2.new(0.0378548913, 0, 0, 0)
		AvatarTextbox.Size = UDim2.new(0, 293, 0, 37)
		AvatarTextbox.Font = Enum.Font.Gotham
		AvatarTextbox.Text = ""
		AvatarTextbox.TextColor3 = Color3.fromRGB(193, 195, 197)
		AvatarTextbox.TextSize = 14.000
		AvatarTextbox.TextXAlignment = Enum.TextXAlignment.Left

		ChangeBtn.Name = "ChangeBtn"
		ChangeBtn.Parent = AvatarChange
		ChangeBtn.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
		ChangeBtn.Position = UDim2.new(0.749670506, 0, 0.823232353, 0)
		ChangeBtn.Size = UDim2.new(0, 76, 0, 27)
		ChangeBtn.Font = Enum.Font.Gotham
		ChangeBtn.Text = "Change"
		ChangeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		ChangeBtn.TextSize = 13.000
		ChangeBtn.AutoButtonColor = false

		ChangeBtn.MouseEnter:Connect(function()
			TweenService:Create(
				ChangeBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(103,123,196)}
			):Play()
		end)

		ChangeBtn.MouseLeave:Connect(function()
			TweenService:Create(
				ChangeBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)

		ChangeBtn.MouseButton1Click:Connect(function()
			pfp = tostring(AvatarTextbox.Text)
			UserImage.Image = pfp
			UserPanelUserImage.Image = pfp
			SaveInfo()

			AvatarChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				AvatarChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)



		ChangeCorner.CornerRadius = UDim.new(0, 4)
		ChangeCorner.Name = "ChangeCorner"
		ChangeCorner.Parent = ChangeBtn

		CloseBtn2.Name = "CloseBtn2"
		CloseBtn2.Parent = AvatarChange
		CloseBtn2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn2.BackgroundTransparency = 1.000
		CloseBtn2.Position = UDim2.new(0.898000002, 0, 0, 0)
		CloseBtn2.Size = UDim2.new(0, 26, 0, 26)
		CloseBtn2.Font = Enum.Font.Gotham
		CloseBtn2.Text = ""
		CloseBtn2.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn2.TextSize = 14.000

		Close2Icon.Name = "Close2Icon"
		Close2Icon.Parent = CloseBtn2
		Close2Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Close2Icon.BackgroundTransparency = 1.000
		Close2Icon.Position = UDim2.new(-0.0384615399, 0, 0.312910825, 0)
		Close2Icon.Size = UDim2.new(0, 25, 0, 25)
		Close2Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
		Close2Icon.ImageColor3 = Color3.fromRGB(119, 122, 127)

		CloseBtn1.Name = "CloseBtn1"
		CloseBtn1.Parent = AvatarChange
		CloseBtn1.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
		CloseBtn1.BackgroundTransparency = 1.000
		CloseBtn1.Position = UDim2.new(0.495000005, 0, 0.823000014, 0)
		CloseBtn1.Size = UDim2.new(0, 76, 0, 27)
		CloseBtn1.Font = Enum.Font.Gotham
		CloseBtn1.Text = "Close"
		CloseBtn1.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn1.TextSize = 13.000

		CloseBtn1Corner.CornerRadius = UDim.new(0, 4)
		CloseBtn1Corner.Name = "CloseBtn1Corner"
		CloseBtn1Corner.Parent = CloseBtn1

		ResetBtn.Name = "ResetBtn"
		ResetBtn.Parent = AvatarChange
		ResetBtn.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
		ResetBtn.BackgroundTransparency = 1.000
		ResetBtn.Position = UDim2.new(0.260895967, 0, 0.823000014, 0)
		ResetBtn.Size = UDim2.new(0, 76, 0, 27)
		ResetBtn.Font = Enum.Font.Gotham
		ResetBtn.Text = "Reset"
		ResetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		ResetBtn.TextSize = 13.000

		ResetBtn.MouseButton1Click:Connect(function()
			pfp = "https://www.roblox.com/headshot-thumbnail/image?userId=".. game.Players.LocalPlayer.UserId .."&width=420&height=420&format=png"
			UserImage.Image = pfp
			UserPanelUserImage.Image = pfp
			SaveInfo()

			AvatarChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				AvatarChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		ResetCorner.CornerRadius = UDim.new(0, 4)
		ResetCorner.Name = "ResetCorner"
		ResetCorner.Parent = ResetBtn

		CloseBtn1.MouseButton1Click:Connect(function()
			AvatarChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				AvatarChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		CloseBtn2.MouseButton1Click:Connect(function()
			AvatarChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				AvatarChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		CloseBtn2.MouseEnter:Connect(function()
			TweenService:Create(
				Close2Icon,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(210,210,210)}
			):Play()
		end)

		CloseBtn2.MouseLeave:Connect(function()
			TweenService:Create(
				Close2Icon,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(119, 122, 127)}
			):Play()
		end)


		AvatarTextbox.Focused:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)

		AvatarTextbox.FocusLost:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(37, 40, 43)}
			):Play()
		end)


	end)

	UserPanelUserTag.Name = "UserPanelUserTag"
	UserPanelUserTag.Parent = UserPanel
	UserPanelUserTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelUserTag.BackgroundTransparency = 1.000
	UserPanelUserTag.Position = UDim2.new(0.271143615, 0, 0.231804818, 0)
	UserPanelUserTag.Size = UDim2.new(0, 113, 0, 19)

	UserPanelUser.Name = "UserPanelUser"
	UserPanelUser.Parent = UserPanelUserTag
	UserPanelUser.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelUser.BackgroundTransparency = 1.000
	UserPanelUser.Font = Enum.Font.GothamSemibold
	UserPanelUser.TextColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelUser.TextSize = 17.000
	UserPanelUser.TextXAlignment = Enum.TextXAlignment.Left
	UserPanelUser.Text = user
	UserPanelUser.Size = UDim2.new(0, UserPanelUser.TextBounds.X + 2, 0, 19)


	UserPanelUserTagLayout.Name = "UserPanelUserTagLayout"
	UserPanelUserTagLayout.Parent = UserPanelUserTag
	UserPanelUserTagLayout.FillDirection = Enum.FillDirection.Horizontal
	UserPanelUserTagLayout.SortOrder = Enum.SortOrder.LayoutOrder

	UserPanelTag.Name = "UserPanelTag"
	UserPanelTag.Parent = UserPanelUserTag
	UserPanelTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelTag.BackgroundTransparency = 1.000
	UserPanelTag.Position = UDim2.new(0.0419999994, 0, 0.493999988, 0)
	UserPanelTag.Size = UDim2.new(0, 65, 0, 19)
	UserPanelTag.Font = Enum.Font.Gotham
	UserPanelTag.Text = "#" .. tag
	UserPanelTag.TextColor3 = Color3.fromRGB(184, 186, 189)
	UserPanelTag.TextSize = 17.000
	UserPanelTag.TextXAlignment = Enum.TextXAlignment.Left

	UserPanelCorner.Name = "UserPanelCorner"
	UserPanelCorner.Parent = UserPanel

	LeftFrame.Name = "LeftFrame"
	LeftFrame.Parent = SettingsHolder
	LeftFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
	LeftFrame.BorderSizePixel = 0
	LeftFrame.Position = UDim2.new(0, 0, -0.000303059904, 0)
	LeftFrame.Size = UDim2.new(0, 233, 0, 375)

	MyAccountBtn.Name = "MyAccountBtn"
	MyAccountBtn.Parent = LeftFrame
	MyAccountBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
	MyAccountBtn.BorderSizePixel = 0
	MyAccountBtn.Position = UDim2.new(0.271232396, 0, 0.101614028, 0)
	MyAccountBtn.Size = UDim2.new(0, 160, 0, 30)
	MyAccountBtn.AutoButtonColor = false
	MyAccountBtn.Font = Enum.Font.SourceSans
	MyAccountBtn.Text = ""
	MyAccountBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	MyAccountBtn.TextSize = 14.000

	MyAccountBtnCorner.CornerRadius = UDim.new(0, 6)
	MyAccountBtnCorner.Name = "MyAccountBtnCorner"
	MyAccountBtnCorner.Parent = MyAccountBtn

	MyAccountBtnTitle.Name = "MyAccountBtnTitle"
	MyAccountBtnTitle.Parent = MyAccountBtn
	MyAccountBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MyAccountBtnTitle.BackgroundTransparency = 1.000
	MyAccountBtnTitle.BorderSizePixel = 0
	MyAccountBtnTitle.Position = UDim2.new(0.0759999976, 0, -0.166999996, 0)
	MyAccountBtnTitle.Size = UDim2.new(0, 95, 0, 39)
	MyAccountBtnTitle.Font = Enum.Font.GothamSemibold
	MyAccountBtnTitle.Text = "My Account"
	MyAccountBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	MyAccountBtnTitle.TextSize = 14.000
	MyAccountBtnTitle.TextXAlignment = Enum.TextXAlignment.Left

	SettingsTitle.Name = "SettingsTitle"
	SettingsTitle.Parent = LeftFrame
	SettingsTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SettingsTitle.BackgroundTransparency = 1.000
	SettingsTitle.Position = UDim2.new(0.308999985, 0, 0.0450000018, 0)
	SettingsTitle.Size = UDim2.new(0, 65, 0, 19)
	SettingsTitle.Font = Enum.Font.GothamBlack
	SettingsTitle.Text = "SETTINGS"
	SettingsTitle.TextColor3 = Color3.fromRGB(142, 146, 152)
	SettingsTitle.TextSize = 11.000
	SettingsTitle.TextXAlignment = Enum.TextXAlignment.Left

	DiscordInfo.Name = "DiscordInfo"
	DiscordInfo.Parent = LeftFrame
	DiscordInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DiscordInfo.BackgroundTransparency = 1.000
	DiscordInfo.Position = UDim2.new(0.304721028, 0, 0.821333349, 0)
	DiscordInfo.Size = UDim2.new(0, 133, 0, 44)
	DiscordInfo.Font = Enum.Font.Gotham
	DiscordInfo.Text = "Stable 1.0.0 (00001)  Host 0.0.0.1                Roblox Lua Engine    "
	DiscordInfo.TextColor3 = Color3.fromRGB(101, 108, 116)
	DiscordInfo.TextSize = 13.000
	DiscordInfo.TextWrapped = true
	DiscordInfo.TextXAlignment = Enum.TextXAlignment.Left
	DiscordInfo.TextYAlignment = Enum.TextYAlignment.Top

	CurrentSettingOpen.Name = "CurrentSettingOpen"
	CurrentSettingOpen.Parent = LeftFrame
	CurrentSettingOpen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CurrentSettingOpen.BackgroundTransparency = 1.000
	CurrentSettingOpen.Position = UDim2.new(1.07294846, 0, 0.0450000018, 0)
	CurrentSettingOpen.Size = UDim2.new(0, 65, 0, 19)
	CurrentSettingOpen.Font = Enum.Font.GothamBlack
	CurrentSettingOpen.Text = "MY ACCOUNT"
	CurrentSettingOpen.TextColor3 = Color3.fromRGB(255, 255, 255)
	CurrentSettingOpen.TextSize = 14.000
	CurrentSettingOpen.TextXAlignment = Enum.TextXAlignment.Left


	SettingsOpenBtn.MouseButton1Click:Connect(function ()
		settingsopened = true
		TopFrameHolder.Visible = false
		ServersHoldFrame.Visible = false
		SettingsFrame.Visible = true
		SettingsHolder:TweenSize(UDim2.new(0, 681, 0, 375), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
		Settings.BackgroundTransparency = 1
		TweenService:Create(
			Settings,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0}
		):Play()
		for i,v in next, SettingsHolder:GetChildren() do
			v.BackgroundTransparency = 1
			TweenService:Create(
				v,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 0}
			):Play()
		end
	end)

	EditBtn.MouseButton1Click:Connect(function()
		local NotificationHolder = Instance.new("TextButton")
		NotificationHolder.Name = "NotificationHolder"
		NotificationHolder.Parent = SettingsHolder
		NotificationHolder.BackgroundColor3 = Color3.fromRGB(22,22,22)
		NotificationHolder.Position = UDim2.new(-0.00881057233, 0, -0.00266666664, 0)
		NotificationHolder.Size = UDim2.new(0, 687, 0, 375)
		NotificationHolder.AutoButtonColor = false
		NotificationHolder.Font = Enum.Font.SourceSans
		NotificationHolder.Text = ""
		NotificationHolder.TextColor3 = Color3.fromRGB(0, 0, 0)
		NotificationHolder.TextSize = 14.000
		NotificationHolder.BackgroundTransparency = 1
		NotificationHolder.Visible = true
		TweenService:Create(
			NotificationHolder,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0.2}
		):Play()

		local UserChange = Instance.new("Frame")
		local UserChangeCorner = Instance.new("UICorner")
		local UnderBar = Instance.new("Frame")
		local UnderBarCorner = Instance.new("UICorner")
		local UnderBarFrame = Instance.new("Frame")
		local Text1 = Instance.new("TextLabel")
		local Text2 = Instance.new("TextLabel")
		local TextBoxFrame = Instance.new("Frame")
		local TextBoxFrameCorner = Instance.new("UICorner")
		local TextBoxFrame1 = Instance.new("Frame")
		local TextBoxFrame1Corner = Instance.new("UICorner")
		local UsernameTextbox = Instance.new("TextBox")
		local Seperator = Instance.new("Frame")
		local HashtagLabel = Instance.new("TextLabel")
		local TagTextbox = Instance.new("TextBox")
		local ChangeBtn = Instance.new("TextButton")
		local ChangeCorner = Instance.new("UICorner")
		local CloseBtn2 = Instance.new("TextButton")
		local Close2Icon = Instance.new("ImageLabel")
		local CloseBtn1 = Instance.new("TextButton")
		local CloseBtn1Corner = Instance.new("UICorner")

		UserChange.Name = "UserChange"
		UserChange.Parent = NotificationHolder
		UserChange.AnchorPoint = Vector2.new(0.5, 0.5)
		UserChange.BackgroundColor3 = Color3.fromRGB(25,25,25)
		UserChange.ClipsDescendants = true
		UserChange.Position = UDim2.new(0.513071597, 0, 0.4746176, 0)
		UserChange.Size = UDim2.new(0, 0, 0, 0)
		UserChange.BackgroundTransparency = 1

		UserChange:TweenSize(UDim2.new(0, 346, 0, 198), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
		TweenService:Create(
			UserChange,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0}
		):Play()

		UserChangeCorner.CornerRadius = UDim.new(0, 5)
		UserChangeCorner.Name = "UserChangeCorner"
		UserChangeCorner.Parent = UserChange

		UnderBar.Name = "UnderBar"
		UnderBar.Parent = UserChange
		UnderBar.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
		UnderBar.Position = UDim2.new(-0.000297061284, 0, 0.945048928, 0)
		UnderBar.Size = UDim2.new(0, 346, 0, 13)

		UnderBarCorner.CornerRadius = UDim.new(0, 5)
		UnderBarCorner.Name = "UnderBarCorner"
		UnderBarCorner.Parent = UnderBar

		UnderBarFrame.Name = "UnderBarFrame"
		UnderBarFrame.Parent = UnderBar
		UnderBarFrame.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
		UnderBarFrame.BorderSizePixel = 0
		UnderBarFrame.Position = UDim2.new(-0.000297061284, 0, -2.53846145, 0)
		UnderBarFrame.Size = UDim2.new(0, 346, 0, 39)

		Text1.Name = "Text1"
		Text1.Parent = UserChange
		Text1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text1.BackgroundTransparency = 1.000
		Text1.Position = UDim2.new(-0.000594122568, 0, 0.0202020202, 0)
		Text1.Size = UDim2.new(0, 346, 0, 68)
		Text1.Font = Enum.Font.GothamSemibold
		Text1.Text = "Change your username"
		Text1.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text1.TextSize = 20.000

		Text2.Name = "Text2"
		Text2.Parent = UserChange
		Text2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text2.BackgroundTransparency = 1.000
		Text2.Position = UDim2.new(-0.000594122568, 0, 0.141587839, 0)
		Text2.Size = UDim2.new(0, 346, 0, 63)
		Text2.Font = Enum.Font.Gotham
		Text2.Text = "Enter your new username."
		Text2.TextColor3 = Color3.fromRGB(171, 172, 176)
		Text2.TextSize = 14.000

		TextBoxFrame.Name = "TextBoxFrame"
		TextBoxFrame.Parent = UserChange
		TextBoxFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBoxFrame.BackgroundColor3 = Color3.fromRGB(37, 40, 43)
		TextBoxFrame.Position = UDim2.new(0.49710983, 0, 0.560606062, 0)
		TextBoxFrame.Size = UDim2.new(0, 319, 0, 38)

		TextBoxFrameCorner.CornerRadius = UDim.new(0, 3)
		TextBoxFrameCorner.Name = "TextBoxFrameCorner"
		TextBoxFrameCorner.Parent = TextBoxFrame

		TextBoxFrame1.Name = "TextBoxFrame1"
		TextBoxFrame1.Parent = TextBoxFrame
		TextBoxFrame1.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBoxFrame1.BackgroundColor3 = Color3.fromRGB(48, 51, 57)
		TextBoxFrame1.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextBoxFrame1.Size = UDim2.new(0, 317, 0, 36)

		TextBoxFrame1Corner.CornerRadius = UDim.new(0, 3)
		TextBoxFrame1Corner.Name = "TextBoxFrame1Corner"
		TextBoxFrame1Corner.Parent = TextBoxFrame1

		UsernameTextbox.Name = "UsernameTextbox"
		UsernameTextbox.Parent = TextBoxFrame1
		UsernameTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		UsernameTextbox.BackgroundTransparency = 1.000
		UsernameTextbox.Position = UDim2.new(0.0378548913, 0, 0, 0)
		UsernameTextbox.Size = UDim2.new(0, 221, 0, 37)
		UsernameTextbox.Font = Enum.Font.Gotham
		UsernameTextbox.Text = user
		UsernameTextbox.TextColor3 = Color3.fromRGB(193, 195, 197)
		UsernameTextbox.TextSize = 14.000
		UsernameTextbox.TextXAlignment = Enum.TextXAlignment.Left

		Seperator.Name = "Seperator"
		Seperator.Parent = TextBoxFrame1
		Seperator.AnchorPoint = Vector2.new(0.5, 0.5)
		Seperator.BackgroundColor3 = Color3.fromRGB(25,25,25)
		Seperator.BorderSizePixel = 0
		Seperator.Position = UDim2.new(0.753000021, 0, 0.500999987, 0)
		Seperator.Size = UDim2.new(0, 1, 0, 25)

		HashtagLabel.Name = "HashtagLabel"
		HashtagLabel.Parent = TextBoxFrame1
		HashtagLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		HashtagLabel.BackgroundTransparency = 1.000
		HashtagLabel.Position = UDim2.new(0.765877604, 0, -0.0546001866, 0)
		HashtagLabel.Size = UDim2.new(0, 23, 0, 37)
		HashtagLabel.Font = Enum.Font.Gotham
		HashtagLabel.Text = "#"
		HashtagLabel.TextColor3 = Color3.fromRGB(79, 82, 88)
		HashtagLabel.TextSize = 16.000

		TagTextbox.Name = "TagTextbox"
		TagTextbox.Parent = TextBoxFrame1
		TagTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TagTextbox.BackgroundTransparency = 1.000
		TagTextbox.Position = UDim2.new(0.824999988, 0, -0.0280000009, 0)
		TagTextbox.Size = UDim2.new(0, 59, 0, 38)
		TagTextbox.Font = Enum.Font.Gotham
		TagTextbox.PlaceholderColor3 = Color3.fromRGB(210, 211, 212)
		TagTextbox.Text = tag
		TagTextbox.TextColor3 = Color3.fromRGB(193, 195, 197)
		TagTextbox.TextSize = 14.000
		TagTextbox.TextXAlignment = Enum.TextXAlignment.Left

		ChangeBtn.Name = "ChangeBtn"
		ChangeBtn.Parent = UserChange
		ChangeBtn.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
		ChangeBtn.Position = UDim2.new(0.749670506, 0, 0.823232353, 0)
		ChangeBtn.Size = UDim2.new(0, 76, 0, 27)
		ChangeBtn.Font = Enum.Font.Gotham
		ChangeBtn.Text = "Change"
		ChangeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		ChangeBtn.TextSize = 13.000
		ChangeBtn.AutoButtonColor = false

		ChangeBtn.MouseEnter:Connect(function()
			TweenService:Create(
				ChangeBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(103,123,196)}
			):Play()
		end)

		ChangeBtn.MouseLeave:Connect(function()
			TweenService:Create(
				ChangeBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)

		ChangeBtn.MouseButton1Click:Connect(function()
			user = UsernameTextbox.Text
			tag = TagTextbox.Text
			UserSettingsPadUser.Text = user
			UserSettingsPadUser.Size = UDim2.new(0, UserSettingsPadUser.TextBounds.X + 2, 0, 19)
			UserSettingsPadTag.Text = "#" .. tag
			UserPanelTag.Text = "#" .. tag
			UserPanelUser.Text = user
			UserPanelUser.Size = UDim2.new(0, UserPanelUser.TextBounds.X + 2, 0, 19)
			UserName.Text = user
			UserTag.Text = "#" .. tag
			SaveInfo()

			UserChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				UserChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		ChangeCorner.CornerRadius = UDim.new(0, 4)
		ChangeCorner.Name = "ChangeCorner"
		ChangeCorner.Parent = ChangeBtn

		CloseBtn2.Name = "CloseBtn2"
		CloseBtn2.Parent = UserChange
		CloseBtn2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn2.BackgroundTransparency = 1.000
		CloseBtn2.Position = UDim2.new(0.898000002, 0, 0, 0)
		CloseBtn2.Size = UDim2.new(0, 26, 0, 26)
		CloseBtn2.Font = Enum.Font.Gotham
		CloseBtn2.Text = ""
		CloseBtn2.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn2.TextSize = 14.000

		Close2Icon.Name = "Close2Icon"
		Close2Icon.Parent = CloseBtn2
		Close2Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Close2Icon.BackgroundTransparency = 1.000
		Close2Icon.Position = UDim2.new(-0.0384615399, 0, 0.312910825, 0)
		Close2Icon.Size = UDim2.new(0, 25, 0, 25)
		Close2Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
		Close2Icon.ImageColor3 = Color3.fromRGB(119, 122, 127)

		CloseBtn1.Name = "CloseBtn1"
		CloseBtn1.Parent = UserChange
		CloseBtn1.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
		CloseBtn1.BackgroundTransparency = 1.000
		CloseBtn1.Position = UDim2.new(0.495000005, 0, 0.823000014, 0)
		CloseBtn1.Size = UDim2.new(0, 76, 0, 27)
		CloseBtn1.Font = Enum.Font.Gotham
		CloseBtn1.Text = "Close"
		CloseBtn1.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn1.TextSize = 13.000

		CloseBtn1Corner.CornerRadius = UDim.new(0, 4)
		CloseBtn1Corner.Name = "CloseBtn1Corner"
		CloseBtn1Corner.Parent = CloseBtn1

		CloseBtn1.MouseButton1Click:Connect(function()
			UserChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				UserChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		CloseBtn2.MouseButton1Click:Connect(function()
			UserChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				UserChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		CloseBtn2.MouseEnter:Connect(function()
			TweenService:Create(
				Close2Icon,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(210,210,210)}
			):Play()
		end)

		CloseBtn2.MouseLeave:Connect(function()
			TweenService:Create(
				Close2Icon,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(119, 122, 127)}
			):Play()
		end)

		TagTextbox.Changed:Connect(function()
			TagTextbox.Text = TagTextbox.Text:sub(1,4)
		end)

		TagTextbox:GetPropertyChangedSignal("Text"):Connect(function()
			TagTextbox.Text = TagTextbox.Text:gsub('%D+', '');
		end)

		UsernameTextbox.Changed:Connect(function()
			UsernameTextbox.Text = UsernameTextbox.Text:sub(1,13)
		end)

		TagTextbox.Focused:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)

		TagTextbox.FocusLost:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(37, 40, 43)}
			):Play()
		end)

		UsernameTextbox.Focused:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)

		UsernameTextbox.FocusLost:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(37, 40, 43)}
			):Play()
		end)

	end)

	function RadientPaid:Notification(titletext, desctext, btntext)
		local NotificationHolderMain = Instance.new("TextButton")
		local Notification = Instance.new("Frame")
		local NotificationCorner = Instance.new("UICorner")
		local UnderBar = Instance.new("Frame")
		local UnderBarCorner = Instance.new("UICorner")
		local UnderBarFrame = Instance.new("Frame")
		local Text1 = Instance.new("TextLabel")
		local Text2 = Instance.new("TextLabel")
		local AlrightBtn = Instance.new("TextButton")
		local AlrightCorner = Instance.new("UICorner")

		NotificationHolderMain.Name = "NotificationHolderMain"
		NotificationHolderMain.Parent = MainFrame
		NotificationHolderMain.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		NotificationHolderMain.BackgroundTransparency = 1
		NotificationHolderMain.BorderSizePixel = 0
		NotificationHolderMain.Position = UDim2.new(0, 0, 0.0560000017, 0)
		NotificationHolderMain.Size = UDim2.new(0, 681, 0, 374)
		NotificationHolderMain.AutoButtonColor = false
		NotificationHolderMain.Font = Enum.Font.SourceSans
		NotificationHolderMain.Text = ""
		NotificationHolderMain.TextColor3 = Color3.fromRGB(0, 0, 0)
		NotificationHolderMain.TextSize = 14.000
		TweenService:Create(
			NotificationHolderMain,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0.2}
		):Play()


		Notification.Name = "Notification"
		Notification.Parent = NotificationHolderMain
		Notification.AnchorPoint = Vector2.new(0.5, 0.5)
		Notification.BackgroundColor3 = Color3.fromRGB(15,15,15)
		Notification.ClipsDescendants = true
		Notification.Position = UDim2.new(0.524819076, 0, 0.469270051, 0)
		Notification.Size = UDim2.new(0, 0, 0, 0)
		Notification.BackgroundTransparency = 1

		Notification:TweenSize(UDim2.new(0, 346, 0, 176), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)

		TweenService:Create(
			Notification,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0}
		):Play()

		NotificationCorner.CornerRadius = UDim.new(0, 5)
		NotificationCorner.Name = "NotificationCorner"
		NotificationCorner.Parent = Notification

		UnderBar.Name = "UnderBar"
		UnderBar.Parent = Notification
		UnderBar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
		UnderBar.Position = UDim2.new(-0.000297061284, 0, 0.945048928, 0)
		UnderBar.Size = UDim2.new(0, 346, 0, 10)

		UnderBarCorner.CornerRadius = UDim.new(0, 5)
		UnderBarCorner.Name = "UnderBarCorner"
		UnderBarCorner.Parent = UnderBar

		UnderBarFrame.Name = "UnderBarFrame"
		UnderBarFrame.Parent = UnderBar
		UnderBarFrame.BackgroundColor3 = Color3.fromRGB(14,14,14)
		UnderBarFrame.BorderSizePixel = 0
		UnderBarFrame.Position = UDim2.new(-0.000297061284, 0, -3.76068449, 0)
		UnderBarFrame.Size = UDim2.new(0, 346, 0, 40)

		Text1.Name = "Text1"
		Text1.Parent = Notification
		Text1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text1.BackgroundTransparency = 1.000
		Text1.Position = UDim2.new(-0.000594122568, 0, 0.0202020202, 0)
		Text1.Size = UDim2.new(0, 346, 0, 68)
		Text1.Font = Enum.Font.GothamSemibold
		Text1.Text = titletext
		Text1.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text1.TextSize = 20.000

		Text2.Name = "Text2"
		Text2.Parent = Notification
		Text2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text2.BackgroundTransparency = 1.000
		Text2.Position = UDim2.new(0.106342293, 0, 0.317724228, 0)
		Text2.Size = UDim2.new(0, 272, 0, 63)
		Text2.Font = Enum.Font.Gotham
		Text2.Text = desctext
		Text2.TextColor3 = Color3.fromRGB(171, 172, 176)
		Text2.TextSize = 14.000
		Text2.TextWrapped = true

		AlrightBtn.Name = "AlrightBtn"
		AlrightBtn.Parent = Notification
		AlrightBtn.BackgroundColor3 = Color3.fromRGB(79, 214, 58)
		AlrightBtn.Position = UDim2.new(0.0332369953, 0, 0.789141417, 0)
		AlrightBtn.Size = UDim2.new(0, 322, 0, 27)
		AlrightBtn.Font = Enum.Font.Gotham
		AlrightBtn.Text = btntext
		AlrightBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		AlrightBtn.TextSize = 13.000
		AlrightBtn.AutoButtonColor = false

		AlrightCorner.CornerRadius = UDim.new(0, 4)
		AlrightCorner.Name = "AlrightCorner"
		AlrightCorner.Parent = AlrightBtn

		AlrightBtn.MouseButton1Click:Connect(function()
			TweenService:Create(
				NotificationHolderMain,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			Notification:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				Notification,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait()
			NotificationHolderMain:Destroy()
		end)

		AlrightBtn.MouseEnter:Connect(function()
			TweenService:Create(
				AlrightBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(28, 214, 90)}
			):Play()
		end)

		AlrightBtn.MouseLeave:Connect(function()
			TweenService:Create(
				AlrightBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(79, 214, 58)}
			):Play()
		end)
	end

	MakeDraggable(TopFramess, MainFrame)
	ServersHoldPadding.PaddingLeft = UDim.new(0, 14)
	local ServerHold = {}
	function ServerHold:Server(text,textgame, img)
		local fc = false
		local currentchanneltoggled = ""
		local Server = Instance.new("TextButton")
		local ServerBtnCorner = Instance.new("UICorner")
		local ServerIco = Instance.new("ImageLabel")
		local ServerWhiteFrame = Instance.new("Frame")
		local ServerWhiteFrameCorner = Instance.new("UICorner")

		Server.Name = text .. "Server"
		Server.Parent = ServersHold
		Server.BackgroundColor3 = Color3.fromRGB(20,20,20)
		Server.Position = UDim2.new(0.125, 0, 0, 0)
		Server.Size = UDim2.new(0, 47, 0, 47)
		Server.AutoButtonColor = false
		Server.Font = Enum.Font.Gotham
		Server.Text = ""
		Server.BackgroundTransparency = 1
		Server.TextTransparency = 1
		Server.TextColor3 = Color3.fromRGB(231,23,55)
		Server.TextSize = 20.000

		ServerBtnCorner.CornerRadius = UDim.new(1, 0)
		ServerBtnCorner.Name = "ServerCorner"
		ServerBtnCorner.Parent = Server

		ServerWhiteFrame.Name = "ServerWhiteFrame"
		ServerWhiteFrame.Parent = Server
		ServerWhiteFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		ServerWhiteFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ServerWhiteFrame.BackgroundTransparency = 1
		ServerWhiteFrame.Position = UDim2.new(-0.347378343, 0, 0.502659559, 0)
		ServerWhiteFrame.Size = UDim2.new(0, 11, 0, 10)

		ServerWhiteFrameCorner.CornerRadius = UDim.new(1, 0)
		ServerWhiteFrameCorner.Name = "ServerWhiteFrameCorner"
		ServerWhiteFrameCorner.Parent = ServerWhiteFrame
		ServersHold.CanvasSize = UDim2.new(0, 0, 0, ServersHoldLayout.AbsoluteContentSize.Y)

		local ServerFrame = Instance.new("Frame")
		local ServerFrame1 = Instance.new("Frame")
		local ServerFrame2 = Instance.new("Frame")
		local ServerTitleFrame = Instance.new("Frame")
		local ServerTitle = Instance.new("TextLabel")
		local ServerTitle2 = Instance.new("TextLabel")
		local GlowFrame = Instance.new("Frame")
		local Glow = Instance.new("ImageLabel")
		local ServerContentFrame = Instance.new("Frame")
		local ServerCorner = Instance.new("UICorner")
		local ChannelCorner = Instance.new("UICorner")
		local ChannelTitleFrame = Instance.new("Frame")
		local Hashtag = Instance.new("TextLabel")
		local ChannelTitle = Instance.new("TextLabel")
		local ChannelContentFrame = Instance.new("Frame")
		local GlowChannel = Instance.new("ImageLabel")
		local ServerChannelHolder = Instance.new("ScrollingFrame")
		local ServerChannelHolderLayout = Instance.new("UIListLayout")
		local ServerChannelHolderPadding = Instance.new("UIPadding")


		ServerFrame.Name = "ServerFrame"
		ServerFrame.Parent = ServersHolder
		ServerFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
		ServerFrame.BorderSizePixel = 0
		ServerFrame.ClipsDescendants = true
		ServerFrame.Position = UDim2.new(0.105726875, 0, 1.01262593, 0)
		ServerFrame.Size = UDim2.new(0, 609, 0, 373)
		ServerFrame.Visible = false

		ServerFrame1.Name = "ServerFrame1"
		ServerFrame1.Parent = ServerFrame
		ServerFrame1.BackgroundColor3 = Color3.fromRGB(20,20,20)
		ServerFrame1.BorderSizePixel = 0
		ServerFrame1.Position = UDim2.new(0, 0, 0.972290039, 0)
		ServerFrame1.Size = UDim2.new(0, 12, 0, 10)

		ServerFrame2.Name = "ServerFrame2"
		ServerFrame2.Parent = ServerFrame
		ServerFrame2.BackgroundColor3 = Color3.fromRGB(20,20,20)
		ServerFrame2.BorderSizePixel = 0
		ServerFrame2.Position = UDim2.new(0.980295539, 0, 0.972290039, 0)
		ServerFrame2.Size = UDim2.new(0, 12, 0, 9)

		ServerTitleFrame.Name = "ServerTitleFrame"
		ServerTitleFrame.Parent = ServerFrame
		ServerTitleFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
		ServerTitleFrame.BackgroundTransparency = 1.000
		ServerTitleFrame.BorderSizePixel = 0
		ServerTitleFrame.Position = UDim2.new(-0.0010054264, 0, -0.000900391256, 0)
		ServerTitleFrame.Size = UDim2.new(0, 180, 0, 40)

		ServerTitle.Name = "ServerTitle"
		ServerTitle.Parent = ServerTitleFrame
		ServerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ServerTitle.BackgroundTransparency = 1.000
		ServerTitle.BorderSizePixel = 0
		ServerTitle.Position = UDim2.new(0.0751359761, 0, 0, 0)
		ServerTitle.Size = UDim2.new(0, 97, 0, 39)
		ServerTitle.Font = Enum.Font.GothamSemibold
		ServerTitle.Text = text
		ServerTitle.TextColor3 = Color3.fromRGB(231,23,55)
		ServerTitle.TextSize = 15.000
		ServerTitle.TextXAlignment = Enum.TextXAlignment.Left

		ServerTitle2.Name = "ServerTitle"
		ServerTitle2.Parent = ServerTitleFrame
		ServerTitle2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ServerTitle2.BackgroundTransparency = 1
		ServerTitle2.BorderSizePixel = 0
		ServerTitle2.Position = UDim2.new(0.0541359761, 0, 7.5, 0)
		ServerTitle2.Size = UDim2.new(0, 97, 0, 39)
		ServerTitle2.ZIndex = 999
		ServerTitle2.Font = Enum.Font.GothamSemibold
		ServerTitle2.Text = textgame
		ServerTitle2.TextColor3 = Color3.fromRGB(255, 255, 255)
		ServerTitle2.TextTransparency = 0.8
		ServerTitle2.TextSize = 13.000
		ServerTitle2.TextXAlignment = Enum.TextXAlignment.Left

		GlowFrame.Name = "GlowFrame"
		GlowFrame.Parent = ServerFrame
		GlowFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
		GlowFrame.BackgroundTransparency = 1.000
		GlowFrame.BorderSizePixel = 0
		GlowFrame.Position = UDim2.new(-0.0010054264, 0, -0.000900391256, 0)
		GlowFrame.Size = UDim2.new(0, 609, 0, 40)

		Glow.Name = "Glow"
		Glow.Parent = GlowFrame
		Glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Glow.BackgroundTransparency = 1.000
		Glow.BorderSizePixel = 0
		Glow.Position = UDim2.new(0, -15, 0, -15)
		Glow.Size = UDim2.new(1, 30, 1, 30)
		Glow.ZIndex = 0
		Glow.Image = "rbxassetid://4996891970"
		Glow.ImageColor3 = Color3.fromRGB(15, 15, 15)
		Glow.ScaleType = Enum.ScaleType.Slice
		Glow.SliceCenter = Rect.new(20, 20, 280, 280)

		ServerContentFrame.Name = "ServerContentFrame"
		ServerContentFrame.Parent = ServerFrame
		ServerContentFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
		ServerContentFrame.BackgroundTransparency = 1.000
		ServerContentFrame.BorderSizePixel = 0
		ServerContentFrame.Position = UDim2.new(-0.0010054264, 0, 0.106338218, 0)
		ServerContentFrame.Size = UDim2.new(0, 180, 0, 333)

		ServerCorner.CornerRadius = UDim.new(0, 4)
		ServerCorner.Name = "ServerCorner"
		ServerCorner.Parent = ServerFrame

		ChannelTitleFrame.Name = "ChannelTitleFrame"
		ChannelTitleFrame.Parent = ServerFrame
		ChannelTitleFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
		ChannelTitleFrame.BorderSizePixel = 0
		ChannelTitleFrame.Position = UDim2.new(0.294561088, 0, -0.000900391256, 0)
		ChannelTitleFrame.Size = UDim2.new(0, 429, 0, 40)

		Hashtag.Name = "Hashtag"
		Hashtag.Parent = ChannelTitleFrame
		Hashtag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Hashtag.BackgroundTransparency = 1.000
		Hashtag.BorderSizePixel = 0
		Hashtag.Position = UDim2.new(0.0279720277, 0, 0, 0)
		Hashtag.Size = UDim2.new(0, 19, 0, 39)
		Hashtag.Font = Enum.Font.Gotham
		Hashtag.Text = "#"
		Hashtag.TextColor3 = Color3.fromRGB(114, 118, 125)
		Hashtag.TextSize = 25.000

		ChannelTitle.Name = "ChannelTitle"
		ChannelTitle.Parent = ChannelTitleFrame
		ChannelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ChannelTitle.BackgroundTransparency = 1.000
		ChannelTitle.BorderSizePixel = 0
		ChannelTitle.Position = UDim2.new(0.0862470865, 0, 0, 0)
		ChannelTitle.Size = UDim2.new(0, 95, 0, 39)
		ChannelTitle.Font = Enum.Font.GothamSemibold
		ChannelTitle.Text = ""
		ChannelTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		ChannelTitle.TextSize = 15.000
		ChannelTitle.TextXAlignment = Enum.TextXAlignment.Left

		ChannelContentFrame.Name = "ChannelContentFrame"
		ChannelContentFrame.Parent = ServerFrame
		ChannelContentFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
		ChannelContentFrame.BorderSizePixel = 0
		ChannelContentFrame.ClipsDescendants = true
		ChannelContentFrame.Position = UDim2.new(0.294561088, 0, 0.106338218, 0)
		ChannelContentFrame.Size = UDim2.new(0, 429, 0, 333)

		GlowChannel.Name = "GlowChannel"
		GlowChannel.Parent = ChannelContentFrame
		GlowChannel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		GlowChannel.BackgroundTransparency = 1.000
		GlowChannel.BorderSizePixel = 0
		GlowChannel.Position = UDim2.new(0, -33, 0, -91)
		GlowChannel.Size = UDim2.new(1.06396091, 30, 0.228228226, 30)
		GlowChannel.ZIndex = 0
		GlowChannel.Image = "rbxassetid://4996891970"
		GlowChannel.ImageColor3 = Color3.fromRGB(15, 15, 15)
		GlowChannel.ScaleType = Enum.ScaleType.Slice
		GlowChannel.SliceCenter = Rect.new(20, 20, 280, 280)

		ServerChannelHolder.Name = "ServerChannelHolder"
		ServerChannelHolder.Parent = ServerContentFrame
		ServerChannelHolder.Active = true
		ServerChannelHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ServerChannelHolder.BackgroundTransparency = 1.000
		ServerChannelHolder.BorderSizePixel = 0
		ServerChannelHolder.Position = UDim2.new(0.00535549596, 0, 0.0241984241, 0)
		ServerChannelHolder.Selectable = false
		ServerChannelHolder.Size = UDim2.new(0, 179, 0, 278)
		ServerChannelHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
		ServerChannelHolder.ScrollBarThickness = 4
		ServerChannelHolder.ScrollBarImageColor3 = Color3.fromRGB(18, 19, 21)
		ServerChannelHolder.ScrollBarImageTransparency = 1

		ServerChannelHolderLayout.Name = "ServerChannelHolderLayout"
		ServerChannelHolderLayout.Parent = ServerChannelHolder
		ServerChannelHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
		ServerChannelHolderLayout.Padding = UDim.new(0, 4)

		ServerChannelHolderPadding.Name = "ServerChannelHolderPadding"
		ServerChannelHolderPadding.Parent = ServerChannelHolder
		ServerChannelHolderPadding.PaddingLeft = UDim.new(0, 9)

		ServerChannelHolder.MouseEnter:Connect(function()
			ServerChannelHolder.ScrollBarImageTransparency = 0
		end)

		ServerChannelHolder.MouseLeave:Connect(function()
			ServerChannelHolder.ScrollBarImageTransparency = 1
		end)

		Server.MouseEnter:Connect(
			function()
				if currentservertoggled ~= Server.Name then
					TweenService:Create(
						Server,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
					):Play()
					TweenService:Create(
						ServerBtnCorner,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{CornerRadius = UDim.new(0, 15)}
					):Play()
					ServerWhiteFrame:TweenSize(
						UDim2.new(0, 11, 0, 27),
						Enum.EasingDirection.Out,
						Enum.EasingStyle.Quart,
						.3,
						true
					)
				end
			end
		)

		Server.MouseLeave:Connect(
			function()
				if currentservertoggled ~= Server.Name then
					TweenService:Create(
						Server,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(25,25,25)}
					):Play()
					TweenService:Create(
						ServerBtnCorner,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{CornerRadius = UDim.new(1, 0)}
					):Play()
					ServerWhiteFrame:TweenSize(
						UDim2.new(0, 11, 0, 10),
						Enum.EasingDirection.Out,
						Enum.EasingStyle.Quart,
						.3,
						true
					)
				end
			end
		)

		Server.MouseButton1Click:Connect(
			function()
				currentservertoggled = Server.Name
				for i, v in next, ServersHolder:GetChildren() do
					if v.Name == "ServerFrame" then
						v.Visible = false
					end
					ServerFrame.Visible = true
				end
				for i, v in next, ServersHold:GetChildren() do
					if v.ClassName == "TextButton" then
						TweenService:Create(
							v,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(25,25,25)}
						):Play()
						TweenService:Create(
							Server,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(25,25,25)}
						):Play()
						TweenService:Create(
							v.ServerCorner,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{CornerRadius = UDim.new(1, 0)}
						):Play()
						TweenService:Create(
							ServerBtnCorner,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{CornerRadius = UDim.new(0, 15)}
						):Play()
						v.ServerWhiteFrame:TweenSize(
							UDim2.new(0, 11, 0, 10),
							Enum.EasingDirection.Out,
							Enum.EasingStyle.Quart,
							.3,
							true
						)
						ServerWhiteFrame:TweenSize(
							UDim2.new(0, 11, 0, 46),
							Enum.EasingDirection.Out,
							Enum.EasingStyle.Quart,
							.3,
							true
						)
					end
				end
			end
		)

		if fs == false then
			TweenService:Create(
				Server,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(25,25,25)}
			):Play()
			TweenService:Create(
				ServerBtnCorner,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{CornerRadius = UDim.new(0, 15)}
			):Play()
			ServerWhiteFrame:TweenSize(
				UDim2.new(0, 11, 0, 46),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Quart,
				.3,
				true
			)
			ServerFrame.Visible = true
			Server.Name = text .. "Server"
			currentservertoggled = Server.Name
			fs = true
		end
		local ChannelHold = {}
		function ChannelHold:Channel(text)
			local ChannelBtn = Instance.new("TextButton")
			local ChannelBtnCorner = Instance.new("UICorner")
			local ChannelBtnHashtag = Instance.new("TextLabel")
			local ChannelBtnTitle = Instance.new("TextLabel")

			ChannelBtn.Name = text .. "ChannelBtn"
			ChannelBtn.Parent = ServerChannelHolder
			ChannelBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
			ChannelBtn.BorderSizePixel = 0
			ChannelBtn.Position = UDim2.new(0.24118948, 0, 0.578947365, 0)
			ChannelBtn.Size = UDim2.new(0, 160, 0, 30)
			ChannelBtn.AutoButtonColor = false
			ChannelBtn.Font = Enum.Font.SourceSans
			ChannelBtn.Text = ""
			ChannelBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
			ChannelBtn.TextSize = 14.000

			ChannelBtnCorner.CornerRadius = UDim.new(0, 8)
			ChannelBtnCorner.Name = "ChannelBtnCorner"
			ChannelBtnCorner.Parent = ChannelBtn

			ChannelBtnHashtag.Name = "ChannelBtnHashtag"
			ChannelBtnHashtag.Parent = ChannelBtn
			ChannelBtnHashtag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ChannelBtnHashtag.BackgroundTransparency = 1.000
			ChannelBtnHashtag.BorderSizePixel = 0
			ChannelBtnHashtag.Position = UDim2.new(0.08, 0, 0, 0)
			ChannelBtnHashtag.Size = UDim2.new(0, 24, 0, 30)
			ChannelBtnHashtag.Font = Enum.Font.Gotham
			ChannelBtnHashtag.Text = ""
			ChannelBtnHashtag.TextColor3 = Color3.fromRGB(114, 118, 125)
			ChannelBtnHashtag.TextSize = 21.000

			ChannelBtnTitle.Name = "ChannelBtnTitle"
			ChannelBtnTitle.Parent = ChannelBtn
			ChannelBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ChannelBtnTitle.BackgroundTransparency = 1.000
			ChannelBtnTitle.BorderSizePixel = 0
			ChannelBtnTitle.Position = UDim2.new(0.05, 0, -0.166666672, 0)
			ChannelBtnTitle.Size = UDim2.new(0, 95, 0, 39)
			ChannelBtnTitle.Font = Enum.Font.Gotham
			ChannelBtnTitle.Text = text
			ChannelBtnTitle.TextColor3 = Color3.fromRGB(114, 118, 125)
			ChannelBtnTitle.TextSize = 14.000
			ChannelBtnTitle.TextXAlignment = Enum.TextXAlignment.Left
			ServerChannelHolder.CanvasSize = UDim2.new(0, 0, 0, ServerChannelHolderLayout.AbsoluteContentSize.Y)

			local ChannelHolder = Instance.new("ScrollingFrame")
			local ChannelHolderLayout = Instance.new("UIListLayout")

			ChannelHolder.Name = "ChannelHolder"
			ChannelHolder.Parent = ChannelContentFrame
			ChannelHolder.Active = true
			ChannelHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ChannelHolder.BackgroundTransparency = 1.000
			ChannelHolder.BorderSizePixel = 0
			ChannelHolder.Position = UDim2.new(0.0360843192, 0, 0.0241984241, 0)
			ChannelHolder.Size = UDim2.new(0, 412, 0, 314)
			ChannelHolder.ScrollBarThickness = 6
			ChannelHolder.CanvasSize = UDim2.new(0,0,0,0)
			ChannelHolder.ScrollBarImageTransparency = 0
			ChannelHolder.ScrollBarImageColor3 = Color3.fromRGB(18, 19, 21)
			ChannelHolder.Visible = false
			ChannelHolder.ClipsDescendants = false

			ChannelHolderLayout.Name = "ChannelHolderLayout"
			ChannelHolderLayout.Parent = ChannelHolder
			ChannelHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
			ChannelHolderLayout.Padding = UDim.new(0, 8)

			ChannelBtn.MouseEnter:Connect(function()
				if currentchanneltoggled ~= ChannelBtn.Name then
					ChannelBtn.BackgroundColor3 = Color3.fromRGB(10,10,10)
					ChannelBtnTitle.TextColor3 = Color3.fromRGB(220,221,222)
				end
			end)

			ChannelBtn.MouseLeave:Connect(function()
				if currentchanneltoggled ~= ChannelBtn.Name then
					ChannelBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
					ChannelBtnTitle.TextColor3 = Color3.fromRGB(114, 118, 125)
				end
			end)

			ChannelBtn.MouseButton1Click:Connect(function()
				for i, v in next, ChannelContentFrame:GetChildren() do
					if v.Name == "ChannelHolder" then
						v.Visible = false
					end
					ChannelHolder.Visible = true
				end
				for i, v in next, ServerChannelHolder:GetChildren() do
					if v.ClassName == "TextButton" then
						v.BackgroundColor3 = Color3.fromRGB(25,25,25)
						v.ChannelBtnTitle.TextColor3 = Color3.fromRGB(114, 118, 125)
					end
					ServerFrame.Visible = true
				end
				ChannelTitle.Text = text
				ChannelBtn.BackgroundColor3 = Color3.fromRGB(10,10,10)
				ChannelBtnTitle.TextColor3 = Color3.fromRGB(255,255,255)
				currentchanneltoggled = ChannelBtn.Name
			end)

			if fc == false then
				fc = true
				ChannelTitle.Text = text
				ChannelBtn.BackgroundColor3 = Color3.fromRGB(10,10,10)
				ChannelBtnTitle.TextColor3 = Color3.fromRGB(255,255,255)
				currentchanneltoggled = ChannelBtn.Name
				ChannelHolder.Visible = true
			end
			local ChannelContent = {}
			function ChannelContent:Button(text,callback)
				local Button = Instance.new("TextButton")
				local ButtonCorner = Instance.new("UICorner")

				Button.Name = "Button"
				Button.Parent = ChannelHolder
				Button.BackgroundColor3 = Color3.fromRGB(231,23,55)
				Button.Size = UDim2.new(0, 401, 0, 30)
				Button.AutoButtonColor = false
				Button.Font = Enum.Font.Gotham
				Button.TextColor3 = Color3.fromRGB(255, 255, 255)
				Button.TextSize = 14.000
				Button.Text = text

				ButtonCorner.CornerRadius = UDim.new(0, 4)
				ButtonCorner.Name = "ButtonCorner"
				ButtonCorner.Parent = Button

				Button.MouseEnter:Connect(function()
					TweenService:Create(
						Button,
						TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(231,23,55)}
					):Play()
				end)

				Button.MouseButton1Click:Connect(function()
					pcall(callback)
					Button.TextSize = 0
					TweenService:Create(
						Button,
						TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
						{TextSize = 14}
					):Play()
				end)

				Button.MouseLeave:Connect(function()
					TweenService:Create(
						Button,
						TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(231,23,55)}
					):Play()
				end)
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end
			function ChannelContent:Toggle(text,default,callback)
				local toggled = false
				local Toggle = Instance.new("TextButton")
				local ToggleTitle = Instance.new("TextLabel")
				local ToggleFrame = Instance.new("Frame")
				local ToggleFrameCorner = Instance.new("UICorner")
				local ToggleFrameCircle = Instance.new("Frame")
				local ToggleFrameCircleCorner = Instance.new("UICorner")
				local Icon = Instance.new("ImageLabel")

				Toggle.Name = "Toggle"
				Toggle.Parent = ChannelHolder
				Toggle.BackgroundColor3 = Color3.fromRGB(25,25,25)
				Toggle.BorderSizePixel = 0
				Toggle.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
				Toggle.Size = UDim2.new(0, 401, 0, 30)
				Toggle.AutoButtonColor = false
				Toggle.Font = Enum.Font.Gotham
				Toggle.Text = ""
				Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
				Toggle.TextSize = 14.000

				ToggleTitle.Name = "ToggleTitle"
				ToggleTitle.Parent = Toggle
				ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleTitle.BackgroundTransparency = 1.000
				ToggleTitle.Position = UDim2.new(0, 5, 0, 0)
				ToggleTitle.Size = UDim2.new(0, 200, 0, 30)
				ToggleTitle.Font = Enum.Font.Gotham
				ToggleTitle.Text = text
				ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				ToggleTitle.TextSize = 14.000
				ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

				ToggleFrame.Name = "ToggleFrame"
				ToggleFrame.Parent = Toggle
				ToggleFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
				ToggleFrame.Position = UDim2.new(0.900481343, -5, 0.13300018, 0)
				ToggleFrame.Size = UDim2.new(0, 40, 0, 21)

				ToggleFrameCorner.CornerRadius = UDim.new(0, 4)
				ToggleFrameCorner.Name = "ToggleFrameCorner"
				ToggleFrameCorner.Parent = ToggleFrame

				ToggleFrameCircle.Name = "ToggleFrameCircle"
				ToggleFrameCircle.Parent = ToggleFrame
				ToggleFrameCircle.BackgroundColor3 = Color3.fromRGB(50,50,50)
				ToggleFrameCircle.Position = UDim2.new(0.234999999, -5, 0.133000001, 0)
				ToggleFrameCircle.Size = UDim2.new(0, 15, 0, 15)

				ToggleFrameCircleCorner.CornerRadius = UDim.new(0, 4)
				ToggleFrameCircleCorner.Name = "ToggleFrameCircleCorner"
				ToggleFrameCircleCorner.Parent = ToggleFrameCircle

				Icon.Name = "Icon"
				Icon.Parent = ToggleFrameCircle
				Icon.AnchorPoint = Vector2.new(0.5, 0.5)
				Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Icon.BackgroundTransparency = 1.000
				Icon.BorderColor3 = Color3.fromRGB(255,255,255)
				Icon.Position = UDim2.new(0, 7, 0, 7)
				Icon.Size = UDim2.new(0, 13, 0, 13)
				Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
				Icon.ImageColor3 = Color3.fromRGB(255,255,255)
				--[[
					SaveModule
				]]
				if Config[text] ~= nil then
					default = Config[text]
				elseif Config[text] == nil then
					Config[text] = default
				end
				Toggle.MouseButton1Click:Connect(function()
					if toggled == false then
						Config[text] = true
						if ConfigSetting.AutoSave then
							ModuleSave:SaveFile();
						end
						TweenService:Create(Icon,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
						TweenService:Create(ToggleFrame,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(231, 23, 55)}):Play()
						ToggleFrameCircle:TweenPosition(UDim2.new(0.655, -5, 0.133000001, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
						TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
						Icon.Image = "http://www.roblox.com/asset/?id=6023426926"
						wait(.1)
						TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
					else
						Config[text] = false
						if ConfigSetting.AutoSave then
							ModuleSave:SaveFile();
						end
						TweenService:Create(Icon,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
						TweenService:Create(ToggleFrame,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(10,10,10)}):Play()
						ToggleFrameCircle:TweenPosition(UDim2.new(0.234999999, -5, 0.133000001, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
						TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
						Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
						wait(.01)
						TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
					end
					toggled = not toggled
					pcall(callback, toggled)
				end)
				if default == true then
					toggled = false
					TweenService:Create(Icon,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
					TweenService:Create(ToggleFrame,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(231,23,55)}):Play()
					ToggleFrameCircle:TweenPosition(UDim2.new(0.655, -5, 0.133000001, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
					TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
					Icon.Image = "http://www.roblox.com/asset/?id=6023426926"
					wait(.1)
					TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
					toggled = not toggled
					pcall(callback, toggled)
				else
					wait(.1)
				end
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end

			function ChannelContent:Slider(text, min, max, start, callback)
				if Config[text] ~= nil then
					start = Config[text]
					pcall(callback,start)
				elseif Config[text] == nil then
					Config[text] = start
				end
				local SliderFunc = {}
				local dragging = false
				local Slider = Instance.new("TextButton")
				local SliderTitle = Instance.new("TextLabel")
				local SliderFrame = Instance.new("Frame")
				local SliderFrameCorner = Instance.new("UICorner")
				local CurrentValueFrame = Instance.new("Frame")
				local CurrentValueFrameCorner = Instance.new("UICorner")
				local Zip = Instance.new("Frame")
				local ZipCorner = Instance.new("UICorner")
				local ValueBubble = Instance.new("Frame")
				local ValueBubbleCorner = Instance.new("UICorner")
				local SquareBubble = Instance.new("Frame")
				local GlowBubble = Instance.new("ImageLabel")
				local ValueLabel = Instance.new("TextLabel")


				Slider.Name = "Slider"
				Slider.Parent = ChannelHolder
				Slider.BackgroundColor3 = Color3.fromRGB(25,25,25)
				Slider.BorderSizePixel = 0
				Slider.Position = UDim2.new(0, 0, 0.216560602, 0)
				Slider.Size = UDim2.new(0, 401, 0, 38)
				Slider.AutoButtonColor = false
				Slider.Font = Enum.Font.Gotham
				Slider.Text = ""
				Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
				Slider.TextSize = 14.000

				SliderTitle.Name = "SliderTitle"
				SliderTitle.Parent = Slider
				SliderTitle.BackgroundColor3 = Color3.fromRGB(231,23,55)
				SliderTitle.BackgroundTransparency = 1.000
				SliderTitle.Position = UDim2.new(0, 5, 0, -4)
				SliderTitle.Size = UDim2.new(0, 200, 0, 27)
				SliderTitle.Font = Enum.Font.Gotham
				SliderTitle.Text = text
				SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				SliderTitle.TextSize = 14.000
				SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

				SliderFrame.Name = "SliderFrame"
				SliderFrame.Parent = Slider
				SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				SliderFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
				SliderFrame.Position = UDim2.new(0.497999996, 0, 0.757000029, 0)
				SliderFrame.Size = UDim2.new(0, 385, 0, 8)

				SliderFrameCorner.Name = "SliderFrameCorner"
				SliderFrameCorner.Parent = SliderFrame

				CurrentValueFrame.Name = "CurrentValueFrame"
				CurrentValueFrame.Parent = SliderFrame
				CurrentValueFrame.BackgroundColor3 = Color3.fromRGB(231,23,55)
				CurrentValueFrame.Size = UDim2.new((start or 0) / max, 0, 0, 8)

				CurrentValueFrameCorner.Name = "CurrentValueFrameCorner"
				CurrentValueFrameCorner.Parent = CurrentValueFrame

				Zip.Name = "Zip"
				Zip.Parent = SliderFrame
				Zip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Zip.Position = UDim2.new((start or 0)/max, -6,-0.644999981, 0)
				Zip.Size = UDim2.new(0, 10, 0, 18)
				ZipCorner.CornerRadius = UDim.new(0, 3)
				ZipCorner.Name = "ZipCorner"
				ZipCorner.Parent = Zip

				ValueBubble.Name = "ValueBubble"
				ValueBubble.Parent = Zip
				ValueBubble.AnchorPoint = Vector2.new(0.5, 0.5)
				ValueBubble.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
				ValueBubble.Position = UDim2.new(0.5, 0, -1.00800002, 0)
				ValueBubble.Size = UDim2.new(0, 36, 0, 21)
				ValueBubble.Visible = false


				Zip.MouseEnter:Connect(function()
					if dragging == false then
						ValueBubble.Visible = true
					end
				end)

				Zip.MouseLeave:Connect(function()
					if dragging == false then
						ValueBubble.Visible = false
					end
				end)


				ValueBubbleCorner.CornerRadius = UDim.new(0, 3)
				ValueBubbleCorner.Name = "ValueBubbleCorner"
				ValueBubbleCorner.Parent = ValueBubble

				SquareBubble.Name = "SquareBubble"
				SquareBubble.Parent = ValueBubble
				SquareBubble.AnchorPoint = Vector2.new(0.5, 0.5)
				SquareBubble.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
				SquareBubble.BorderSizePixel = 0
				SquareBubble.Position = UDim2.new(0.493000001, 0, 0.637999971, 0)
				SquareBubble.Rotation = 45.000
				SquareBubble.Size = UDim2.new(0, 19, 0, 19)

				GlowBubble.Name = "GlowBubble"
				GlowBubble.Parent = ValueBubble
				GlowBubble.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				GlowBubble.BackgroundTransparency = 1.000
				GlowBubble.BorderSizePixel = 0
				GlowBubble.Position = UDim2.new(0, -15, 0, -15)
				GlowBubble.Size = UDim2.new(1, 30, 1, 30)
				GlowBubble.ZIndex = 0
				GlowBubble.Image = "rbxassetid://4996891970"
				GlowBubble.ImageColor3 = Color3.fromRGB(15, 15, 15)
				GlowBubble.ScaleType = Enum.ScaleType.Slice
				GlowBubble.SliceCenter = Rect.new(20, 20, 280, 280)

				ValueLabel.Name = "ValueLabel"
				ValueLabel.Parent = ValueBubble
				ValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ValueLabel.BackgroundTransparency = 1.000
				ValueLabel.Size = UDim2.new(0, 36, 0, 21)
				ValueLabel.Font = Enum.Font.Gotham
				ValueLabel.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
				ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				ValueLabel.TextSize = 10.000
				local function move(input)
					local pos =
						UDim2.new(
							math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
							-6,
							-0.644999981,
							0
						)
					local pos1 =
						UDim2.new(
							math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
							0,
							0,
							8
						)
					CurrentValueFrame.Size = pos1
					Zip.Position = pos
					local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
					ValueLabel.Text = tostring(value)
					Config[text] = value
					if ConfigSetting.AutoSave then
						ModuleSave:SaveFile()
					end
					pcall(callback, value)
				end
				Zip.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true
							ValueBubble.Visible = true
						end
					end
				)
				Zip.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false
							ValueBubble.Visible = false
						end
					end
				)
				game:GetService("UserInputService").InputChanged:Connect(
				function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						move(input)
					end
				end
				)

				function SliderFunc:Change(tochange)
					CurrentValueFrame.Size = UDim2.new((tochange or 0) / max, 0, 0, 8)
					Zip.Position = UDim2.new((tochange or 0)/max, -6,-0.644999981, 0)
					ValueLabel.Text = tostring(tochange and math.floor((tochange / max) * (max - min) + min) or 0)
					Config[text] = tochange
					if ConfigSetting.AutoSave then
						ModuleSave:Savefile()
					end
					pcall(callback, tochange)
				end

				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
				return SliderFunc
			end
			function ChannelContent:Line()
				local Seperator1 = Instance.new("Frame")
				local Seperator2 = Instance.new("Frame")

				Seperator1.Name = "Seperator1"
				Seperator1.Parent = ChannelHolder
				Seperator1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Seperator1.BackgroundTransparency = 1.000
				Seperator1.Position = UDim2.new(0, 0, 0.350318581, 0)
				Seperator1.Size = UDim2.new(0, 100, 0, 8)

				Seperator2.Name = "Seperator2"
				Seperator2.Parent = Seperator1
				Seperator2.BackgroundColor3 = Color3.fromRGB(66, 69, 74)
				Seperator2.BorderSizePixel = 0
				Seperator2.Position = UDim2.new(0, 0, 0, 4)
				Seperator2.Size = UDim2.new(0, 401, 0, 1)
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end
            function ChannelContent:MultiDropdown(text, list, def ,callback)
                local function tablefound(ta, object)
					for i,v in pairs(ta) do
						if v == object then
							return true
						end
					end
					return false
				end
                local MultiDropFunc = {}
                local MultiItem = {}
                local Selected;
				local itemcount = 0
				local framesize = 0
				local DropTog = false
				local Dropdown = Instance.new("Frame")
				local DropdownTitle = Instance.new("TextLabel")
				local DropdownFrameOutline = Instance.new("Frame")
				local DropdownFrameOutlineCorner = Instance.new("UICorner")
				local DropdownFrame = Instance.new("Frame")
				local DropdownFrameCorner = Instance.new("UICorner")
				local CurrentSelectedText = Instance.new("TextLabel")
				local ArrowImg = Instance.new("ImageLabel")
				local DropdownFrameBtn = Instance.new("TextButton")
				local Deafault = def;
				
				if Config[text] ~= nil then
					Deafault = Config[text]
					MultiItem = Config[text]
					pcall(callback,MultiItem)
				elseif Config[text] == nil then
					Config[text] = Deafault
				end
				Dropdown.Name = "Dropdown"
				Dropdown.Parent = ChannelHolder
				Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Dropdown.BackgroundTransparency = 1.000
				Dropdown.Position = UDim2.new(0.0796874985, 0, 0.445175439, 0)
				Dropdown.Size = UDim2.new(0, 403, 0, 73)

				DropdownTitle.Name = "DropdownTitle"
				DropdownTitle.Parent = Dropdown
				DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownTitle.BackgroundTransparency = 1.000
				DropdownTitle.Position = UDim2.new(0, 5, 0, 0)
				DropdownTitle.Size = UDim2.new(0, 200, 0, 29)
				DropdownTitle.Font = Enum.Font.Gotham
				DropdownTitle.Text = text
				DropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropdownTitle.TextSize = 14.000
				DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left

				DropdownFrameOutline.Name = "DropdownFrameOutline"
				DropdownFrameOutline.Parent = DropdownTitle
				DropdownFrameOutline.AnchorPoint = Vector2.new(0.5, 0.5)
				DropdownFrameOutline.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
				DropdownFrameOutline.Position = UDim2.new(0.988442957, 0, 1.6197437, 0)
				DropdownFrameOutline.Size = UDim2.new(0, 396, 0, 36)

				DropdownFrameOutlineCorner.CornerRadius = UDim.new(0, 3)
				DropdownFrameOutlineCorner.Name = "DropdownFrameOutlineCorner"
				DropdownFrameOutlineCorner.Parent = DropdownFrameOutline

				DropdownFrame.Name = "DropdownFrame"
				DropdownFrame.Parent = DropdownTitle
				DropdownFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
				DropdownFrame.ClipsDescendants = true
				DropdownFrame.Position = UDim2.new(0.00999999978, 0, 1.06638527, 0)
				DropdownFrame.Selectable = true
				DropdownFrame.Size = UDim2.new(0, 392, 0, 32)

				DropdownFrameCorner.CornerRadius = UDim.new(0, 4)
				DropdownFrameCorner.Name = "DropdownFrameCorner"
				DropdownFrameCorner.Parent = DropdownFrame

				CurrentSelectedText.Name = "CurrentSelectedText"
				CurrentSelectedText.Parent = DropdownFrame
				CurrentSelectedText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				CurrentSelectedText.BackgroundTransparency = 1.000
				CurrentSelectedText.Position = UDim2.new(0.0178571437, 0, 0, 0)
				CurrentSelectedText.Size = UDim2.new(0, 193, 0, 32)
				CurrentSelectedText.Font = Enum.Font.Gotham
				CurrentSelectedText.Text = text..": " .. table.concat(Deafault,",")
				CurrentSelectedText.TextColor3 = Color3.fromRGB(255, 255, 255)
				CurrentSelectedText.TextSize = 14.000
				CurrentSelectedText.TextXAlignment = Enum.TextXAlignment.Left

				ArrowImg.Name = "ArrowImg"
				ArrowImg.Parent = CurrentSelectedText
				ArrowImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ArrowImg.BackgroundTransparency = 1.000
				ArrowImg.Position = UDim2.new(1.84974098, 0, 0.167428851, 0)
				ArrowImg.Size = UDim2.new(0, 22, 0, 22)
				ArrowImg.Image = "http://www.roblox.com/asset/?id=6034818372"
				ArrowImg.ImageColor3 = Color3.fromRGB(212, 212, 212)

				DropdownFrameBtn.Name = "DropdownFrameBtn"
				DropdownFrameBtn.Parent = DropdownFrame
				DropdownFrameBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownFrameBtn.BackgroundTransparency = 1.000
				DropdownFrameBtn.Size = UDim2.new(0, 392, 0, 32)
				DropdownFrameBtn.Font = Enum.Font.SourceSans
				DropdownFrameBtn.Text = ""
				DropdownFrameBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
				DropdownFrameBtn.TextSize = 14.000

				local DropdownFrameMainOutline = Instance.new("Frame")
				local DropdownFrameMainOutlineCorner = Instance.new("UICorner")
				local DropdownFrameMain = Instance.new("Frame")
				local DropdownFrameMainCorner = Instance.new("UICorner")
				local DropItemHolderLabel = Instance.new("TextLabel")
				local DropItemHolder = Instance.new("ScrollingFrame")
				local DropItemHolderLayout = Instance.new("UIListLayout")

				DropdownFrameMainOutline.Name = "DropdownFrameMainOutline"
				DropdownFrameMainOutline.Parent = DropdownTitle
				DropdownFrameMainOutline.BackgroundColor3 = Color3.fromRGB(15,15,15)
				DropdownFrameMainOutline.Position = UDim2.new(-0.00155700743, 0, 2.16983342, 0)
				DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, 81)
				DropdownFrameMainOutline.Visible = false

				DropdownFrameMainOutlineCorner.CornerRadius = UDim.new(0, 3)
				DropdownFrameMainOutlineCorner.Name = "DropdownFrameMainOutlineCorner"
				DropdownFrameMainOutlineCorner.Parent = DropdownFrameMainOutline

				DropdownFrameMain.Name = "DropdownFrameMain"
				DropdownFrameMain.Parent = DropdownTitle
				DropdownFrameMain.BackgroundColor3 = Color3.fromRGB(25,25,25)
				DropdownFrameMain.ClipsDescendants = true
				DropdownFrameMain.Position = UDim2.new(0.00999999978, 0, 2.2568965, 0)
				DropdownFrameMain.Selectable = true
				DropdownFrameMain.Size = UDim2.new(0, 392, 0, 77)
				DropdownFrameMain.Visible = false

				DropdownFrameMainCorner.CornerRadius = UDim.new(0, 4)
				DropdownFrameMainCorner.Name = "DropdownFrameMainCorner"
				DropdownFrameMainCorner.Parent = DropdownFrameMain

				DropItemHolderLabel.Name = "ItemHolderLabel"
				DropItemHolderLabel.Parent = DropdownFrameMain
				DropItemHolderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropItemHolderLabel.BackgroundTransparency = 1.000
				DropItemHolderLabel.Position = UDim2.new(0.0178571437, 0, 0, 0)
				DropItemHolderLabel.Size = UDim2.new(0, 193, 0, 13)
				DropItemHolderLabel.Font = Enum.Font.Gotham
				DropItemHolderLabel.Text = ""
				DropItemHolderLabel.TextColor3 = Color3.fromRGB(212, 212, 212)
				DropItemHolderLabel.TextSize = 14.000
				DropItemHolderLabel.TextXAlignment = Enum.TextXAlignment.Left

				DropItemHolder.Name = "ItemHolder"
				DropItemHolder.Parent = DropItemHolderLabel
				DropItemHolder.Active = true
				DropItemHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropItemHolder.BackgroundTransparency = 1.000
				DropItemHolder.Position = UDim2.new(0, 0, 0.215384638, 0)
				DropItemHolder.Size = UDim2.new(0, 385, 0, 0)
				DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
				DropItemHolder.ScrollBarThickness = 4
				DropItemHolder.BorderSizePixel = 0
				DropItemHolder.ScrollBarImageColor3 = Color3.fromRGB(231,23,55)

				DropItemHolderLayout.Name = "ItemHolderLayout"
				DropItemHolderLayout.Parent = DropItemHolder
				DropItemHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
				DropItemHolderLayout.Padding = UDim.new(0, 0)

				DropdownFrameBtn.MouseButton1Click:Connect(function()
					if DropTog == false then
						DropdownFrameMain.Visible = true
						DropdownFrameMainOutline.Visible = true
						Dropdown.Size = UDim2.new(0, 403, 0, 73 + DropdownFrameMainOutline.AbsoluteSize.Y)
						ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)

					else
						Dropdown.Size = UDim2.new(0, 403, 0, 73)
						DropdownFrameMain.Visible = false
						DropdownFrameMainOutline.Visible = false
						ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
					end
					DropTog = not DropTog
				end)


				for i,v in next, list do
					itemcount = itemcount + 1

					if itemcount == 1 then
						framesize = 29
					elseif itemcount == 2 then
						framesize = 58
					elseif itemcount >= 3 and itemcount <= 9 then
						framesize = 87
					elseif itemcount >= 10 then
						framesize = 200
					end

					local Item = Instance.new("TextButton")
					local ItemCorner = Instance.new("UICorner")
					local ItemText = Instance.new("TextLabel")

					Item.Name = "Item"
					Item.Parent = DropItemHolder
					Item.BackgroundColor3 = Color3.fromRGB(10,10,10)
					Item.Size = UDim2.new(0, 379, 0, 29)
					Item.AutoButtonColor = false
					Item.Font = Enum.Font.SourceSans
					Item.Text = ""
					Item.TextColor3 = Color3.fromRGB(0, 0, 0)
					Item.TextSize = 14.000
					Item.BackgroundTransparency = 1

					ItemCorner.CornerRadius = UDim.new(0, 4)
					ItemCorner.Name = "ItemCorner"
					ItemCorner.Parent = Item

					ItemText.Name = "ItemText"
					ItemText.Parent = Item
					ItemText.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
					ItemText.BackgroundTransparency = 1.000
					ItemText.Position = UDim2.new(0.0211081803, 0, 0, 0)
					ItemText.Size = UDim2.new(0, 192, 0, 29)
					ItemText.Font = Enum.Font.Gotham
					ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
					ItemText.TextSize = 14.000
					ItemText.TextXAlignment = Enum.TextXAlignment.Left
					ItemText.Text = v
					local stringfind = table.concat(MultiItem,",")
					if string.find(stringfind,ItemText.Text) then
						ItemText.TextColor3 = Color3.fromRGB(255, 10, 5)
					end
					Item.MouseButton1Click:Connect(function()
                        if tablefound(MultiItem,v) then
                            for io,va in next,MultiItem do
								if va == v then
									table.remove(MultiItem,io)
								end
							end
                            ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
                            CurrentSelectedText.Text = text .." : "..table.concat(MultiItem,",")
							Config[text] = MultiItem
							if ConfigSetting.AutoSave then
								ModuleSave:SaveFile();
							end
                            pcall(callback,MultiItem)
                        else
                            table.insert(MultiItem,v)
                            CurrentSelectedText.Text = text .." : "..table.concat(MultiItem,",")
                            ItemText.TextColor3 = Color3.fromRGB(255, 10, 5)
							Config[text] = MultiItem
							if ConfigSetting.AutoSave then
								ModuleSave:SaveFile();
							end
                            pcall(callback,MultiItem)
                        end
					end)

					DropItemHolder.CanvasSize = UDim2.new(0,0,0,DropItemHolderLayout.AbsoluteContentSize.Y)

					DropItemHolder.Size = UDim2.new(0, 385, 0, framesize)
					DropdownFrameMain.Size = UDim2.new(0, 392, 0, framesize + 6)
					DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, framesize + 10)
				end

				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)

				function MultiDropFunc:Clear()
					for i,v in next, DropItemHolder:GetChildren() do
						if v.Name == "Item" then
							v:Destroy()
						end
					end
					table.clear(MultiItem);
					CurrentSelectedText.Text = "..."
					Config[text] = MultiItem
					if ConfigSetting.AutoSave then
						ModuleSave:SaveFile();
					end
					itemcount = 0
					framesize = 0
					DropItemHolder.Size = UDim2.new(0, 385, 0, 0)
					DropdownFrameMain.Size = UDim2.new(0, 392, 0, 0)
					DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, 0)
					Dropdown.Size = UDim2.new(0, 403, 0, 73)
					DropdownFrameMain.Visible = false
					DropdownFrameMainOutline.Visible = false
					ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
				end

				function MultiDropFunc:Add(textadd)
					itemcount = itemcount + 1

					if itemcount == 1 then
						framesize = 29
					elseif itemcount == 2 then
						framesize = 58
					elseif itemcount >= 3 and itemcount <= 4 then
						framesize = 87
					elseif itemcount >= 10 then
						framesize = 200
					end

					local Item = Instance.new("TextButton")
					local ItemCorner = Instance.new("UICorner")
					local ItemText = Instance.new("TextLabel")

					Item.Name = "Item"
					Item.Parent = DropItemHolder
					Item.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
					Item.Size = UDim2.new(0, 379, 0, 29)
					Item.AutoButtonColor = false
					Item.Font = Enum.Font.SourceSans
					Item.Text = ""
					Item.TextColor3 = Color3.fromRGB(0, 0, 0)
					Item.TextSize = 14.000
					Item.BackgroundTransparency = 1

					ItemCorner.CornerRadius = UDim.new(0, 4)
					ItemCorner.Name = "ItemCorner"
					ItemCorner.Parent = Item

					ItemText.Name = "ItemText"
					ItemText.Parent = Item
					ItemText.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
					ItemText.BackgroundTransparency = 1.000
					ItemText.Position = UDim2.new(0.0211081803, 0, 0, 0)
					ItemText.Size = UDim2.new(0, 192, 0, 29)
					ItemText.Font = Enum.Font.Gotham
					ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
					ItemText.TextSize = 14.000
					ItemText.TextXAlignment = Enum.TextXAlignment.Left
					ItemText.Text = textadd

					Item.MouseButton1Click:Connect(function()
						if tablefound(MultiItem,textadd) then
                            for io,va in next,MultiItem do
								if va == textadd then
									table.remove(MultiItem,io)
								end
							end
                            ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
                            CurrentSelectedText.Text = text .." : "..table.concat(MultiItem,",")
							Config[text] = MultiItem
							if ConfigSetting.AutoSave then
								ModuleSave:SaveFile();
							end
                            pcall(callback,MultiItem)
                        else
                            table.insert(MultiItem,textadd)
                            CurrentSelectedText.Text = text .." : "..table.concat(MultiItem,",")
                            ItemText.TextColor3 = Color3.fromRGB(255, 10, 5)
							Config[text] = MultiItem
							if ConfigSetting.AutoSave then
								ModuleSave:SaveFile();
							end
                            pcall(callback,MultiItem)
                        end
					end)

					DropItemHolder.CanvasSize = UDim2.new(0,0,0,DropItemHolderLayout.AbsoluteContentSize.Y)

					DropItemHolder.Size = UDim2.new(0, 385, 0, framesize)
					DropdownFrameMain.Size = UDim2.new(0, 392, 0, framesize + 6)
					DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, framesize + 10)
				end
				return MultiDropFunc
            end
			function ChannelContent:Dropdown(text, list, def ,callback)
				local DropFunc = {}
				local itemcount = 0
				local framesize = 0
				local DropTog = false
				local Dropdown = Instance.new("Frame")
				local DropdownTitle = Instance.new("TextLabel")
				local DropdownFrameOutline = Instance.new("Frame")
				local DropdownFrameOutlineCorner = Instance.new("UICorner")
				local DropdownFrame = Instance.new("Frame")
				local DropdownFrameCorner = Instance.new("UICorner")
				local CurrentSelectedText = Instance.new("TextLabel")
				local ArrowImg = Instance.new("ImageLabel")
				local DropdownFrameBtn = Instance.new("TextButton")
				if Config[text] ~= nil then
					def = Config[text]
					pcall(callback,def)
				elseif Config[text] == nil then
					Config[text] = def
				end
				Dropdown.Name = "Dropdown"
				Dropdown.Parent = ChannelHolder
				Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Dropdown.BackgroundTransparency = 1.000
				Dropdown.Position = UDim2.new(0.0796874985, 0, 0.445175439, 0)
				Dropdown.Size = UDim2.new(0, 403, 0, 73)

				DropdownTitle.Name = "DropdownTitle"
				DropdownTitle.Parent = Dropdown
				DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownTitle.BackgroundTransparency = 1.000
				DropdownTitle.Position = UDim2.new(0, 5, 0, 0)
				DropdownTitle.Size = UDim2.new(0, 200, 0, 29)
				DropdownTitle.Font = Enum.Font.Gotham
				DropdownTitle.Text = text
				DropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropdownTitle.TextSize = 14.000
				DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left

				DropdownFrameOutline.Name = "DropdownFrameOutline"
				DropdownFrameOutline.Parent = DropdownTitle
				DropdownFrameOutline.AnchorPoint = Vector2.new(0.5, 0.5)
				DropdownFrameOutline.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
				DropdownFrameOutline.Position = UDim2.new(0.988442957, 0, 1.6197437, 0)
				DropdownFrameOutline.Size = UDim2.new(0, 396, 0, 36)

				DropdownFrameOutlineCorner.CornerRadius = UDim.new(0, 3)
				DropdownFrameOutlineCorner.Name = "DropdownFrameOutlineCorner"
				DropdownFrameOutlineCorner.Parent = DropdownFrameOutline

				DropdownFrame.Name = "DropdownFrame"
				DropdownFrame.Parent = DropdownTitle
				DropdownFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
				DropdownFrame.ClipsDescendants = true
				DropdownFrame.Position = UDim2.new(0.00999999978, 0, 1.06638527, 0)
				DropdownFrame.Selectable = true
				DropdownFrame.Size = UDim2.new(0, 392, 0, 32)

				DropdownFrameCorner.CornerRadius = UDim.new(0, 4)
				DropdownFrameCorner.Name = "DropdownFrameCorner"
				DropdownFrameCorner.Parent = DropdownFrame

				CurrentSelectedText.Name = "CurrentSelectedText"
				CurrentSelectedText.Parent = DropdownFrame
				CurrentSelectedText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				CurrentSelectedText.BackgroundTransparency = 1.000
				CurrentSelectedText.Position = UDim2.new(0.0178571437, 0, 0, 0)
				CurrentSelectedText.Size = UDim2.new(0, 193, 0, 32)
				CurrentSelectedText.Font = Enum.Font.Gotham
				CurrentSelectedText.Text = text..":"..def
				CurrentSelectedText.TextColor3 = Color3.fromRGB(255, 255, 255)
				CurrentSelectedText.TextSize = 14.000
				CurrentSelectedText.TextXAlignment = Enum.TextXAlignment.Left

				ArrowImg.Name = "ArrowImg"
				ArrowImg.Parent = CurrentSelectedText
				ArrowImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ArrowImg.BackgroundTransparency = 1.000
				ArrowImg.Position = UDim2.new(1.84974098, 0, 0.167428851, 0)
				ArrowImg.Size = UDim2.new(0, 22, 0, 22)
				ArrowImg.Image = "http://www.roblox.com/asset/?id=6034818372"
				ArrowImg.ImageColor3 = Color3.fromRGB(212, 212, 212)

				DropdownFrameBtn.Name = "DropdownFrameBtn"
				DropdownFrameBtn.Parent = DropdownFrame
				DropdownFrameBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownFrameBtn.BackgroundTransparency = 1.000
				DropdownFrameBtn.Size = UDim2.new(0, 392, 0, 32)
				DropdownFrameBtn.Font = Enum.Font.SourceSans
				DropdownFrameBtn.Text = ""
				DropdownFrameBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
				DropdownFrameBtn.TextSize = 14.000

				local DropdownFrameMainOutline = Instance.new("Frame")
				local DropdownFrameMainOutlineCorner = Instance.new("UICorner")
				local DropdownFrameMain = Instance.new("Frame")
				local DropdownFrameMainCorner = Instance.new("UICorner")
				local DropItemHolderLabel = Instance.new("TextLabel")
				local DropItemHolder = Instance.new("ScrollingFrame")
				local DropItemHolderLayout = Instance.new("UIListLayout")

				DropdownFrameMainOutline.Name = "DropdownFrameMainOutline"
				DropdownFrameMainOutline.Parent = DropdownTitle
				DropdownFrameMainOutline.BackgroundColor3 = Color3.fromRGB(15,15,15)
				DropdownFrameMainOutline.Position = UDim2.new(-0.00155700743, 0, 2.16983342, 0)
				DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, 81)
				DropdownFrameMainOutline.Visible = false

				DropdownFrameMainOutlineCorner.CornerRadius = UDim.new(0, 3)
				DropdownFrameMainOutlineCorner.Name = "DropdownFrameMainOutlineCorner"
				DropdownFrameMainOutlineCorner.Parent = DropdownFrameMainOutline

				DropdownFrameMain.Name = "DropdownFrameMain"
				DropdownFrameMain.Parent = DropdownTitle
				DropdownFrameMain.BackgroundColor3 = Color3.fromRGB(25,25,25)
				DropdownFrameMain.ClipsDescendants = true
				DropdownFrameMain.Position = UDim2.new(0.00999999978, 0, 2.2568965, 0)
				DropdownFrameMain.Selectable = true
				DropdownFrameMain.Size = UDim2.new(0, 392, 0, 77)
				DropdownFrameMain.Visible = false

				DropdownFrameMainCorner.CornerRadius = UDim.new(0, 4)
				DropdownFrameMainCorner.Name = "DropdownFrameMainCorner"
				DropdownFrameMainCorner.Parent = DropdownFrameMain

				DropItemHolderLabel.Name = "ItemHolderLabel"
				DropItemHolderLabel.Parent = DropdownFrameMain
				DropItemHolderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropItemHolderLabel.BackgroundTransparency = 1.000
				DropItemHolderLabel.Position = UDim2.new(0.0178571437, 0, 0, 0)
				DropItemHolderLabel.Size = UDim2.new(0, 193, 0, 13)
				DropItemHolderLabel.Font = Enum.Font.Gotham
				DropItemHolderLabel.Text = ""
				DropItemHolderLabel.TextColor3 = Color3.fromRGB(212, 212, 212)
				DropItemHolderLabel.TextSize = 14.000
				DropItemHolderLabel.TextXAlignment = Enum.TextXAlignment.Left

				DropItemHolder.Name = "ItemHolder"
				DropItemHolder.Parent = DropItemHolderLabel
				DropItemHolder.Active = true
				DropItemHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropItemHolder.BackgroundTransparency = 1.000
				DropItemHolder.Position = UDim2.new(0, 0, 0.215384638, 0)
				DropItemHolder.Size = UDim2.new(0, 385, 0, 0)
				DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
				DropItemHolder.ScrollBarThickness = 4
				DropItemHolder.BorderSizePixel = 0
				DropItemHolder.ScrollBarImageColor3 = Color3.fromRGB(231,23,55)

				DropItemHolderLayout.Name = "ItemHolderLayout"
				DropItemHolderLayout.Parent = DropItemHolder
				DropItemHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
				DropItemHolderLayout.Padding = UDim.new(0, 0)

				DropdownFrameBtn.MouseButton1Click:Connect(function()
					if DropTog == false then
						DropdownFrameMain.Visible = true
						DropdownFrameMainOutline.Visible = true
						Dropdown.Size = UDim2.new(0, 403, 0, 73 + DropdownFrameMainOutline.AbsoluteSize.Y)
						ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)

					else
						Dropdown.Size = UDim2.new(0, 403, 0, 73)
						DropdownFrameMain.Visible = false
						DropdownFrameMainOutline.Visible = false
						ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
					end
					DropTog = not DropTog
				end)


				for i,v in next, list do
					itemcount = itemcount + 1

					if itemcount == 1 then
						framesize = 29
					elseif itemcount == 2 then
						framesize = 58
					elseif itemcount >= 3 and itemcount <= 9 then
						framesize = 87
					elseif itemcount >= 10 then
						framesize = 200
					end

					local Item = Instance.new("TextButton")
					local ItemCorner = Instance.new("UICorner")
					local ItemText = Instance.new("TextLabel")

					Item.Name = "Item"
					Item.Parent = DropItemHolder
					Item.BackgroundColor3 = Color3.fromRGB(10,10,10)
					Item.Size = UDim2.new(0, 379, 0, 29)
					Item.AutoButtonColor = false
					Item.Font = Enum.Font.SourceSans
					Item.Text = ""
					Item.TextColor3 = Color3.fromRGB(0, 0, 0)
					Item.TextSize = 14.000
					Item.BackgroundTransparency = 1

					ItemCorner.CornerRadius = UDim.new(0, 4)
					ItemCorner.Name = "ItemCorner"
					ItemCorner.Parent = Item

					ItemText.Name = "ItemText"
					ItemText.Parent = Item
					ItemText.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
					ItemText.BackgroundTransparency = 1.000
					ItemText.Position = UDim2.new(0.0211081803, 0, 0, 0)
					ItemText.Size = UDim2.new(0, 192, 0, 29)
					ItemText.Font = Enum.Font.Gotham
					ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
					ItemText.TextSize = 14.000
					ItemText.TextXAlignment = Enum.TextXAlignment.Left
					ItemText.Text = v

					Item.MouseEnter:Connect(function()
						ItemText.TextColor3 = Color3.fromRGB(255,255,255)
						Item.BackgroundTransparency = 0
					end)

					Item.MouseLeave:Connect(function()
						ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
						Item.BackgroundTransparency = 1
					end)

					Item.MouseButton1Click:Connect(function()
						CurrentSelectedText.Text = text..": "..v
						Config[text] = v
						if ConfigSetting.AutoSave then
							ModuleSave:SaveFile()
						end
						pcall(callback, v)
						Dropdown.Size = UDim2.new(0, 403, 0, 73)
						DropdownFrameMain.Visible = false
						DropdownFrameMainOutline.Visible = false
						ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
						DropTog = not DropTog
					end)

					DropItemHolder.CanvasSize = UDim2.new(0,0,0,DropItemHolderLayout.AbsoluteContentSize.Y)

					DropItemHolder.Size = UDim2.new(0, 385, 0, framesize)
					DropdownFrameMain.Size = UDim2.new(0, 392, 0, framesize + 6)
					DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, framesize + 10)
				end

				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)

				function DropFunc:Clear()
					for i,v in next, DropItemHolder:GetChildren() do
						if v.Name == "Item" then
							v:Destroy()
						end
					end

					CurrentSelectedText.Text = "..."

					itemcount = 0
					framesize = 0
					DropItemHolder.Size = UDim2.new(0, 385, 0, 0)
					DropdownFrameMain.Size = UDim2.new(0, 392, 0, 0)
					DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, 0)
					Dropdown.Size = UDim2.new(0, 403, 0, 73)
					DropdownFrameMain.Visible = false
					DropdownFrameMainOutline.Visible = false
					ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
				end

				function DropFunc:Add(textadd)
					itemcount = itemcount + 1

					if itemcount == 1 then
						framesize = 29
					elseif itemcount == 2 then
						framesize = 58
					elseif itemcount >= 3 and itemcount <= 4 then
						framesize = 87
					elseif itemcount >= 10 then
						framesize = 200
					end

					local Item = Instance.new("TextButton")
					local ItemCorner = Instance.new("UICorner")
					local ItemText = Instance.new("TextLabel")

					Item.Name = "Item"
					Item.Parent = DropItemHolder
					Item.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
					Item.Size = UDim2.new(0, 379, 0, 29)
					Item.AutoButtonColor = false
					Item.Font = Enum.Font.SourceSans
					Item.Text = ""
					Item.TextColor3 = Color3.fromRGB(0, 0, 0)
					Item.TextSize = 14.000
					Item.BackgroundTransparency = 1

					ItemCorner.CornerRadius = UDim.new(0, 4)
					ItemCorner.Name = "ItemCorner"
					ItemCorner.Parent = Item

					ItemText.Name = "ItemText"
					ItemText.Parent = Item
					ItemText.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
					ItemText.BackgroundTransparency = 1.000
					ItemText.Position = UDim2.new(0.0211081803, 0, 0, 0)
					ItemText.Size = UDim2.new(0, 192, 0, 29)
					ItemText.Font = Enum.Font.Gotham
					ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
					ItemText.TextSize = 14.000
					ItemText.TextXAlignment = Enum.TextXAlignment.Left
					ItemText.Text = textadd

					Item.MouseEnter:Connect(function()
						ItemText.TextColor3 = Color3.fromRGB(255,255,255)
						Item.BackgroundTransparency = 0
					end)

					Item.MouseLeave:Connect(function()
						ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
						Item.BackgroundTransparency = 1
					end)

					Item.MouseButton1Click:Connect(function()
						CurrentSelectedText.Text = text..": "..textadd
						Config[text] = textadd
						if ConfigSetting.AutoSave then
							ModuleSave:SaveFile()
						end
						pcall(callback, textadd)
						Dropdown.Size = UDim2.new(0, 403, 0, 73)
						DropdownFrameMain.Visible = false
						DropdownFrameMainOutline.Visible = false
						ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
						DropTog = not DropTog
					end)

					DropItemHolder.CanvasSize = UDim2.new(0,0,0,DropItemHolderLayout.AbsoluteContentSize.Y)

					DropItemHolder.Size = UDim2.new(0, 385, 0, framesize)
					DropdownFrameMain.Size = UDim2.new(0, 392, 0, framesize + 6)
					DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, framesize + 10)
				end
				return DropFunc
			end
			function ChannelContent:Colorpicker(text, preset, callback)
				local OldToggleColor = Color3.fromRGB(0, 0, 0)
				local OldColor = Color3.fromRGB(0, 0, 0)
				local OldColorSelectionPosition = nil
				local OldHueSelectionPosition = nil
				local ColorH, ColorS, ColorV = 1, 1, 1
				local RainbowColorPicker = false
				local ColorPickerInput = nil
				local ColorInput = nil
				local HueInput = nil

				local Colorpicker = Instance.new("Frame")
				local ColorpickerTitle = Instance.new("TextLabel")
				local ColorpickerFrameOutline = Instance.new("Frame")
				local ColorpickerFrameOutlineCorner = Instance.new("UICorner")
				local ColorpickerFrame = Instance.new("Frame")
				local ColorpickerFrameCorner = Instance.new("UICorner")
				local Color = Instance.new("ImageLabel")
				local ColorCorner = Instance.new("UICorner")
				local ColorSelection = Instance.new("ImageLabel")
				local Hue = Instance.new("ImageLabel")
				local HueCorner = Instance.new("UICorner")
				local HueGradient = Instance.new("UIGradient")
				local HueSelection = Instance.new("ImageLabel")
				local PresetClr = Instance.new("Frame")
				local PresetClrCorner = Instance.new("UICorner")

				Colorpicker.Name = "Colorpicker"
				Colorpicker.Parent = ChannelHolder
				Colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Colorpicker.BackgroundTransparency = 1.000
				Colorpicker.Position = UDim2.new(0.0895741582, 0, 0.474232763, 0)
				Colorpicker.Size = UDim2.new(0, 403, 0, 175)

				ColorpickerTitle.Name = "ColorpickerTitle"
				ColorpickerTitle.Parent = Colorpicker
				ColorpickerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorpickerTitle.BackgroundTransparency = 1.000
				ColorpickerTitle.Position = UDim2.new(0, 5, 0, 0)
				ColorpickerTitle.Size = UDim2.new(0, 200, 0, 29)
				ColorpickerTitle.Font = Enum.Font.Gotham
				ColorpickerTitle.Text = "Colorpicker"
				ColorpickerTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
				ColorpickerTitle.TextSize = 14.000
				ColorpickerTitle.TextXAlignment = Enum.TextXAlignment.Left

				ColorpickerFrameOutline.Name = "ColorpickerFrameOutline"
				ColorpickerFrameOutline.Parent = ColorpickerTitle
				ColorpickerFrameOutline.BackgroundColor3 = Color3.fromRGB(37, 40, 43)
				ColorpickerFrameOutline.Position = UDim2.new(-0.00100000005, 0, 0.991999984, 0)
				ColorpickerFrameOutline.Size = UDim2.new(0, 238, 0, 139)

				ColorpickerFrameOutlineCorner.CornerRadius = UDim.new(0, 3)
				ColorpickerFrameOutlineCorner.Name = "ColorpickerFrameOutlineCorner"

				ColorpickerFrameOutlineCorner.Parent = ColorpickerFrameOutline

				ColorpickerFrame.Name = "ColorpickerFrame"
				ColorpickerFrame.Parent = ColorpickerTitle
				ColorpickerFrame.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
				ColorpickerFrame.ClipsDescendants = true
				ColorpickerFrame.Position = UDim2.new(0.00999999978, 0, 1.06638515, 0)
				ColorpickerFrame.Selectable = true
				ColorpickerFrame.Size = UDim2.new(0, 234, 0, 135)

				ColorpickerFrameCorner.CornerRadius = UDim.new(0, 3)
				ColorpickerFrameCorner.Name = "ColorpickerFrameCorner"
				ColorpickerFrameCorner.Parent = ColorpickerFrame

				Color.Name = "Color"
				Color.Parent = ColorpickerFrame
				Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
				Color.Position = UDim2.new(0, 10, 0, 10)
				Color.Size = UDim2.new(0, 154, 0, 118)
				Color.ZIndex = 10
				Color.Image = "rbxassetid://4155801252"

				ColorCorner.CornerRadius = UDim.new(0, 3)
				ColorCorner.Name = "ColorCorner"
				ColorCorner.Parent = Color

				ColorSelection.Name = "ColorSelection"
				ColorSelection.Parent = Color
				ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorSelection.BackgroundTransparency = 1.000
				ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
				ColorSelection.Size = UDim2.new(0, 18, 0, 18)
				ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
				ColorSelection.ScaleType = Enum.ScaleType.Fit

				Hue.Name = "Hue"
				Hue.Parent = ColorpickerFrame
				Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Hue.Position = UDim2.new(0, 171, 0, 10)
				Hue.Size = UDim2.new(0, 18, 0, 118)

				HueCorner.CornerRadius = UDim.new(0, 3)
				HueCorner.Name = "HueCorner"
				HueCorner.Parent = Hue

				HueGradient.Color = ColorSequence.new {
					ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
					ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
					ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
					ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
					ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
					ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
					ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
				}
				HueGradient.Rotation = 270
				HueGradient.Name = "HueGradient"
				HueGradient.Parent = Hue

				HueSelection.Name = "HueSelection"
				HueSelection.Parent = Hue
				HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				HueSelection.BackgroundTransparency = 1.000
				HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
				HueSelection.Size = UDim2.new(0, 18, 0, 18)
				HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"

				PresetClr.Name = "PresetClr"
				PresetClr.Parent = ColorpickerFrame
				PresetClr.BackgroundColor3 = preset
				PresetClr.Position = UDim2.new(0.846153855, 0, 0.0740740746, 0)
				PresetClr.Size = UDim2.new(0, 25, 0, 25)

				PresetClrCorner.CornerRadius = UDim.new(0, 3)
				PresetClrCorner.Name = "PresetClrCorner"
				PresetClrCorner.Parent = PresetClr

				local function UpdateColorPicker(nope)
					PresetClr.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
					Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

					pcall(callback, PresetClr.BackgroundColor3)
				end

				ColorH =
					1 -
					(math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
						Hue.AbsoluteSize.Y)
				ColorS =
					(math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
						Color.AbsoluteSize.X)
				ColorV =
					1 -
					(math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
						Color.AbsoluteSize.Y)

				PresetClr.BackgroundColor3 = preset
				Color.BackgroundColor3 = preset
				pcall(callback, PresetClr.BackgroundColor3)

				Color.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then

							if ColorInput then
								ColorInput:Disconnect()
							end

							ColorInput =
								RunService.RenderStepped:Connect(
									function()
										local ColorX =
										(math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
											Color.AbsoluteSize.X)
										local ColorY =
										(math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
											Color.AbsoluteSize.Y)

										ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
										ColorS = ColorX
										ColorV = 1 - ColorY

										UpdateColorPicker(true)
									end
								)
						end
					end
				)

				Color.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if ColorInput then
								ColorInput:Disconnect()
							end
						end
					end
				)

				Hue.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then


							if HueInput then
								HueInput:Disconnect()
							end

							HueInput =
								RunService.RenderStepped:Connect(
									function()
										local HueY =
										(math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
											Hue.AbsoluteSize.Y)

										HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
										ColorH = 1 - HueY

										UpdateColorPicker(true)
									end
								)
						end
					end
				)

				Hue.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if HueInput then
								HueInput:Disconnect()
							end
						end
					end
				)

				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end

			function ChannelContent:Textbox(text, placetext, disapper, callback)
				local Textbox = Instance.new("Frame")
				local TextboxTitle = Instance.new("TextLabel")
				local TextboxFrameOutline = Instance.new("Frame")
				local TextboxFrameOutlineCorner = Instance.new("UICorner")
				local TextboxFrame = Instance.new("Frame")
				local TextboxFrameCorner = Instance.new("UICorner")
				local TextBox = Instance.new("TextBox")
				Textbox.Name = "Textbox"
				Textbox.Parent = ChannelHolder
				Textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Textbox.BackgroundTransparency = 1.000
				Textbox.Position = UDim2.new(0.0796874985, 0, 0.445175439, 0)
				Textbox.Size = UDim2.new(0, 403, 0, 73)

				TextboxTitle.Name = "TextboxTitle"
				TextboxTitle.Parent = Textbox
				TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextboxTitle.BackgroundTransparency = 1.000
				TextboxTitle.Position = UDim2.new(0, 5, 0, 0)
				TextboxTitle.Size = UDim2.new(0, 200, 0, 29)
				TextboxTitle.Font = Enum.Font.Gotham
				TextboxTitle.Text = text
				TextboxTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextboxTitle.TextSize = 14.000
				TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left

				TextboxFrameOutline.Name = "TextboxFrameOutline"
				TextboxFrameOutline.Parent = TextboxTitle
				TextboxFrameOutline.AnchorPoint = Vector2.new(0.5, 0.5)
				TextboxFrameOutline.BackgroundColor3 = Color3.fromRGB(15,15,15)
				TextboxFrameOutline.Position = UDim2.new(0.988442957, 0, 1.6197437, 0)
				TextboxFrameOutline.Size = UDim2.new(0, 396, 0, 36)

				TextboxFrameOutlineCorner.CornerRadius = UDim.new(0, 3)
				TextboxFrameOutlineCorner.Name = "TextboxFrameOutlineCorner"
				TextboxFrameOutlineCorner.Parent = TextboxFrameOutline

				TextboxFrame.Name = "TextboxFrame"
				TextboxFrame.Parent = TextboxTitle
				TextboxFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
				TextboxFrame.ClipsDescendants = true
				TextboxFrame.Position = UDim2.new(0.00999999978, 0, 1.06638527, 0)
				TextboxFrame.Selectable = true
				TextboxFrame.Size = UDim2.new(0, 392, 0, 32)

				TextboxFrameCorner.CornerRadius = UDim.new(0, 4)
				TextboxFrameCorner.Name = "TextboxFrameCorner"
				TextboxFrameCorner.Parent = TextboxFrame

				TextBox.Parent = TextboxFrame
				TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.BackgroundTransparency = 1.000
				TextBox.Position = UDim2.new(0.0178571437, 0, 0, 0)
				TextBox.Size = UDim2.new(0, 377, 0, 32)
				TextBox.Font = Enum.Font.Gotham
				TextBox.PlaceholderColor3 = Color3.fromRGB(255,255,255)
				TextBox.PlaceholderText = placetext
				TextBox.Text = ""
				TextBox.TextColor3 = Color3.fromRGB(193, 195, 197)
				TextBox.TextSize = 14.000
				TextBox.TextXAlignment = Enum.TextXAlignment.Left
				if Config[text] ~= nil then
					TextBox.Text = Config[text]
					pcall(callback,TextBox.Text)
				elseif Config[text] == nil then
					Config[text] = ""
				end
				TextBox.Focused:Connect(function()
					TweenService:Create(
						TextboxFrameOutline,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(255, 170, 0)}
					):Play()
				end)

				TextBox.FocusLost:Connect(function(ep)
					TweenService:Create(
						TextboxFrameOutline,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(15,15,15)}
					):Play()
					if ep then
						if #TextBox.Text > 0 then
							pcall(callback, TextBox.Text)
							Config[text] = TextBox.Text
							if ConfigSetting.AutoSave then
								ModuleSave:SaveFile()
							end
							if disapper then
								TextBox.Text = ""
							end
						end
					end
				end)

				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end

			function ChannelContent:Label(text,colortext)
				local Label = Instance.new("TextButton")
				local LabelTitle = Instance.new("TextLabel")
				local labelfunc = {}

				Label.Name = "Label"
				Label.Parent = ChannelHolder
				Label.BackgroundColor3 = Color3.fromRGB(25,25,25)
				Label.BorderSizePixel = 0
				Label.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
				Label.Size = UDim2.new(0, 401, 0, 30)
				Label.AutoButtonColor = false
				Label.Font = Enum.Font.Gotham
				Label.Text = ""
				Label.TextColor3 = colortext
				Label.TextSize = 14.000

				LabelTitle.Name = "LabelTitle"
				LabelTitle.Parent = Label
				LabelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelTitle.BackgroundTransparency = 1.000
				LabelTitle.Position = UDim2.new(0, 5, 0, 0)
				LabelTitle.Size = UDim2.new(0, 200, 0, 30)
				LabelTitle.Font = Enum.Font.Gotham
				LabelTitle.Text = text
				LabelTitle.TextColor3 = colortext
				LabelTitle.TextSize = 14.000
				LabelTitle.TextXAlignment = Enum.TextXAlignment.Left

				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
				function labelfunc:Refresh(tochange)
					Label.Text = tochange
				end	
				return labelfunc
			end

			function ChannelContent:Bind(text, presetbind, callback)
				local Key = presetbind.Name
				local Keybind = Instance.new("TextButton")
				local KeybindTitle = Instance.new("TextLabel")
				local KeybindText = Instance.new("TextLabel")

				Keybind.Name = "Keybind"
				Keybind.Parent = ChannelHolder
				Keybind.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
				Keybind.BorderSizePixel = 0
				Keybind.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
				Keybind.Size = UDim2.new(0, 401, 0, 30)
				Keybind.AutoButtonColor = false
				Keybind.Font = Enum.Font.Gotham
				Keybind.Text = ""
				Keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
				Keybind.TextSize = 14.000

				KeybindTitle.Name = "KeybindTitle"
				KeybindTitle.Parent = Keybind
				KeybindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				KeybindTitle.BackgroundTransparency = 1.000
				KeybindTitle.Position = UDim2.new(0, 5, 0, 0)
				KeybindTitle.Size = UDim2.new(0, 200, 0, 30)
				KeybindTitle.Font = Enum.Font.Gotham
				KeybindTitle.Text = text
				KeybindTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				KeybindTitle.TextSize = 14.000
				KeybindTitle.TextXAlignment = Enum.TextXAlignment.Left

				KeybindText.Name = "KeybindText"
				KeybindText.Parent = Keybind
				KeybindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				KeybindText.BackgroundTransparency = 1.000
				KeybindText.Position = UDim2.new(0, 316, 0, 0)
				KeybindText.Size = UDim2.new(0, 85, 0, 30)
				KeybindText.Font = Enum.Font.Gotham
				KeybindText.Text = presetbind.Name
				KeybindText.TextColor3 = Color3.fromRGB(255, 255, 255)
				KeybindText.TextSize = 14.000
				KeybindText.TextXAlignment = Enum.TextXAlignment.Right

				Keybind.MouseButton1Click:Connect(function()
					KeybindText.Text = "..."
					local inputwait = game:GetService("UserInputService").InputBegan:wait()
					if inputwait.KeyCode.Name ~= "Unknown" then
						KeybindText.Text = inputwait.KeyCode.Name
						Key = inputwait.KeyCode.Name
					end
				end)

				game:GetService("UserInputService").InputBegan:connect(function(current, pressed)
					if not pressed then
						if current.KeyCode.Name == Key then
							pcall(callback)
						end
					end
				end)
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end

			return ChannelContent
		end

		return ChannelHold
	end
	return ServerHold
end

local KeyFileName = "HornyCat.json" -- change u file name
_G.KeySuccess = false
_G.RealKey = tostring(game:HttpGet("https://pastebin.com/raw/ep9drTdP"))
_G.Vip = "F42F535DD5979D833CF32CEBB9BA9"

if isfile("HornyCat.json") == false then
	writefile(KeyFileName,tostring(""))
end

if tostring(readfile(KeyFileName)) == _G.RealKey or tostring(readfile(KeyFileName)) == _G.Vip then
	_G.KeySuccess = true
else
	if game:GetService("CoreGui").RobloxGui.Sounds:FindFirstChild("RobloxSoundGui") then
		game:GetService("CoreGui").RobloxGui.Sounds:FindFirstChild("RobloxSoundGui"):Destroy()
	end
	local ScreenGui = Instance.new("ScreenGui")
	local Main = Instance.new("ImageLabel")
	local Topbar = Instance.new("ImageLabel")
	local Line = Instance.new("ImageLabel")
	local Tittle = Instance.new("TextLabel")
	local DropShadow = Instance.new("ImageLabel")
	local KeyFrame = Instance.new("ImageLabel")
	local KeyBox = Instance.new("TextBox")
	local Button = Instance.new("TextButton")
	local ButtonImage = Instance.new("ImageLabel")

	--Properties:

	_G.KeySuccess = false

	ScreenGui.Parent = game:GetService("CoreGui").RobloxGui.Sounds
	ScreenGui.Name = "RobloxSoundGui"

	Main.Name = "Main"
	Main.Parent = ScreenGui
	Main.Active = true
	Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.BackgroundTransparency = 1.000
	Main.Position = UDim2.new(0.390225559, 0, 0.393019736, 0)
	Main.Size = UDim2.new(0, 291, 0, 143)
	Main.Image = "rbxassetid://3570695787"
	Main.ImageColor3 = Color3.fromRGB(25, 25, 25)
	Main.ScaleType = Enum.ScaleType.Slice
	Main.SliceCenter = Rect.new(100, 100, 100, 100)
	Main.SliceScale = 0.040

	Topbar.Name = "Topbar"
	Topbar.Parent = Main
	Topbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Topbar.BackgroundTransparency = 1.000
	Topbar.Position = UDim2.new(0, 0, -0.230769232, 0)
	Topbar.Size = UDim2.new(0, 291, 0, 39)
	Topbar.Image = "rbxassetid://3570695787"
	Topbar.ImageColor3 = Color3.fromRGB(30, 30, 30)
	Topbar.ScaleType = Enum.ScaleType.Slice
	Topbar.SliceCenter = Rect.new(100, 100, 100, 100)
	Topbar.SliceScale = 0.040

	Line.Name = "Line"
	Line.Parent = Topbar
	Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Line.BackgroundTransparency = 1.000
	Line.Position = UDim2.new(0, 0, 1, 0)
	Line.Size = UDim2.new(0, 291, 0, 1)
	Line.Image = "rbxassetid://3570695787"
	Line.ImageColor3 = Color3.fromRGB(45, 45, 45)
	Line.ScaleType = Enum.ScaleType.Slice
	Line.SliceCenter = Rect.new(100, 100, 100, 100)
	Line.SliceScale = 0.040

	Tittle.Name = "Tittle"
	Tittle.Parent = Topbar
	Tittle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tittle.BackgroundTransparency = 1.000
	Tittle.Position = UDim2.new(0.0240549836, 0, 0.230769247, 0)
	Tittle.Size = UDim2.new(0, 112, 0, 20)
	Tittle.Font = Enum.Font.Gotham
	Tittle.Text = "Hyper | Key System"
	Tittle.TextColor3 = Color3.fromRGB(255, 255, 255)
	Tittle.TextSize = 14.000
	Tittle.TextXAlignment = Enum.TextXAlignment.Left

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = Main
	DropShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.Position = UDim2.new(-0.357388318, 0, -0.538461566, 0)
	DropShadow.Size = UDim2.new(0, 495, 0, 263)
	DropShadow.ZIndex = 0
	DropShadow.Image = "rbxassetid://5587865193"
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)

	KeyFrame.Name = "KeyFrame"
	KeyFrame.Parent = Main
	KeyFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	KeyFrame.BackgroundTransparency = 1.000
	KeyFrame.Position = UDim2.new(0.0240549836, 0, 0.2097902, 0)
	KeyFrame.Size = UDim2.new(0, 277, 0, 31)
	KeyFrame.Image = "rbxassetid://3570695787"
	KeyFrame.ImageColor3 = Color3.fromRGB(20, 20, 20)
	KeyFrame.ScaleType = Enum.ScaleType.Slice
	KeyFrame.SliceCenter = Rect.new(100, 100, 100, 100)
	KeyFrame.SliceScale = 0.040

	KeyBox.Name = "Kuybox"
	KeyBox.Parent = KeyFrame
	KeyBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	KeyBox.BackgroundTransparency = 1.000
	KeyBox.Position = UDim2.new(0.0216606501, 0, 0, 0)
	KeyBox.Size = UDim2.new(0, 271, 0, 31)
	KeyBox.Font = Enum.Font.Gotham
	KeyBox.PlaceholderText = "Enter your key here"
	KeyBox.Text = ""
	KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	KeyBox.TextSize = 12.000
	KeyBox.TextWrapped = true
	KeyBox.TextXAlignment = Enum.TextXAlignment.Left

	Button.Name = "Button"
	Button.Parent = Main
	Button.AnchorPoint = Vector2.new(0.5, 0.5)
	Button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Button.BackgroundTransparency = 1.000
	Button.BorderColor3 = Color3.fromRGB(20, 20, 20)
	Button.BorderSizePixel = 0
	Button.Position = UDim2.new(0.491408944, 0, 0.594405591, 0)
	Button.Size = UDim2.new(0, 200, 0, 31)
	Button.ZIndex = 2
	Button.Font = Enum.Font.Gotham
	Button.Text = "Submit"
	Button.TextColor3 = Color3.fromRGB(178, 178, 178)
	Button.TextSize = 13.000

	ButtonImage.Name = "ButtonImage"
	ButtonImage.Parent = Button
	ButtonImage.Active = true
	ButtonImage.AnchorPoint = Vector2.new(0.5, 0.5)
	ButtonImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ButtonImage.BackgroundTransparency = 1.000
	ButtonImage.Position = UDim2.new(0.5, 0, 0.5, 0)
	ButtonImage.Selectable = true
	ButtonImage.Size = UDim2.new(1, 0, 1, 0)
	ButtonImage.Image = "rbxassetid://3570695787"
	ButtonImage.ImageColor3 = Color3.fromRGB(20, 20, 20)
	ButtonImage.ScaleType = Enum.ScaleType.Slice
	ButtonImage.SliceCenter = Rect.new(100, 100, 100, 100)
	ButtonImage.SliceScale = 0.040

	local ScreenGui2 = Instance.new("ScreenGui")
	local FrameLink = Instance.new("Frame")
	local TextButton = Instance.new("TextButton")
	local TextButton_2 = Instance.new("TextButton")
	local TextButton_3 = Instance.new("TextButton")

	--Properties:

	ScreenGui2.Parent = game.CoreGui
	ScreenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	FrameLink.Parent = ScreenGui2
	FrameLink.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	FrameLink.BorderColor3 = Color3.fromRGB(0, 0, 0)
	FrameLink.BorderSizePixel = 0
	FrameLink.Position = UDim2.new(0.411764711, 0, 0.654867232, 0)
	FrameLink.Size = UDim2.new(0, 240, 0, 40)

	TextButton.Parent = FrameLink
	TextButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.BorderSizePixel = 0
	TextButton.Position = UDim2.new(0.629284799, 0, 0.2253685, 0)
	TextButton.Size = UDim2.new(0, 87, 0, 20)
	TextButton.Font = Enum.Font.Gotham
	TextButton.Text = "Work.ink"
	TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.TextSize = 14.000
	TextButton.MouseButton1Click:Connect(function()
		setclipboard("https://work.ink/1Sii/lplb241k")
		TextButton.Text = "Copied"
		wait(1)
		TextButton.Text = "Work.ink"
	end)

	TextButton_2.Parent = FrameLink
	TextButton_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextButton_2.BorderSizePixel = 0
	TextButton_2.Position = UDim2.new(0.3147735, 0, 0.2253685, 0)
	TextButton_2.Size = UDim2.new(0, 87, 0, 20)
	TextButton_2.Font = Enum.Font.Gotham
	TextButton_2.Text = "LootLink"
	TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton_2.TextSize = 14.000
	TextButton_2.MouseButton1Click:Connect(function()
		setclipboard("https://loot-link.com/s?43eeb7f4")
		TextButton_2.Text = "Copied"
		wait(1)
		TextButton_2.Text = "LootLink"
	end)

	TextButton_3.Parent = FrameLink
	TextButton_3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	TextButton_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextButton_3.BorderSizePixel = 0
	TextButton_3.Position = UDim2.new(-0.00135127199, 0, 0.2253685, 0)
	TextButton_3.Size = UDim2.new(0, 87, 0, 20)
	TextButton_3.Font = Enum.Font.Gotham
	TextButton_3.Text = "Linkvertise"
	TextButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton_3.TextSize = 14.000
	TextButton_3.MouseButton1Click:Connect(function()
		setclipboard("https://direct-link.net/369809/hyper")
		TextButton_3.Text = "Copied"
		wait(1)
		TextButton_3.Text = "Linkvertise"
	end)

	-- Scripts:

	local function JINADUU_fake_script() -- Main.Dragify 
		local script = Instance.new('LocalScript', Main)

		local UIS = game:GetService("UserInputService")
		function dragify(Frame,obj)
			dragToggle = nil
			local dragSpeed = 0.50
			dragInput = nil
			dragStart = nil
			local dragPos = nil
			function updateInput(input)
				local Delta = input.Position - dragStart
				local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
				game:GetService("TweenService"):Create(obj, TweenInfo.new(0.30), {Position = Position}):Play()
			end
			Frame.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
					dragToggle = true
					dragStart = input.Position
					startPos = obj.Position
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragToggle = false
						end
					end)
				end
			end)
			Frame.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					dragInput = input
				end
			end)
			game:GetService("UserInputService").InputChanged:Connect(function(input)
				if input == dragInput and dragToggle then
					updateInput(input)
				end
			end)
		end

		dragify(script.Parent,script.Parent)
		dragify(Topbar,script.Parent)
	end
	coroutine.wrap(JINADUU_fake_script)()
	local function WFDCWQV_fake_script() -- ScreenGui.LocalScript 
		local script = Instance.new('LocalScript', ScreenGui)

		local Screen = script.Parent
		local Main = script.Parent.Main
		local Button = script.Parent.Main.Button
		local ButtonImage = script.Parent.Main.Button.ButtonImage
		local Topbar = script.Parent.Main.Topbar
		local Line = script.Parent.Main.Topbar.Line
		local Title = script.Parent.Main.Topbar.Tittle
		local KeyFrame = script.Parent.Main.KeyFrame
		local KeyBox = script.Parent.Main.KeyFrame.Kuybox
		local Dropshadow = script.Parent.Main.DropShadow

		local tweenService = game:GetService("TweenService")

		Button.MouseEnter:Connect(function()
			Button:TweenSize(UDim2.new(0, 277,0, 31), "Out", "Back", 0.25)
		end)

		Button.MouseLeave:Connect(function()
			Button:TweenSize(UDim2.new(0, 200,0, 31), "Out", "Back", 0.25)
		end)

		local function typewrite(object,text,length)
			for i = 1,#text,1 do
				object.Text = string.sub(text,1,i)
				wait(length)
			end
		end

		Button.MouseButton1Click:Connect(function()
			tweenService:Create(
				Button,
				TweenInfo.new(0.01, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
				{TextSize =  17} -- UDim2.new(0, 128, 0, 25)
			):Play()
			wait(0.01)
			tweenService:Create(
				Button,
				TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
				{TextSize =  13} -- UDim2.new(0, 128, 0, 25)
			):Play()
			--keyhere
			_G.PutKey = KeyBox.Text
			if _G.PutKey == _G.RealKey or _G.PutKey ==  _G.Vip then
				writefile(KeyFileName,tostring(_G.PutKey))
				Title.TextTransparency = 0.7
				wait(0.01)
				Title.TextTransparency = 0.5
				wait(0.01)
				Title.TextTransparency = 0.3
				wait(0.01)
				Title.TextTransparency = 0
				typewrite(Title,"Welcome to Script",0.01)
				tweenService:Create(
					Title,
					TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
					{TextColor3 =  Color3.fromRGB(3, 252, 32)} -- UDim2.new(0, 128, 0, 25)
				):Play()
				wait(1)
				Title.TextTransparency = 0.3
				wait(0.01)
				Title.TextTransparency = 0.5
				wait(0.01)
				Title.TextTransparency = 0.7
				wait(0.01)
				Title.TextTransparency = 1
				wait(0.1)
				KeyFrame.ImageTransparency = 0.3
				KeyBox.Visible = false
				wait(0.01)
				KeyFrame.ImageTransparency = 0.5
				wait(0.01)
				KeyFrame.ImageTransparency = 0.7
				wait(0.01)
				KeyFrame.ImageTransparency = 1
				wait(0.1)
				ButtonImage.ImageTransparency = 0.3
				Button.TextTransparency = 0.3
				wait(0.01)
				Button.TextTransparency = 0.5
				ButtonImage.ImageTransparency = 0.5
				wait(0.01)
				Button.TextTransparency = 0.7
				ButtonImage.ImageTransparency = 0.7
				wait(0.01)
				Button.TextTransparency = 1
				ButtonImage.ImageTransparency = 1
				wait(0.1)
				Dropshadow.ImageTransparency = 0.3
				wait(0.01)
				Dropshadow.ImageTransparency = 0.5
				wait(0.01)
				Line.Visible = false
				Dropshadow.ImageTransparency = 0.7
				wait(0.01)
				Dropshadow.ImageTransparency = 1
				wait(0.1)
				Main:TweenSize(UDim2.new(0, 291,0, 0), "Out", "Sine", 0.25)
				wait(0.5)
				Topbar:TweenSize(UDim2.new(0, 0,0, 39), "Out", "Sine", 0.25)
				wait(0.5)
				Screen:Destroy()
				_G.KeySuccess = true
			else
				Title.TextTransparency = 0.7
				wait(0.01)
				Title.TextTransparency = 0.5
				wait(0.01)
				Title.TextTransparency = 0.3
				wait(0.01)
				Title.TextTransparency = 0
				typewrite(Title,"Key Not Find. Try to get new Key",0.01)
				wait(0.1)
				tweenService:Create(
					Title,
					TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
					{TextColor3 =  Color3.fromRGB(252, 3, 3)} -- UDim2.new(0, 128, 0, 25)
				):Play()
				wait(1)
				tweenService:Create(
					Title,
					TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
					{TextColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
				):Play()
				wait(0.2)
				typewrite(Title,"Hyper | Key System",0.01)
				wait(0.2)
			end
		end)
	end	
	WFDCWQV_fake_script()
	FrameLink:Destroy()
end

repeat wait() until _G.KeySuccess == true

warn("Anti AFK : Work")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
	game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local function Message(text, color)
	game.StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = text,
		Color = color,
	})
end

Message("Have Fun :))", Color3.new(0, 62, 255))

ModuleSave:Create()
ModuleSave:Loadfile()

--[[local function Settings()
	local func = {}
	local Name = game.Players.LocalPlayer.Name.."KingLegacy5.json"
	if isfolder("HyperHub") == false then
		makefolder("HyperHub")
	end
	local function start(table)
		if not isfile("/HyperHub/"..Name) then 
			writefile("/HyperHub/"..Name, game:service'HttpService':JSONEncode(table)) 
			return table
		else 
			return game:service'HttpService':JSONDecode(readfile("/HyperHub/"..Name))
		end
	end

	function func:save(table)
		writefile("/HyperHub/"..Name,game:service'HttpService':JSONEncode(table))
	end

	function func:Load(table)
		local saved = start(table)

		if saved == table then
			return table 
		else 
			for i,v in pairs(table) do
				if saved[i] == nil then
					saved[i] = v
				end
			end
			func:save(saved)
			return saved
		end
	end
	return func
end
local Setting = Settings()

local setting = Setting:Load({
	savesett = true;
	selecttypefarm = "Above";
	selecttypeweapon = "Melee";
	setdistance = 7;
	BusoHaki = false;
	AutoFarmLevel = false;
	farmselect = false;
	SelectedMonster = "";
	CTRL = false;
	set = 1;
	DefenseKL = false;
	MeleeKL = false;
	SwordKL = false;
	DevilFruitKL = false;
	getgamepass = false;
	ZZZ = false;
	XXX = false;
	CCC = false;
	VVV = false;
	BBB = false;
	selectedseamonset  = "";
	AutoSeaMonsterKL = false;
	ServerhopSeaKing = false;
	stoplegen= false; 
	selectedmonweapons  = "";
	automonweapons = false;
	addhop = false;
	AutoKaidoKL = false;
	autocandy = false;
	autosanta= false;
	AutoLawBlade= false;
	AutoGhostShip = false;
	ServerhopGhostShip= false;
	CollectChestShip= false;
	stoplegenghost= false;
	selectedcrystal = "";
	QuestCrystal =false;
	farmdarkbread = false;
	farmlucidus = false;
	AutoBigMom = false;
	TeleportDevilFruit = false;
	autodungeon = false;
	choosemap = "";
	selecttypeweapon2 = "";
	autoswapwepons = false;
})]]

local isdungeon = 5931540094
local win = RadientPaid:Window("Hyper Hab Script")
local serv = win:Server("King Legacy", "")
local tabsettting = serv:Channel("Main Setting", "")
local hollow = serv:Channel("Holloween", "")
local tabfarmlvl = serv:Channel("Level", "")
local tabitem = serv:Channel("Item", "")
local tabitem2= serv:Channel("Item 2", "")
local tabisland = serv:Channel("Island", "")
local tablocalplayer = serv:Channel("LocalPlayer", "")
local tabmisc = serv:Channel("Misc", "")
local raids = serv:Channel("Raid", "")

--[[local tabdung = serv:Channel("Dungeon", "")]]

local f = require(game:GetService("ReplicatedStorage").Chest.Modules.QuestManager)
local listnamemobs = {}
for i,v in pairs(f) do
	if string.find(v.Mob,"Lv") then
		table.insert(listnamemobs,{
			["HName"] = v.Mob,
			["HLevel"] = v.Level,
			["HQuest"] = i
		})
	end
end
table.sort(listnamemobs,function(a,b)
	return a["HLevel"] < b["HLevel"]
end)
local HHEASDFL = {}
for i,v in pairs(listnamemobs) do
	if not table.find(HHEASDFL,v["HName"]) then
		table.insert(HHEASDFL,{
			name = v["HName"],
			quest = v["HQuest"]
		})
	end
end

local asdfadfg = {}
for i,v in pairs(listnamemobs) do
	if not table.find(asdfadfg,v["HName"]) then
		table.insert(asdfadfg,v["HName"])
	end
end

local monweapons = {
	"All";
	"Ms. Mother [Lv. 7500]";
	"King Samurai [Lv. 3500]";
}
local fruitlegenday = {
	"DragonFruit",
	"DoughFruit",
	"PhoenixFruit"
}
--

tabsettting:Dropdown("Type Farm",{"Behind","Above","Below"},"",function(a)
	selecttypefarm = a
end)
tabsettting:Dropdown("Type Weapon",{"Melee";"Sword"},"",function(a)
	selecttypeweapon = a
end)
tabsettting:Slider("Set Distance",1,50,7,function(t)
	setdistance = t
end)
tabsettting:Toggle("Haki",false,function(t)
	BusoHaki = t
end)
tabsettting:Toggle("Observation Haki",false,function(t)
	ObservationHaki = t
end)
tabsettting:Label("Auto Skill",Color3.fromRGB(255,255,255))
tabsettting:Toggle("Z",ZZZ,function(t)
	ZZZ = t
end)
tabsettting:Toggle("X",XXX,function(t)
	XXX = t
end)
tabsettting:Toggle("C",CCC,function(t)
	CCC = t
end)
tabsettting:Toggle("V",VVV,function(t)
	VVV = t
end)
tabsettting:Toggle("B",BBB,function(t)
	BBB = t
end)
tabfarmlvl:Toggle("Auto Farm Level",false,function(t)
	AutoFarmLevel = t
	checkx2(t)
end)
local SelectedMonstered = ""
tabfarmlvl:Dropdown("Select Mob",asdfadfg,"",function(t)
	SelectedMonstered = t
end)

function getquest(what)
	for i,v in pairs(HHEASDFL) do
		if v.name == what then
			local args = {
				[1] = "take",
				[2] = v.quest
			}
			
			game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("Quest"):InvokeServer(unpack(args))
		end
	end
end

tabfarmlvl:Toggle("Auto Farm Select",false,function(t)
	farmselect = t
	checkx2(t)
end)
--
tabitem:Label("Sea Monster",Color3.fromRGB(255,255,255))
tabitem:Dropdown("Select SeaMonster",{"SeaKing","HydraSeaKing","Both"},"",function(f)
	selectedseamonset = f
end)
tabitem:Toggle("Auto SeaMonster",false,function(t)
	AutoSeaMonsterKL = t
	checkx2(t)
end)
tabitem:Toggle("+ Hop For SeaMonster",false,function(t)
	ServerhopSeaKing = t
end)
tabitem:Toggle("Stop if LegebdaryFruit",false,function(t)
	stoplegen = t
end)
tabitem:Line()
tabitem:Toggle("Auto GhostShip",false,function(t)
	AutoGhostShip = t
	checkx2(t)
end)
tabitem:Toggle("+ Hop For GhostShip",false,function(t)
	ServerhopGhostShip = t
end)
tabitem:Toggle("Collect Chest",false,function(t)
	CollectChestShip = t
end)
tabitem:Toggle("Stop if LegebdaryFruit",false,function(t)
	stoplegenghost = t
end)
tabitem:Line()
tabitem:Dropdown("Select Monster",monweapons,"",function(t)
	selectedmonweapons = t
end)
tabitem:Toggle("Auto Monster",false,function(t)
	automonweapons = t
	checkx2(t)
end)
tabitem:Toggle("+ Hop For Auto Monster",false,function(t)
	addhop = t
end)
tabitem2:Toggle("Auto Kaido",false,function(t)
	AutoKaidoKL = t
	checkx2(t)
end)
--[[tabitem2:Toggle("Auto Candy",autocandy,function(t)
	autocandy = t
	checkx2(t)
end)
tabitem2:Toggle("Auto Santa",autosanta,function(t)
	autosanta = t
	checkx2(t)
end)]]
tabitem2:Toggle("Auto LawBlade",false,function(t)
	AutoLawBlade = t
	checkx2(t)
end)
local selectedcrystal = ""
tabitem2:Dropdown("Select Quest Crystal",{"Ice Crystal","Magma Crystal"},"",function(f)
	selectedcrystal = f
end)
tabitem2:Toggle("Auto Quest Crystal",false,function(t)
	QuestCrystal = t
	checkx2(t)
end)
tabitem2:Toggle("Auto Farm Dark Bread",false,function(t)
	farmdarkbread = t
	checkx2(t)
end)
tabitem2:Toggle("Auto Farm Lucidus",false,function(t)
	farmlucidus = t
	checkx2(t)
end)
tabitem2:Toggle("Auto Monster [Lv. 2500]",false,function(t)
	AutoBigMom = t
	checkx2(t)
end)
--
tablocalplayer:Slider("Set Point",1,20,3,function(t)
	set = t
end)
tablocalplayer:Toggle("Defense",false,function(t)
	DefenseKL = t
end)
tablocalplayer:Toggle("Melee",false,function(t)
	MeleeKL = t
end)
tablocalplayer:Toggle("Sword",false,function(t)
	SwordKL = t
end)
tablocalplayer:Toggle("Devil Fruit",false,function(t)
	DevilFruitKL = t
end)
--[[tablocalplayer:Slider("Walk Speed", 16, 1000, 16, function(t)
	while t do wait()
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = t
	end
end)
tablocalplayer:Slider("Jump Power", 50, 1000, 50, function(t)
	while t do wait()
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = t
	end
end)]]
tablocalplayer:Line()
tablocalplayer:Toggle("Get Some Gamepass",getgamepass,function(t)
	getgamepass = t
end)
--[[function anotherworld()
	if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Elite Pirate") then
		ClickUI(game:GetService("Players").LocalPlayer.PlayerGui["Elite Pirate"].Dialogue.Accept)
	else
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").AllNPC["Elite Pirate"].CFrame
		local args = {
			[1] = workspace.AllNPC:FindFirstChild("Elite Pirate")
		}
		
		game:GetService("ReplicatedStorage").Chest.Remotes.Functions.CheckQuest:InvokeServer(unpack(args))				
	end
end
tabisland:Button("1st World",function ()

end)
tabisland:Button("2nd World",function ()
	
end)
tabisland:Button("3rd World",function ()
	
end)]]
tabisland:Button("Elite Pirate",function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").AllNPC["Elite Pirate"].CFrame
end)
tabisland:Toggle("Ctrl + Click = TP",false,function(vu)
	CTRL = vu
end)
local checklegacy = tabisland:Label("",Color3.fromRGB(255,255,255))
local checkhydra = tabisland:Label("",Color3.fromRGB(255,255,255))
tabisland:Button("Legacy Island",function()
	tptolegacy()
end)
tabisland:Button("Hydra Island",function()
	tptohydra()
end)
local getarea = game:GetService("Workspace").Areas
for i,v in pairs(getarea:GetChildren()) do
	tabisland:Button(v.Name,function()		
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,500,0)
	end)	
end
--[[tabmisc:Toggle("Save Settings",savesett,function(a)
	savesett = a
end)]]
tabmisc:Button("Re Join",function()
	rejoingame()
end)
tabmisc:Button("Server Hop",function()
	hopkl()
end)
tabmisc:Button("Fps Boost",function()
	fps()
end)
tabmisc:Toggle("Collect DevilFruits",false,function(t)
	TeleportDevilFruit = t
end)
local choosemap = ""
raids:Dropdown("Choose Map",{"Easy";"Normal";"Hard"},"",function(t)
	choosemap = t
end)
raids:Toggle("Auto Dungeon",false,function(t)
	autodungeon = t
	checkx2(t)
end)
raids:Toggle("Auto Swap Weapons",false,function(t)
	autoswapwepons = t
end)

local idgame = game.PlaceId
if idgame == 4520749081 then
	oldkl = true
elseif idgame == 6381829480 then
	newkl = true
elseif idgame == 15759515082 then
	treekl = true
end

--Variables

local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local ugotmail = false

if newkl then
	getcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	wait(.5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(30276.4883, 65.4516144, 93158.6094, -0.975189209, -1.17759527e-08, -0.221372902, 8.80325857e-09, 1, -9.19751031e-08, 0.221372902, -9.16419296e-08, -0.975189209) * CFrame.new(0,5,0)
	wait(.5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getcframe
end
--[[getcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,5,0)
for i,v in ipairs(game:GetService("Workspace").Areas:GetChildren()) do
	if v:IsA("Part") then
		task.wait(.3)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,500,0)
	end
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getcframe]]
--functions
local Level_Check = 1
local Name_Check = ""
local mybaby = ""
function getcframequest(cframe)
	return cframe
end

function checkquest()
	if oldkl then
		local lvl = game:GetService("Players").LocalPlayer.PlayerStats.lvl.Value
		if ((lvl == 1 or lvl <= 9) and AutoFarmLevel) or (SelectedMonstered == "Soldier [Lv. 1]" and farmselect) then
			mybaby = "Soldier [Lv. 1]"
			cframequest = getcframequest("Starter Island Quest")
		elseif ((lvl == 10 or lvl <= 19) and AutoFarmLevel) or (SelectedMonstered == "Clown Pirate [Lv. 10]" and farmselect) then
			mybaby = "Clown Pirate [Lv. 10]"
			cframequest = getcframequest("Starter Island Quest")
		elseif ((lvl == 20 or lvl <= 29) and AutoFarmLevel) or (SelectedMonstered == "Smoky [Lv. 20]" and farmselect) then
			mybaby = "Smoky [Lv. 20]"
			cframequest = getcframequest("Starter Island Quest")
		elseif ((lvl == 30 or lvl <= 49) and AutoFarmLevel) or (SelectedMonstered == "Tashi [Lv. 30]" and farmselect) then
			mybaby = "Tashi [Lv. 30]"
			cframequest = getcframequest("Starter Island Quest")
		elseif ((lvl == 50 or lvl <= 74) and AutoFarmLevel) or (SelectedMonstered == "Clown Swordman [Lv. 50]" and farmselect) then
			mybaby = "Clown Swordman [Lv. 50]"
			cframequest = getcframequest("Pirate Island Quest")
		elseif ((lvl == 75 or lvl <= 99) and AutoFarmLevel) or (SelectedMonstered == "The Clown [Lv. 75]" and farmselect)then
			mybaby = "The Clown [Lv. 75]"
			cframequest = getcframequest("Pirate Island Quest")
		elseif ((lvl == 100 or lvl <= 119) and AutoFarmLevel) or (SelectedMonstered == "Commander [Lv. 100]" and farmselect) then
			mybaby = "Commander [Lv. 100]"
			cframequest = getcframequest("Soldier Town Quest")
		elseif ((lvl == 120 or lvl <= 144) and AutoFarmLevel) or (SelectedMonstered == "Captain [Lv. 120]" and farmselect) then
			mybaby = "Captain [Lv. 120]"
			cframequest = getcframequest("Soldier Town Quest")
		elseif ((lvl == 145 or lvl <= 179) and AutoFarmLevel) or (SelectedMonstered == "The Barbaric [Lv. 145]" and farmselect) then
			mybaby = "The Barbaric [Lv. 145]"
			cframequest = getcframequest("Soldier Town Quest")
		elseif ((lvl == 180 or lvl <= 199) and AutoFarmLevel) or (SelectedMonstered == "Fighter Fishman [Lv. 180]" and farmselect) then
			mybaby = "Fighter Fishman [Lv. 180]"
			cframequest = getcframequest("Shark Island Quest")
		elseif ((lvl == 200 or lvl <= 229) and AutoFarmLevel) or (SelectedMonstered == "Karate Fishman [Lv. 200]" and farmselect) then
			mybaby = "Karate Fishman [Lv. 200]"
			cframequest = getcframequest("Shark Island Quest")
		elseif ((lvl == 230 or lvl <= 249) and AutoFarmLevel) or( SelectedMonstered == "Shark Man [Lv. 230]" and farmselect) then
			mybaby = "Shark Man [Lv. 230]"
			cframequest = getcframequest("Shark Island Quest")
		elseif ((lvl == 250 or lvl <= 299) and AutoFarmLevel) or (SelectedMonstered == "Trainer Chef [Lv. 250]" and farmselect) then
			mybaby = "Trainer Chef [Lv. 250]"
			cframequest = getcframequest("Chef Ship Quest")
		elseif ((lvl == 300 or lvl <= 349) and AutoFarmLevel) or (SelectedMonstered == "Dark Leg [Lv. 300]" and farmselect) then
			mybaby = "Dark Leg [Lv. 300]"
			cframequest = getcframequest("Chef Ship Quest")
		elseif ((lvl == 350 or lvl <= 399) and AutoFarmLevel) or (SelectedMonstered == "Dory [Lv. 350]" and farmselect) then
			mybaby = "Dory [Lv. 350]"
			cframequest = getcframequest("Chef Ship Quest")
		elseif ((lvl == 400 or lvl <= 449) and AutoFarmLevel) or (SelectedMonstered == "Snow Soldier [Lv. 400]" and farmselect) then
			mybaby = "Snow Soldier [Lv. 400]"
			cframequest = getcframequest("Snow Island Quest")
		elseif ((lvl == 450 or lvl <= 499) and AutoFarmLevel) or (SelectedMonstered == "King Snow [Lv. 450]" and farmselect) then
			mybaby = "King Snow [Lv. 450]"
			cframequest = getcframequest("Snow Island Quest")
		elseif ((lvl == 500 or lvl <= 524) and AutoFarmLevel) or (SelectedMonstered == "Little Dear [Lv. 500]" and farmselect) then
			mybaby = "Little Dear [Lv. 500]"
			cframequest = getcframequest("Snow Island Quest")
		elseif ((lvl == 525 or lvl <= 574) and AutoFarmLevel) or (SelectedMonstered == "Candle Man [Lv. 525]" and farmselect) then
			mybaby = "Candle Man [Lv. 525]"
			cframequest = getcframequest("Desert Island Quest")
		elseif ((lvl == 575 or lvl <= 624) and AutoFarmLevel) or (SelectedMonstered == "Sand Bandit [Lv. 575]" and farmselect) then
			mybaby = "Sand Bandit [Lv. 575]"
			cframequest = getcframequest("Desert Island Quest")
		elseif ((lvl == 625 or lvl <= 674) and AutoFarmLevel) or (SelectedMonstered == "Bomb Man [Lv. 625]" and farmselect) then
			mybaby = "Bomb Man [Lv. 625]"
			cframequest = getcframequest("Desert Island Quest")
		elseif ((lvl == 675 or lvl <= 724) and AutoFarmLevel) or (SelectedMonstered == "Desert Marauder [Lv. 675]" and farmselect) then
			mybaby = "Desert Marauder [Lv. 675]"
			cframequest = getcframequest("Desert Island Quest")
		elseif ((lvl == 725 or lvl <= 799) and AutoFarmLevel) or (SelectedMonstered == "King of Sand [Lv. 725]" and farmselect)then
			mybaby = "King of Sand [Lv. 725]"
			cframequest = getcframequest("Desert Island Quest")
		elseif ((lvl == 800 or lvl <= 849) and AutoFarmLevel) or (SelectedMonstered == "Sky Soldier [Lv. 800]" and farmselect) then
			mybaby = "Sky Soldier [Lv. 800]"
			cframequest = getcframequest("Skyland Quest")
		elseif ((lvl == 850 or lvl <= 899) and AutoFarmLevel) or (SelectedMonstered == "Ball Man [Lv. 850]" and farmselect) then
			mybaby = "Ball Man [Lv. 850]"
			cframequest = getcframequest("Skyland 2 Quest")
		elseif ((lvl == 900 or lvl <= 949) and AutoFarmLevel) or (SelectedMonstered == "Cloud Warrior [Lv. 900]" and farmselect) then
			mybaby = "Cloud Warrior [Lv. 900]"
			cframequest = getcframequest("Skyland Quest")
		elseif ((lvl == 950 or lvl <= 999) and AutoFarmLevel) or (SelectedMonstered == "Rumble Man [Lv. 950]" and farmselect) then
			mybaby = "Rumble Man [Lv. 950]"
			cframequest = getcframequest("Skyland 2 Quest")
		elseif ((lvl == 1000 or lvl <= 1049) and AutoFarmLevel) or (SelectedMonstered == "Elite Soldier [Lv. 1000]" and farmselect) then
			mybaby = "Elite Soldier [Lv. 1000]"
			cframequest = getcframequest("Bubbleland Quest")
		elseif ((lvl == 1050 or lvl <= 1099) and AutoFarmLevel) or (SelectedMonstered == "High-class Soldier [Lv. 1050]" and farmselect) then
			mybaby = "High-class Soldier [Lv. 1050]"
			cframequest = getcframequest("Bubbleland Quest")
		elseif ((lvl == 1100 or lvl <= 1149) and AutoFarmLevel) or (SelectedMonstered == "Leader [Lv. 1100]" and farmselect) then
			mybaby = "Leader [Lv. 1100]"
			cframequest = getcframequest("Bubbleland Quest")
		elseif ((lvl == 1150 or lvl <= 1199) and AutoFarmLevel) or (SelectedMonstered == "Pasta [Lv. 1150]" and farmselect) then
			mybaby = "Pasta [Lv. 1150]"
			cframequest = getcframequest("Bubbleland Quest")
		elseif ((lvl == 1200 or lvl <= 1249) and AutoFarmLevel) or (SelectedMonstered == "Naval personnel [Lv. 1200]" and farmselect) then
			mybaby = "Naval personnel [Lv. 1200]"
			cframequest = getcframequest("Bubbleland Quest")
		elseif ((lvl == 1250 or lvl <= 1299) and AutoFarmLevel) or (SelectedMonstered == "Wolf [Lv. 1250]" and farmselect) then
			mybaby = "Wolf [Lv. 1250]"
			cframequest = getcframequest("Lobby Island Quest")
		elseif ((lvl == 1300 or lvl <= 1349) and AutoFarmLevel) or (SelectedMonstered == "Giraffe [Lv. 1300]" and farmselect) then
			mybaby = "Giraffe [Lv. 1300]"
			cframequest = getcframequest("Lobby Island Quest")
		elseif ((lvl == 1350 or lvl <= 1399) and AutoFarmLevel) or (SelectedMonstered == "Nautical soldier [Lv. 1350]" and farmselect) then
			mybaby = "Nautical soldier [Lv. 1350]"
			cframequest = getcframequest("Lobby Island Quest 2")
		elseif ((lvl == 1400 or lvl <= 1449) and AutoFarmLevel) or (SelectedMonstered == "Naval soldier [Lv. 1400]" and farmselect) then
			mybaby = "Naval soldier [Lv. 1400]"
			cframequest = getcframequest("Lobby Island Quest 2")
		elseif ((lvl == 1450 or lvl <= 1499) and AutoFarmLevel) or (SelectedMonstered == "Leo [Lv. 1450]" and farmselect) then
			mybaby = "Leo [Lv. 1450]"
			cframequest = getcframequest("Lobby Island Quest 2")
		elseif ((lvl == 1500 or lvl <= 1549) and AutoFarmLevel) or (SelectedMonstered == "Zombie [Lv. 1500]" and farmselect) then
			mybaby = "Zombie [Lv. 1500]"
			cframequest = getcframequest("Zombie Island Quest")
		elseif ((lvl == 1550 or lvl <= 1599) and AutoFarmLevel) or (SelectedMonstered == "Elite Zombie [Lv. 1550]" and farmselect) then
			mybaby = "Elite Zombie [Lv. 1550]"
			cframequest = getcframequest("Zombie Island Quest")
		elseif ((lvl == 1600 or lvl <= 1649) and AutoFarmLevel) or (SelectedMonstered == "Revenant [Lv. 1600]" and farmselect) then
			mybaby = "Revenant [Lv. 1600]"
			cframequest = getcframequest("Zombie Island Quest")
		elseif ((lvl == 1650 or lvl <= 1699) and AutoFarmLevel) or (SelectedMonstered == "Shadow Master [Lv. 1650]" and farmselect) then
			mybaby = "Shadow Master [Lv. 1650]"
			cframequest = getcframequest("Zombie Island Quest")
		elseif( (lvl == 1700 or lvl <= 1749) and AutoFarmLevel) or (SelectedMonstered == "New World Pirate [Lv. 1700]" and farmselect) then
			mybaby = "New World Pirate [Lv. 1700]"
			cframequest = getcframequest("War Island Quest")
		elseif ((lvl == 1750 or lvl <= 1799) and AutoFarmLevel) or (SelectedMonstered == "Cutlass Pirate [Lv. 1750]" and farmselect) then
			mybaby = "Cutlass Pirate [Lv. 1750]"
			cframequest = getcframequest("War Island Quest")
		elseif ((lvl == 1800 or lvl <= 1849) and AutoFarmLevel) or (SelectedMonstered == "Rear Admiral [Lv. 1800]" and farmselect) then
			mybaby = "Rear Admiral [Lv. 1800]"
			cframequest = getcframequest("War Island Quest")
		elseif ((lvl == 1850 or lvl <= 1924) and AutoFarmLevel) or (SelectedMonstered == "True Karate Fishman [Lv. 1850]" and farmselect) then
			mybaby = "True Karate Fishman [Lv. 1850]"
			cframequest = getcframequest("War Island Quest")
		elseif ((lvl == 1925 or lvl <= 1999) and AutoFarmLevel) or (SelectedMonstered == "Quake Woman [Lv. 1925]" and farmselect) then
			mybaby = "Quake Woman [Lv. 1925]"
			cframequest = getcframequest("War Island Quest")
		elseif ((lvl == 2000 or lvl <= 2049) and AutoFarmLevel) or (SelectedMonstered == "Fishman [Lv. 2000]" and farmselect) then
			mybaby = "Fishman [Lv. 2000]"
			cframequest = getcframequest("Fishland Quest")
		elseif ((lvl == 2050 or lvl <= 2099) and AutoFarmLevel) or (SelectedMonstered == "Combat Fishman [Lv. 2050]" and farmselect) then
			mybaby = "Combat Fishman [Lv. 2050]"
			cframequest = getcframequest("Fishland Quest")
		elseif ((lvl == 2100 or lvl <= 2149) and AutoFarmLevel) or (SelectedMonstered == "Sword Fishman [Lv. 2100]" and farmselect) then
			mybaby = "Sword Fishman [Lv. 2100]"
			cframequest = getcframequest("Fishland Quest")
		elseif ((lvl == 2150 or lvl <= 2199) and AutoFarmLevel) or (SelectedMonstered == "Soldier Fishman [Lv. 2150]" and farmselect) then
			mybaby = "Soldier Fishman [Lv. 2150]"
			cframequest = getcframequest("Fishland Quest")
		elseif (lvl >= 2200) and AutoFarmLevel or (SelectedMonstered == "Seasoned Fishman [Lv. 2200]" and farmselect) then
			mybaby = "Seasoned Fishman [Lv. 2200]"
			cframequest = getcframequest("Fishland Quest")
		end
	end
	if newkl then
		local lvl = game:GetService("Players").LocalPlayer.PlayerStats.lvl.Value
		if ((lvl == 2250 or lvl <= 2299) and AutoFarmLevel) or (SelectedMonstered == "Beast Pirate [Lv. 2250]" and farmselect) then
			mybaby = "Beast Pirate [Lv. 2250]"
			cframequest = getcframequest("Japan 1 Quest")
		elseif ((lvl == 2300 or lvl <= 2349) and AutoFarmLevel) or (SelectedMonstered == "Beast Swordman [Lv. 2300]" and farmselect) then
			mybaby = "Beast Swordman [Lv. 2300]"
			cframequest = getcframequest("Japan 1 Quest")
		elseif ((lvl == 2350 or lvl <= 2399)  and AutoFarmLevel)or (SelectedMonstered == "Gazelle Man [Lv. 2350]" and farmselect) then
			mybaby = "Gazelle Man [Lv. 2350]"
			cframequest = getcframequest("Japan 1 Quest")
		elseif ((lvl == 2400 or lvl <= 2449) and AutoFarmLevel) or (SelectedMonstered == "Bandit Beast Pirate [Lv. 2400]" and farmselect) then
			mybaby = "Bandit Beast Pirate [Lv. 2400]"
			cframequest = getcframequest("Japan 2 Quest")
		elseif ((lvl == 2450 or lvl <= 2499) and AutoFarmLevel) or (SelectedMonstered == "Powerful Beast Pirate [Lv. 2450]" and farmselect) then
			mybaby = "Powerful Beast Pirate [Lv. 2450]"
			cframequest = getcframequest("Japan 2 Quest")
		elseif ((lvl == 2500 or lvl <= 2549) and AutoFarmLevel) or (SelectedMonstered == "Violet Samurai [Lv. 2500]" and farmselect) then
			mybaby = "Violet Samurai [Lv. 2500]"
			cframequest = getcframequest("Japan 2 Quest")
		elseif ((lvl == 2550 or lvl <= 2599) and AutoFarmLevel) or (SelectedMonstered == "Duke [Lv. 2550]" and farmselect) then
			mybaby = "Duke [Lv. 2550]"
			cframequest = getcframequest("Japan 3 Quest")
		elseif ((lvl == 2600 or lvl <= 2649) and AutoFarmLevel) or (SelectedMonstered == "Magician [Lv. 2600]" and farmselect) then
			mybaby = "Magician [Lv. 2600]"
			cframequest = getcframequest("Japan 3 Quest")
		elseif ((lvl == 2650 or lvl <= 2699) and AutoFarmLevel) or (SelectedMonstered == "Kitsune Samurai [Lv. 2650]" and farmselect) then
			mybaby = "Kitsune Samurai [Lv. 2650]"
			cframequest = getcframequest("Japan 3 Quest")
		elseif ((lvl == 2700 or lvl <= 2749)  and AutoFarmLevel)or (SelectedMonstered == "Elite Beast Pirate [Lv. 2700]" and farmselect) then
			mybaby = "Elite Beast Pirate [Lv. 2700]"
			cframequest = getcframequest("Japan 4 Quest")
		elseif ((lvl == 2750 or lvl <= 2799) and AutoFarmLevel) or (SelectedMonstered == "Bear Man [Lv. 2750]" and farmselect) then
			mybaby = "Bear Man [Lv. 2750]"
			cframequest = getcframequest("Japan 4 Quest")
		elseif ((lvl == 2800 or lvl <= 2849) and AutoFarmLevel) or (SelectedMonstered == "Bean [Lv. 2800]" and farmselect) then
			mybaby = "Bean [Lv. 2800]"
			cframequest = getcframequest("Japan 4 Quest")
		elseif ((lvl == 2850 or lvl <= 2899) and AutoFarmLevel) or (SelectedMonstered == "Meji [Lv. 2850]" and farmselect) then
			mybaby = "Meji [Lv. 2850]"
			cframequest = getcframequest("Japan 5 Quest")
		elseif ((lvl == 2900 or lvl <= 2949) and AutoFarmLevel) or (SelectedMonstered == "Petra [Lv. 2900]" and farmselect) then
			mybaby = "Petra [Lv. 2900]"
			cframequest = getcframequest("Japan 5 Quest")
		elseif ((lvl == 2950 or lvl <= 2999) and AutoFarmLevel) or (SelectedMonstered == "Kappa [Lv. 2950]" and farmselect) then
			mybaby = "Kappa [Lv. 2950]"
			cframequest = getcframequest("Japan 6 Quest")
		elseif ((lvl == 3000 or lvl <= 3024) and AutoFarmLevel) or (SelectedMonstered == "Joey [Lv. 3000]" and farmselect) then
			mybaby = "Joey [Lv. 3000]"
			cframequest = getcframequest("Japan 6 Quest")
		elseif ((lvl == 3025 or lvl <= 3074) and AutoFarmLevel) or (SelectedMonstered == "Skull Pirate [Lv. 3050]" and farmselect) then
			mybaby = "Skull Pirate [Lv. 3050]"
			cframequest = getcframequest("Skull Island Quest")
		elseif ((lvl == 3075 or lvl <= 3099) and AutoFarmLevel) or (SelectedMonstered == "Elite Skeleton [Lv. 3100]" and farmselect) then
			mybaby = "Elite Skeleton [Lv. 3100]"
			cframequest = getcframequest("Skull Island Quest")
		elseif ((lvl == 3100 or lvl <= 3124) and AutoFarmLevel) or (SelectedMonstered == "Desert Thief [Lv. 3125]" and farmselect) then
			mybaby = "Desert Thief [Lv. 3125]"
			cframequest = getcframequest("Desert 2nd Quest")
		elseif ((lvl == 3125 or lvl <= 3149) and AutoFarmLevel) or (SelectedMonstered == "Anubis [Lv. 3150]" and farmselect) then
			mybaby = "Anubis [Lv. 3150]"
			cframequest = getcframequest("Desert 2nd Quest")
		elseif ((lvl == 3150  or lvl <= 3174) and AutoFarmLevel) or (SelectedMonstered == "Pharaoh [Lv. 3175]" and farmselect) then
			mybaby = "Pharaoh [Lv. 3175]"
			cframequest = getcframequest("Desert 2nd Quest")
		elseif ((lvl == 3175 or lvl <= 3199) and AutoFarmLevel) or (SelectedMonstered == "Flame User [Lv. 3200]" and farmselect) then
			mybaby = "Flame User [Lv. 3200]"
			cframequest = getcframequest("Desert 2nd Quest")
		elseif ((lvl == 3200 or lvl <= 3224) and AutoFarmLevel) or (SelectedMonstered == "Chess Soldier [Lv. 3200]" and farmselect) then
			mybaby = "Chess Soldier [Lv. 3200]"
			cframequest = getcframequest("Loaf 1 Quest")
		elseif ((lvl == 3225 or lvl <= 3249) and AutoFarmLevel) or (SelectedMonstered == "Sunken Vessel [Lv. 3225]" and farmselect) then
			mybaby = "Sunken Vessel [Lv. 3225]"
			cframequest = getcframequest("Loaf 1 Quest")
		elseif( (lvl == 3250 or lvl <= 3274) and AutoFarmLevel) or (SelectedMonstered == "Biscuit Man [Lv. 3250]" and farmselect) then
			mybaby = "Biscuit Man [Lv. 3250]"	
			cframequest = getcframequest("Loaf 1 Quest")
		elseif ((lvl == 3275 or lvl <= 3299) and AutoFarmLevel) or (SelectedMonstered == "Dough Master [Lv. 3275]" and farmselect) then
			mybaby = "Dough Master [Lv. 3275]"
			cframequest = getcframequest("Loaf 2 Quest")
		elseif ((lvl == 3300 or lvl <= 3324) and AutoFarmLevel) or (SelectedMonstered == "Azlan [Lv. 3300]" and farmselect) then
			mybaby = "Azlan [Lv. 3300]"
			cframequest = getcframequest("Shred Endangering Quest")
		elseif ((lvl == 3325 or lvl <= 3399) and AutoFarmLevel)  or (SelectedMonstered == "The Volcano [Lv. 3325]" and farmselect) then
			mybaby = "The Volcano [Lv. 3325]"
			cframequest = getcframequest("Shred Endangering Quest")
		elseif ((lvl == 3400 or lvl <= 3424) and AutoFarmLevel)  or (SelectedMonstered == "Dark Beard Servant [Lv. 3400]" and farmselect) then
			mybaby = "Dark Beard Servant [Lv. 3400]"
			cframequest = getcframequest("Skull Pirate Island Quest")
		elseif ((lvl == 3425 or lvl <= 3449) and AutoFarmLevel)  or (SelectedMonstered == "Supreme Swordman [Lv. 3425]" and farmselect) then
			mybaby = "Supreme Swordman [Lv. 3425]"
			cframequest = getcframequest("Skull Pirate Island Quest")
		elseif ((lvl == 3450 or lvl <= 3499 ) and AutoFarmLevel)  or (SelectedMonstered == "Sally [Lv. 3450]" and farmselect) then
			mybaby = "Sally [Lv. 3450]"
			cframequest = getcframequest("Skull Pirate Island Quest")
		elseif ((lvl == 3500 or lvl <= 3524) and AutoFarmLevel)  or (SelectedMonstered == "Vice Admiral [Lv. 3500]" and farmselect) then
			mybaby = "Vice Admiral [Lv. 3500]"
			cframequest = getcframequest("Soldier Head Quater 1 Quest")
		elseif ((lvl == 3525 or lvl <= 3549))  or (SelectedMonstered == "Pondere [Lv. 3525]" and farmselect) then
			mybaby = "Pondere [Lv. 3525]"
			cframequest = getcframequest("Soldier Head Quater 1 Quest")
		elseif ((lvl == 3550 or lvl <= 3599) and AutoFarmLevel) or (SelectedMonstered == "Hefty [Lv. 3550]" and farmselect) then
			mybaby = "Hefty [Lv. 3550]"
			cframequest = getcframequest("Soldier Head Quater 2 Quest")
		elseif ((lvl == 3600 or lvl <= 3624) and AutoFarmLevel) or (SelectedMonstered == "Fiore Gladiator [Lv. 3600]" and farmselect) then
			mybaby = "Fiore Gladiator [Lv. 3600]"
			cframequest = getcframequest("Fiore 1 Quest")
		elseif ((lvl == 3625 or lvl <= 3649) and AutoFarmLevel) or (SelectedMonstered == "Fiore Fighter [Lv. 3625]" and farmselect) then
			mybaby = "Fiore Fighter [Lv. 3625]"
			cframequest = getcframequest("Fiore 1 Quest")
		elseif ((lvl == 3650 or lvl <= 3674) and AutoFarmLevel )or (SelectedMonstered == "Fiore Pirate [Lv. 3650]" and farmselect) then
			mybaby = "Fiore Pirate [Lv. 3650]"
			cframequest = getcframequest("Fiore 2 Quest")
		elseif ((lvl == 3675 or lvl <= 3699) and AutoFarmLevel) or (SelectedMonstered == "Lomeo [Lv. 3675]" and farmselect) then
			mybaby = "Lomeo [Lv. 3675]"
			cframequest = getcframequest("Fiore 2 Quest")
		elseif ((lvl == 3700 or lvl <= 3724) and AutoFarmLevel) or (SelectedMonstered == "Prince Aria [Lv. 3700]" and farmselect)then
			mybaby = "Prince Aria [Lv. 3700]"
			cframequest = getcframequest("Fiore 3 Quest")
		elseif ((lvl == 3725 or lvl <= 3749) and AutoFarmLevel) or (SelectedMonstered == "Devastate [Lv. 3725]" and farmselect) then
			mybaby = "Devastate [Lv. 3725]"
			cframequest = getcframequest("Fiore 3 Quest")
		elseif ((lvl == 3750 or lvl <= 3774) and AutoFarmLevel) or (SelectedMonstered == "Physicus [Lv. 3750]" and farmselect) then
			mybaby = "Physicus [Lv. 3750]"
			cframequest = getcframequest("Fiore 3 Quest")
		elseif ((lvl == 3775 or lvl <= 3799) and AutoFarmLevel) or (SelectedMonstered == "Floffy [Lv. 3775]" and farmselect) then
			mybaby = "Floffy [Lv. 3775]"
			cframequest = getcframequest("Fiore 3 Quest")
		elseif ((lvl == 3800 or lvl <= 3974) and AutoFarmLevel) or (SelectedMonstered == "Dead Troupe [Lv. 3800]" and farmselect) then
			mybaby = "Dead Troupe [Lv. 3800]"
			cframequest = getcframequest("Fiore 4 Quest")
		elseif (lvl >= 3975 and AutoFarmLevel) or (SelectedMonstered == "Ryu [Lv. 3975]" and farmselect) then
			mybaby = "Ryu [Lv. 3975]"
			cframequest = getcframequest("Fiore 4 Quest")
		end
	end
	if treekl then
		local lvl = game:GetService("Players").LocalPlayer.PlayerStats.lvl.Value
		if ((lvl == 4000 or lvl <= 4049) and AutoFarmLevel) or (SelectedMonstered == "Deep Diver [Lv. 4000]" and farmselect) then
			mybaby = "Deep Diver [Lv. 4000]"
			cframequest = getcframequest("The Unearthly 1 Quest")
		elseif ((lvl == 4050 or lvl <= 4099) and AutoFarmLevel) or (SelectedMonstered == "Fugitive [Lv. 4050]" and farmselect) then
			mybaby = "Fugitive [Lv. 4050]"
			cframequest = getcframequest("The Unearthly 1 Quest")
		elseif ((lvl == 4100 or lvl <= 4149) and AutoFarmLevel) or (SelectedMonstered == "Deep one Villager [Lv. 4100]" and farmselect) then
			mybaby = "Deep one Villager [Lv. 4100]"
			cframequest = getcframequest("The Unearthly 1 Quest")
		elseif ((lvl == 4150 or lvl <= 4199) and AutoFarmLevel) or (SelectedMonstered == "Fishman Guardian [Lv. 4150]" and farmselect) then
			mybaby = "Fishman Guardian [Lv. 4150]"
			cframequest = getcframequest("The Unearthly 2 Quest")
		elseif ((lvl == 4200 or lvl <= 4249) and AutoFarmLevel) or (SelectedMonstered == "The deep one [Lv. 4200]" and farmselect) then
			mybaby = "The deep one [Lv. 4200]"
			cframequest = getcframequest("The Unearthly 2 Quest")
		elseif ((lvl == 4250 or lvl <= 4299) and AutoFarmLevel) or (SelectedMonstered == "Fishman King's Guard [Lv. 4250]" and farmselect) then
			mybaby = "Fishman King's Guard [Lv. 4250]"
			cframequest = getcframequest("The Unearthly 2 Quest")
		elseif( (lvl == 4300 or lvl <= 4324) and AutoFarmLevel) or (SelectedMonstered == "Jungle Gorilla [Lv. 4300]" and farmselect) then
			mybaby = "Jungle Gorilla [Lv. 4300]"
			cframequest = getcframequest("The Shallow 1 Quest")
		elseif ((lvl == 4325 or lvl <= 4349) and AutoFarmLevel) or (SelectedMonstered == "Wilderness Gorilla [Lv. 4325]" and farmselect) then
			mybaby = "Wilderness Gorilla [Lv. 4325]"
			cframequest = getcframequest("The Shallow 1 Quest")
		elseif ((lvl == 4350 or lvl <= 4374)  and AutoFarmLevel)or (SelectedMonstered == "Jungle Ape [Lv. 4350]" and farmselect) then
			mybaby = "Jungle Ape [Lv. 4350]"
			cframequest = getcframequest("The Shallow 1 Quest")
		elseif ((lvl == 4375 or lvl <= 4399) and AutoFarmLevel) or (SelectedMonstered == "Cyborg Gorilla [Lv. 4375]" and farmselect) then
			mybaby = "Cyborg Gorilla [Lv. 4375]"
			cframequest = getcframequest("The Shallow 1 Quest")
		elseif ((lvl == 4400 or lvl <= 4449) and AutoFarmLevel) or (SelectedMonstered == "Ripcurrent Raider [Lv. 4400]" and farmselect) then
			mybaby = "Ripcurrent Raider [Lv. 4400]"
			cframequest = getcframequest("Drakenhold Fortress Quest")
		elseif ((lvl == 4450 or lvl <= 4499) and AutoFarmLevel) or (SelectedMonstered == "Tidal Warrior [Lv. 4450]" and farmselect) then
			mybaby = "Tidal Warrior [Lv. 4450]"
			cframequest = getcframequest("Drakenhold Fortress Quest")
		elseif ((lvl == 4500 or lvl <= 4549) and AutoFarmLevel) or (SelectedMonstered == "Ocean Gladiator [Lv. 4500]" and farmselect) then
			mybaby = "Ocean Gladiator [Lv. 4500]"
			cframequest = getcframequest("Drakenhold Fortress Quest")
		elseif ((lvl == 4550 or lvl <= 4599) and AutoFarmLevel) or (SelectedMonstered == "Deepfire Combatant [Lv. 4550]" and farmselect) then
			mybaby = "Deepfire Combatant [Lv. 4550]"
			cframequest = getcframequest("Forgotten Coliseum Quest")
		elseif ((lvl == 4600 or lvl <= 4649) and AutoFarmLevel) or (SelectedMonstered == "Electro Abyss Warrior [Lv. 4600]" and farmselect) then
			mybaby = "Electro Abyss Warrior [Lv. 4600]"
			cframequest = getcframequest("Forgotten Coliseum Quest")
		elseif ((lvl == 4650 or lvl <= 4699) and AutoFarmLevel) or (SelectedMonstered == "Inferno Diver [Lv. 4650]" and farmselect) then
			mybaby = "Inferno Diver [Lv. 4650]"
			cframequest = getcframequest("Forgotten Coliseum Quest")
		elseif ((lvl == 4700 or lvl <= 4749) and AutoFarmLevel) or (SelectedMonstered == "Tempest Tidebreaker [Lv. 4700]" and farmselect) then
			mybaby = "Tempest Tidebreaker [Lv. 4700]"
			cframequest = getcframequest("Forgotten Coliseum Quest 2")
		elseif (lvl >= 4750 and AutoFarmLevel) or (SelectedMonstered == "Abyssal Swordsman [Lv. 4750]" and farmselect) then
			mybaby = "Abyssal Swordsman [Lv. 4750]"
			cframequest = getcframequest("Forgotten Coliseum Quest 2")
		end
	end
end

function hopkl()
	repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
	local HttpService, TPService = game:GetService"HttpService", game:GetService"TeleportService";
	local OtherServers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
	function joinNew()
		if not isfile('servers.sss') then 
			writefile('servers.sss',HttpService:JSONEncode({}))
		end
		local dontJoin = readfile('servers.sss') 
		dontJoin = HttpService:JSONDecode(dontJoin)

		for Index, Server in next, OtherServers["data"] do
			if Server ~= game.JobId then
				local j = true
				for a,c in pairs(dontJoin) do 
					if c == Server.id then 
						j = false 
					end
				end
				if j then
					table.insert(dontJoin,Server["id"])
					writefile("servers.sss",HttpService:JSONEncode(dontJoin))
					wait()
					return Server['id']				
				end
			end
		end
	end

	local server = joinNew()
	if not server then 
		writefile("servers.sss",HttpService:JSONEncode({}))
		local server = joinNew()
		TPService:TeleportToPlaceInstance(game.PlaceId, server)
	else
		TPService:TeleportToPlaceInstance(game.PlaceId, server)
	end
end
function EquipWeapon(ToolSe)
	if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
		wait()
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
	end
end
function equip()
	if selecttypeweapon == "Melee" then
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.Name == game:GetService("Players").LocalPlayer.PlayerStats.FightingStyle.Value then
				if game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) then
					game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
				end
			end				
		end
	elseif selecttypeweapon == "Sword" then
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.Name == game:GetService("Players").LocalPlayer.PlayerStats.SwordName.Value then
				if game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) then
					game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
				end
			end
		end
	elseif selecttypeweapon == "Devil Fruit" then
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.Name == game:GetService("Players").LocalPlayer.PlayerStats.DFName.Value then
				if game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) then
					game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
				end
			end
		end
	end
end
local getmelee = ""
local getsword = ""

function attacksdfgsdfgsdfgsf()
	if selecttypeweapon == "Melee" then
		getmelee = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerStats").FightingStyle.Value
		if game:GetService("Players").LocalPlayer.Character:FindFirstChild(getmelee) then
			local args = {
				[1] = "FS_"..getmelee.."_M1"
			}
			game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer(unpack(args))	
		end
	elseif selecttypeweapon == "Sword" then
		getsword = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerStats").SwordName.Value
		if game:GetService("Players").LocalPlayer.Character:FindFirstChild(getsword) then
			local args = {
				[1] = "SW_"..getsword.."_M1"
			}
			game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer(unpack(args))
		end
	end
end

function forfarm(enemies)
	if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
		if selecttypefarm == "Behind" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemies * CFrame.new(0,0,setdistance)
		elseif selecttypefarm == "Above" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemies * CFrame.new(0,setdistance,0) * CFrame.Angles(math.rad(-90),0,0)
		elseif selecttypefarm == "Below" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemies * CFrame.Angles(math.rad(90),0,0) - Vector3.new(0,setdistance,0)
		end		
	end
end
function tp(target)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame
end
function tp2(target)
	if not game:GetService("Workspace").AllNPC:FindFirstChild(target) then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage").NPC[target].HumanoidRootPart.CFrame * CFrame.new(0,0,-4)
	else 
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").AllNPC[target].CFrame * CFrame.new(0,0,-4)
	end
end
function tp3(target)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage").MOB[target].HumanoidRootPart.CFrame * CFrame.new(0,0,-4)
end
function tp4(target)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").AllNPC[target].CFrame * CFrame.new(0,0,-4)
end
function tptolegacy()
	if game:GetService("Workspace").Island:FindFirstChild("Legacy Island1") then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Island:FindFirstChild("Legacy Island1").Gate.Part.CFrame*CFrame.new(0,50,0)
	elseif game:GetService("Workspace").Island:FindFirstChild("Legacy Island2") then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Island:FindFirstChild("Legacy Island2").Gate.Part.CFrame*CFrame.new(0,50,0)
	elseif game:GetService("Workspace").Island:FindFirstChild("Legacy Island3") then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Island:FindFirstChild("Legacy Island3").Gate.Part.CFrame*CFrame.new(0,50,0)
	elseif game:GetService("Workspace").Island:FindFirstChild("Legacy Island4") then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Island:FindFirstChild("Legacy Island4").Gate.Part.CFrame*CFrame.new(0,50,0)
	end
end
function tptohydra()
	if game:GetService("Workspace").Areas:FindFirstChild("HydraIslandArea") then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Areas:FindFirstChild("HydraIslandArea").CFrame*CFrame.new(0,50,0)
	end
end
function rejoingame()
	local ts = game:GetService("TeleportService")
	local p = game:GetService("Players").LocalPlayer
	ts:Teleport(game.PlaceId, p)
end
function fps()
	local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
	local g = game
	local w = g.Workspace
	local l = g.Lighting
	local t = w.Terrain
	t.WaterWaveSize = 0
	t.WaterWaveSpeed = 0
	t.WaterReflectance = 0
	t.WaterTransparency = 0
	l.GlobalShadows = false
	l.FogEnd = 9e9
	l.Brightness = 0
	settings().Rendering.QualityLevel = "Level01"
	for i, v in pairs(g:GetDescendants()) do
		if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
			v.Material = "Plastic"
			v.Reflectance = 0
		elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
			v.Transparency = 1
		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
			v.Lifetime = NumberRange.new(0)
		elseif v:IsA("Explosion") then
			v.BlastPressure = 1
			v.BlastRadius = 1
		elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
			v.Enabled = false
		elseif v:IsA("MeshPart") then
			v.Material = "Plastic"
			v.Reflectance = 0
			v.TextureID = 10385902758728957
		end
	end
	for i, e in pairs(l:GetChildren()) do
		if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
			e.Enabled = false
		end
	end
end
function gotochest()
	if game:GetService("Workspace").Island:FindFirstChild("Legacy Island1") then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Island:FindFirstChild("Legacy Island1").ChestSpawner.CFrame
	elseif game:GetService("Workspace").Island:FindFirstChild("Legacy Island2") then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Island:FindFirstChild("Legacy Island2").ChestSpawner.CFrame
	elseif game:GetService("Workspace").Island:FindFirstChild("Legacy Island3") then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Island:FindFirstChild("Legacy Island3").ChestSpawner.CFrame
	elseif game:GetService("Workspace").Island:FindFirstChild("Legacy Island4") then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Island:FindFirstChild("Legacy Island4").ChestSpawner.CFrame
	end
end
function checkx2(here)
	if here then
		ugotmail = true
	else
		ugotmail = false
	end
end
function checklaw()
	if game:GetService("Players").LocalPlayer.CurrentQuest.Value.Value == "Kioru Quest 1" then
		Law_Name = "Kappa [Lv. 2950]"
	elseif game:GetService("Players").LocalPlayer.CurrentQuest.Value.Value == "Kioru Quest 2" then
		Law_Name = "Anubis [Lv. 3150]"
	elseif game:GetService("Players").LocalPlayer.CurrentQuest.Value.Value == "Kioru Quest 3" then
		Law_Name = "Flame User [Lv. 3200]"
	elseif game:GetService("Players").LocalPlayer.CurrentQuest.Value.Value == "Kioru Quest 4" then
		Law_Name = "Sunken Vessel [Lv. 3225]"
	elseif game:GetService("Players").LocalPlayer.CurrentQuest.Value.Value == "Kioru Quest 5" then
		Law_Name = "Biscuit Man [Lv. 3250]"
	elseif game:GetService("Players").LocalPlayer.CurrentQuest.Value.Value == "Kioru Quest 6" then
		Law_Name = "Dough Master [Lv. 3275]"
	end
end
function checkcrystal()
	if selectedcrystal == "Ice Crystal" then
		Name_Crystal = "Ice Crystal"
		Name_Find_Crystal = "Azlan [Lv. 3300]"
		Name_Boss_Crystal = "The Ice King [Lv. 3350]"
		Name_Quest = "Kill 1 The Ice King"
		Level_Quest = 3350
		Low_Level = "You must be Level 3,350 to accept this quest."
	elseif selectedcrystal == "Magma Crystal" then
		Name_Crystal = "Magma Crystal"
		Name_Find_Crystal = "The Volcano [Lv. 3325]"
		Name_Boss_Crystal = "The Crimson Demon [Lv. 3375]"
		Name_Quest = "Kill 1 The Crimson Demon"
		Level_Quest = 3375
		Low_Level = "You must be Level 3,375 to accept this quest."
	end
end
function ClickUI(path)
    game:GetService("GuiService").SelectedObject = path
     wait(.1)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, 13, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
    wait(.1)
     game:GetService("VirtualInputManager"):SendKeyEvent(false, 13, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
     wait(.1)
    game:GetService("GuiService").SelectedObject = nil
    wait(.1)
end
function clickquest(one,two)
	if game:GetService("Workspace").AllNPC:FindFirstChild(two) then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").AllNPC[two].CFrame
	else
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage").NPC[two].HumanoidRootPart.CFrame
	end
	local args = {
	    [1] = workspace.AllNPC[one]
	}

	game:GetService("ReplicatedStorage").Chest.Remotes.Functions.CheckQuest:InvokeServer(unpack(args))
	wait(.5)
	ClickUI(game:GetService("Players").LocalPlayer.PlayerGui[one].Dialogue.Accept)
end
--

Mouse.Button1Down:connect(function()
	if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
		return
	end
	if not Mouse.Target then
		return
	end
	if CTRL then
		game:GetService("Players").LocalPlayer.Character:MoveTo(Mouse.Hit.p)
	end
end)

spawn(function()
	while wait() do
		if autodungeon then
			pcall(function ()
				if game.PlaceId == isdungeon then
					if game:GetService("Players").LocalPlayer.PlayerGui.ChooseMap.Enabled == true then
						for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.ChooseMap.ChooseMapFrame.ScrollingFrame[choosemap].MouseButton1Click)) do						
							v:Fire()						
						end
					elseif game:GetService("Players").LocalPlayer.PlayerGui["GoldenArena GUI"].StartButton.Visible == true then
						ClickUI(game:GetService("Players").LocalPlayer.PlayerGui["GoldenArena GUI"].StartButton)
					else
						for i,v in pairs(game:GetService("Workspace").MOB:GetChildren()) do
							if v:FindFirstChild('Humanoid').Health > 0 then
								repeat task.wait()
									forfarm(v.HumanoidRootPart.CFrame)																					
								until autodungeon == false or v:FindFirstChild("Humanoid").Health <= 0
							end	
						end
					end
				else
					if newkl then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4596.60205078125, 223.14341735839844, -66.93316650390625)
					else
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2527.77978515625, 103.6971664428711, -1931.352294921875)
					end
				end
			end)
		end
	end
end)
spawn(function()
	while wait() do
		if autodungeon then
			pcall(function ()
				if game.PlaceId == isdungeon then
					if autoswapwepons then
						EquipWeapon(game:GetService("Players").LocalPlayer.PlayerStats.FightingStyle.Value)
						wait(2)
						EquipWeapon(game:GetService("Players").LocalPlayer.PlayerStats.SwordName.Value)
						wait(2)
						EquipWeapon(game:GetService("Players").LocalPlayer.PlayerStats.DFName.Value)
						wait(2)
					else
						equip()
					end
				end
			end)
		end
	end
end)
--

spawn(function()
	while true do 
		wait(.5)
		if game:GetService("Workspace").Island:FindFirstChild("Legacy Island1") then
			checklegacy:Refresh("Legacy Island is spawned")
		elseif game:GetService("Workspace").Island:FindFirstChild("Legacy Island2") then
			checklegacy:Refresh("Legacy Island is spawned")
		elseif game:GetService("Workspace").Island:FindFirstChild("Legacy Island3") then
			checklegacy:Refresh("Legacy Island is spawned")
		elseif game:GetService("Workspace").Island:FindFirstChild("Legacy Island4") then
			checklegacy:Refresh("Legacy Island is spawned")
		else
			checklegacy:Refresh("Legacy Island is not spawn")
		end
		if game:GetService("Workspace").Areas:FindFirstChild("HydraIslandArea") then
			checkhydra:Refresh("Hydra Island is spawned")
		else
			checkhydra:Refresh("Hydra Island is not spawn")
		end
	end
end)
spawn(function()
	while wait() do
		if ugotmail then
			pcall(function()
				attacksdfgsdfgsdfgsf()				
				if  game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
					game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
				end
				if  game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Sit == true then
					game.Players.LocalPlayer.Character.Humanoid.Sit = false
				end	
			end)
		end
	end
end)
spawn(function()
	while wait(.5) do
		if BusoHaki then
			if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
				if game.Players.LocalPlayer.Character.Services:FindFirstChild("Haki") then
					if game.Players.LocalPlayer.Character.Services.Haki.Value == 0 then
						game:GetService("ReplicatedStorage").Chest.Remotes.Events.Armament:FireServer()
						game.Players.LocalPlayer.Character.Services.Haki.Value = 1
					end
				end
			end
		end
	end
end)
spawn(function()
	while wait(.5) do
		if ObservationHaki then
			if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and not game.Players.LocalPlayer.Character:FindFirstChild("HighlightPlayer") then
				game:service('VirtualInputManager'):SendKeyEvent(true, "Y", false, game)
				wait(.1)
				game:service('VirtualInputManager'):SendKeyEvent(false, "Y", false, game)
				wait(1)
			end
		end
	end
end)
function warptoquest(here)
	if game:GetService("Workspace").AllNPC:FindFirstChild(here) then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").AllNPC[here].CFrame * CFrame.new(0,0,3)
	else
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage").NPC[here].HumanoidRootPart.CFrame * CFrame.new(0,0,3)
	end
end

spawn(function()
	while wait() do
		if AutoFarmLevel then
			pcall(function()	
				checkquest()
				if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestFrame.Visible == false then	
					getquest(mybaby)								
				else
					if not game:GetService("ReplicatedStorage").MOB:FindFirstChild(mybaby) then	
						if mybaby == "Dough Master [Lv. 3275]" then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(30276.4883, 65.4516144, 93158.6094, -0.975189209, -1.17759527e-08, -0.221372902, 8.80325857e-09, 1, -9.19751031e-08, 0.221372902, -9.16419296e-08, -0.975189209) * CFrame.new(0,10,0)
						elseif mybaby == "Dead Troupe Captain [Lv. 3850]" then		
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframequest
						elseif mybaby == "Ocean Gladiator [Lv. 4500]" then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-115.976616, 44.9609604, -9149.57422, -0.314125299, 0, 0.94938159, 0, 1, 0, -0.94938159, 0, -0.314125299) * CFrame.new(0,0,3)
						elseif mybaby == "Abyssal Swordsman [Lv. 4750]" then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8126.33203125, 239.62893676757812, 91.52705383300781) * CFrame.new(0,0,3)
						else
							warptoquest(cframequest)
						end
						for i,v in pairs(game:GetService("Workspace").Monster:GetDescendants()) do
							if v.Name == mybaby and v:FindFirstChild('Humanoid').Health > 0 then
								repeat task.wait()																
									for i5,v5 in pairs(HHEASDFL) do	
										if v5.name == v.Name then
											if game:GetService("Players").LocalPlayer.CurrentQuest.Value == v5.quest then
												equip()
												forfarm(v.HumanoidRootPart.CFrame)									
											else
												getquest(mybaby)										
											end
										end
									end
								until AutoFarmLevel == false or v:FindFirstChild("Humanoid").Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestFrame.Visible == false							
							end	
						end
					else
						if mybaby == "Dough Master [Lv. 3275]" then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(30276.4883, 65.4516144, 93158.6094, -0.975189209, -1.17759527e-08, -0.221372902, 8.80325857e-09, 1, -9.19751031e-08, 0.221372902, -9.16419296e-08, -0.975189209) * CFrame.new(0,10,0)
						elseif mybaby == "Dead Troupe Captain [Lv. 3850]" then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframequest
						else
							warptoquest(cframequest)
						end
					end
				end
			end)
		end
	end
end)
spawn(function()
	while wait() do
		if farmselect then
			pcall(function()
				checkquest()
				if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestFrame.Visible == false then
					getquest(SelectedMonstered)						
				else
					if not game:GetService("ReplicatedStorage").MOB:FindFirstChild(SelectedMonstered) then
						if SelectedMonstered == "Dough Master [Lv. 3275]" then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(30276.4883, 65.4516144, 93158.6094, -0.975189209, -1.17759527e-08, -0.221372902, 8.80325857e-09, 1, -9.19751031e-08, 0.221372902, -9.16419296e-08, -0.975189209) * CFrame.new(0,10,0)
						elseif SelectedMonstered == "Dead Troupe Captain [Lv. 3850]" then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframequest
						elseif SelectedMonstered == "Ocean Gladiator [Lv. 4500]" then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-115.976616, 44.9609604, -9149.57422, -0.314125299, 0, 0.94938159, 0, 1, 0, -0.94938159, 0, -0.314125299) * CFrame.new(0,0,3)
						elseif SelectedMonstered == "Abyssal Swordsman [Lv. 4750]" then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8126.33203125, 239.62893676757812, 91.52705383300781) * CFrame.new(0,0,3)
						else
							warptoquest(cframequest)
						end
						for i,v in pairs(game:GetService("Workspace").Monster:GetDescendants()) do
							if v.Name == SelectedMonstered and v:FindFirstChild('Humanoid').Health > 0 then
								repeat task.wait()		
									for i5,v5 in pairs(HHEASDFL) do	
										if v5.name == v.Name then
											if game:GetService("Players").LocalPlayer.CurrentQuest.Value == v5.quest then
												equip()
												forfarm(v.HumanoidRootPart.CFrame)									
											else
												getquest(SelectedMonstered)
											end
										end
									end
								until not farmselect or v:FindFirstChild("Humanoid").Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestFrame.Visible == false
							end
						end
					else
						if SelectedMonstered == "Dough Master [Lv. 3275]" then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(30276.4883, 65.4516144, 93158.6094, -0.975189209, -1.17759527e-08, -0.221372902, 8.80325857e-09, 1, -9.19751031e-08, 0.221372902, -9.16419296e-08, -0.975189209) * CFrame.new(0,10,0)
						elseif SelectedMonstered == "Dead Troupe Captain [Lv. 3850]" then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframequest
						else
							warptoquest(cframequest)
						end
					end
				end
			end)
		end
	end
end)
--[[spawn(function()
	while wait() do
		if autocandy then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Areas.SantaFactory.CFrame * CFrame.new(0,500,0)
			for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
				if (v.Name == "Hybrid Deer [Lv. 5000]" or v.Name == "Green Elf [Lv. 6250]" or v.Name == "Ginger Bread [Lv. 7500]") and v:FindFirstChild("Humanoid") then
					repeat task.wait()								
						equip()
						forfarm(v.HumanoidRootPart.CFrame)	
					until autocandy == false or v:FindFirstChild("Humanoid").Health <= 0
				end
			end
		end
	end
end)
spawn(function()
	while wait() do
		if autosanta then
			if game:GetService("Workspace").Monster.Boss:FindFirstChild("Kris Kringle [Lv. 10000]") then
				for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
					if v.Name == "Kris Kringle [Lv. 10000]" and v:FindFirstChild("Humanoid") then
						repeat task.wait()								
							equip()
							forfarm(v.HumanoidRootPart.CFrame)	
						until autosanta == false or v:FindFirstChild("Humanoid").Health <= 0
					end
				end
			elseif game:GetService("ReplicatedStorage").MOB:FindFirstChild("Kris Kringle [Lv. 10000]") then
				tp(game:GetService("ReplicatedStorage").MOB["Kris Kringle [Lv. 10000]"])
			elseif game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame["Inventory_Frame"].ScrollingFrameMaterial:FindFirstChild("Santa's Candy") and (not game:GetService("Workspace").Monster.Boss:FindFirstChild("Kris Kringle [Lv. 10000]") or not game:GetService("ReplicatedStorage").MOB:FindFirstChild("Kris Kringle [Lv. 10000]")) then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").AllNPC.SummonKrisKringle.Head.CFrame
				getquest("SummonKrisKringle")
			else
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Areas.SantaFactory.CFrame * CFrame.new(0,500,0)
				for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
					if (v.Name == "Hybrid Deer [Lv. 5000]" or v.Name == "Green Elf [Lv. 6250]" or v.Name == "Ginger Bread [Lv. 7500]") and v:FindFirstChild("Humanoid") then
						repeat task.wait()								
							equip()
							forfarm(v.HumanoidRootPart.CFrame)	
						until autosanta == false or v:FindFirstChild("Humanoid").Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame["Inventory_Frame"].ScrollingFrameMaterial:FindFirstChild("Santa's Candy")
					end
				end
			end
		end
	end
end)]]
spawn(function()
	while wait() do
		if automonweapons then
			pcall(function()
				if selectedmonweapons == "All" then
					if game:GetService("Workspace").Monster.Boss:FindFirstChild("Ms. Mother [Lv. 7500]") or game:GetService("Workspace").Monster.Boss:FindFirstChild("King Samurai [Lv. 3500]") then
						for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
							if (v.Name == "King Samurai [Lv. 3500]" or v.Name == "Ms. Mother [Lv. 7500]") and v.Humanoid.Health > 0 then
								repeat task.wait()								
									equip()
									forfarm(v.HumanoidRootPart.CFrame)	
								until automonweapons == false or v:FindFirstChild("Humanoid").Health <= 0
							end
						end
					elseif game:GetService("ReplicatedStorage").MOB:FindFirstChild("Ms. Mother [Lv. 7500]") then
						tp(game:GetService("ReplicatedStorage").MOB:FindFirstChild("Ms. Mother [Lv. 7500]"))
					elseif game:GetService("ReplicatedStorage").MOB:FindFirstChild("King Samurai [Lv. 3500]") then
						tp(game:GetService("ReplicatedStorage").MOB:FindFirstChild("King Samurai [Lv. 3500]"))
					else
						if addhop then
							hopkl()
						end
					end
				elseif selectedmonweapons ~= "All" then
					if game:GetService("Workspace").Monster.Boss:FindFirstChild(selectedmonweapons) or game:GetService("ReplicatedStorage").MOB:FindFirstChild(selectedmonweapons) then
						for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
							if v.Name == selectedmonweapons and v.Humanoid.Health > 0 then
								repeat task.wait()								
									equip()
									forfarm(v.HumanoidRootPart.CFrame)	
								until automonweapons == false or v:FindFirstChild("Humanoid").Health <= 0
							end
						end
					else
						if addhop then
							hopkl()
						end
					end
				end
			end)
		end
	end
end)
spawn(function()
	while wait() do
		if AutoSeaMonsterKL then
			pcall(function()
				if selectedseamonset == "SeaKing" then
					if game:GetService("Workspace").SeaMonster:FindFirstChild("SeaKing") then
						for i,v in pairs(game:GetService("Workspace").SeaMonster:GetChildren()) do
							if v.Name == "SeaKing" and v:FindFirstChild("Humanoid") then
								repeat task.wait()						
									if v:FindFirstChild("Humanoid").Health > 0 then
										equip()
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,10)
									else
										gotochest()
										wait(3)
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3661.3359375, 57.334808349609375, 167.71633911132812)
									end
								until AutoSeaMonsterKL == false or v:FindFirstChild("Humanoid").Health <= 0
							end
						end
					else
						wait(5)
						if ServerhopSeaKing then
							Message("Hop!", Color3.new(0, 62, 255))
							hopkl()
						end
					end
				elseif selectedseamonset == "HydraSeaKing" then
					if game:GetService("Workspace").SeaMonster:FindFirstChild("HydraSeaKing") then
						for i,v in pairs(game:GetService("Workspace").SeaMonster:GetChildren()) do
							if v.Name == "HydraSeaKing" and v:FindFirstChild("Humanoid") then
								repeat task.wait()		
									if v:FindFirstChild("Humanoid").Health > 0 then
										equip()
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,50,10)
									else
										for i,v in pairs(game:GetService("Workspace").Island:GetDescendants()) do
											if v:FindFirstChild("SeaBeastChest") then
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HydraStand.CFrame
											end
										end
									end
								until AutoSeaMonsterKL == false or v:FindFirstChild("Humanoid").Health <= 0
							end
						end
					else
						wait(5)
						if ServerhopSeaKing then
							Message("Hop!", Color3.new(0, 62, 255))
							hopkl()
						end
					end
				elseif selectedseamonset == "Both" then
					if game:GetService("Workspace").SeaMonster:FindFirstChild("HydraSeaKing") then
						for i,v in pairs(game:GetService("Workspace").SeaMonster:GetChildren()) do
							if v.Name == "HydraSeaKing" and v:FindFirstChild("Humanoid") then
								repeat task.wait()		
									if v:FindFirstChild("Humanoid").Health > 0 then
										equip()
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,50,10)
									else
										for i,v in pairs(game:GetService("Workspace").Island:GetDescendants()) do
											if v:FindFirstChild("SeaBeastChest") then
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HydraStand.CFrame
											end
										end
									end
								until AutoSeaMonsterKL == false or v:FindFirstChild("Humanoid").Health <= 0
							end
						end
					elseif game:GetService("Workspace").SeaMonster:FindFirstChild("SeaKing") then
						for i,v in pairs(game:GetService("Workspace").SeaMonster:GetChildren()) do
							if v.Name == "SeaKing" and v:FindFirstChild("Humanoid") then
								repeat task.wait()		
									if v:FindFirstChild("Humanoid").Health > 0 then
										equip()
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,10)
									else
										gotochest()
										wait(3)
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3661.3359375, 57.334808349609375, 167.71633911132812)
									end
								until AutoSeaMonsterKL == false or v:FindFirstChild("Humanoid").Health <= 0
							end
						end
					else
						wait(5)
						if ServerhopSeaKing then
							Message("Hop!", Color3.new(0, 62, 255))
							hopkl()
						end
					end
				end	
			end)		
		end
	end
end)
spawn(function()
	while wait() do
		if stoplegen then
			for i,v in pairs(fruitlegenday) do
				if game.Players.LocalPlayer.Backpack:FindFirstChild(v) or game.Players.LocalPlayer.Character:FindFirstChild(v) then
					ServerhopSeaKing = false
				end
			end
		end
	end
end)
spawn(function()
	while wait() do
		if AutoKaidoKL then
			pcall(function()
				if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame["Inventory_Frame"].ScrollingFrameMaterial:FindFirstChild("Dragon's Orb") and (not game:GetService("Workspace").Monster.Boss:FindFirstChild("Dragon [Lv. 5000]") or not game:GetService("ReplicatedStorage").MOB:FindFirstChild("Dragon [Lv. 5000]")) then
					farmskeleton = false
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Island["B - Skull Island"].SummonAltar.Handle.CFrame * CFrame.new(0,-1,1)
					clickquest("SummonDragon","SummonDragon")
				elseif game:GetService("Workspace").Monster.Boss:FindFirstChild("Dragon [Lv. 5000]") then
					if game:GetService("Workspace").Monster.Boss:FindFirstChild("Dragon [Lv. 5000]")  then
						farmskeleton = false
						for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
							if v.Name == "Dragon [Lv. 5000]" and v:FindFirstChild("Humanoid") then
								repeat task.wait()
									equip()
									forfarm(v.HumanoidRootPart.CFrame)	
								until AutoKaidoKL == false or v:FindFirstChild("Humanoid").Health <= 0
							end
						end
					else
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Island:FindFirstChild("B - Skull Island").SummonAltar.Handle.CFrame * CFrame.new(0,-1,1)
					end
				else
					farmskeleton = true
				end
			end)	
		end
	end
end)
spawn(function()
	while wait() do
		if farmskeleton and AutoKaidoKL then
			pcall(function()
				if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestFrame.Visible == false then				
					getquest("Elite Skeleton [Lv. 3100]")
				else
					if game:GetService("Workspace").Monster.Boss:FindFirstChild("Elite Skeleton [Lv. 3100]") then
						for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
							if v.Name == "Elite Skeleton [Lv. 3100]" and v:FindFirstChild("Humanoid") then
								repeat task.wait()
									equip()
									forfarm(v.HumanoidRootPart.CFrame)								
								until AutoKaidoKL == false or v:FindFirstChild("Humanoid").Health <= 0
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6052.0576171875, 160.00473022460938, 7232.03857421875)
							end
						end
					else
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Island:FindFirstChild("B - Skull Island").SummonAltar.Handle.CFrame * CFrame.new(0,-1,1)
					end
				end
			end)
		end
	end
end)
spawn(function()
	while wait() do
		if AutoLawBlade then
			pcall(function()
				checklaw()
				if game:GetService("Players").LocalPlayer.PlayerStats.lvl.Value >= 3300 then
					if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestFrame.Visible == false then
						getquest("QuestKioru")
					else
						if game:GetService("Workspace").Monster.Boss:FindFirstChild(Law_Name) then
							for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
								if v.Name == Law_Name and v:FindFirstChild("Humanoid") then
									repeat task.wait()	
										equip()
										forfarm(v.HumanoidRootPart.CFrame)											 
									until AutoLawBlade == false or v:FindFirstChild("Humanoid").Health <= 0
								end
							end
						else
							if game:GetService("ReplicatedStorage").MOB:FindFirstChild(Law_Name) then
								tp(game:GetService("ReplicatedStorage").MOB[Law_Name])
							end
						end
					end
				end
			end)
		end
	end
end)
function getchest()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if string.find(v.Name,"Chest") then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.RootPart.CFrame * CFrame.new(0,-1,0)
			wait(.5)
		end
	end
end
spawn(function()
	while wait() do
		if AutoGhostShip then
			pcall(function()
				if game:GetService("Workspace").GhostMonster:FindFirstChild("Ghost Ship") then
					for i,v in pairs(game:GetService("Workspace").GhostMonster:GetChildren()) do
						if v.Name == "Ghost Ship" and v:FindFirstChild("Humanoid") then
							repeat task.wait()										
								if v.Humanoid.Health <= 0 then
									if not game.Players.LocalPlayer.Character:FindFirstChild("Bullitus") then
										local args = {
											[1] = "Bullitus"
										}
										game:GetService("ReplicatedStorage").Chest.Remotes.Functions.AccessoryEq:InvokeServer(unpack(args))									
									end
									if game:GetService("Workspace"):FindFirstChild("Chest1") and CollectChestShip == true then
										getchest()
									end
								else
									equip()
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,75,0)
								end
							until AutoGhostShip == false or v:FindFirstChild("Humanoid").Health <= 0	
							getchest()							
						end
					end
				else
					if game:GetService("Workspace"):FindFirstChild("Chest1") and CollectChestShip == true then
						getchest()
					end
					wait(5)
					if ServerhopGhostShip then
						if not game:GetService("Workspace"):FindFirstChild("Chest1") then
							Message("Hop!", Color3.new(0, 62, 255))
							hopkl()
						end
					end
				end
			end)
		end
	end
end)
spawn(function()
	while wait() do
		if stoplegenghost then
			pcall(function()
				for i,v in pairs(fruitlegenday) do
					if game.Players.LocalPlayer.Backpack:FindFirstChild(v) or game.Players.LocalPlayer.Character:FindFirstChild(v) then
						AutoGhostShip = false
						ServerhopGhostShip = false
						AutoSeaMonsterKL = false
						wait(.5)
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3661.3359375, 57.334808349609375, 167.71633911132812)
					end
				end
			end)
		end
	end
end)
spawn(function()
	while wait() do		
		if QuestCrystal then
			pcall(function()
				checkcrystal()
				if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame["Inventory_Frame"].ScrollingFrameMaterial:FindFirstChild(Name_Crystal) and game:GetService("Players").LocalPlayer.CurrentQuest.Value.Value ~= Name_Quest and (not game:GetService("Workspace").Monster.Boss:FindFirstChild(Name_Boss_Crystal) or not game:GetService("ReplicatedStorage").MOB:FindFirstChild(Name_Boss_Crystal)) then
					find_crystal = false
					local args = {
					    [1] = "QuestSpawnBoss",
					    [2] = {
					        ["LevelLow"] = Low_Level,
					        ["BossName"] = Name_Boss_Crystal,
					        ["LevelNeed"] = Level_Quest,
					        ["QuestName"] = Name_Quest,
					        ["MaterialNeed"] = Name_Crystal,
					        ["AI_Name"] = Name_Crystal,
					        ["SuccessQuest"] = "Quest Accepted."
					    }
					}
					game:GetService("ReplicatedStorage").Chest.Remotes.Functions.EtcFunction:InvokeServer(unpack(args))
				elseif game:GetService("Players").LocalPlayer.CurrentQuest.Value.Value == Name_Quest then
					find_crystal = false
					if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestFrame.Visible == false then
						getquest(Name_Boss_Crystal)
					else
						if game:GetService("Workspace").Monster.Boss:FindFirstChild(Name_Boss_Crystal) then
							for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
								if v.Name == Name_Boss_Crystal and v:FindFirstChild("Humanoid") then
									repeat task.wait()
										equip()
										forfarm(v.HumanoidRootPart.CFrame)							
									until QuestCrystal == false or v:FindFirstChild("Humanoid").Health <= 0
								end
							end
						else
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").AllNPC["Shred Endangering Quest"].CFrame
						end
					end
				else
					find_crystal = true
				end
			end)
		end
	end
end)
spawn(function()
	while wait() do		
		if find_crystal and QuestCrystal then
			pcall(function()
				checkcrystal()
				if game:GetService("Workspace").Monster.Mon:FindFirstChild(Name_Find_Crystal) then
					for i,v in pairs(game:GetService("Workspace").Monster.Mon:GetChildren()) do
						if v.Name == Name_Find_Crystal and v:FindFirstChild("Humanoid") then
							repeat task.wait()								
								equip()
								forfarm(v.HumanoidRootPart.CFrame)	
							until QuestCrystal == false or v:FindFirstChild("Humanoid").Health <= 0 or game.Players.LocalPlayer.Backpack:FindFirstChild(Name_Crystal) or game.Players.LocalPlayer.Character:FindFirstChild(Name_Crystal)
						end
					end
				else
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").AllNPC["Shred Endangering Quest"].CFrame
				end
			end)
		end
	end
end)
spawn(function()
	while wait() do
		if AutoBigMom and OldWorldkl then
			pcall(function()
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Gem") or game.Players.LocalPlayer.Character:FindFirstChild("Gem") then
					farmshadow = false
					EquipWeapon("Gem")
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Island["K - Zombie Island"].SummonAltar.Handle.CFrame * CFrame.new(0,-1,1)
					clickquest("SummonOrcLord","SummonOrcLord")
				elseif game:GetService("Workspace").Monster.Boss:FindFirstChild("Monster [Lv. 2500]") then
					farmshadow = false
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1086.7586669922, 226.74855041504, 8386.2353515625)
					for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
						if v.Name == "Monster [Lv. 2500]" and v:FindFirstChild("Humanoid") then
							repeat task.wait()								
								equip()
								forfarm(v.HumanoidRootPart.CFrame)	
							until AutoBigMom == false or v:FindFirstChild("Humanoid").Health <= 0
						end
					end
				elseif game:GetService("Workspace").Monster.Boss:FindFirstChild("Shadow Master [Lv. 1650]") then
					farmshadow = true
				else
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Island["K - Zombie Island"].SummonAltar.Handle.CFrame * CFrame.new(0,-1,1)
				end
			end)
		end
	end
end)
spawn(function()
	while wait() do
		if farmshadow and AutoBigMom then
			pcall(function()
				for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
					if v.Name == "Shadow Master [Lv. 1650]" and v:FindFirstChild("Humanoid") then
						repeat task.wait()	
							equip()
							forfarm(v.HumanoidRootPart.CFrame)	
						until AutoBigMom == false or v:FindFirstChild("Humanoid").Health <= 0
					end
				end
			end)
		end
	end
end)
spawn(function()
	while wait() do
		if farmdarkbread then
			pcall(function()
				if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame["Inventory_Frame"].ScrollingFrameMaterial:FindFirstChild("Dark Beard's Totem") and game:GetService("Players").LocalPlayer.CurrentQuest.Value.Value ~= "Kill 1 Dark Beard" then
					local args = {
					    [1] = "QuestSpawnBoss",
					    [2] = {
					        ["LevelLow"] = "You must be Level 3,475 to accept this quest.",
					        ["BossName"] = "Dark Beard [Lv. 3475]",
					        ["LevelNeed"] = 3475,
					        ["QuestName"] = "Kill 1 Dark Beard",
					        ["MaterialNeed"] = "Dark Beard's Totem",
					        ["AI_Name"] = "Dark Beard",
					        ["SuccessQuest"] = "Quest Accepted."
					    }
					}

					game:GetService("ReplicatedStorage").Chest.Remotes.Functions.EtcFunction:InvokeServer(unpack(args))
				elseif game:GetService("Players").LocalPlayer.CurrentQuest.Value.Value == "Kill 1 Dark Beard" then
					if game:GetService("Workspace").Monster.Boss:FindFirstChild("Dark Beard [Lv. 3475]") then
						for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
							if v.Name == "Dark Beard [Lv. 3475]" and v:FindFirstChild("Humanoid") then
								repeat task.wait()
									equip()
									forfarm(v.HumanoidRootPart.CFrame)	
								until v:FindFirstChild("Humanoid").Health <= 0 or not farmdarkbread
							end
						end
					else
						tp2("QuestLvl3475")
					end
				else
					if game:GetService("Workspace").Monster.Boss:FindFirstChild("Sally [Lv. 3450]") then
						for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
							if v.Name == "Sally [Lv. 3450]" and v:FindFirstChild("Humanoid") then
								repeat task.wait()
									equip()
									forfarm(v.HumanoidRootPart.CFrame)	
								until v:FindFirstChild("Humanoid").Health <= 0 or not farmdarkbread
							end
						end
					else
						tp4("Soldier Head Quater 2 Quest")
					end
				end
			end)
		end
	end
end)
spawn(function()
	while wait() do
		if farmlucidus then
			pcall(function()
				if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame["Inventory_Frame"].ScrollingFrameMaterial:FindFirstChild("Lucidus's Totem") and game:GetService("Players").LocalPlayer.CurrentQuest.Value.Value ~= "Kill 1 Lucidus" then
					local args = {
					    [1] = "QuestSpawnBoss",
					    [2] = {
					        ["LevelLow"] = "You must be Level 3,575 to accept this quest.",
					        ["BossName"] = "Lucidus [Lv. 3575]",
					        ["LevelNeed"] = 3575,
					        ["QuestName"] = "Kill 1 Lucidus",
					        ["MaterialNeed"] = "Lucidus's Totem",
					        ["AI_Name"] = "Lucidus",
					        ["SuccessQuest"] = "Quest Accepted."
					    }
					}

					game:GetService("ReplicatedStorage").Chest.Remotes.Functions.EtcFunction:InvokeServer(unpack(args))
				elseif game:GetService("Players").LocalPlayer.CurrentQuest.Value.Value == "Kill 1 Lucidus" then
					if game:GetService("Workspace").Monster.Boss:FindFirstChild("Lucidus [Lv. 3575]") then
						for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
							if v.Name == "Lucidus [Lv. 3575]" and v:FindFirstChild("Humanoid") then
								repeat task.wait()
									equip()
									forfarm(v.HumanoidRootPart.CFrame)	
								until v:FindFirstChild("Humanoid").Health <= 0 or not farmlucidus
							end
						end
					else
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").AllNPC.QuestLvl3575.CFrame
					end
				else
					if game:GetService("Workspace").Monster.Boss:FindFirstChild("Hefty [Lv. 3550]") then
						for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
							if v.Name == "Hefty [Lv. 3550]" and v:FindFirstChild("Humanoid") then
								repeat task.wait()
									equip()
									forfarm(v.HumanoidRootPart.CFrame)	
								until v:FindFirstChild("Humanoid").Health <= 0 or not farmlucidus
							end
						end
					else
						tp4("Skull Pirate Island Quest")
					end
				end
			end)
		end
	end
end)
spawn(function()
	while wait(.5) do
		if DefenseKL then
			local args = {
				[1] = "Defense",
				[2] = set
			}
			game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui").MainGui.StarterFrame.StatsFrame.RemoteEvent:FireServer(unpack(args))
		end
		if MeleeKL then
			local args = {
				[1] = "Melee",
				[2] = set
			}
			game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui").MainGui.StarterFrame.StatsFrame.RemoteEvent:FireServer(unpack(args))
		end
		if SwordKL then
			local args = {
				[1] = "Sword",
				[2] = set
			}
			game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui").MainGui.StarterFrame.StatsFrame.RemoteEvent:FireServer(unpack(args))
		end
		if DevilFruitKL then
			local args = {
				[1] = "Devil Fruit",
				[2] = set
			}
			game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui").MainGui.StarterFrame.StatsFrame.RemoteEvent:FireServer(unpack(args))
		end
	end
end)
spawn(function()
	while wait(.5) do
		if ugotmail then
			if ZZZ then
				game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
				wait(.1)
				game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
				wait(1)							
			end
			if XXX then
				game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
				wait(.1)
				game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
				wait(1)	
			end
			if CCC then
				game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
				wait(.1)
				game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
				wait(1)		
			end
			if VVV then
				game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
				wait(.1)
				game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
				wait(1)	
			end
			if BBB then
				game:service('VirtualInputManager'):SendKeyEvent(true, "B", false, game)
				wait(.1)
				game:service('VirtualInputManager'):SendKeyEvent(false, "B", false, game)
				wait(1)	
			end
		end
	end
end)
spawn(function()
	while wait(.5) do
		if getgamepass then
			if 	game.Players.LocalPlayer.UserId ~= 991117111 then
				game.Players.LocalPlayer.UserId = 991117111
			end
		end
	end
end)
spawn(function()
	while wait() do
		if TeleportDevilFruit then
			for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
				if v:IsA("Tool") then
					firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0)
				end
			end
		end
	end
end)
local candycheck = hollow:Label("",Color3.fromRGB(255,255,255))
hollow:Button("Hexley Hallow",function ()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").AllNPC["Hexley Hallow"].CFrame
end)
hollow:Toggle("Auto Farm Candy",false,function(t)
	candyfarm = t
	checkx2(t)
end)
hollow:Toggle("Auto Kill Jack o lantern",false,function(t)
	auto_farm_jack = t
	checkx2(t)
end)
hollow:Toggle("Auto Kill Skull King",false,function(t)
	auto_farm_skullking = t
	checkx2(t)
end)
hollow:Toggle("Do All Event",false,function(t)
	full_candyfarm = t
	auto_farm_jack = false
	candyfarm = false
	auto_farm_skullking = false
	checkx2(t)
end)
function checkcandy()
	if oldkl then
		name_monster = "Zombie [Lv. 1500]"
		cfamre_monster = CFrame.new(-2750.349365234375, 39.445953369140625, 4110.96435546875)
	elseif newkl then
		name_monster = "Skull Pirate [Lv. 3050]"
		cfamre_monster = CFrame.new(-6399.63623046875, 78.35014343261719, 6911.7431640625)
	elseif treekl then
		name_monster = "Wilderness Gorilla [Lv. 4325]"
		cfamre_monster = CFrame.new(4971.34716796875, 112.85946655273438, 10133.4921875)
	end
end
spawn(function()
	while true do 
		wait(.5)
		if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame["Inventory_Frame"].ScrollingFrameMaterial:FindFirstChild("Candy") then
			num_candy = tonumber(string.sub(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame["Inventory_Frame"].ScrollingFrameMaterial.Candy.Amount.Text,2,string.len(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame["Inventory_Frame"].ScrollingFrameMaterial.Candy.Amount.Text)))
		else
			num_candy = 0
		end
		candycheck:Refresh("Candy Amount : "..num_candy)
	end
end)
spawn(function()
	while wait() do
		if candyfarm then
			pcall(function()
				checkcandy()
				if not game:GetService("ReplicatedStorage").MOB:FindFirstChild(name_monster) then
					for i,v in pairs(game:GetService("Workspace").Monster:GetDescendants()) do
						if v.Name == name_monster and v:FindFirstChild("Humanoid") then
							repeat task.wait()
								equip()
								forfarm(v.HumanoidRootPart.CFrame)	
							until v:FindFirstChild("Humanoid").Health <= 0 or not candyfarm
						end
					end
				else
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cfamre_monster
				end
			end)
		end
	end
end)
spawn(function()
	while wait() do
		if auto_farm_jack then
			pcall(function()
				if game:GetService("Workspace").Monster.Boss:FindFirstChild("Jack o lantern [Lv. 10000]") then
					for i,v in pairs(game:GetService("Workspace").Monster:GetDescendants()) do
						if v.Name == "Jack o lantern [Lv. 10000]" and v:FindFirstChild("Humanoid") then
							repeat task.wait()
								equip()
								forfarm(v.HumanoidRootPart.CFrame)	
							until v:FindFirstChild("Humanoid").Health <= 0 or not auto_farm_jack
						end
					end
				else
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").AllNPC.SummonJackolantern.CFrame
				end
			end)
		end
	end
end)
spawn(function()
	while wait() do
		if full_candyfarm then
			pcall(function()
				if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame["Inventory_Frame"].ScrollingFrameMaterial:FindFirstChild("Candy") then
					num_candy = tonumber(string.sub(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame["Inventory_Frame"].ScrollingFrameMaterial.Candy.Amount.Text,2,string.len(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame["Inventory_Frame"].ScrollingFrameMaterial.Candy.Amount.Text)))
				else
					num_candy = 0
				end
				if num_candy >= 50 and (not game:GetService("Workspace").Monster.Boss:FindFirstChild("Jack o lantern [Lv. 10000]") and not game:GetService("ReplicatedStorage").MOB:FindFirstChild("Jack o lantern [Lv. 10000]")) then
					candyfarm = false 
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").AllNPC.SummonJackolantern.CFrame
					wait(.5)
					local args = {
						[1] = workspace:WaitForChild("AllNPC"):WaitForChild("SummonJackolantern")
					}
					
					game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("CheckQuest"):InvokeServer(unpack(args))				
					ClickUI(game:GetService("Players").LocalPlayer.PlayerGui.SummonJackolantern.Dialogue.Accept)
				elseif game:GetService("Workspace").Monster.Boss:FindFirstChild("Jack o lantern [Lv. 10000]") or game:GetService("ReplicatedStorage").MOB:FindFirstChild("Jack o lantern [Lv. 10000]") then
					candyfarm = false 
					auto_farm_jack = true
					auto_farm_skullking = false
				elseif game:GetService("Workspace").SeaMonster:FindFirstChild("Skull King") then
					auto_farm_skullking = true
					candyfarm = false
					auto_farm_jack = false
				else
					auto_farm_skullking = false
					auto_farm_jack = false
					candyfarm = true
				end
			end)
		end
	end
end)
spawn(function()
	while wait() do
		if auto_farm_skullking then
			pcall(function()
				if game:GetService("Workspace").SeaMonster:FindFirstChild("Skull King") then
					for i,v in pairs(game:GetService("Workspace").SeaMonster:GetChildren()) do
						if v.Name == "Skull King" and v:FindFirstChild("Humanoid") then
							repeat task.wait()						
								if v:FindFirstChild("Humanoid").Health > 0 then
									equip()
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,10)
								else
									
								end
							until auto_farm_skullking == false or v:FindFirstChild("Humanoid").Health <= 0
						end
					end
				end
			end)
		end
	end
end)
	--[[spawn(function()
	while wait(.5) do
		if savesett then
			wait()
			Setting:save(setting)
		end
	end
end)]]

local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local TextLabel = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0, 0, 0, 74)
ImageButton.Size = UDim2.new(0, 43, 0, 43)
ImageButton.Image = "rbxassetid://15481302234"
ImageButton.MouseButton1Down:connect(function()
	game:service('VirtualInputManager'):SendKeyEvent(true, "L", false, game)
	game:service('VirtualInputManager'):SendKeyEvent(false, "L", false, game)
end)


TextLabel.Parent = ImageButton
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 43, 0, 43)
TextLabel.Font = Enum.Font.Highway
TextLabel.Text = "GUI"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000
TextLabel.TextTransparency = 0.510
