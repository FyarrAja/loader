-- ============================================================
--   BlueHaven Hub  ~  Test UI Script (Full Components Showcase)
--   Execute ini di executor untuk preview & test semua komponen GUI:
--   - Static Text & Label
--   - Button
--   - Toggle (Standard & Note)
--   - Slider
--   - Dropdown & MultiDropdown
--   - Input Box
-- ============================================================

local player = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Smart loader: handle semua jenis executor + Anti-Cache
local _loadstring = rawloadstring or syn and syn.loadstring or clonefunction and clonefunction(loadstring) or loadstring

local function loadLibrary(url)
    local cacheBuster = (url:find("%?") and "&" or "?") .. "t=" .. tostring(tick()):gsub("%.", "")
    local finalUrl = url .. cacheBuster
    local content = nil

    local httpReq = (type(request) == "function" and request)
                 or (type(http_request) == "function" and http_request)
                 or (syn and type(syn.request) == "function" and syn.request)
                 or (http and type(http.request) == "function" and http.request)

    if httpReq then
        pcall(function()
            local res = httpReq({ Url = finalUrl, Method = "GET" })
            if res and res.Body and #res.Body > 100 then
                content = res.Body
            end
        end)
    end
    if not content and game.HttpGet then
        local ok, res = pcall(function() return game:HttpGet(finalUrl) end)
        if ok and res and #res > 100 then
            content = res
        end
    end
    if not content and game.HttpGet then
        content = game:HttpGet(url)
    end
    assert(content and #content > 100, "HttpGet gagal / file kosong")
    
    local chunk, err = _loadstring(content)
    if not chunk then
        local stripped = content:gsub("^#[^\n]*\n", ""):gsub("^\xef\xbb\xbf", "")
        chunk, err = _loadstring(stripped)
    end
    assert(chunk, "loadstring gagal: " .. tostring(err))
    
    local ok, step1 = pcall(chunk)
    assert(ok, "chunk() error: " .. tostring(step1))
    
    if type(step1) == "table" and type(step1.CreateWindow) == "function" then
        return step1
    elseif type(step1) == "function" then
        local ok2, step2 = pcall(step1, "CPC1:7qN4vK9mP2xR8sT5wY3aD6fH1jL0cB7eG4uZ9iM2")
        assert(ok2, "factory() error: " .. tostring(step2))
        assert(type(step2) == "table", "Library nil: " .. type(step2))
        return step2
    end
    error("chunk() returned: " .. type(step1))
end

-- ============================================================
--  FIGMA ASSET IDS (Blue Haven Hub)
-- ============================================================
-- 1. Mascot Kucing Tidur + Logo Bhv (Decal dari Figma)
_G.BH_CatMascotId = "rbxassetid://96054470467014"
-- 2. Canvas Background Texture (Di-nil agar tidak memakai decal lama rbxassetid://140268358133592 yang ada tulisan Nextora Assets)
_G.BH_CanvasAssetId = nil
-- 3. Tombol Close (Direct close button decal dari Figma)
_G.BH_CloseButtonId = "rbxassetid://121248223515226"
-- 4. Background Texture Close Button
_G.BH_CloseBgAssetId = "rbxassetid://101344938838576"
-- 5. Floating Mobile Mascot Toggle (Touch-Draggable icon untuk buka/tutup GUI di HP)
_G.BH_MobileToggle = true

-- Load BlueHaven library (commit c5f052d - Top-Center Capsule Pill & Full Framewisp Audio/Ripple/Spring FX)
local Library = loadLibrary(
    "https://raw.githubusercontent.com/FyarrAja/loader/c5f052d/library"
)

-- ============================================================
--  Inisialisasi Window
-- ============================================================

local BHHub = Library:CreateWindow({
    Name       = "BlueHaven Hub",
    DefaultTab = "Showcase",
})

local Window = BHHub:GetDefaultTab()

-- ============================================================
--  TAB 1 : Showcase (Tampilkan SEMUA Tipe Elemen / Komponen GUI)
-- ============================================================

-- 1. SECTION: Statik & Labels
local staticSection = Window:CreateSection({ Name = "1. Komponen Statik & Teks", Expanded = true })

staticSection:CreateText({
    Name = "Status Hub",
    Text = "BlueHaven v2.1 — Online & Siap Digunakan",
})

staticSection:CreateText({
    Name = "Info Versi",
    Text = "Theme: Deep Ocean Blue & Cyan Cyber Studs",
})

staticSection:CreateText({
    Name = "User Data",
    Text = "Nama: " .. player.Name .. " (UserId: " .. tostring(player.UserId) .. ")",
})

-- 2. SECTION: Tombol (Buttons)
local buttonSection = Window:CreateSection({ Name = "2. Komponen Tombol (Buttons)", Expanded = true })

buttonSection:CreateButton({
    Name = "Test Klik Button",
    Callback = function()
        print("[BlueHaven] Test button berhasil diklik!")
    end,
})

buttonSection:CreateButton({
    Name = "Cetak Info Player ke Console (F9)",
    Callback = function()
        print("=== [BlueHaven Hub] Info Player ===")
        print("Name     :", player.Name)
        print("UserId   :", player.UserId)
        print("PlaceId  :", game.PlaceId)
        print("JobId    :", game.JobId)
    end,
})

-- 3. SECTION: Toggles (Saklar)
local toggleSection = Window:CreateSection({ Name = "3. Komponen Toggle (Saklar)", Expanded = true })

toggleSection:CreateToggle({
    Name    = "Speed Boost (Normal Toggle)",
    Default = false,
    Callback = function(value)
        local char = player.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.WalkSpeed = value and 32 or 16
            end
        end
        print("[BlueHaven] Speed Boost:", value)
    end,
})

toggleSection:CreateToggle({
    Name    = "Auto Farm (Toggle dengan Note)",
    Note    = "Ini adalah fitur toggle dengan catatan/keterangan.",
    Default = true,
    Callback = function(value)
        print("[BlueHaven] Auto Farm:", value)
    end,
})

toggleSection:CreateToggle({
    Name    = "Infinite Jump",
    Default = false,
    Callback = function(value)
        if value then
            _G.BH_InfJump = UserInputService.JumpRequest:Connect(function()
                local char = player.Character
                if char then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
                end
            end)
        else
            if _G.BH_InfJump then
                _G.BH_InfJump:Disconnect()
                _G.BH_InfJump = nil
            end
        end
        print("[BlueHaven] Infinite Jump:", value)
    end,
})

-- 4. SECTION: Sliders (Penggeser)
local sliderSection = Window:CreateSection({ Name = "4. Komponen Slider", Expanded = true })

sliderSection:CreateSlider({
    Name    = "Walk Speed Slider",
    Min     = 16,
    Max     = 200,
    Default = 16,
    Callback = function(value)
        local char = player.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = value end
        end
        print("[BlueHaven] Walk Speed diubah ke:", value)
    end,
})

sliderSection:CreateSlider({
    Name    = "Jump Power Slider",
    Min     = 50,
    Max     = 300,
    Default = 50,
    Callback = function(value)
        local char = player.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.JumpPower = value end
        end
        print("[BlueHaven] Jump Power diubah ke:", value)
    end,
})

sliderSection:CreateSlider({
    Name    = "Field of View (Kamera FOV)",
    Min     = 60,
    Max     = 120,
    Default = 70,
    Callback = function(value)
        workspace.CurrentCamera.FieldOfView = value
        print("[BlueHaven] FOV diubah ke:", value)
    end,
})

-- 5. SECTION: Dropdowns (Menu Pilihan)
local dropdownSection = Window:CreateSection({ Name = "5. Komponen Dropdown", Expanded = true })

dropdownSection:CreateDropdown({
    Name    = "Pilihan Single Dropdown",
    Options = { "Pilihan Pertama", "Pilihan Kedua", "Pilihan Ketiga", "Mode Stealth" },
    Default = "Pilihan Pertama",
    Callback = function(value)
        print("[BlueHaven] Single Dropdown terpilih:", value)
    end,
})

dropdownSection:CreateMultiDropdown({
    Name    = "Pilihan Multi Dropdown",
    Note    = "Bisa pilih lebih dari satu item",
    Options = { "Player ESP", "Tracers", "Box ESP", "Health Bar", "Distance" },
    Default = { "Player ESP", "Distance" },
    Callback = function(selected)
        print("[BlueHaven] Multi Dropdown terpilih:", table.concat(selected, ", "))
    end,
})

-- 6. SECTION: Input Teks (Text Box)
local inputSection = Window:CreateSection({ Name = "6. Komponen Input Teks", Expanded = true })

inputSection:CreateInput({
    Name        = "Target Player Username",
    Placeholder = "Ketik username player...",
    Default     = "",
    MaxLength   = 50,
    Callback    = function(value)
        print("[BlueHaven] Target input:", value)
    end,
})

inputSection:CreateInput({
    Name        = "Custom Speed Angka",
    Placeholder = "Ketik angka (misal: 64)...",
    Default     = "",
    MaxLength   = 10,
    Callback    = function(value)
        local num = tonumber(value)
        if num and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = num
        end
        print("[BlueHaven] Custom speed:", value)
    end,
})

-- ============================================================
--  TAB 2 : Fitur Player & Gerakan
-- ============================================================

local playerTab = BHHub:CreateTab({ Name = "Player" })

local moveSection = playerTab:CreateSection({ Name = "Pergerakan", Expanded = true })

moveSection:CreateToggle({
    Name    = "No Clip (Tembus Tembok)",
    Default = false,
    Callback = function(value)
        _G.BH_NoClip = value
        if value then
            _G.BH_NoClipConn = RunService.Stepped:Connect(function()
                local char = player.Character
                if char and _G.BH_NoClip then
                    for _, part in ipairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            if _G.BH_NoClipConn then
                _G.BH_NoClipConn:Disconnect()
                _G.BH_NoClipConn = nil
            end
        end
    end,
})

moveSection:CreateButton({
    Name    = "Respawn Character",
    Callback = function()
        local char = player.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum:ChangeState(Enum.HumanoidStateType.Dead) end
        end
    end,
})

-- ============================================================
--  TAB 3 : Visual & Pengaturan
-- ============================================================

local miscTab = BHHub:CreateTab({ Name = "Misc" })

local utilSection = miscTab:CreateSection({ Name = "Utilitas", Expanded = true })

utilSection:CreateButton({
    Name    = "Copy JobId Server",
    Callback = function()
        if setclipboard then
            setclipboard(tostring(game.JobId))
            print("[BlueHaven] JobId disalin!")
        end
    end,
})

utilSection:CreateButton({
    Name    = "Rejoin Server Ini",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, player)
    end,
})

-- TAB: Farm
local farmTab = BHHub:CreateTab({ Name = "Farm" })
local farmSec = farmTab:CreateSection({ Name = "Auto Farm Options", Expanded = true })
farmSec:CreateToggle({ Name = "Auto Farm Mobs", Default = false, Callback = function(v) print("Auto Farm:", v) end })
farmSec:CreateDropdown({ Name = "Farm Mode", Options = { "Fast Attack", "Safe Distance", "Instant Kill" }, Default = "Fast Attack", Callback = function(v) print("Farm Mode:", v) end })

-- TAB: Predictor
local predictorTab = BHHub:CreateTab({ Name = "Predictor" })
local predSec = predictorTab:CreateSection({ Name = "Prediction Settings", Expanded = true })
predSec:CreateToggle({ Name = "Enable Predictor ESP", Default = true, Callback = function(v) print("Predictor:", v) end })

-- TAB: Progress
local progressTab = BHHub:CreateTab({ Name = "Progress" })
local progSec = progressTab:CreateSection({ Name = "Player Progress Stats", Expanded = true })
progSec:CreateText({ Name = "Level Status", Text = "Level: 2550 (MAX)" })
progSec:CreateText({ Name = "Rank", Text = "Rank: Master Warrior" })

-- TAB: Server
local serverTab = BHHub:CreateTab({ Name = "Server" })
local srvSec = serverTab:CreateSection({ Name = "Server Management", Expanded = true })
srvSec:CreateButton({ Name = "Server Hop", Callback = function() print("Server hopping...") end })
srvSec:CreateButton({ Name = "Rejoin Current Server", Callback = function() print("Rejoining...") end })

-- TAB: Auto Hop
local hopTab = BHHub:CreateTab({ Name = "Auto Hop" })
local hopSec = hopTab:CreateSection({ Name = "Auto Hop Settings", Expanded = true })
hopSec:CreateToggle({ Name = "Hop On Staff/Admin Join", Default = true, Callback = function(v) print("Hop on staff:", v) end })

-- TAB: Discord
local discordTab = BHHub:CreateTab({ Name = "Discord" })
local discSec = discordTab:CreateSection({ Name = "Community Server", Expanded = true })
discSec:CreateButton({ Name = "Copy Discord Invite Link", Callback = function() if setclipboard then setclipboard("https://discord.gg/bluehaven") end end })

-- TAB: Quick & Keys
local keysTab = BHHub:CreateTab({ Name = "Quick & Keys" })
local keysSec = keysTab:CreateSection({ Name = "Keybindings", Expanded = true })
keysSec:CreateText({ Name = "Menu Toggle Key", Text = "Press RightControl to Toggle GUI" })

-- TAB: Settings
local settingsTab = BHHub:CreateTab({ Name = "Settings" })
local setSec = settingsTab:CreateSection({ Name = "GUI Settings", Expanded = true })
setSec:CreateToggle({ Name = "RGB Glow Effect", Default = true, Callback = function(v) print("RGB:", v) end })
setSec:CreateToggle({ Name = "Watermark", Default = true, Callback = function(v) print("Watermark:", v) end })

-- TAB: Config
local configTab = BHHub:CreateTab({ Name = "Config" })
local cfgSec = configTab:CreateSection({ Name = "Config Manager", Expanded = true })
cfgSec:CreateDropdown({ Name = "Select Config", Options = { "Default", "Legit", "Rage", "PvP" }, Default = "Default", Callback = function(v) print("Config:", v) end })
cfgSec:CreateButton({ Name = "Save Current Config", Callback = function() print("Config saved!") end })
cfgSec:CreateButton({ Name = "Load Selected Config", Callback = function() print("Config loaded!") end })

-- ============================================================
--  Finalize  (WAJIB dipanggil paling terakhir)
--  Fix parameter: Window = BHHub (bukan BHHub.Window)
-- ============================================================

pcall(function()
    if Library and type(Library.Finalize) == "function" then
        Library:Finalize({
            Window      = BHHub,
            MainTab     = Window,
            ShowMainTab = true,
        })
    end
end)

-- Pastikan Tab Showcase terpilih dan seluruh section ter-render
pcall(function()
    if BHHub and type(BHHub.Select) == "function" then
        BHHub:Select(Window)
    elseif Window and type(Window.Select) == "function" then
        Window:Select()
    end
end)

