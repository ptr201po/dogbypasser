-- ptr201po // dogbypasser

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local textChatService = game:GetService('TextChatService')

local method = 1
local autoBypass = 1 -- 1 is no 2 is yes

local fixTaggingMessage = "Hi123hi345!@("



local function sendMessage(message)
    
end

local function fixTagging()
    if textChatService.ChatInputBarConfiguration.TargetTextChannel then
        textChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync(fixTaggingMessage)
    else
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(fixTaggingMessage, "All")
    end
end

local Window = Rayfield:CreateWindow({
   Name = "dog bypasser",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "dogbypasser v1",
   LoadingSubtitle = ".gg/dogbypasser",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "dogbypasser"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "dogbypasser loader",
      Subtitle = ".gg/dogbypasser",
      Note = "join the discord for key", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/1BC7dbBt"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("MainTab", 4483362458) -- Title, Image
local MainParagraphOne = MainTab:CreateParagraph({Title = "Paragraph Example", Content = "Paragraph Example"})


local Dropdown = MainTab:CreateDropdown({
   Name = "Method",
   Options = {"Test One","Test Two","Test Three"},
   CurrentOption = {"Test one"},
   MultipleOptions = false,
   Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
   -- The function that takes place when the selected option is changed
   -- The variable (Options) is a table of strings for the current selected options
   end,
})


local Toggle = MainTab:CreateToggle({
   Name = "Auto-Bypass",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
   end,
})


local Button = MainTab:CreateButton({
   Name = "Fix Tagging",
   Callback = function()
            fixTagging()
   end,
})
