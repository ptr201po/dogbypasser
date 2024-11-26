-- ptr201po  // 999

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local method = 1 -- 1 = legit 2 = unlegit
local tagFixMsg = "hihi123!&4"

local bypasses = {
    [1] = "what the fuck",
    [2] = "i fuck minors",
    [3] = "your script is shit",
    [4] = "im jerking off rn",
    [5] = "i hate gays",
    [6] = "fuck you",
    [7] = "pick some cotton blackass coon",
    [8] = "kill yourself"
}

local bypassesLegit = {
    [1] = "what the fâ€¢â€¢â€¢â€¢â€¢â€¢uâ€¢câ€¢kâ€¢",
    [2] = "i fâ€¢â€¢â€¢â€¢â€¢â€¢uâ€¢câ€¢kâ€¢ minors", 
    [3] = "your script is â€¢sâ€¢â€¢â€¢â€¢â€¢â€¢hâ€¢iâ€¢tâ€¢",
    [4] = "im â€¢jâ€¢eâ€¢râ€¢kâ€¢iâ€¢nâ€¢g off rn",
    [5] = "i hate gâ€¢â€¢â€¢â€¢â€¢â€¢aâ€¢yâ€¢s",
    [6] = "fâ€¢â€¢â€¢â€¢â€¢â€¢uâ€¢câ€¢kâ€¢ you",
    [7] = "â€¢pâ€¢iâ€¢câ€¢kâ€¢ some â€¢câ€¢oâ€¢tâ€¢tâ€¢oâ€¢nâ€¢ â€¢bâ€¢lâ€¢aâ€¢câ€¢kâ€¢aâ€¢sâ€¢sâ€¢ â€¢câ€¢oâ€¢oâ€¢nâ€¢",
    [8] = "â€¢kâ€¢iâ€¢lâ€¢lâ€¢ â€¢yâ€¢oâ€¢uâ€¢râ€¢sâ€¢eâ€¢lâ€¢fâ€¢"
}

local unlegitConversionTableUpper = {
    A = "Ạ", B = "Ḅ", C = "С", D = "Ḍ", E = "Ẹ",
    F = "F", G = "Ģ", H = "Ḥ", I = "Ị", J = "J",
    K = "Ḳ", L = "Ḷ", M = "Ṃ", N = "Ṇ", O = "Ọ",
    P = "Р", Q = "Q", R = "Ṛ", S = "Ṣ", T = "Ṭ",
    U = "Ụ", V = "Ṿ", W = "Ẉ", X = "Х", Y = "Ỵ", Z = "Ẓ"
}

local unlegitConversionTableLower = {
    a = "ạ", b = "ḅ", c = "с", d = "ḍ", e = "ẹ",
    f = "f", g = "ɡ", h = "ḥ", i = "ị", j = "ј",
    k = "ḳ", l = "ḷ", m = "ṃ", n = "ṇ", o = "ọ",
    p = "р", q = "q", r = "ṛ", s = "ṣ", t = "ṭ",
    u = "ụ", v = "ṿ", w = "ẉ", x = "х", y = "ỵ", z = "ẓ", ["|"] = "\r",
}


local function fixTagging()
    if game:GetService("TextChatService"):FindFirstChild("TextChannels") then
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(tagFixMsg)
    else
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tagFixMsg, "All")
    end
end


local function bypassPressed(number)
    local bypass = bypassesLegit[number]

    if method == 1 then
        if not bypass or bypass == "" then
        bypass = ">\b" .. bypass
    end

    local result = ""
    local insideReplacedWord = false

    -- Process each character
    for i = 1, #bypass do
        local char = bypass:sub(i, i)

        -- Skip characters inside curly braces and add them to the result
        if char == "{" then
            insideReplacedWord = true
        elseif char == "}" then
            insideReplacedWord = false
        elseif insideReplacedWord then
            result = result .. char
        elseif char == " " then
            result = result .. "\b"
        else
            -- Replace dot with a zero-width space (\u{200B})
            if char == "." then
                result = result .. "\u{200D}" .. "\u{200E}" .. "\u{200C}" .. "\u{2063}"
            else
                result = result .. char
            end
        end
    end

    -- Perform other replacements
    result = result:gsub("{", ""):gsub("}", "")
    result = result:gsub("â€¢", "\u{0327}")
    result = result:gsub("I", "â„¹")
    result = result:gsub("|", "\r")
    result = result:gsub("\u{0327}", "")

    -- Send the final result to the chat service
    if game:GetService("TextChatService"):FindFirstChild("TextChannels") then
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(result)
    else
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(result, "All")
    end
    else
        local text = bypasses[number]
        local convertedText = ""
        for char in text:gmatch(".") do
            local convertedChar = unlegitConversionTableUpper[char] or unlegitConversionTableLower[char] or char
            convertedText = convertedText .. convertedChar .. "̗"
        end
        if game:GetService("TextChatService"):FindFirstChild("TextChannels") then
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(convertedText)
        else
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(convertedText, "All")
        end
    end
end
    
        




local Window = Rayfield:CreateWindow({
   Name = "dogbypasser v1",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "loading dogbypasser v1",
   LoadingSubtitle = ".gg/dogbypasser",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "dogbypasser loader",
      Subtitle = ".gg/dogbypasser",
      Note = "get the key in the discord .gg/dogbypasser", -- Use this to tell the user how to get a key
      FileName = "dogbypasser", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/1BC7dbBt"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Main", 4483362458) -- Title, Image
local BypassesTab = Window:CreateTab("Bypasses", 4483362458) -- Title, Image

local MainParagraphOne = MainTab:CreateParagraph({Title = "Paragraph Example", Content = "Paragraph Example"})

local MethodDropdown = MainTab:CreateDropdown({
   Name = "Method",
   Options = {"Legit","Unlegit"},
   CurrentOption = {"Legit"},
   MultipleOptions = false,
   Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
            if Options[1] == "Legit" then
                method = 1
            else
                method = 2
            end
            print(method)
   end,
})

local FixTagging = MainTab:CreateButton({
   Name = "Fix Tagging",
   Callback = function()
            fixTagging()
   end,
})

local BypassButtonOne = BypassesTab:CreateButton({
   Name = "what the fuck",
   Callback = function()
            bypassPressed(1)
   end,
})

local BypassButtonTwo = BypassesTab:CreateButton({
   Name = "i fuck minors",
   Callback = function()
            bypassPressed(2)
   end,
})

local BypassButtonThree = BypassesTab:CreateButton({
   Name = "your script is shit",
   Callback = function()
            bypassPressed(3)
   end,
})

local BypassButtonFour = BypassesTab:CreateButton({
   Name = "im jerking off rn",
   Callback = function()
            bypassPressed(4)
   end,
})

local BypassButtonFive = BypassesTab:CreateButton({
   Name = "i hate gays",
   Callback = function()
            bypassPressed(5)
   end,
})

local BypassButtonSix = BypassesTab:CreateButton({
   Name = "fuck you",
   Callback = function()
            bypassPressed(6)
   end,
})

local BypassButtonSeven = BypassesTab:CreateButton({
   Name = "pick some cotton blackass coon",
   Callback = function()
            bypassPressed(7)
   end,
})

local BypassButtonEight = BypassesTab:CreateButton({
   Name = "kill yourself",
   Callback = function()
            bypassPressed(8)
   end,
})
