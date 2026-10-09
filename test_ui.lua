


local func1, obj1, obj2, defaultTab, Players, RunService, ReplicatedStorage, CoreGui, UserInputService, localPlayer
local networking, func2, tbl1, value1, func3, func4, list1, func5, func6, tbl2
local str1, func7, list2, flag1, value2, espSection, flag2, n, tbl3, tbl4
local tbl5, tbl6, value3, sequence, tbl7

do
	local CollectionService, ProximityPromptService, obj3, obj4, flag3, list3, tbl8, n2, n3, n4
	local tbl9, str2, tbl10, tbl11, tbl12, tbl13, tbl14, tbl15, value4, value5
	local value6, createText, flag4, value7, flag5, tbl16, n5, tbl17, flag6, n6
	local tbl18, func8, func9, func10

	do
		local obj5, obj6, obj7, obj8, obj9, n7

		do
			func1 = function(param1)
				local genv = typeof(getgenv) == "function" and getgenv() or _G

				if type(genv.ChilliDebugPrint) == "function" then
					pcall(genv.ChilliDebugPrint, param1)
				end
			end

			_G.BH_CatMascotId = _G.BH_CatMascotId or nil
			_G.BH_LoadingIconId = _G.BH_LoadingIconId or nil
			_G.BH_GoodbyeIconId = _G.BH_GoodbyeIconId or nil
			_G.BH_CanvasAssetId = _G.BH_CanvasAssetId or nil
			_G.BH_CloseButtonId = _G.BH_CloseButtonId or nil
			_G.BH_HeaderStripId = _G.BH_HeaderStripId or nil
			_G.BH_MobileToggle = _G.BH_MobileToggle or nil
			if _G.BH_LoadingScreen == nil then _G.BH_LoadingScreen = true end
			if _G.BH_LoadingDelay == nil then _G.BH_LoadingDelay = 0.15 end
			if _G.BH_ShowNotification == nil then _G.BH_ShowNotification = true end

			local function func11()
				local function func13()
					local chilliHubSaeCleanup = (typeof(getgenv) == "function" and getgenv() or _G).ChilliHubSaeCleanup
					if type(chilliHubSaeCleanup) == "function" then
						pcall(chilliHubSaeCleanup)
					end

					local tbl19 = { game:GetService("CoreGui") }
				if typeof(gethui) == "function" then
						local ok, result = pcall(gethui)
						if ok and typeof(result) == "Instance" then
							table.insert(tbl19, result)
						end
					end

					local byName = {
						Settings = true,
						ChilliLeftCenter = true,
						ChilliLibrarySettings = true,
						ChilliLibraryLauncher = true,
					}

					for _, item2 in ipairs(tbl19) do
						for _, child in ipairs(item2:GetChildren()) do
							if child:IsA("ScreenGui") and (child:GetAttribute("ChilliLibraryOwned") == true or byName[child.Name]) then
								pcall(function()
									child:Destroy()
								end)
							end
						end
					end
				end

				pcall(func13)

				local _loadstring = rawloadstring or (syn and syn.loadstring) or (clonefunction and clonefunction(loadstring)) or loadstring
				local url = "https://raw.githubusercontent.com/FyarrAja/loader/3e700f8/library"
				local cacheBuster = (url:find("%?") and "&" or "?") .. "t=" .. tostring(tick()):gsub("%.", "")
				local finalUrl = url .. cacheBuster
				local content = nil

				local httpReq = (type(request) == "function" and request)
					or (type(http_request) == "function" and http_request)
					or (syn and type(syn.request) == "function" and syn.request)
					or (http and type(http.request) == "function" and http.request)

				if not content and httpReq then
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
				assert(content and #content > 100, "BlueHaven Library failed to load")

				local chunk, err = _loadstring(content)
				if not chunk then
					local stripped = content:gsub("^#[^\n]*\n", ""):gsub("^\xef\xbb\xbf", "")
					chunk, err = _loadstring(stripped)
				end
				assert(chunk, "loadstring error: " .. tostring(err))

				local ok, step1 = pcall(chunk)
				assert(ok, "chunk() error: " .. tostring(step1))

				if type(step1) == "table" and type(step1.CreateWindow) == "function" then
					return step1
				elseif type(step1) == "function" then
					local ok2, step2 = pcall(step1, "CPC1:7qN4vK9mP2xR8sT5wY3aD6fH1jL0cB7eG4uZ9iM2")
					assert(ok2 and type(step2) == "table", "factory() error: " .. tostring(step2))
					return step2
				end
				error("Invalid BlueHaven Library return type: " .. type(step1))
			end

			obj1 = func11()
			assert(type(obj1) == "table" and type(obj1.CreateWindow) == "function" and type(obj1.Finalize) == "function", "BlueHaven Library returned an invalid API.")

			obj1.ManualQuickDefaults = {
				PinnedFeatures = { "Combat & Move > Speed & Mobility > Speed Boost", "Combat & Move > Speed & Mobility > Boost Speed" },
				Keybinds = { ["Combat & Move > Speed & Mobility > Speed Boost"] = "Q" },
				PinGroups = {},
				LeftCenterHidden = true,
			}

			obj2 = obj1:CreateWindow({ Name = "BlueHaven Hub", DefaultTab = "Main Farm" })
			defaultTab = obj2:GetDefaultTab()
			Players = game:GetService("Players")
			RunService = game:GetService("RunService")
			ReplicatedStorage = game:GetService("ReplicatedStorage")
			CoreGui = game:GetService("CoreGui")
			UserInputService = game:GetService("UserInputService")
			CollectionService = game:GetService("CollectionService")
			game:GetService("LocalizationService")
			ProximityPromptService = game:GetService("ProximityPromptService")
			localPlayer = Players.LocalPlayer
			do
				local pkg = ReplicatedStorage:FindFirstChild("Packages") or ReplicatedStorage:WaitForChild("Packages", 1.0)
				networking = (pkg and (pkg:FindFirstChild("Networking") or pkg:WaitForChild("Networking", 1.0))) or Instance.new("Folder")
			end

			func2 = function(callback1)
				local ok, result = pcall(function()
					return require(callback1())
				end)

				return ok and result or nil
			end

			tbl1 = {
				EggState = func2(function()
					return ReplicatedStorage.Client.EggState
				end),
				AreaEggs = func2(function()
					return ReplicatedStorage.Shared.Types.AreaEggs
				end),
				ToolGameplayGuard = func2(function()
					return ReplicatedStorage.Client.ToolGameplayGuard
				end),
				Assets = func2(function()
					return ReplicatedStorage.Data.Assets
				end),
				Guards = func2(function()
					return ReplicatedStorage.Data.Guards
				end),
				EggRecords = func2(function()
					return ReplicatedStorage.Shared.Util.EggRecords
				end),
				Mutations = func2(function()
					return ReplicatedStorage.Shared.Modules.Mutations
				end),
				Save = func2(function()
					return ReplicatedStorage.Shared.Save
				end),
				FuseKernel = func2(function()
					return ReplicatedStorage.Shared.Util.FuseKernel
				end),
				AreaEggCycle = func2(function()
					return ReplicatedStorage.Shared.Util.AreaEggCycle
				end),
				AreaEggResetWall = func2(function()
					return ReplicatedStorage.Client.AreaEggResetWall
				end),
				AreaEggResetCycle = func2(function()
					return ReplicatedStorage.Data.AreaEggResetCycle
				end),
				Gears = func2(function()
					return ReplicatedStorage.Data.Gears
				end),
				Areas = func2(function()
					return ReplicatedStorage.Data.Areas
				end),
				LimitedEgg = func2(function()
					return ReplicatedStorage.Data.LimitedEgg
				end),
				BrainrotEgg = func2(function()
					return ReplicatedStorage.Data.BrainrotEgg
				end),
				MonsterEgg = func2(function()
					return ReplicatedStorage.Data.MonsterEgg
				end),
			}

			local save = tbl1.Save

			if type(save) == "table" and (type(save.Get) ~= "function" or type(save.FieldSignal) ~= "function") then
				tbl1.Save = setmetatable({
					Get = type(save.Get) == "function" and save.Get or save.Peek,
					FieldSignal = type(save.FieldSignal) == "function" and save.FieldSignal or save.Watch,
				}, { __index = save })
			end

			local function func15()
				if typeof(gethui) == "function" then
					local ok, result = pcall(gethui)
					if ok and typeof(result) == "Instance" then
						return result
					end
				end

				return CoreGui
			end

			value1 = func15()

			do
				local obj10 = Random.new()
				local str3 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

				func3 = function()
					local value9 = obj10:NextInteger(12, 20)
					local arr2 = table.create(value9)

					for i = 1, value9 do
						local value10 = obj10:NextInteger(1, #str3)
						arr2[i] = string.sub("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", value10, value10)
					end

					return table.concat(arr2)
				end
			end

			do
				local tbl20 = {}

				func4 = function(param2)
					table.insert(tbl20, param2)
				end

				list1 = {}

				func5 = function(obj11, param3)
					local n8 = 1000
					local n9 = 3
					local n10 = 12

					local function func16(num1)
						if num1 <= 0 then
							return 0
						end
						local n11 = 10 ^ (math.floor(math.log10(num1)) - 2)
						return math.floor(num1 / n11 + 0.5) * n11
					end

					local function func17(param4)
						local n11 = math.clamp(tonumber(param4) or 0, 0, 1000)
						if n11 <= 0 then
							return 0
						end
						return func16(10 ^ (n9 + (n10 - n9) * n11 / n8))
					end

					local function stepOf(param5)
						local n11 = tonumber(param5) or 0
						if n11 <= 0 then
							return 0
						end
						return math.clamp(math.floor((math.log10(n11) - n9) / (n10 - n9) * n8 * 100 + 0.5) / 100, 0, 1000)
					end

					local function func18(param6)
						local formatted = string.format(param6 >= 100 and "%.0f" or param6 >= 10 and "%.1f" or "%.2f", param6)

						if string.find(formatted, ".", 1, true) then
							formatted = string.gsub(string.gsub(formatted, "0+$", ""), "%.$", "")
						end

						return formatted
					end

					local function valueFormat(param7)
						local num2 = func17(param7)
						if num2 <= 0 then
							return "Off"
						end

						if num2 < 1000000 then
							return func18(num2 / 1000) .. " K/s"
						end

						if num2 < 1e9 then
							return func18(num2 / 1000000) .. " M/s"
						end
						return func18(num2 / 1e9) .. " B/s"
					end

					local function func19(param8)
						local num3 = func17(param8)
						if num3 <= 0 then
							return "0"
						end

						if num3 < 1000000 then
							return func18(num3 / 1000) .. "k"
						end
						return (string.gsub(string.gsub(string.format("%.3f", num3 / 1000000), "0+$", ""), "%.$", ""))
					end

					local tbl21 = { k = 1000, m = 1000000, b = 1e9, t = 1e12 }

					local function valueParse(flag7)
						local cleaned = string.gsub(string.lower(string.gsub(tostring(flag7 or ""), "[%s,/]", "")), "s$", "")
						if cleaned == "" or cleaned == "off" then
							return 0
						end
						local value11, value12 = string.match(cleaned, "^([%d%.]+)([kmbt]?)$")
						local num4 = tonumber(value11)
						if not num4 then
							return nil
						end
						return stepOf(num4 * (tbl21[value12] or 1000000))
					end

					local value13 = obj11:CreateSlider({
						Name = param3.Name,
						Note = param3.Note,
						SubOf = param3.SubOf,
						Min = 0,
						Max = n8,
						Default = stepOf(param3.Default or 0),
						AllowDecimals = true,
						Increment = 0.01,
						ValueFormat = valueFormat,
						ValueParse = valueParse,
						Callback = function(value)
							if type(param3.OnRaw) == "function" then
								param3.OnRaw(func17(value))
							end
						end,
					})

					local obj12 = type(value13) == "table" and rawget(value13, "Instance") or nil

					if typeof(obj12) == "Instance" then
						for _, descendant in ipairs(obj12:GetDescendants()) do
							if descendant:IsA("TextBox") then
								local connection = descendant.Focused:Connect(function()
									task.defer(function()
										if descendant:IsFocused() then
											local ok, result = pcall(value13.Get, value13)
											descendant.Text = func19(ok and result or 0)
											descendant.CursorPosition = #descendant.Text + 1
											descendant.SelectionStart = 1
										end
									end)
								end)

								func4(function()
									pcall(function()
										connection:Disconnect()
									end)
								end)
							end
						end
					end

					if type(param3.Legacy) == "string" and type(param3.SectionName) == "string" then
						table.insert(list1, { Handle = value13, Name = param3.Name, Legacy = param3.Legacy, Section = param3.SectionName, StepOf = stepOf })
					end

					return value13
				end

				local text = "All"

				func6 = function(param9)
					if type(param9) ~= "table" then
						return param9
					end
					local instance2 = rawget(param9, "Instance")
					if typeof(instance2) ~= "Instance" then
						return param9
					end
					local flag8 = false

					local function func20(param10)
						if flag8 then
							return
						end

						if param10.Text == "None" then
							flag8 = true
							param10.Text = text
							flag8 = false
						end
					end

					local function func21(descendant)
						if not descendant:IsA("TextLabel") or descendant.Name ~= "Value" then
							return
						end
						func20(descendant)

						local connection = descendant:GetPropertyChangedSignal("Text"):Connect(function()
							func20(descendant)
						end)

						func4(function()
							pcall(function()
								connection:Disconnect()
							end)
						end)
					end

					for _, descendant in ipairs(instance2:GetDescendants()) do
						func21(descendant)
					end

					local connection = instance2.DescendantAdded:Connect(func21)

					func4(function()
						pcall(function()
							connection:Disconnect()
						end)
					end)

					return param9
				end

				local genv = typeof(getgenv) == "function" and getgenv() or _G
				local chilliHubSaeCleanup = genv.ChilliHubSaeCleanup

				if type(chilliHubSaeCleanup) == "function" then
					pcall(chilliHubSaeCleanup)
				end

				genv.ChilliHubSaeCleanup = function()
					for i = #tbl20, 1, -1 do
						pcall(tbl20[i])
					end

					table.clear(tbl20)
				end
			end

			do
				local n8 = 0
				local value14 = nil

				value14 = function(list4, flag9)
					local n9 = flag9 or 0

					if type(list4) == "table" then
						if n9 > 3 then
							return
						end
						local n10 = 0

						for k, value15 in pairs(list4) do
							n10 += 1

							if not (n10 > 20) then
								value14(k, n9 + 1)
								value14(value15, n9 + 1)
								continue
							end

							break
						end
					elseif typeof(list4) == "Instance" then
						pcall(list4.GetFullName, list4)
					else
						n8 += #tostring(list4)
					end
				end

				local list5 = {}

				local function func22(param11)
					list5[#list5 + 1] = param11
				end

				local function func23()
					for _, item3 in ipairs(list5) do
						pcall(function()
							item3:Disconnect()
						end)
					end

					table.clear(list5)
				end

				local function chilliToolKeeper()
					func23()

					for _, item4 in ipairs({
						"RE/GearSatchel/Lost",
						"RE/GearSatchel/Gained",
						"RE/RigSync/ProbeSatchel",
						"RE/RigSync/SeedSatchel",
						"RE/RigSync/CorrectionBegan",
						"RE/RigSync/Refresh",
						"RE/ToolTrigger/Trigger",
						"RE/BatSwing/Trigger",
					}) do
						local obj13 = networking:FindFirstChild(item4)

						if obj13 and obj13:IsA("RemoteEvent") then
							func22(obj13.OnClientEvent:Connect(function(...)
								value14({ ... })
							end))
						end
					end

					local function func24(flag10)
						if not flag10 then
							return
						end

						func22(flag10.ChildRemoved:Connect(function(child)
							if child:IsA("Tool") then
								value14({ child.Name, child.Parent })
							end
						end))

						func22(flag10.ChildAdded:Connect(function(child)
							if child:IsA("Tool") then
								value14({ child.Name })
							end
						end))
					end

					func24(localPlayer:FindFirstChildOfClass("Backpack"))

					func22(localPlayer.ChildAdded:Connect(function(child)
						if child:IsA("Backpack") then
							func24(child)
						end
					end))

					task.spawn(function()
						pcall(function()
							local value16 = tbl1.Save.Get()
							value14({ value16.GearInventory, value16.Inventory }, 2)
						end)

						-- Startup full getgc(false) scan removed to prevent heavy GC frame spikes
					end)
				end
				;(typeof(getgenv) == "function" and getgenv() or _G).ChilliToolKeeper = chilliToolKeeper
				task.defer(chilliToolKeeper)
				func4(func23)
			end

			do
				local n8 = 0.35
				local n9 = 5
				local tbl22 = {}
				local rrIdx = 1

				tbl2 = {
					Add = function(param12)
						local stagger = (#tbl22 % 10) * 0.035
						local tbl23 = { Run = param12, Gap = n8 - stagger, Idle = n9 - stagger * 8, Repeat = false, Hold = 0, Woken = true }
						table.insert(tbl22, tbl23)
						return tbl23
					end,
					Wake = function()
						for _, w in ipairs(tbl22) do
							w.Woken = true
						end
					end,
					Backoff = function(param13, param14)
						if param13 then
							param13.Hold = tonumber(param14) or 6
						end
					end,
				}

				local connection = RunService.Heartbeat:Connect(function(deltaTime)
					local count = #tbl22
					if count == 0 then return end
					for i = 1, count do
						local item6 = tbl22[i]
						item6.Gap = item6.Gap + deltaTime
						item6.Idle = item6.Idle + deltaTime
						if item6.Hold > 0 then
							item6.Hold = item6.Hold - deltaTime
						end
					end

					local ranThisFrame = 0
					for step = 1, count do
						if ranThisFrame >= 2 then break end
						if rrIdx > count then rrIdx = 1 end
						local item6 = tbl22[rrIdx]
						rrIdx = rrIdx + 1

						if item6.Hold <= 0 and item6.Gap >= n8 then
							if item6.Woken or item6.Repeat or item6.Idle >= n9 then
								item6.Woken = false
								item6.Gap = 0
								item6.Idle = 0
								ranThisFrame = ranThisFrame + 1
								local ok, result = pcall(item6.Run, item6)
								item6.Repeat = ok and result == true
							end
						end
					end
				end)

				func4(function()
					connection:Disconnect()
				end)
			end

			local obj14
			do
				-- BlueHaven Hub Custom Tab & Section Architecture (Distinct from Chilli Hub)
				-- Tab 1: Main Farm (DefaultTab) -> Stealing, Base Placement, Treadmill & Base Upgrades
				obj14 = defaultTab:CreateSection({ Name = "Auto Steal & Carry", Expanded = true })
				obj5 = defaultTab:CreateSection({ Name = "Base Egg Placement", Expanded = true })
				obj6 = defaultTab:CreateSection({ Name = "Treadmill Runner", Expanded = false })
				local progSec = defaultTab:CreateSection({ Name = "Base & Trail Upgrades", Expanded = false })

				-- Tab 2: Hatch & Pets -> Egg Hatching, Pet Protection (Favorite), Fuse Machine, and Separate Pet/Egg/Lab Selling
				local hatchPetsTab = obj2:CreateTab({ Name = "Hatch & Pets", SectionsExpanded = true })
				obj7 = hatchPetsTab:CreateSection({ Name = "Egg Hatcher & Best Equip", Expanded = true })
				obj4 = hatchPetsTab:CreateSection({ Name = "Smart Pet Favorite", Expanded = false })
				obj9 = hatchPetsTab:CreateSection({ Name = "Pet Fuse Machine", Expanded = false })
				local sellPetSec = hatchPetsTab:CreateSection({ Name = "Auto Sell Pets", Expanded = false })
				local sellEggSec = hatchPetsTab:CreateSection({ Name = "Auto Sell Eggs", Expanded = false })
				local sellLabSec = hatchPetsTab:CreateSection({ Name = "Auto Sell Lab Eggs", Expanded = false })
				obj8 = sellPetSec

				-- Tab 3: Lab & Boss -> Dedicated Event Tab with Mech Boss Arena, Dr. Scramble Lab, Butterfly Bloom & Wisp Quest
				local labBossTab = obj2:CreateTab({ Name = "Lab & Boss", SectionsExpanded = true })
				local mechBossSec = labBossTab:CreateSection({ Name = "Mech Boss Arena", Expanded = true })
				obj3 = labBossTab:CreateSection({ Name = "Dr. Scramble Lab & Shop", Expanded = true })
				local butterflySec = labBossTab:CreateSection({ Name = "Butterfly Bloom & Essence", Expanded = true })
				local wispSec = labBossTab:CreateSection({ Name = "Wisp & Banjo Quest", Expanded = true })

				-- Tab 4: Combat & Move -> Combat First, then Speed & Mobility, then Character Protection
				local combatMoveTab = obj2:CreateTab({ Name = "Combat & Move", SectionsExpanded = true })
				local combatSec = combatMoveTab:CreateSection({ Name = "Combat & Hit Target", Expanded = true })
				local moveSec = combatMoveTab:CreateSection({ Name = "Speed & Mobility", Expanded = true })
				local charSec = combatMoveTab:CreateSection({ Name = "Character Protection", Expanded = true })

				-- Tab 5: ESP & Predictor -> Split Egg ESP & Entity ESP + Egg/Lab/Fuse Predictors
				local espPredTab = obj2:CreateTab({ Name = "ESP & Predictor", SectionsExpanded = true })
				local eggEspSec = espPredTab:CreateSection({ Name = "Egg ESP & Filter", Expanded = true })
				local entityEspSec = espPredTab:CreateSection({ Name = "Player, Guard & Part ESP", Expanded = true })
				local eggPredSec = espPredTab:CreateSection({ Name = "Egg Spawn Predictor", Expanded = true })
				local labPredSec = espPredTab:CreateSection({ Name = "Lab Recipe Predictor", Expanded = false })
				local fusePredSec = espPredTab:CreateSection({ Name = "Fuse Outcome Predictor", Expanded = false })

				-- Tab 6: Webhook & Misc -> Discord Webhook Notifier, AFK/HUD Utility, and FPS Optimizer
				local webhookMiscTab = obj2:CreateTab({ Name = "Webhook & Misc", SectionsExpanded = true })
				local webhookSec = webhookMiscTab:CreateSection({ Name = "Discord Webhook Notifier", Expanded = true })
				local utilSec = webhookMiscTab:CreateSection({ Name = "AFK & Farm HUD Utility", Expanded = true })
				local perfSec = webhookMiscTab:CreateSection({ Name = "FPS & Graphics Optimizer", Expanded = true })

				-- Tab 7: Server -> Egg Finder Auto Hop, Server Hop & Job ID Joiner
				local serverTab = obj2:CreateTab({ Name = "Server", SectionsExpanded = true })
				local eggFinderSec = serverTab:CreateSection({ Name = "Egg Finder & Auto Hop", Expanded = true })
				local serverHopSec = serverTab:CreateSection({ Name = "Server Hop & Auto Load", Expanded = true })
				local jobIdSec = serverTab:CreateSection({ Name = "Job ID & Rejoin", Expanded = true })

				-- Tab 8: Community -> BlueHaven Hub Community
				local commTab = obj2:CreateTab({ Name = "Community", Side = "Right", SectionsExpanded = true })
				local commSec = commTab:CreateSection({ Name = "BlueHaven Community", Expanded = true })

				obj2._bhLayout = {
					SellPet = sellPetSec,
					SellEgg = sellEggSec,
					SellLab = sellLabSec,
					MechBoss = mechBossSec,
					Butterfly = butterflySec,
					Wisp = wispSec,
					Combat = combatSec,
					Movement = moveSec,
					Character = charSec,
					EggEsp = eggEspSec,
					EntityEsp = entityEspSec,
					EggPred = eggPredSec,
					LabPred = labPredSec,
					FusePred = fusePredSec,
					Webhook = webhookSec,
					Progress = progSec,
					Utility = utilSec,
					Performance = perfSec,
					EggFinder = eggFinderSec,
					ServerHop = serverHopSec,
					JobId = jobIdSec,
					Community = commSec,
					PredictorTab = espPredTab,
					MiscTab = webhookMiscTab,
				}
			end
			flag3 = { Paused = false }

			do
				local n8 = 0.5
				local value17 = nil
				local value18 = nil
				local list6 = {}
				local flag14 = false
				local n9 = 0

				local function func25()
					for i = #list6, 1, -1 do
						local entry1 = list6[i]

						if entry1 and entry1.Connected then
							entry1:Disconnect()
						end

						list6[i] = nil
					end
				end

				local function func26()
					func25()
					local obj15 = value17
					local flag15 = value18
					value17 = nil
					value18 = nil
					if not obj15 or not obj15.Parent or not flag15 then
						return
					end

					pcall(function()
						obj15.BreakJointsOnDeath = flag15.BreakJointsOnDeath
						obj15.RequiresNeck = flag15.RequiresNeck
						obj15:SetStateEnabled(Enum.HumanoidStateType.Dead, flag15.DeadEnabled)
					end)
				end

				local function func27(instance3)
					if not instance3 or not instance3.Parent then
						return false
					end

					return pcall(function()
						instance3.BreakJointsOnDeath = false
						instance3.RequiresNeck = false
						instance3:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
					end) and instance3.BreakJointsOnDeath == false and instance3.RequiresNeck == false and instance3:GetStateEnabled(Enum.HumanoidStateType.Dead) == false
				end

				local function func28(humanoid2)
					if flag3.Paused or humanoid2 ~= value17 or not humanoid2 or not humanoid2.Parent or flag14 then
						return false
					end
					local maxHealth = humanoid2.MaxHealth
					if maxHealth <= 0 then
						return false
					end

					if maxHealth == math.huge or humanoid2.Health >= maxHealth then
						return true
					end
					flag14 = true

					local ok = pcall(function()
						humanoid2.Health = maxHealth
					end)

					flag14 = false
					return ok and humanoid2.Health >= maxHealth
				end

				local function func29(instance4)
					if instance4 == value17 and instance4 and instance4.Parent then
						return true
					end
					func26()
					if not instance4 or not instance4:IsA("Humanoid") or not instance4.Parent then
						return false
					end
					value17 = instance4

					value18 = {
						BreakJointsOnDeath = instance4.BreakJointsOnDeath,
						RequiresNeck = instance4.RequiresNeck,
						DeadEnabled = instance4:GetStateEnabled(Enum.HumanoidStateType.Dead),
					}

					if not func27(instance4) then
						func26()
						return false
					end
					func28(instance4)

					list6[#list6 + 1] = instance4.HealthChanged:Connect(function()
						func28(instance4)
					end)

					list6[#list6 + 1] = instance4:GetPropertyChangedSignal("MaxHealth"):Connect(function()
						func28(instance4)
					end)

					list6[#list6 + 1] = instance4.StateChanged:Connect(function(old, new)
						if new == Enum.HumanoidStateType.Dead and not flag3.Paused then
							func27(instance4)
							func28(instance4)
						end
					end)

					n9 = os.clock()
					return true
				end

				local function func30()
					local character = localPlayer.Character
					return character and character:FindFirstChildOfClass("Humanoid") or nil
				end

				local connection = localPlayer.CharacterAdded:Connect(function()
					task.defer(function()
						func29(func30())
					end)
				end)

				local connection2 = RunService.Heartbeat:Connect(function()
					local now = os.clock()
					if flag3.Paused or now - n9 < n8 then
						return
					end
					n9 = now
					local result6 = func30()
					if result6 ~= value17 then
						func29(result6)
						return
					end

					if result6 then
						func27(result6)
						func28(result6)
					end
				end)

				task.defer(function()
					func29(func30())
				end)

				func4(function()
					if connection then
						connection:Disconnect()
					end

					if connection2 then
						connection2:Disconnect()
					end

					func26()
				end)
			end

			local tbl24 = { "bat", "katana", "axe", "staff", "club", "hammer", "sword", "blade" }

			str1 = {
				Steal = { Active = false, LastFinishedAt = 0, Carrying = false },
				SafeCarry = {
					Enabled = true,
					SkipUnsafe = false,
					WaitGuard = false,
					SameSpeedBigEggs = false,
					Blocked = {},
					StretchSeconds = 6,
					BeatGuard = false,
					SlowUntil = 0,
					SlowFactor = 0.3,
					LineDrop = false,
					LineGap = 12,
					LineWait = 15,
					DirectBudget = 450,
					DirectMargin = 0.3,
					CrossNow = false,
					CrossSpeed = 231,
					PickupSpeed = 154,
					HopRatio = 1.515,
					CrossRatio = 1,
					PickupRatio = 0.667,
					FarFromLine = 150,
					DropDelay = 0.19,
					LineApproach = 0.97,
					ReJump = true,
					ShakeTime = 0,
					SnapPickup = false,
					Hops = true,
					HopStep = 350,
					HopGap = 0.1,
					HopLift = 42,
					HopStop = 48,
					GetUp = true,
					ShakeInside = 1,
					CarryScale = 1,
					EasyRatio = 1.3,
					LastSkip = nil,
					Category = nil,
					PlanOk = true,
					LightMult = 0.96,
					Height = 70,
					ClimbShare = 0.5,
					Approach = "Run",
					RunSpeed = 1,
					RunWait = 0,
					RunAnimate = true,
					RunHeight = 50,
					SnapLimit = 90,
					StraightRun = true,
					RunStyle = "Velocity",
					CarryStyle = "Velocity",
					SpeedJitter = 0.08,
					Wobble = 0,
					LaneOffset = 0,
					JumpsPerMinute = 0,
					PausesPerMinute = 0,
					ReactMin = 0.2,
					ReactMax = 0.6,
					CarryReact = 0,
					SpeedRatio = 1.5,
					ExcessSeconds = 5.5,
					GuardMargin = 4,
					GuardRatio = 1.06,
					MinRatio = 1.1,
					BaseWait = 6.5,
					FreeJump = 1500,
					WaitRate = 0.9,
					RecoverTries = math.huge,
					GuessMult = 0.93,
					CarryRatio = 0.9,
					Mult = 1,
					Seen = {},
					JumpDistance = 0,
					JumpAt = 0,
					LastDelivered = 0,
					LastFailed = 0,
					Handle = nil,
				},
				Movement = {
					Owner = nil,
					PlaceWanted = false,
					StealFirst = false,
					MutationWanted = false,
					FracturedWanted = false,
				},
				AntiGuard = {
					Enabled = false,
					Busy = false,
					BusySince = 0,
					HitArms = 0,
					Handle = nil,
					Render = nil,
				},
				IsBatTool = function(instance5)
					if typeof(instance5) ~= "Instance" or not instance5:IsA("Tool") then
						return false
					end

					if instance5:GetAttribute("IsBat") == true then
						return true
					end
					local attribute = instance5:GetAttribute("GearName")

					if type(attribute) == "string" then
						local gears = tbl1.Gears
						local directory = type(gears) == "table" and gears.Directory or nil
						local flag16 = type(directory) == "table" and directory[attribute] or nil
						return type(flag16) == "table" and flag16.BatControllerData ~= nil
					end

					if instance5:GetAttribute("ItemType") ~= nil then
						return false
					end
					local lowered = string.lower(instance5.Name)

					for _, item7 in ipairs(tbl24) do
						if string.find(lowered, item7, 1, true) then
							return true
						end
					end

					return false
				end,
				FindBat = function()
					local character = localPlayer.Character
					local tool = character and character:FindFirstChildWhichIsA("Tool")
					if str1.IsBatTool(tool) then
						return tool
					end
					local backpack = localPlayer:FindFirstChildOfClass("Backpack")

					if backpack then
						for _, child in ipairs(backpack:GetChildren()) do
							if str1.IsBatTool(child) then
								return child
							end
						end
					end

					if character then
						for _, child in ipairs(character:GetChildren()) do
							if str1.IsBatTool(child) then
								return child
							end
						end
					end

					return nil
				end,
				IsNight = function()
					local areaEggCycle = tbl1.AreaEggCycle
					if type(areaEggCycle) ~= "table" or type(areaEggCycle.IsNightPhase) ~= "function" then
						return false
					end
					local ok, result = pcall(areaEggCycle.IsNightPhase, workspace:GetServerTimeNow())
					return ok and result == true
				end,
				WallSealed = function()
					local areaEggResetWall = tbl1.AreaEggResetWall
					if type(areaEggResetWall) ~= "table" or type(areaEggResetWall.IsSealed) ~= "function" then
						return false
					end
					local ok, result = pcall(areaEggResetWall.IsSealed)
					return ok and result == true
				end,
				WallOpenDelay = function()
					local areaEggResetCycle = tbl1.AreaEggResetCycle
					if type(areaEggResetCycle) ~= "table" then
						return 5
					end
					return (tonumber(areaEggResetCycle.WallCountdownDelayAfterDayStartsSeconds) or 2) + (tonumber(areaEggResetCycle.WallCountdownSeconds) or 3)
				end,
				ClaimMovement = function(owner)
					local movement = str1.Movement
					if movement.Owner == nil or movement.Owner == owner or movement.Owner == "treadmill" and owner ~= "treadmill" or movement.Owner == "scramble" and owner == "steal" then
						movement.Owner = owner
						return true
					end
					return false
				end,
				ReleaseMovement = function(param15)
					if str1.Movement.Owner == param15 then
						str1.Movement.Owner = nil
					end
				end,
			}

			do
				local shieldMethods = { "Humanoid Swap", "Disable Monitor" }
				str1.ShieldMethods = shieldMethods
				local first1 = shieldMethods[1]
				local tbl25 = {}
				local tbl26 = {}
				local connection = nil
				local n8 = 0
				local tbl27 = { Original = nil, Clone = nil, Links = {} }
				local connection2 = nil
				local tbl28 = {}

				local function func31()
					for _, item8 in ipairs(tbl28) do
						task.defer(function()
							pcall(item8)
						end)
					end
				end

				str1.OnHumanoidChanged = function(param16)
					table.insert(tbl28, param16)
					local tbl29

					tbl29 = {
						Connected = true,
						Disconnect = function()
							tbl29.Connected = false
							local foundAt = table.find(tbl28, param16)

							if foundAt then
								table.remove(tbl28, foundAt)
							end
						end,
					}

					return tbl29
				end

				local function func32(humanoid)
					pcall(function()
						local playerScripts = localPlayer:FindFirstChild("PlayerScripts")
						local playerModule = playerScripts and playerScripts:FindFirstChild("PlayerModule")

						if playerModule then
							local controls = require(playerModule):GetControls()

							if type(controls) == "table" then
								controls.humanoid = humanoid
							end
						end
					end)
				end

				local function func33(instance6)
					local animate = instance6 and instance6:FindFirstChild("Animate")

					if animate and animate:IsA("LocalScript") then
						task.spawn(function()
							animate.Enabled = false
							task.wait()
							animate.Enabled = true
						end)
					end
				end

				local function func34()
					for _, link in ipairs(tbl27.Links) do
						pcall(function()
							link:Disconnect()
						end)
					end

					table.clear(tbl27.Links)
				end

				str1.UndoSwap = function()
					func34()
					local character = localPlayer.Character
					local original = tbl27.Original
					local clone = tbl27.Clone
					local value19 = tbl27
					tbl27.Original = nil
					value19.Clone = nil

					if original and clone and character and original.Parent == nil and clone.Parent == character then
						original.Parent = character
						workspace.CurrentCamera.CameraSubject = original
						func32(original)

						pcall(function()
							clone:Destroy()
						end)

						func33(character)
						func31()
					end
				end

				local tbl30 = {
					[Enum.HumanoidStateType.Running] = true,
					[Enum.HumanoidStateType.RunningNoPhysics] = true,
					[Enum.HumanoidStateType.Landed] = true,
				}

				str1.Grounded = function(obj)
					if not obj then
						local character = localPlayer.Character
						obj = character and character:FindFirstChildOfClass("Humanoid")
					end

					if not obj or obj.Health <= 0 or obj.FloorMaterial == Enum.Material.Air then
						return false
					end
					return tbl30[obj:GetState()] == true
				end

				str1.ShieldPaused = false

				str1.WalkSpeed = function()
					local character = localPlayer.Character
					character = character and character:FindFirstChildOfClass("Humanoid")
					character = character and character.WalkSpeed or 16
					local original = tbl27.Original

					if original and original.Health > 0 then
						character = math.min(character, original.WalkSpeed)
					end

					local ok, result = pcall(function()
						local leaderstats = localPlayer:FindFirstChild("leaderstats")
						leaderstats = leaderstats and leaderstats:FindFirstChild("Speed")
						local TreadmillUtil = require(ReplicatedStorage.Shared.Util.TreadmillUtil)
						return leaderstats and TreadmillUtil.SpeedPowerToWalkSpeed(leaderstats.Value) or nil
					end)

					local n9

					if ok and tonumber(result) and result > 0 then
						n9 = math.min(character, result)
					else
						n9 = character
					end

					return n9
				end

				local function func35()
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")
					if not humanoid or humanoid.Health <= 0 then
						return
					end

					if tbl27.Clone and tbl27.Clone.Parent == character then
						return
					end

					if not str1.Grounded(humanoid) then
						return
					end
					local clone = humanoid:Clone()
					humanoid.Parent = nil
					clone.Parent = character
					workspace.CurrentCamera.CameraSubject = clone
					func32(clone)
					func33(character)
					local value20 = tbl27
					tbl27.Original = humanoid
					value20.Clone = clone
					func31()

					table.insert(tbl27.Links, humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
						if clone.Parent ~= nil then
							clone.WalkSpeed = humanoid.WalkSpeed
						end
					end))

					local animator = humanoid:FindFirstChildOfClass("Animator")
					local animator2 = clone:FindFirstChildOfClass("Animator")

					if animator and animator2 then
						table.insert(tbl27.Links, animator.AnimationPlayed:Connect(function(param17)
							local animation = param17.Animation
							if not animation or clone.Parent == nil then
								return
							end

							local ok, result = pcall(function()
								return animator2:LoadAnimation(animation)
							end)

							if not ok or not result then
								return
							end

							pcall(function()
								result.Priority = param17.Priority
								result.Looped = param17.Looped
								local speed = param17.Speed
								result:Play(0.05, math.max(param17.WeightTarget, 0.01), speed)
							end)

							local connection3 = nil

							connection3 = param17.Stopped:Connect(function()
								connection3:Disconnect()

								pcall(function()
									result:Stop(0.1)
								end)
							end)
						end))
					end

					table.insert(tbl27.Links, clone.Died:Connect(function()
						func34()
						local value21 = tbl27
						tbl27.Original = nil
						value21.Clone = nil
						local character2 = localPlayer.Character

						if character2 and humanoid.Parent == nil then
							humanoid.Parent = character2
							workspace.CurrentCamera.CameraSubject = humanoid
							func32(humanoid)
							func31()
						end

						pcall(function()
							clone:Destroy()
						end)

						humanoid.Health = 0
					end))
				end

				local function func36()
					if type(getconnections) ~= "function" then
						return
					end

					for _, item9 in ipairs({ RunService.Heartbeat, RunService.PreSimulation, RunService.PostSimulation }) do
						local ok, result = pcall(getconnections, item9)

						if ok and type(result) == "table" then
							for _, item10 in ipairs(result) do
								local ok2, result2 = pcall(function()
									return item10.Function
								end)

								local flag17 = ok2 and type(result2) == "function"
								local flag18 = false
								local result3 = nil

								if flag17 then
									flag18, result3 = pcall(debug.info, result2, "s")
								end

								if flag18 and string.find(tostring(result3), "UGI", 1, true) then
									local ok3, result4 = pcall(function()
										return item10.Enabled
									end)

									if not ok3 or result4 ~= false then
										if pcall(function()
											item10:Disable()
										end) then
											table.insert(tbl26, item10)
										end
									end
								end
							end
						end
					end
				end

				local function func37()
					if connection then
						connection:Disconnect()
						connection = nil
					end

					if connection2 then
						connection2:Disconnect()
						connection2 = nil
					end

					for _, item11 in ipairs(tbl26) do
						pcall(function()
							item11:Enable()
						end)
					end

					table.clear(tbl26)
				end

				local function func38()
					if str1.ShieldPaused then
						return
					end

					if first1 == shieldMethods[1] then
						func35()
					else
						func36()
					end
				end

				local function func39()
					func38()
					n8 = 0

					connection = RunService.Heartbeat:Connect(function(deltaTime)
						n8 += deltaTime
						local character = localPlayer.Character
						local flag19 = first1 == shieldMethods[1]

						if flag19 then
							flag19 = not (tbl27.Clone and character and tbl27.Clone.Parent == character)
						end

						if (flag19 and 0.25 or 3) <= n8 then
							n8 = 0
							func38()
						end
					end)

					connection2 = localPlayer.CharacterAdded:Connect(function(character)
						func34()
						local value22 = tbl27
						tbl27.Original = nil
						value22.Clone = nil
						if first1 ~= shieldMethods[1] then
							return
						end

						task.spawn(function()
							character:WaitForChild("Humanoid", 10)
							task.wait(1)

							if connection and localPlayer.Character == character then
								func38()
							end
						end)
					end)
				end

				str1.Swapped = function()
					if first1 ~= shieldMethods[1] then
						return true
					end
					local character = localPlayer.Character
					return tbl27.Clone ~= nil and character ~= nil and tbl27.Clone.Parent == character
				end

				str1.Shield = function(param18, flag20)
					tbl25[param18] = flag20 == true or nil
					if next(tbl25) == nil then
						func37()
						return
					end

					if connection then
						return
					end
					func39()
				end

				str1.SetShieldMethod = function(flag21)
					if not table.find(shieldMethods, flag21) or flag21 == first1 then
						return
					end
					local flag22 = connection ~= nil
					func37()
					first1 = flag21

					if flag22 and next(tbl25) ~= nil then
						func39()
					end
				end

				func4(func37)
			end

			str1.Shield("load", true)

			str1.Toggle = function(obj, flag23)
				if type(obj) ~= "table" then
					return flag23 == true
				end

				local ok, result = pcall(function()
					local controller = obj._controller
					return type(controller) == "table" and type(controller.GetValue) == "function" and controller.GetValue()
				end)

				if ok and type(result) == "boolean" then
					return result
				end

				for _, item12 in ipairs({ "Get", "GetValue" }) do
					local ok2, result2 = pcall(function()
						return obj[item12]
					end)

					if ok2 and type(result2) == "function" then
						local ok3, result3 = pcall(result2, obj)
						if ok3 and type(result3) == "boolean" then
							return result3
						end
					end
				end

				return flag23 == true
			end

			str1.Root = function()
				local character = localPlayer.Character
				character = character and character:FindFirstChild("HumanoidRootPart")
				return character and character:IsDescendantOf(workspace) and character or nil
			end

			str1.PlacedPoints = function()
				local placedEggRenders = workspace:FindFirstChild("PlacedEggRenders")
				local tbl31 = {}
				if not placedEggRenders then
					return tbl31
				end
				local userId2 = tostring(localPlayer.UserId)

				for _, child in ipairs(placedEggRenders:GetChildren()) do
					if string.find(child.Name, userId2, 1, true) then
						local ok, result = pcall(function()
							return child:IsA("Model") and child:GetPivot() or child.CFrame
						end)

						if ok then
							table.insert(tbl31, result.Position)
						end
					end
				end

				return tbl31
			end

			str1.OwnPlot = function()
				local plots = workspace:FindFirstChild("Plots")
				if not plots then
					return nil
				end

				for _, child in ipairs(plots:GetChildren()) do
					local plotSign = child:FindFirstChild("PlotSign")
					plotSign = plotSign and plotSign:FindFirstChild("PlayerPlotSign")
					plotSign = plotSign and plotSign:FindFirstChild("Frame")
					plotSign = plotSign and plotSign:FindFirstChild("PlayerName")

					if plotSign and plotSign:IsA("TextLabel") then
						local lowered2 = string.lower(plotSign.Text)
						if lowered2 == string.lower(localPlayer.Name) or lowered2 == string.lower(localPlayer.DisplayName) then
							return child
						end
					end
				end

				return nil
			end

			local function func40()
				local list7 = str1.PlacedPoints()
				if #list7 == 0 then
					return nil
				end
				local vector = Vector3.zero

				for _, item13 in ipairs(list7) do
					vector += item13
				end

				return vector / #list7
			end

			str1.PenAnchor = function()
				local result7 = func40()
				if result7 then
					return result7
				end
				local obj16 = str1.OwnPlot()
				if not obj16 then
					return nil
				end
				local toUpdate = obj16:FindFirstChild("ToUpdate")
				local starterPen = toUpdate and toUpdate:FindFirstChild("StarterPen") or obj16:FindFirstChild("CenterPoint")
				if not starterPen then
					return nil
				end

				local ok, result = pcall(function()
					return starterPen:IsA("Model") and starterPen:GetPivot() or starterPen.CFrame
				end)

				return ok and result.Position or nil
			end

			str1.Plot = function()
				local value23 = str1.OwnPlot()
				if value23 then
					return value23
				end
				local plots = workspace:FindFirstChild("Plots")
				local result8 = func40()
				if not plots or not result8 then
					return nil
				end
				local huge = math.huge
				local value24 = nil

				for _, child in ipairs(plots:GetChildren()) do
					local ok, result, result2 = pcall(function()
						return child:GetBoundingBox()
					end)

					if ok and result and result2 then
						local value25 = result:PointToObjectSpace(result8)
						local n8 = result2.X / 2
						local flag24 = math.abs(value25.X) <= n8
						local flag25

						if flag24 then
							local n9 = result2.Z / 2
							flag25 = math.abs(value25.Z) <= n9
						else
							flag25 = flag24
						end

						if flag25 then
							return child
						end
						local magnitude = (result.Position - result8).Magnitude

						if magnitude < huge then
							value24 = child
							huge = magnitude
						end
					end
				end

				if value24 and huge <= 60 then
					return value24
				end
				return nil
			end

			str1.Belt = function()
				if treadmill and treadmill.AdminTreadmill ~= false then
					local adminModel = workspace:FindFirstChild("AdminTreadmill")
					if adminModel then
						local adminPart = (adminModel:IsA("BasePart") and adminModel)
							or adminModel:FindFirstChild("TreadmillBottom", true)
							or adminModel:FindFirstChild("BoundingBoxPart", true)
							or (adminModel:IsA("Model") and adminModel.PrimaryPart)
							or adminModel:FindFirstChildWhichIsA("BasePart", true)
						if adminPart then
							return adminPart
						end
					end
				end
				local obj17 = str1.Plot()
				if not obj17 then
					return nil
				end
				local treadmillBottom = obj17:FindFirstChild("TreadmillBottom")
				if treadmillBottom and treadmillBottom:IsA("BasePart") then
					return treadmillBottom
				end
				local clientTreadmillRenders = workspace:FindFirstChild("__ClientTreadmillRenders")
				clientTreadmillRenders = clientTreadmillRenders and clientTreadmillRenders:FindFirstChild("TreadmillRender_" .. obj17.Name)

				if clientTreadmillRenders then
					clientTreadmillRenders = clientTreadmillRenders:FindFirstChild("BoundingBoxPart") or clientTreadmillRenders:IsA("Model") and clientTreadmillRenders.PrimaryPart or clientTreadmillRenders:FindFirstChildWhichIsA("BasePart")
				end

				if clientTreadmillRenders then
					return clientTreadmillRenders
				end
				local treadmillUpgrade = obj17:FindFirstChild("TreadmillUpgrade")
				return treadmillUpgrade and treadmillUpgrade:FindFirstChildWhichIsA("BasePart") or nil
			end

			str1.DistanceTo = function(num5)
				local flag26 = str1.Root()
				if not flag26 or not num5 then
					return math.huge
				end
				return (flag26.Position - num5).Magnitude
			end

			do
				local tbl32 = {}
				local n8 = 0

				local function func41()
					local obj18 = str1.Plot()
					if not obj18 then
						return {}
					end
					local tbl33 = {}

					for _, item14 in ipairs({ "TreadmillBottom", "TreadmillUpgrade" }) do
						local obj19 = obj18:FindFirstChild(item14)

						if obj19 then
							if obj19:IsA("BasePart") then
								table.insert(tbl33, obj19)
							else
								for _, descendant in ipairs(obj19:GetDescendants()) do
									if descendant:IsA("BasePart") then
										table.insert(tbl33, descendant)
									end
								end
							end
						end
					end

					local clientTreadmillRenders = workspace:FindFirstChild("__ClientTreadmillRenders")
					clientTreadmillRenders = clientTreadmillRenders and clientTreadmillRenders:FindFirstChild("TreadmillRender_" .. obj18.Name)

					if clientTreadmillRenders then
						for _, descendant in ipairs(clientTreadmillRenders:GetDescendants()) do
							if descendant:IsA("BasePart") then
								table.insert(tbl33, descendant)
							end
						end
					end

					return tbl33
				end

				local function func42()
					for _, item15 in ipairs(func41()) do
						if not tbl32[item15] then
							tbl32[item15] = {
								CFrame = item15.CFrame,
								CanTouch = item15.CanTouch,
								CanCollide = item15.CanCollide,
								Transparency = item15.Transparency,
							}

							pcall(function()
								item15.CanTouch = false
								item15.CanCollide = false
								item15.Transparency = 1
								item15.CFrame = item15.CFrame - Vector3.new(0, 120, 0)
							end)
						end
					end
				end

				local function func43()
					for k, value26 in pairs(tbl32) do
						if k and k.Parent then
							pcall(function()
								k.CFrame = value26.CFrame
								k.CanTouch = value26.CanTouch
								k.CanCollide = value26.CanCollide
								k.Transparency = value26.Transparency
							end)
						end
					end

					table.clear(tbl32)
				end

				str1.HoldBelt = function()
					n8 += 1
					func42()
				end

				str1.ReleaseBelt = function()
					n8 = math.max(0, n8 - 1)

					if n8 == 0 then
						func43()
					end
				end

				str1.BeltHeld = function()
					return n8 > 0
				end

				str1.RefreshBeltHide = function()
					if n8 > 0 then
						func42()
					end
				end

				func4(function()
					n8 = 0
					func43()
				end)

				str1.LeaveBelt = function()
					local rfTreadmillAskDoff = networking:FindFirstChild("RF/Treadmill/AskDoff")

					if rfTreadmillAskDoff and rfTreadmillAskDoff:IsA("RemoteFunction") then
						pcall(rfTreadmillAskDoff.InvokeServer, rfTreadmillAskDoff)
					end
				end

				str1.Treadmill = { Riding = false }

				str1.ResetBelt = function()
					n8 = 0
					func43()
				end

				str1.OnBelt = function()
					local flag27 = str1.Belt()
					if not flag27 or tbl32[flag27] then
						return false
					end
					local flag28 = str1.Root()
					if not flag28 then
						return false
					end
					local value27 = flag27.CFrame:PointToObjectSpace(flag28.Position)
					local n9 = flag27.Size.X / 2 + 2
					local flag29 = math.abs(value27.X) <= n9

					if flag29 then
						local n10 = flag27.Size.Z / 2 + 2
						flag29 = math.abs(value27.Z) <= n10
					end

					return flag29 and value27.Y >= -2 and value27.Y <= flag27.Size.Y / 2 + 8
				end
			end

			str1.ExitBelt = function()
				str1.Treadmill.Riding = false
				str1.LeaveBelt()
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoid then
					pcall(function()
						humanoid.Jump = true
						humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					end)
				end

				task.wait(0.35)
			end

			str1.Flying = false
			str1.Driving = 0

			str1.BeginFlight = function()
				str1.Flying = true
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoid then
					humanoid.PlatformStand = true

					pcall(function()
						humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
					end)
				end

				return str1.Root() ~= nil
			end

			str1.SetFlightVelocity = function(assemblyLinearVelocity)
				local value28 = str1.Root()

				if value28 then
					value28.AssemblyLinearVelocity = assemblyLinearVelocity
					value28.AssemblyAngularVelocity = Vector3.zero
				end
			end

			str1.EndFlight = function()
				str1.Flying = false
				local value29 = str1.Root()

				if value29 then
					pcall(function()
						value29.AssemblyLinearVelocity = Vector3.zero
						value29.AssemblyAngularVelocity = Vector3.zero
					end)
				end

				local character = localPlayer.Character
				character = character and character:FindFirstChildOfClass("Humanoid")

				if character then
					character.PlatformStand = false
				end
			end

			do
				local tbl34 = {
					Enum.HumanoidStateType.FallingDown,
					Enum.HumanoidStateType.Ragdoll,
					Enum.HumanoidStateType.Physics,
					Enum.HumanoidStateType.Seated,
					Enum.HumanoidStateType.PlatformStanding,
				}

				local tbl35 = {}
				local flag30 = false

				str1.GodMode = function(param19)
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")
					if not character or not humanoid then
						return
					end

					if param19 then
						flag30 = true

						for _, item16 in ipairs(tbl34) do
							pcall(function()
								humanoid:SetStateEnabled(item16, false)
							end)
						end

						pcall(function()
							humanoid.BreakJointsOnDeath = false
						end)

						for _, descendant in ipairs(character:GetDescendants()) do
							if descendant:IsA("BasePart") and tbl35[descendant] == nil then
								tbl35[descendant] = descendant.CanCollide

								pcall(function()
									descendant.CanCollide = false
								end)
							end
						end
					elseif flag30 then
						flag30 = false

						for _, item17 in ipairs(tbl34) do
							pcall(function()
								humanoid:SetStateEnabled(item17, true)
							end)
						end

						for k, value30 in pairs(tbl35) do
							if k and k.Parent then
								pcall(function()
									k.CanCollide = value30
								end)
							end
						end

						table.clear(tbl35)
					end
				end
			end

			str1.GodTick = function()
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoid and humanoid.Health < humanoid.MaxHealth then
					pcall(function()
						humanoid.Health = humanoid.MaxHealth
					end)
				end
			end

			str1.StopWalking = function()
				local character = localPlayer.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoid and humanoidRootPart then
					pcall(function()
						humanoid:MoveTo(humanoidRootPart.Position)
						humanoid:Move(Vector3.zero, false)
					end)
				end
			end

			local function func44(num6, param20, param21, callback2)
				local n8 = tonumber(param20) or 6
				local n9 = tonumber(param21) or 10
				local n10 = 0
				local n11 = 0
				local n12 = 0
				local position

				while n10 < n9 do
					if type(callback2) == "function" and callback2() then
						str1.StopWalking()
						return false
					end
					local character = localPlayer.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")
					if not humanoidRootPart or not humanoid or humanoid.Health <= 0 then
						return false
					end

					if (humanoidRootPart.Position - num6).Magnitude <= n8 then
						str1.StopWalking()
						return true
					end

					if position and (humanoidRootPart.Position - position).Magnitude < 1 then
						n11 += 0.2
					else
						n11 = 0
					end

					position = humanoidRootPart.Position
					n12 = math.max(0, n12 - 0.2)

					if n11 >= 0.8 and n12 <= 0 then
						str1.LeaveBelt()

						pcall(function()
							humanoid.Jump = true
						end)

						n11 = 0
						n12 = 1.5
					end

					humanoid:MoveTo(num6)
					n10 += task.wait(0.2)
				end

				str1.StopWalking()
				return str1.DistanceTo(num6) <= n8
			end

			str1.WalkTo = function(param22, param23, param24, param25)
				str1.Driving = str1.Driving + 1
				local ok, result = pcall(func44, param22, param23, param24, param25)
				str1.Driving = math.max(0, str1.Driving - 1)
				return ok and result == true
			end

			local tbl36 = {
				Boss = "Fractured",
				GreatBloom = "Spirit Bloom",
				Sakura = "Bloom",
				Monstrous = "Parasite",
			}

			task.spawn(function()
				local mutations = tbl1.Mutations

				local ok, result = pcall(function()
					return mutations.All()
				end)

				if ok and type(result) == "table" then
					for k, value31 in pairs(result) do
						local id = type(value31) == "table" and (value31.Id or k) or nil
						local label = type(value31) == "table" and value31.Label or nil

						if id ~= nil and type(label) == "string" and label ~= "" then
							tbl36[tostring(id)] = label
						end
					end
				end
			end)

			func7 = function(param26)
				return tbl36[tostring(param26)] or tostring(param26)
			end

			local tbl37

			tbl37 = {
				"Forest",
				"Desert",
				"Snow",
				"Lake",
				"Jungle",
				"Volcano",
				"Prehistoric",
				"Cosmic",
				"Abyss Ocean",
				"Cherry Blossom",
				"Light Dark",
				"Titan Temple",
			}

			local tbl38 = {}

			for _, item18 in ipairs(tbl37) do
				tbl38[item18] = true
			end

			task.spawn(function()
				local eggState = tbl1.EggState

				local ok, result = pcall(function()
					return eggState.ReadFieldEggs()
				end)

				if ok and type(result) == "table" and type(result.Records) == "table" then
					for _, record in pairs(result.Records) do
						local areaId = type(record) == "table" and record.AreaId or nil

						if type(areaId) == "string" and not tbl38[areaId] then
							tbl38[areaId] = true
							table.insert(tbl37, areaId)
						end
					end
				end
			end)

			list3 = { "Any" }
			tbl8 = { Any = 0 }

			do
				local tbl39 = {}
				local directory = tbl1.Assets and tbl1.Assets.Directory

				if type(directory) == "table" then
					for _, value32 in pairs(directory) do
						local rarity = type(value32) == "table" and value32.Rarity or nil
						local flag31 = type(rarity) == "table"

						if flag31 then
							flag31 = tonumber(rarity.RarityNumber or rarity.Rank)
						end

						flag31 = flag31 or nil

						if flag31 then
							local entry2 = tbl39[flag31]

							if not entry2 then
								entry2 = tostring(rarity.DisplayName or rarity._id or flag31)
							end

							tbl39[flag31] = entry2
						end
					end
				end

				if next(tbl39) == nil then
					tbl39 = {
						"Common",
						"Uncommon",
						"Rare",
						"Epic",
						"Legendary",
						"Mythic",
						"Cosmic",
						"Secret",
						"Eternal",
						"Divine",
					}
				end

				local tbl40 = {}

				for k in pairs(tbl39) do
					table.insert(tbl40, k)
				end

				table.sort(tbl40)

				for _, item19 in ipairs(tbl40) do
					table.insert(list3, tbl39[item19])
					tbl8[tbl39[item19]] = item19
				end
			end

			list2 = { "Best Rarity", "Biggest Weight", "Best Mutation", "Highest Value", "Lowest Value" }
			local tbl41
			tbl41 = {}
			local n8
			n8 = 0
			local tbl42
			tbl42 = {}
			local tbl43
			tbl43 = {}
			local tbl44
			tbl44 = {}
			local tbl45
			tbl45 = {}
			str1.Steal.RiftPriority = false
			str1.Steal.RiftNeeds = {}
			str1.Steal.RiftRequirements = {}
			str1.Steal.RiftCurrent = {}

			str1.StockWaits = function(obj)
				if type(obj) ~= "table" or not obj.RiftOnly or obj.RiftNow then
					return false
				end
				local mech = str1.Mech
				if type(mech) ~= "table" or str1.Toggle(mech.Handle, false) ~= true then
					return false
				end
				return mech.Busy == true or workspace:FindFirstChild("ScrambleArenaPortal") ~= nil or localPlayer:GetAttribute("InScrambleArena") == true
			end

			str1.Lab = {
				Banners = {},
				Reserved = {},
				SkipOwned = true,
				Stock = {},
				StockEggs = {},
				StockPer = 3,
				Pools = {},
				PoolLists = {},
			}

			str1.Lab.Shares = {
				Biohazard = {
					{ "Cyclops Gorilla", 0.431 },
					{ "Red Panda", 0.431 },
					{ "Snowy Owl", 0.399 },
					{ "Salamander", 0.381 },
					{ "Pterodactyl", 0.234 },
					{ "Galaxy Gecko", 0.202 },
					{ "Ankylosaurus", 0.194 },
					{ "Crane", 0.138 },
					{ "Parrotfish", 0.126 },
					{ "Centapede", 0.106 },
					{ "Dodo", 0.104 },
					{ "Swordfish", 0.1 },
					{ "Koi", 0.046 },
					{ "La Vacca Saturno Saturnita", 0.044 },
					{ "Finned Thresher", 0.024 },
					{ "Bronto", 0.019 },
					{ "Triceratops", 0.013 },
					{ "Orca", 0.009 },
				},
				Experimental = {
					{ "Blade Head", 0.342 },
					{ "Red Panda", 0.341 },
					{ "Crab", 0.331 },
					{ "Salamander", 0.327 },
					{ "Snowy Owl", 0.324 },
					{ "Mantis", 0.314 },
					{ "Cyclops Gorilla", 0.178 },
					{ "Galaxy Gecko", 0.161 },
					{ "Crane", 0.135 },
					{ "Kaiju Spider", 0.134 },
					{ "Pterodactyl", 0.119 },
					{ "Dodo", 0.096 },
					{ "Centapede", 0.094 },
					{ "Rhino", 0.034 },
					{ "Koi", 0.032 },
					{ "Ankylosaurus", 0.03 },
					{ "La Vacca Saturno Saturnita", 0.01 },
					{ "Bronto", 0.001 },
					{ "Triceratops", 0.001 },
				},
				UnstableDNA = {
					{ "Toro", 0.236 },
					{ "Lamb", 0.232 },
					{ "Blade Head", 0.228 },
					{ "Imp", 0.223 },
					{ "Crab", 0.22 },
					{ "Moth", 0.219 },
					{ "Demon Hound", 0.217 },
					{ "Peacock", 0.21 },
					{ "Mantis", 0.203 },
					{ "Salamander", 0.165 },
					{ "Dove", 0.104 },
					{ "Flame Sprite", 0.103 },
					{ "Galaxy Gecko", 0.103 },
					{ "Kaiju Spider", 0.102 },
					{ "Red Panda", 0.102 },
					{ "Crane", 0.096 },
					{ "Snowy Owl", 0.088 },
					{ "Centapede", 0.064 },
					{ "Cyclops Gorilla", 0.021 },
					{ "Jellyfish", 0.02 },
					{ "Dark Gargoyle", 0.019 },
					{ "Rhino", 0.018 },
					{ "Koi", 0.009 },
					{ "La Vacca Saturno Saturnita", 0.001 },
				},
			}

			str1.Lab.Pickers = {}
			str1.Lab.ExtraPath = "ChilliLibrary/SAE_LabEggs.json"

			str1.Lab.RefreshPools = function()
				local lab = str1.Lab

				local ok, result = pcall(function()
					return require(ReplicatedStorage.Shared.Modules.ScrambleTradeInRecipes)
				end)

				if not ok or type(result) ~= "table" or type(result.Simulate) ~= "function" then
					return
				end
				local HttpService = game:GetService("HttpService")
				local tbl46 = {}

				pcall(function()
					if isfile(lab.ExtraPath) then
						local data = HttpService:JSONDecode(readfile(lab.ExtraPath))

						if type(data) == "table" then
							tbl46 = data
						end
					end
				end)

				local flag32 = false

				for k, share in pairs(lab.Shares) do
					local ok2, result2 = pcall(result.Simulate, k, 4000)

					if ok2 and type(result2) == "table" and type(result2.SlotPicks) == "table" then
						local n9 = math.max(1, tonumber(result2.Runs) or 4000)
						local tbl47 = {}

						for _, slotPick in pairs(result2.SlotPicks) do
							if type(slotPick) == "table" then
								for k2, value33 in pairs(slotPick) do
									local str4 = tostring(k2)
									tbl47[str4] = (tbl47[str4] or 0) + (tonumber(value33) or 0)
								end
							end
						end

						local tbl48 = type(tbl46[k]) == "table" and tbl46[k] or {}
						local tbl49 = {}
						local tbl50 = {}
						local flag33 = false

						for _, item20 in ipairs(share) do
							local first2 = item20[1]
							local second1 = item20[2]

							if (tbl47[first2] or 0) > 0 or second1 < 0.02 then
								tbl49[first2] = true
								table.insert(tbl50, { first2, second1 })
							else
								flag33 = true
							end
						end

						for k2, value34 in pairs(tbl47) do
							if not tbl49[k2] and value34 > 0 then
								local num7 = tonumber(tbl48[k2])

								if not num7 then
									num7 = math.max(0.001, math.floor(value34 / n9 * 1000 + 0.5) / 1000)
									tbl48[k2] = num7
									tbl46[k] = tbl48
									flag32 = true
								end

								table.insert(tbl50, { k2, num7 })
								flag33 = true
							end
						end

						if flag33 then
							table.sort(tbl50, function(tbl51, tbl52)
								if tbl51[2] ~= tbl52[2] then
									return tbl51[2] > tbl52[2]
								end
								return tbl51[1] < tbl52[1]
							end)

							lab.Shares[k] = tbl50
							lab.Pools[k] = nil
							lab.PoolLists[k] = nil
							local flag34 = lab.Pickers[k]

							if flag34 and flag34.Handle and type(flag34.Handle.SetOptions) == "function" and type(lab.LabelsFor) == "function" then
								local list8, value35 = lab.LabelsFor(k)

								if #list8 > 0 then
									flag34.CategoryOf = value35
									pcall(flag34.Handle.SetOptions, flag34.Handle, list8, nil, true)
								end
							end
						end
					end

					task.wait()
				end

				task.delay(0.3, function()
					pcall(str1.Lab.FixPickers)
				end)

				if flag32 and type(writefile) == "function" then
					pcall(function()
						if type(isfolder) == "function" and type(makefolder) == "function" and not isfolder("ChilliLibrary") then
							makefolder("ChilliLibrary")
						end

						writefile(lab.ExtraPath, HttpService:JSONEncode(tbl46))
					end)
				end
			end

			str1.Lab.FixPickers = function()
				local lab = str1.Lab
				if not str1.Steal.RiftPriority or type(lab.LabelsFor) ~= "function" then
					return
				end

				for k, picker in pairs(lab.Pickers) do
					local handle = picker.Handle
					local value36 = type(handle) == "table" and rawget(handle, "Instance") or nil

					if typeof(value36) == "Instance" and value36.AbsoluteSize.Y <= 2 and type(handle.SetOptions) == "function" then
						local list9, value37 = lab.LabelsFor(k)

						if #list9 > 0 then
							picker.CategoryOf = value37
							pcall(handle.SetOptions, handle, list9, nil, false)
						end
					end
				end
			end

			str1.Lab.PoolOf = function(param27)
				local lab = str1.Lab
				local value38 = lab.Pools[param27]
				if value38 then
					return value38
				end
				local tbl53 = {}
				local tbl54 = {}
				local func45 = ipairs
				local tbl55 = lab.Shares[tostring(param27)] or {}

				for _, value39 in func45(tbl55) do
					local first3 = value39[1]
					local second2 = value39[2]

					if second2 >= 0.05 then
						tbl53[first3] = true
					end

					table.insert(tbl54, { Category = first3, Share = second2 })
				end

				lab.Pools[param27] = tbl53
				lab.PoolLists[param27] = tbl54
				return tbl53
			end

			str1.Lab.IsLabPet = function(param28)
				local lab = str1.Lab

				if not lab.PetSet then
					local petSet = {}
					local data = lab.Data

					if type(data) == "table" and type(data.Banners) == "table" then
						for _, banner in ipairs(data.Banners) do
							local func46 = ipairs
							local pets = type(banner) == "table" and type(banner.Pets) == "table" and banner.Pets or {}

							for _, pet in func46(pets) do
								if type(pet) == "table" and pet.AssetId ~= nil then
									petSet[tostring(pet.AssetId)] = true
								end
							end
						end
					end

					if next(petSet) == nil then
						return false
					end
					lab.PetSet = petSet
				end

				return lab.PetSet[tostring(param28)] == true
			end

			str1.Lab.StockActive = function()
				return next(str1.Lab.Stock) ~= nil
			end

			str1.Lab.StockTargets = function()
				local lab = str1.Lab
				local tbl56 = {}
				if not str1.Steal.RiftPriority or not lab.StockActive() then
					return tbl56
				end

				for k in pairs(lab.Stock) do
					local flag35 = lab.StockEggs[k]
					local func47 = pairs
					local tbl57 = type(flag35) == "table" and flag35 or {}

					for k2 in func47(tbl57) do
						tbl56[k2] = lab.StockPer
					end
				end

				return tbl56
			end

			str1.Lab.Data = func2(function()
				return ReplicatedStorage.Data.ScrambleTradeIn
			end)

			str1.Lab.Fallback = {
				{ Id = "Biohazard", Name = "Biohazard Pets" },
				{ Id = "Experimental", Name = "Experimental Pets" },
				{ Id = "UnstableDNA", Name = "Unstable DNA" },
			}

			str1.Lab.BannerList = function()
				local data = str1.Lab.Data
				local tbl58 = {}

				if type(data) == "table" and type(data.Banners) == "table" then
					for _, banner in ipairs(data.Banners) do
						if type(banner) == "table" and banner.Id ~= nil then
							table.insert(tbl58, { Id = tostring(banner.Id), Name = tostring(banner.DisplayName or banner.Id) })
						end
					end
				end

				if #tbl58 == 0 then
					return str1.Lab.Fallback
				end
				return tbl58
			end

			str1.Lab.BannerName = function(param29)
				for _, item21 in ipairs(str1.Lab.BannerList()) do
					if item21.Id == tostring(param29) then
						return item21.Name
					end
				end

				return tostring(param29)
			end

			str1.Lab.BannerOk = function(flag36)
				if next(str1.Lab.Banners) == nil then
					return true
				end
				return flag36 ~= nil and str1.Lab.Banners[tostring(flag36)] == true
			end

			str1.Lab.PickedText = function()
				local tbl59 = {}

				for _, item22 in ipairs(str1.Lab.BannerList()) do
					if str1.Lab.Banners[item22.Id] then
						table.insert(tbl59, item22.Name)
					end
				end

				return table.concat(tbl59, " or ")
			end

			local flag37
			flag37 = false
			local tbl60
			tbl60 = {}
			local n9
			n9 = 0
			flag1 = list2[4]
			local n10
			n10 = 27.4
			n7 = 400
			local func48
			func48 = nil

			value2 = obj14:CreateToggle({
				Name = "Auto Steal",
				Default = false,
				Callback = function()
					if func48 then
						func48()
					end
				end,
			})

			for _, item23 in ipairs(tbl37) do
				tbl41[item23] = true
			end

			func6(obj14:CreateMultiDropdown({
				Name = "Target Areas",
				Options = tbl37,
				Default = tbl37,
				Callback = function(value)
					local tbl61 = {}

					if type(value) == "table" then
						for k, value40 in pairs(value) do
							if value40 == true and type(k) == "string" then
								tbl61[k] = true
							elseif type(value40) == "string" then
								tbl61[value40] = true
							end
						end
					end

					if next(tbl61) == nil then
						for _, item24 in ipairs(tbl37) do
							tbl61[item24] = true
						end
					end

					tbl41 = tbl61
				end,
			}))

			obj14:CreateDropdown({
				Name = "Min Rarity",
				Note = "Steal eggs of the chosen rarity and every rarity above it",
				Options = list3,
				Default = list3[1],
				Callback = function(value)
					n8 = tbl8[value] or 0
				end,
			})

			func5(obj14, {
				Name = "Min Steal Value",
				Note = "Skip eggs worth less than this. Drag or type 250k, 50m, 1.5b",
				Legacy = "Min Value To Steal",
				SectionName = "Auto Steal",
				OnRaw = function(param30)
					n9 = param30
				end,
			})

			do
				local tbl62 = {}
				local tbl63 = {}
				local directory = tbl1.Assets and tbl1.Assets.Directory
				local tbl64 = {}

				if type(directory) == "table" then
					for k, value41 in pairs(directory) do
						local rarity = type(value41) == "table" and value41.Rarity or nil
						local flag38 = type(rarity) == "table"

						if flag38 then
							flag38 = tonumber(rarity.RarityNumber or rarity.Rank)
						end

						flag38 = flag38 or nil

						if flag38 then
							table.insert(tbl64, {
								Category = tostring(k),
								Name = tostring(value41.DisplayName or k),
								Rarity = flag38,
								RarityName = tostring(rarity.DisplayName or rarity._id or flag38),
							})
						end
					end
				end

				table.sort(tbl64, function(param31, param32)
					if param31.Rarity ~= param32.Rarity then
						return param31.Rarity > param32.Rarity
					end
					return param31.Name < param32.Name
				end)

				for _, item25 in ipairs(tbl64) do
					local formatted2 = string.format("%s [%s]", item25.Name, item25.RarityName)

					if tbl63[formatted2] then
						formatted2 = string.format("%s [%s] (%s)", item25.Name, item25.RarityName, item25.Category)
					end

					table.insert(tbl62, formatted2)
					tbl63[formatted2] = item25.Category
				end

				func6(obj14:CreateMultiDropdown({
					Name = "Target Specific Eggs",
					Note = "Only steal these eggs (empty = all)",
					Options = tbl62,
					Default = {},
					Callback = function(value)
						local tbl65 = {}

						if type(value) == "table" then
							for k, value42 in pairs(value) do
								k = value42 == true and type(k) == "string" and k or type(value42) == "string" and value42 or nil

								if k and tbl63[k] then
									tbl65[tbl63[k]] = true
								end
							end
						end

						tbl42 = tbl65
					end,
				}))
			end

			do
				local n11 = 30
				local value43 = nil
				local flag39 = false
				local n12 = 0

				local function func49()
					local tbl66 = {}
					local save2 = tbl1.Save

					if type(save2) == "table" and type(save2.Get) == "function" then
						local ok, result = pcall(save2.Get)

						if ok and type(result) == "table" then
							local tbl67 = {}
							local eggState = tbl1.EggState

							if type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function" then
								local ok2, result2 = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)

								if ok2 and type(result2) == "table" then
									for k, value44 in pairs(result2) do
										if type(value44) == "table" and value44.Placement ~= nil then
											tbl67[k] = true
										end
									end
								end
							end

							local func50 = pairs
							local eggInventory = result.EggInventory or {}

							for k, value45 in func50(eggInventory) do
								if type(value45) == "table" and value45.AssetCategory ~= nil and not tbl67[k] then
									local assetCategory = tostring(value45.AssetCategory)
									tbl66[assetCategory] = (tbl66[assetCategory] or 0) + 1
								end
							end
						end
					end

					return tbl66
				end

				local function func51()
					local lab = str1.Lab
					local tbl68 = {}
					str1.Steal.RiftCurrent = {}
					local value46 = nil

					if lab.StockActive() then
						value46 = func49()

						for k, stockTarget in pairs(lab.StockTargets()) do
							if (value46[k] or 0) < stockTarget then
								tbl68[k] = true
							end
						end

						local riftBanner = str1.Steal.RiftBanner
						if riftBanner == nil or not lab.Stock[riftBanner] then
							return tbl68
						end
					end

					local tbl69 = {}

					for _, riftRequirement in ipairs(str1.Steal.RiftRequirements) do
						tbl69[riftRequirement] = (tbl69[riftRequirement] or 0) + 1
					end

					if next(tbl69) == nil then
						return tbl68
					end

					if lab.SkipOwned then
						value46 = value46 or func49()
					else
						value46 = {}
					end

					local riftCurrent = {}

					for k, value47 in pairs(tbl69) do
						if (value46[k] or 0) < value47 then
							tbl68[k] = true
							riftCurrent[k] = true
						end
					end

					str1.Steal.RiftCurrent = riftCurrent
					return tbl68
				end

				local function func52()
					local rfScrambleTradeInAskState = networking:FindFirstChild("RF/ScrambleTradeIn/AskState")
					local isRemoteFunction = rfScrambleTradeInAskState and rfScrambleTradeInAskState:IsA("RemoteFunction")
					local flag40 = false
					local result = nil

					if isRemoteFunction then
						flag40, result = pcall(rfScrambleTradeInAskState.InvokeServer, rfScrambleTradeInAskState)
					end

					if not flag40 or type(result) ~= "table" or type(result.Requirements) ~= "table" then
						if str1.Lab.StockActive() then
							str1.Steal.RiftNeeds = func51()
						end

						return
					end

					str1.Steal.RiftBanner = result.BannerId ~= nil and tostring(result.BannerId) or nil
					local riftRequirements = {}

					if result.Unlocked ~= false and str1.Lab.BannerOk(result.BannerId) then
						for _, requirement in ipairs(result.Requirements) do
							table.insert(riftRequirements, tostring(requirement))
						end
					end

					str1.Steal.RiftRequirements = riftRequirements
					str1.Steal.RiftNeeds = func51()
				end

				tbl2.Add(function()
					if not str1.Steal.RiftPriority or flag39 or os.clock() < n12 then
						return false
					end
					flag39 = true
					n12 = os.clock() + n11

					task.spawn(function()
						pcall(func52)
						flag39 = false
					end)

					return false
				end)

				local function recount()
					if not str1.Steal.RiftPriority then
						return
					end
					local riftNeeds = str1.Steal.RiftNeeds
					local result9 = func51()
					local flag41 = false

					for k in pairs(riftNeeds) do
						if not result9[k] then
							flag41 = true
						end
					end

					for k in pairs(result9) do
						if not riftNeeds[k] then
							flag41 = true
						end
					end

					str1.Steal.RiftNeeds = result9

					if flag41 then
						tbl2.Wake()
					end
				end

				str1.Lab.Recount = recount
				local save2 = tbl1.Save

				if type(save2) == "table" and type(save2.FieldSignal) == "function" then
					for _, item26 in ipairs({ "EggInventory", "Inventory" }) do
						local ok, result = pcall(save2.FieldSignal, item26)

						if ok and type(result) == "table" and type(result.Connect) == "function" then
							local ok2, result2 = pcall(result.Connect, result, function()
								task.defer(recount)
							end)

							if ok2 and result2 then
								func4(function()
									pcall(function()
										result2:Disconnect()
									end)
								end)
							end
						end
					end
				end

				str1.Lab.ForceSteal = function()
					n12 = 0
				end

				value43 = obj14:CreateToggle({
					Name = "Steal Missing Lab Eggs",
					Default = false,
					Callback = function()
						str1.Steal.RiftPriority = str1.Toggle(value43, false) == true
						n12 = 0

						if not str1.Steal.RiftPriority then
							str1.Steal.RiftNeeds = {}
						end

						task.delay(0.3, function()
							pcall(str1.Lab.FixPickers)
						end)

						tbl2.Wake()
					end,
				})

				obj14:CreateToggle({
					Name = "Skip Owned Lab Eggs",
					Note = "Only for the current recipe",
					Default = true,
					ShowWhen = value43,
					Callback = function(value)
						str1.Lab.SkipOwned = value ~= false
						pcall(recount)
					end,
				})

				local tbl70 = {}
				local byName2 = {}

				for _, item27 in ipairs(str1.Lab.BannerList()) do
					table.insert(tbl70, item27.Name)
					byName2[item27.Name] = item27.Id
				end

				obj14:CreateMultiDropdown({
					Name = "Stock Lab Eggs For",
					Note = "Collects eggs for these banners even before they open",
					Options = tbl70,
					Default = {},
					ShowWhen = value43,
					Callback = function(value)
						local stock = {}

						if type(value) == "table" then
							for k, value48 in pairs(value) do
								k = value48 == true and type(k) == "string" and k
								local flag42

								if k then
									flag42 = k
								else
									flag42 = type(value48) == "string" and value48
								end

								flag42 = flag42 or nil

								if flag42 and byName2[flag42] then
									stock[byName2[flag42]] = true
								end
							end
						end

						str1.Lab.Stock = stock
						n12 = 0

						task.spawn(function()
							pcall(recount)
						end)

						tbl2.Wake()
					end,
				})

				local ok, result = pcall(function()
					local directory = tbl1.Assets and tbl1.Assets.Directory
					local tbl71 = { Biohazard = "Biohazard", Experimental = "Experimental", UnstableDNA = "Unstable DNA" }

					str1.Lab.LabelsFor = function(param33)
						local tbl72 = {}
						local tbl73 = {}
						str1.Lab.PoolOf(param33)
						local tbl74 = str1.Lab.PoolLists[param33] or {}

						for _, item28 in ipairs(tbl74) do
							local flag43 = type(directory) == "table" and directory[item28.Category] or nil
							local n13 = item28.Share * 100
							local num8 = n13 < 1 and "<1%" or string.format("%d%%", math.floor(n13 + 0.5))
							local formatted3 = string.format("%s Egg (%s)", tostring(type(flag43) == "table" and flag43.DisplayName or item28.Category), num8)

							if tbl73[formatted3] then
								local format = string.format
								local func53 = tostring
								local displayName = type(flag43) == "table" and flag43.DisplayName or item28.Category
								local category = item28.Category
								formatted3 = format("%s Egg [%s] (%s)", func53(displayName), category, num8)
							end

							table.insert(tbl72, formatted3)
							tbl73[formatted3] = item28.Category
						end

						return tbl72, tbl73
					end

					for _, item29 in ipairs(str1.Lab.BannerList()) do
						local id = item29.Id
						local list10, value49 = str1.Lab.LabelsFor(id)
						local tbl75 = { CategoryOf = value49 }
						str1.Lab.Pickers[id] = tbl75
						local tbl76 = {}

						for i = 1, math.min(5, #list10) do
							table.insert(tbl76, list10[i])
						end

						tbl75.Handle = obj14:CreateMultiDropdown({
							Name = (tbl71[id] or item29.Name) .. " Lab Eggs",
							Options = list10,
							Default = tbl76,
							ShowWhen = value43,
							Callback = function(value)
								local tbl77 = {}

								if type(value) == "table" then
									for k, value50 in pairs(value) do
										k = value50 == true and type(k) == "string" and k
										local flag44

										if k then
											flag44 = k
										else
											flag44 = type(value50) == "string" and value50
										end

										local flag45 = flag44 or nil

										if flag45 and tbl75.CategoryOf[flag45] then
											tbl77[tbl75.CategoryOf[flag45]] = true
										end
									end
								end

								str1.Lab.StockEggs[id] = next(tbl77) ~= nil and tbl77 or nil
								n12 = 0

								task.spawn(function()
									pcall(recount)
								end)

								tbl2.Wake()
							end,
						})
					end
				end)

				if not ok then
					warn("[Chilli Hub] Lab egg pickers failed: " .. tostring(result))
				end

				task.spawn(function()
					pcall(str1.Lab.RefreshPools)
				end)

				obj14:CreateSlider({
					Name = "Stock Per Egg",
					Min = 1,
					Max = 30,
					Default = 3,
					Increment = 1,
					Unit = "",
					ShowWhen = value43,
					Callback = function(value)
						str1.Lab.StockPer = math.clamp(math.floor(tonumber(value) or 3), 1, 30)

						task.spawn(function()
							pcall(recount)
						end)
					end,
				})
			end

			do
				local n11 = 5
				local n12 = 5
				local n13 = 60
				local value51 = nil
				local n14 = 0
				local n15 = 0
				local flag46 = false
				local tbl78 = {}

				local function func54()
					local save2 = tbl1.Save

					if type(save2) == "table" and type(save2.Get) == "function" then
						local ok, result = pcall(save2.Get)
						if ok and type(result) == "table" then
							return result
						end
					end

					return nil
				end

				local function func55()
					local result10 = func54()
					local directory = tbl1.Areas and tbl1.Areas.Directory
					local directory2 = tbl1.Assets and tbl1.Assets.Directory
					if not result10 or type(directory) ~= "table" or type(directory2) ~= "table" then
						return
					end
					local index = type(result10.Index) == "table" and result10.Index or {}
					local tbl79 = {}
					local func56 = pairs
					local inventory = result10.Inventory or {}

					for _, value52 in func56(inventory) do
						if type(value52) == "table" and value52.Category ~= nil then
							tbl79[tostring(value52.Category)] = true
						end
					end

					local func57 = pairs
					local eggInventory = result10.EggInventory or {}

					for _, value53 in func57(eggInventory) do
						if type(value53) == "table" and value53.AssetCategory ~= nil then
							tbl79[tostring(value53.AssetCategory)] = true
						end
					end

					local tbl80 = {}

					for _, value54 in pairs(directory) do
						local flag47 = type(value54) == "table" and type(value54.Rarity) == "table"

						if flag47 then
							flag47 = tonumber(value54.Rarity.RarityNumber or value54.Rarity.Rank)
						end

						flag47 = flag47 or 0
						local func58 = pairs
						local dropTable = type(value54) == "table" and value54.DropTable or {}

						for _, value55 in func58(dropTable) do
							local flag48 = type(value55) == "table" and value55[1] or nil
							local n16 = type(value55) == "table" and tonumber(value55[2]) or 0
							local flag49 = flag48 ~= nil and directory2[flag48] or nil

							if type(flag49) == "table" and n16 > 0 and flag49.DontRoll ~= true then
								local str5 = tostring(flag48)

								if index[flag48] ~= true and not tbl79[str5] and (tbl80[str5] == nil or flag47 > tbl80[str5]) then
									tbl80[str5] = flag47
								end
							end
						end
					end

					tbl60 = tbl80
				end

				local function func59(childName, ...)
					local obj20 = networking:FindFirstChild(childName)
					if not obj20 or not obj20:IsA("RemoteFunction") then
						return false
					end
					local ok, result = pcall(obj20.InvokeServer, obj20, ...)
					return ok and result ~= false
				end

				local function func60(param34, list11)
					local tbl81 = {}
					if type(param34) ~= "table" then
						return tbl81
					end

					for _, item30 in ipairs(list11) do
						local tbl82 = param34

						for _, item31 in ipairs(item30) do
							tbl82 = type(tbl82) == "table" and tbl82[item31] or nil
						end

						local func61 = ipairs
						local tbl83 = type(tbl82) == "table" and tbl82 or {}

						for _, value56 in func61(tbl83) do
							if type(value56) == "table" and value56.AssetId ~= nil then
								table.insert(tbl81, value56.AssetId)
							end
						end
					end

					return tbl81
				end

				local tbl84 = {
					{
						Id = "LimitedEgg",
						Gear = "GravityDisruptor",
						Module = "LimitedEgg",
						Lists = { { "Entries" }, { "MechaReroll", "Entries" } },
					},
					{
						Id = "BrainrotEgg",
						Gear = "BeeLauncher",
						Module = "BrainrotEgg",
						Lists = { { "Entries" } },
					},
					{
						Id = "MonsterEgg",
						Gear = "BeeLauncher",
						Module = "MonsterEgg",
						Lists = { { "Entries" }, { "MechaEntries" } },
					},
				}

				local function func62()
					local result11 = func54()
					if not result11 then
						return
					end
					local index = type(result11.Index) == "table" and result11.Index or {}
					local indexClaimedCategories = type(result11.IndexClaimedCategories) == "table" and result11.IndexClaimedCategories or {}

					for k, value57 in pairs(index) do
						if value57 == true and indexClaimedCategories[k] ~= true then
							func59("RF/Codex/AskRedeemAll")
							break
						end
					end

					local gearInventory = type(result11.GearInventory) == "table" and result11.GearInventory or {}

					for _, item32 in ipairs(tbl84) do
						local flag50 = (tonumber(gearInventory[item32.Gear]) or 0) <= 0

						if flag50 then
							flag50 = os.clock() >= (tbl78[item32.Id] or 0)
						end

						if flag50 then
							local list12 = func60(tbl1[item32.Module], item32.Lists)
							local len2 = #list12 > 0

							for _, item33 in ipairs(list12) do
								if index[item33] ~= true then
									len2 = false
									break
								end
							end

							if len2 then
								tbl78[item32.Id] = os.clock() + n13
								func59("RF/Codex/AskRedeemLimitedEgg", item32.Id)
							end
						end
					end
				end

				tbl2.Add(function()
					local now = os.clock()

					if flag37 and now >= n14 then
						n14 = now + n11
						pcall(func55)
					end

					if not flag46 and now >= n15 and str1.Toggle(str1.IndexClaimHandle, false) then
						flag46 = true
						n15 = now + n12

						task.spawn(function()
							pcall(func62)
							flag46 = false
						end)
					end

					return false
				end)

				value51 = obj14:CreateToggle({
					Name = "Steal Missing Index Eggs",
					Note = "Also steal eggs missing from your index, highest area first",
					Default = false,
					Callback = function()
						flag37 = str1.Toggle(value51, false) == true
						n14 = 0

						if not flag37 then
							tbl60 = {}
						end

						tbl2.Wake()
					end,
				})

				str1.IndexClaimRestart = function()
					n15 = 0
					tbl2.Wake()
				end
			end

			str1.Steal.PriorityHandle = obj14:CreateDropdown({
				Name = "Steal Priority",
				Options = list2,
				Default = list2[4],
				Callback = function(value)
					if table.find(list2, value) then
						flag1 = value

						if type(str1.ResortSteal) == "function" then
							str1.ResortSteal()
						end
					end
				end,
			})

			str1.SafeCarry.InstantHandle = obj14:CreateToggle({
				Name = "Instant Steal",
				Note = "Delivers the egg to the safe zone in a few seconds, needs enough Speed",
				Default = false,
				Callback = function(value)
					if type(value) ~= "boolean" then
						value = str1.Toggle(str1.SafeCarry.InstantHandle, false)
					end

					str1.SafeCarry.LineDrop = value ~= false
					str1.SafeCarry.SpeedJitter = str1.SafeCarry.LineDrop and 0 or 0.08

					if str1.StealPanelSync then
						pcall(str1.StealPanelSync)
					end
				end,
			})

			str1.SafeCarry.RunHandle = obj14:CreateSlider({
				Name = "Tween Speed",
				Note = "Over 100% may glitch",
				Min = 50,
				Max = 120,
				Default = 100,
				Increment = 1,
				Unit = "%",
				Callback = function(value)
					str1.SafeCarry.RunSpeed = math.clamp(tonumber(value) or 100, 50, 120) / 100
				end,
			})

			obj14:CreateSlider({
				Name = "Carry Speed",
				Min = 80,
				Max = 120,
				Default = 100,
				Increment = 1,
				Unit = "%",
				Callback = function(value)
					str1.SafeCarry.CarryScale = math.clamp(tonumber(value) or 100, 80, 120) / 100
				end,
			})

			pcall(function()
				local mgState = { Handle = nil, Event = nil, Status = "Off", PushedAt = 0, TurnedSteal = false }
				str1.MinigameEgg = mgState
				local mgEvents = {
					{ Flag = "Event_RedLightGreenLight", Prefix = "RLGL", Name = "Red Light Green Light" },
					{ Flag = "Event_TrexRun", Prefix = "TrexRun", Name = "T-Rex Run" },
				}
				local function activeMgEvent()
					for _, ev in ipairs(mgEvents) do
						if workspace:GetAttribute(ev.Flag) == true or typeof(workspace:GetAttribute(ev.Prefix .. "_EggPosition")) == "Vector3" then
							return ev
						end
					end
					return nil
				end
				local function findMgEggUid(pos)
					local eggState = tbl1.EggState
					if type(eggState) ~= "table" or type(eggState.ReadFieldEggs) ~= "function" then return nil end
					local ok, res = pcall(eggState.ReadFieldEggs)
					local recs = ok and type(res) == "table" and res.Records or nil
					if type(recs) ~= "table" then return nil end
					local bestDist, bestUid = 40, nil
					for _, r in pairs(recs) do
						if type(r) == "table" and type(r.Uid) == "string" and r.State ~= "Carried" and r.State ~= "Claimed" then
							local cf = typeof(r.BottomCFrame) == "CFrame" and r.BottomCFrame or (typeof(r.BoundsCFrame) == "CFrame" and r.BoundsCFrame or nil)
							if cf then
								local d = Vector3.new(cf.Position.X - pos.X, 0, cf.Position.Z - pos.Z).Magnitude
								if d < bestDist then
									bestDist, bestUid = d, r.Uid
								end
							end
						end
					end
					return bestUid
				end
				local function clearMgSteal()
					str1.MinigameUid = nil
					if mgState.TurnedSteal and not (str1.Steal and str1.Steal.Carrying) then
						mgState.TurnedSteal = false
						if value2 and type(value2.Set) == "function" then
							pcall(value2.Set, value2, false)
						end
					end
				end
				mgState.Handle = obj14:CreateToggle({
					Name = "Auto Steal Minigame Egg",
					Note = "Red Light Green Light and T-Rex Run: ragdoll TP to the egg, home with Instant Steal if on, else tween 400",
					Default = true,
					Callback = function()
						tbl2.Wake()
					end,
				})
				tbl2.Add(function()
					if not str1.Toggle(mgState.Handle, false) then
						mgState.Status = "Off"
						mgState.Event = nil
						clearMgSteal()
						return false
					end
					local ev = activeMgEvent()
					mgState.Event = ev
					if not ev then
						mgState.Status = "Waiting for Red Light Green Light or T-Rex Run"
						clearMgSteal()
						return false
					end
					local pos = workspace:GetAttribute(ev.Prefix .. "_EggPosition")
					local carrier = workspace:GetAttribute(ev.Prefix .. "_CarrierUserId")
					if carrier == localPlayer.UserId then
						mgState.Status = "Carrying the egg home"
						return false
					end
					if type(carrier) == "number" then
						mgState.Status = "Another player has the egg"
						str1.MinigameUid = nil
						return false
					end
					if typeof(pos) ~= "Vector3" then
						mgState.Status = "Waiting for the egg to land"
						clearMgSteal()
						return false
					end
					local foundUid = findMgEggUid(pos)
					if not foundUid then
						mgState.Status = "Egg landed, looking for it"
						clearMgSteal()
						return false
					end
					if str1.MinigameUid ~= foundUid or os.clock() - mgState.PushedAt >= 2 then
						str1.MinigameUid = foundUid
						mgState.PushedAt = os.clock()
						if type(str1.StealNow) == "function" then
							if not str1.Toggle(value2, false) then
								mgState.TurnedSteal = true
							end
							pcall(str1.StealNow, foundUid, true)
						end
					end
					mgState.Status = "Going for the egg"
					return false
				end)

				local capState = { Handle = nil, TakeHandle = nil, Height = 45, KeepAway = 45, Status = "Off", Generation = 0, LastGrab = 0 }
				str1.CaptureEgg = capState
				local function isCaptureEventActive()
					return workspace:GetAttribute("Event_CaptureTheEgg") == true
						or workspace:GetAttribute("Event_CaptureTheEggGameplay") == true
						or type(workspace:GetAttribute("Event_CaptureTheEggUid")) == "string"
				end
				local function findCaptureEggRecord()
					local eggState = tbl1.EggState
					if type(eggState) ~= "table" or type(eggState.ReadFieldEggs) ~= "function" then return nil end
					local ok, res = pcall(eggState.ReadFieldEggs)
					local recs = ok and type(res) == "table" and res.Records or nil
					if type(recs) ~= "table" then return nil end
					local targetUid = workspace:GetAttribute("Event_CaptureTheEggUid")
					if type(targetUid) == "string" and recs[targetUid] then
						return recs[targetUid]
					end
					for _, r in pairs(recs) do
						if type(r) == "table" and (r.IsCaptureEgg == true or tostring(r.AssetCategory or ""):find("Capture") or tostring(r.EggType or ""):find("Capture")) then
							return r
						end
					end
					return nil
				end
				capState.Handle = obj14:CreateToggle({
					Name = "Auto Capture Event Egg",
					Default = false,
					Callback = function(v)
						capState.Generation += 1
						capState.Status = v and "Waiting for Capture The Egg" or "Off"
						tbl2.Wake()
					end,
				})
				capState.TakeHandle = obj14:CreateToggle({
					Name = "Take It From The Holder",
					Default = true,
					SubOf = capState.Handle,
					Callback = function() tbl2.Wake() end,
				})
				obj14:CreateSlider({
					Name = "Hold Height",
					Min = 20,
					Max = 120,
					Default = 45,
					Increment = 1,
					Unit = "studs",
					SubOf = capState.Handle,
					Callback = function(v) capState.Height = math.clamp(tonumber(v) or 45, 20, 120) end,
				})
				obj14:CreateSlider({
					Name = "Keep Away Distance",
					Min = 20,
					Max = 150,
					Default = 45,
					Increment = 1,
					Unit = "studs",
					SubOf = capState.Handle,
					Callback = function(v) capState.KeepAway = math.clamp(tonumber(v) or 45, 20, 150) end,
				})
				tbl2.Add(function()
					if not str1.Toggle(capState.Handle, false) then
						capState.Status = "Off"
						return false
					end
					if not isCaptureEventActive() then
						capState.Status = "Waiting for Capture The Egg"
						return false
					end
					local rec = findCaptureEggRecord()
					local root = str1.Root()
					local char = localPlayer.Character
					if not rec or not root or not char then
						capState.Status = "Event active, waiting for egg"
						return false
					end
					local carrierId = tonumber(rec.CarrierUserId or rec.OwnerUserId)
					if carrierId == localPlayer.UserId then
						capState.Status = "Holding Event Egg (Keep Away)"
						local basePos = root.Position
						local pushVec = Vector3.zero
						for _, pl in ipairs(Players:GetPlayers()) do
							if pl ~= localPlayer and pl.Character then
								local pr = pl.Character:FindFirstChild("HumanoidRootPart")
								if pr then
									local diff = Vector3.new(basePos.X - pr.Position.X, 0, basePos.Z - pr.Position.Z)
									if diff.Magnitude < capState.KeepAway and diff.Magnitude > 0.01 then
										pushVec += diff.Unit * (capState.KeepAway - diff.Magnitude)
									end
								end
							end
						end
						local targetPos = Vector3.new(basePos.X + pushVec.X, math.max(basePos.Y, 68 + capState.Height), basePos.Z + pushVec.Z)
						pcall(function()
							char:PivotTo(CFrame.new(targetPos))
							root.AssemblyLinearVelocity = Vector3.zero
						end)
						return true
					end
					if carrierId and not str1.Toggle(capState.TakeHandle, true) then
						capState.Status = "Another player is holding the egg"
						return false
					end
					local cf = typeof(rec.BottomCFrame) == "CFrame" and rec.BottomCFrame or (typeof(rec.BoundsCFrame) == "CFrame" and rec.BoundsCFrame or nil)
					if cf and os.clock() - capState.LastGrab >= 0.35 then
						capState.LastGrab = os.clock()
						capState.Status = "Grabbing Capture Event Egg"
						pcall(function()
							char:PivotTo(CFrame.new(cf.Position + Vector3.new(0, 3, 0)))
							if tbl1.EggState and type(tbl1.EggState.CarryFieldEgg) == "function" then
								tbl1.EggState.CarryFieldEgg(rec.Uid, rec.Slot)
							end
						end)
					end
					return false
				end)

				str1.OldSteal = false
				str1.OldStealSpeed = 400
				local oldStealHandle = obj14:CreateToggle({
					Name = "Old Auto Steal",
					Note = "Only works while the running man boost (Admin Treadmill) shows at the bottom of the screen",
					Default = false,
					Callback = function(v)
						str1.OldSteal = v == true
						tbl2.Wake()
					end,
				})
				obj14:CreateSlider({
					Name = "Old Steal Tween Speed",
					Min = 100,
					Max = 1000,
					Default = 400,
					Increment = 25,
					Unit = "studs/s",
					SubOf = oldStealHandle,
					Callback = function(v)
						str1.OldStealSpeed = math.clamp(tonumber(v) or 400, 100, 1000)
					end,
				})
				tbl2.Add(function()
					if not str1.OldSteal then return false end
					local hasAdminTreadmill = workspace:FindFirstChild("AdminTreadmill") ~= nil or localPlayer:GetAttribute("AdminTreadmill") == true
					if not hasAdminTreadmill then return false end
					if str1.Steal and str1.Steal.Carrying and type(str1.FlyTo) == "function" then
						local plot = type(str1.Plot) == "function" and str1.Plot() or nil
						local spawnPart = plot and (plot:FindFirstChild("Spawn") or plot:FindFirstChildWhichIsA("BasePart")) or nil
						if spawnPart then
							pcall(function()
								local root = str1.Root()
								if root and (root.Position - spawnPart.Position).Magnitude > 10 then
									local dir = (spawnPart.Position - root.Position)
									local step = math.min(dir.Magnitude, (str1.OldStealSpeed or 400) * 0.15)
									root.CFrame = CFrame.new(root.Position + dir.Unit * step) * root.CFrame.Rotation
								end
							end)
							return true
						end
					end
					return false
				end)
			end)

			str1.BossPortalUp = function()
				return workspace:FindFirstChild("ScrambleArenaPortal") ~= nil
			end

			str1.AntiGuard.Handle = obj2:CreateState({ Name = "Anti Guard Enabled", Default = false })

			pcall(function()
				str1.AntiGuard.Enabled = str1.AntiGuard.Handle:Get() == true
			end)

			pcall(function()
				str1.AntiGuard.Handle:Subscribe(function(enabled3)
					if type(enabled3) ~= "boolean" then
						enabled3 = str1.AntiGuard.Handle:Get()
					end

					str1.AntiGuard.Enabled = enabled3 == true

					if str1.StealPanelSync then
						pcall(str1.StealPanelSync)
					end

					if str1.AntiGuard.Render and str1.UiDefer then
						str1.UiDefer(function()
							pcall(str1.AntiGuard.Render, false)
						end)
					end
				end)
			end)

			str1.AntiGuard.PanelHandle = obj14:CreateToggle({
				Name = "Anti Guard Panel",
				Default = true,
				Callback = function(panelShown)
					if type(panelShown) ~= "boolean" then
						panelShown = str1.Toggle(str1.AntiGuard.PanelHandle, true)
					end

					str1.AntiGuard.PanelShown = panelShown

					if str1.AntiGuard.ShowPanel then
						pcall(str1.AntiGuard.ShowPanel, panelShown)
					end
				end,
			})

			local flag51
			flag51 = nil
			local value58
			value58 = nil
			local value59
			value59 = nil
			local str6
			str6 = "None"
			local flag52
			flag52 = "Idle"
			local flag53
			flag53 = false
			local n11
			n11 = 0
			local tbl85
			tbl85 = {}
			local n12
			n12 = 20
			local uid
			uid = nil
			local func63

			func63 = function(flag54)
				return flag54 ~= n11 or not str1.Toggle(flag51, false)
			end

			local func64

			do
				local tbl86 = {}

				local function func65(num9)
					if type(num9) ~= "number" or tbl86[num9] then
						return
					end
					tbl86[num9] = true

					task.delay(math.max(0, num9 - workspace:GetServerTimeNow()) + 0.05, function()
						tbl86[num9] = nil
						tbl2.Wake()
					end)
				end

				local n13 = 0

				func64 = function()
					local areaEggCycle = tbl1.AreaEggCycle
					if type(areaEggCycle) ~= "table" then
						return nil
					end

					local ok, result, result2, result3, result4 = pcall(function()
						local serverTimeNow = workspace:GetServerTimeNow()
						local nextResetTime = areaEggCycle.NextResetTime
						return serverTimeNow, areaEggCycle.IsNightPhase(serverTimeNow), areaEggCycle.NextNightTime(serverTimeNow), nextResetTime(serverTimeNow)
					end)

					if not ok or type(result4) ~= "number" then
						return nil
					end

					if result2 == true then
						n13 = result4 + str1.WallOpenDelay()
						func65(n13)
						return n13, "night", result
					end

					if str1.WallSealed() then
						func65(result + 0.3)
						return math.max(n13, result), "wall", result
					end

					if type(result3) == "number" and result3 > result then
						func65(result3)
					end

					return nil
				end
			end

			do
				local areaEggResetWall = tbl1.AreaEggResetWall
				local changed = type(areaEggResetWall) == "table" and areaEggResetWall.Changed or nil

				if changed and type(changed.Connect) == "function" then
					local ok, result = pcall(function()
						return changed:Connect(function()
							tbl2.Wake()
						end)
					end)

					if ok and result then
						func4(function()
							pcall(function()
								result:Disconnect()
							end)
						end)
					end
				end
			end

			local n13
			n13 = 8
			local tbl87
			tbl87 = nil
			local n14
			n14 = 0
			local func66, func67, func68

			local function func69(flag55)
				local tbl88 = {}
				local str7 = "FirstAreaEgg_" .. tostring(localPlayer.UserId)
				local eggState = tbl1.EggState

				if type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function" then
					task.spawn(function()
						local ok, result = pcall(eggState.ReadFieldEggs)

						if ok and type(result) == "table" and type(result.Records) == "table" then
							for _, record in pairs(result.Records) do
								local flag56 = type(record) == "table" and type(record.Uid) == "string"

								if flag56 then
									flag56 = not (flag55 and string.sub(record.Uid, 1, #str7) == str7)
								end

								if flag56 then
									tbl88[record.Uid] = true
								end
							end
						end
					end)
				end

				return tbl88
			end

			func66 = function()
				if tbl87 == nil then
					return false
				end

				if str1.IsNight() then
					return true
				end

				if n14 == math.huge then
					n14 = os.clock() + n13
				end

				return false
			end

			func67 = function()
				if tbl87 and n14 == math.huge then
					return
				end
				tbl87 = func69(true)
				n14 = math.huge
				table.clear(tbl43)
				table.clear(tbl45)
				table.clear(tbl44)
				table.clear(tbl85)
				uid = nil
			end

			func68 = function()
				if not tbl87 then
					return false
				end

				if n14 <= os.clock() then
					tbl87 = nil
					return false
				end
				local result12 = func69()
				if next(result12) == nil then
					return true
				end
				local flag57 = false
				local flag58 = false

				for k in pairs(result12) do
					if tbl87[k] then
						flag57 = true
					else
						flag58 = true
					end
				end

				if not flag57 then
					tbl87 = nil
					return false
				end
				return not flag58
			end

			local func70

			do
				local function func71(param35)
					local directory = tbl1.Assets and tbl1.Assets.Directory
					local flag59 = type(directory) == "table" and directory[tostring(param35)] or nil
					local rarity = type(flag59) == "table" and type(flag59.Rarity) == "table" and flag59.Rarity or nil
					local tbl89 = {}

					if rarity then
						rarity = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					tbl89.RarityNumber = rarity or 0
					tbl89.EarningRate = type(flag59) == "table" and tonumber(flag59.EarningRate) or 0
					return tbl89
				end

				local function func72(flag60)
					local mutations = tbl1.Mutations


					if type(mutations) == "table" and type(mutations.EarningsFor) == "function" then
						local ok, result = pcall(mutations.EarningsFor, type(flag60) == "table" and flag60 or {})
						if ok and type(result) == "number" then
							return result
						end
					end

					return 1
				end

				local function func73(param36, param37)
					local eggRecords = tbl1.EggRecords

					if type(eggRecords) == "table" and type(eggRecords.WeightKgForScale) == "function" then
						local ok, result = pcall(eggRecords.WeightKgForScale, param36, param37)
						if ok and type(result) == "number" then
							return result
						end
					end

					return 0
				end

				func70 = function(flag61, flag62)
					local records = nil
					local eggState = tbl1.EggState

					if type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function" then
						task.spawn(function()
							local ok, result = pcall(eggState.ReadFieldEggs)

							if ok and type(result) == "table" and type(result.Records) == "table" and next(result.Records) ~= nil then
								records = result.Records
							end
						end)
					end

					if not records then
						local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
						if not rfEggWorldAskFieldEggSnapshot or not rfEggWorldAskFieldEggSnapshot:IsA("RemoteFunction") then
							return {}
						end
						local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)
						records = ok and type(result) == "table" and result.Records or nil
					end

					if type(records) ~= "table" then
						return {}
					end
					local tbl90 = {}
					local tbl91 = {}

					for _, record in pairs(records) do
						local uid2 = type(record) == "table" and record.Uid or nil

						if uid2 and record.State ~= "Claimed" then
							tbl91[uid2] = true
						end

						local flag63 = uid2 and (record.State == "Slot" or record.State == "Dropped" or record.State == "Carried" and flag62 == true and flag61 ~= true and not (str1.Steal.Carrying and uid2 == str1.Steal.CarryUid))
						local flag64 = uid2 and tbl43[uid2] or nil
						local flag65 = uid2 and tbl44[uid2] == true or false
						local flag66 = flag61 ~= true and flag37 and uid2 and tbl60[tostring(record.AssetCategory)] or nil
						local flag67 = flag61 ~= true and str1.Steal.RiftPriority == true and uid2 ~= nil and str1.Steal.RiftNeeds[tostring(record.AssetCategory)] == true
						local flag68 = flag61 == true or flag64 ~= nil or flag65 or flag67 or flag66 ~= nil or tbl41[tostring(record.AreaId)] == true
						local flag69 = flag61 ~= true and flag64 == nil and tbl45[uid2] == true
						local flag70 = tbl87 ~= nil and tbl87[uid2] == true
						flag63 = flag63 and typeof(record.BottomCFrame) == "CFrame"

						if flag63 then
							flag63 = (tbl85[uid2] or 0) <= os.clock()
						end

						if flag63 and flag68 and not flag69 and not flag70 then
							local assetCategory2 = func71(record.AssetCategory)
							local assetCategory3 = tostring(record.AssetCategory)
							local flag71 = assetCategory2.RarityNumber >= n8
							local flag72 = next(tbl42) == nil or tbl42[assetCategory3] == true
							local n15 = tonumber(record.AssetScale) or 1
							local mutations3 = func72(record.Mutations)
							local n16 = n15 > 5 and (n15 / 5) ^ 1.2 * 19.637875755794113 or n15 ^ 1.85
							local flag73 = n9 <= 0 or assetCategory2.EarningRate * n16 * mutations3 >= n9
							flag73 = flag71 and flag72 and flag73
							local flag74 = flag67 and not flag73 and not flag65 and flag64 == nil and flag66 == nil
							local lastSkip = flag61 ~= true and str1.SafeCarry.Unsafe({ Uid = uid2, Category = assetCategory3 })

							if lastSkip then
								tbl43[uid2] = nil
								tbl44[uid2] = nil
								str1.SafeCarry.LastSkip = lastSkip
							elseif flag61 == true or flag64 or flag65 or flag67 or flag66 ~= nil or flag73 then
								table.insert(tbl90, {
									Uid = uid2,
									Category = assetCategory3,
									Scale = n15,
									State = record.State,
									Rarity = assetCategory2.RarityNumber,
									Weight = func73(record.AssetCategory, n15),
									Mutation = mutations3,
									Value = assetCategory2.EarningRate * n16 * mutations3,
									CFrame = record.BottomCFrame,
									AreaId = tostring(record.AreaId),
									Rift = flag61 ~= true and flag67,
									RiftOnly = flag61 ~= true and flag74,
									RiftNow = flag61 ~= true and flag74 and str1.Steal.RiftCurrent[assetCategory3] == true,
									Index = flag66,
									Forced = flag61 ~= true and flag64 and flag64.At or nil,
									Priority = flag61 ~= true and flag65,
								})
							end
						end
					end

					if next(tbl91) ~= nil then
						for k in pairs(tbl43) do
							if not tbl91[k] then
								tbl43[k] = nil
							end
						end

						for k in pairs(tbl44) do
							if not tbl91[k] then
								tbl44[k] = nil
							end
						end

						for k in pairs(tbl45) do
							if not tbl91[k] then
								tbl45[k] = nil
							end
						end
					end

					table.sort(tbl90, function(param38, param39)
						if param38.Forced ~= nil ~= param39.Forced ~= nil then
							return param38.Forced ~= nil
						end

						if param38.Forced and param39.Forced and param38.Forced ~= param39.Forced then
							return param38.Forced < param39.Forced
						end

						if param38.Priority ~= param39.Priority then
							return param38.Priority == true
						end

						if param38.RiftOnly ~= param39.RiftOnly then
							return param39.RiftOnly == true
						end

						if param38.RiftOnly and param38.RiftNow ~= param39.RiftNow then
							return param38.RiftNow == true
						end

						if param38.Index ~= nil ~= param39.Index ~= nil then
							return param38.Index ~= nil
						end

						if param38.Index and param39.Index and param38.Index ~= param39.Index then
							return param38.Index > param39.Index
						end

						if flag1 == list2[2] and param38.Weight ~= param39.Weight then
							return param38.Weight > param39.Weight
						end

						if flag1 == list2[3] and param38.Mutation ~= param39.Mutation then
							return param38.Mutation > param39.Mutation
						end

						if flag1 == list2[4] and param38.Value ~= param39.Value then
							return param38.Value > param39.Value
						end

						if flag1 == list2[5] and param38.Value ~= param39.Value then
							return param38.Value < param39.Value
						end

						if param38.Rarity ~= param39.Rarity then
							return param38.Rarity > param39.Rarity
						end

						if param38.Value ~= param39.Value then
							return param38.Value > param39.Value
						end
						return tostring(param38.Uid) < tostring(param39.Uid)
					end)

					return tbl90
				end
			end

			local n15
			n15 = 6
			local func74, func75, func76, func77, func78

			do
				local value60 = nil
				local connection = nil

				func74 = function(part2, num10, num11, num12, flag75)
					local n16 = num10 - part2.Position
					local magnitude = n16.Magnitude
					local n17 = math.max(num12, 0.0041666666666666666)
					local vector = Vector3.zero

					if magnitude > 0.01 then
						vector = n16.Unit * math.min(num11, magnitude / n17)
					end

					local assemblyLinearVelocity = vector + Vector3.new(0, workspace.Gravity * n17 * 0.5, 0)

					if magnitude > 2 then
						if not flag75.mark then
							flag75.mark = magnitude
							flag75.clock = 0
						end

						flag75.clock = flag75.clock + num12

						if flag75.clock >= 0.4 then
							if flag75.mark - magnitude < num11 * 0.1 then
								pcall(function()
									part2.CFrame = part2.CFrame + n16.Unit * math.min(magnitude, num11 * n17)
								end)
							end

							flag75.mark = magnitude
							flag75.clock = 0
						end
					else
						flag75.mark = nil
					end

					pcall(function()
						part2.AssemblyLinearVelocity = assemblyLinearVelocity
						part2.AssemblyAngularVelocity = Vector3.zero
					end)

					return magnitude <= 0.5
				end

				func75 = function()
					local value61 = str1.Root()

					if value61 then
						pcall(function()
							value61.AssemblyLinearVelocity = Vector3.zero
							value61.AssemblyAngularVelocity = Vector3.zero
						end)
					end
				end

				local connection2 = nil
				local tbl92 = {}

				func76 = function()
					value60 = nil

					if connection then
						connection:Disconnect()
						connection = nil
					end

					if connection2 then
						connection2:Disconnect()
						connection2 = nil
					end
				end

				func77 = function()
					local num13 = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
					return num13 ~= nil and num13 > workspace:GetServerTimeNow()
				end

				local flag76 = false

				local function func79()
					if flag76 then
						return true
					end
					return true
				end

				func78 = function(flag77, flag78)
					value60 = flag77
					flag76 = flag78 == true
					if connection or not flag77 then
						return
					end
					tbl92 = {}

					connection = RunService.Heartbeat:Connect(function()
						if not value60 or func79() or func77() or str1.AntiGuard.Busy then
							return
						end
						local flag79 = str1.Root()
						if not flag79 then
							return
						end

						pcall(function()
							local rotation = flag79.CFrame.Rotation
							flag79.CFrame = CFrame.new(value60) * rotation
							flag79.AssemblyLinearVelocity = Vector3.zero
							flag79.AssemblyAngularVelocity = Vector3.zero
						end)
					end)

					connection2 = RunService.PreSimulation:Connect(function(deltaTime)
						if not value60 or not func79() or func77() or str1.AntiGuard.Busy then
							return
						end
						local value62 = str1.Root()

						if value62 then
							func74(value62, value60, 400, deltaTime, tbl92)
						end
					end)
				end
			end

			func4(func76)
			local func80

			func80 = function()
				func76()
				str1.EndFlight()
				str1.GodMode(false)
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoid then
					humanoid.PlatformStand = false
				end
			end

			local n16, func81, func82

			do
				local n17 = 1.5
				n16 = 0.6

				local function func83(param40, param41)
					local x = param41.X
					return (Vector3.new(param40.X, 0, param40.Z) - Vector3.new(x, 0, param41.Z)).Magnitude
				end

				local function func84(obj21)
					local ok, result = pcall(function()
						return obj21:GetPivot().Position
					end)

					return ok and result or nil
				end

				func81 = function(part3, flag80, param42)
					local position3 = func83(part3.Position, param42)
					local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")

					if areaEggSlotsClient then
						for _, child in ipairs(areaEggSlotsClient:GetChildren()) do
							if child:IsA("Model") and child.Name ~= flag80 then
								local flag81 = func84(child)
								if flag81 and func83(flag81, part3.Position) + n17 < position3 then
									return false
								end
							end
						end
					end

					for _, child in ipairs(workspace:GetChildren()) do
						if child:IsA("Model") and child.Name ~= flag80 and #child.Name == 32 and child:FindFirstChild("Hitbox") then
							local flag82 = func84(child)
							if flag82 and func83(flag82, part3.Position) + n17 < position3 then
								return false
							end
						end
					end

					return true
				end

				str1.Steal.WrongEgg = function(carryUid)
					local steal = str1.Steal
					if type(carryUid) ~= "string" or not steal.Carrying or steal.CarryUid == carryUid then
						return false
					end
					local eggState = tbl1.EggState

					if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
						pcall(eggState.DropFieldEgg, "PlayerRequest")
					end

					local n18 = 0

					while steal.Carrying and n18 < 1 do
						n18 += RunService.Heartbeat:Wait()
					end

					steal.Carrying = false
					steal.CarryUid = carryUid
					return true
				end

				func82 = function(param43, param44, flag83)
					local n18 = flag83 or 14
					local value63 = nil
					local value64 = nil

					for _, child in ipairs(workspace:GetChildren()) do
						if child.Name == "SmartPromptPart" and child:IsA("BasePart") then
							local carryAreaEgg = child:FindFirstChild("CarryAreaEgg")

							if carryAreaEgg and carryAreaEgg:IsA("ProximityPrompt") then
								local position4 = func83(child.Position, param44)

								if position4 < n18 then
									n18 = position4
									value63 = carryAreaEgg
									value64 = child
								end
							end
						end
					end

					if not value63 or not value64 then
						return nil
					end

					if type(param43) == "string" and not func81(value64, param43, param44) then
						return nil
					end
					return value63, value64
				end
			end

			local func85

			func85 = function(param45)
				local eggState = tbl1.EggState

				if type(param45) == "string" and type(eggState) == "table" and type(eggState.CarryFieldEgg) == "function" then
					pcall(eggState.CarryFieldEgg, param45)
				end
			end

			local func86

			do
				local function func87()
					local carryUid = str1.Steal.CarryUid
					return type(carryUid) == "string" and carryUid or nil
				end

				local function func88(param46)
					local result13 = func87()
					if not result13 or type(param46) ~= "string" then
						return true
					end
					return result13 == param46
				end

				local function func89(param47)
					if type(param47) ~= "string" then
						return false
					end
					local list13 = func70(false, true)
					if #list13 == 0 then
						return true
					end

					for _, item34 in ipairs(list13) do
						if item34.Uid == param47 then
							return true
						end
					end

					return false
				end

				local function func90(param48)
					local eggState = tbl1.EggState

					if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
						pcall(eggState.DropFieldEgg, "PlayerRequest")
					end

					local n17 = 0

					while str1.Steal.Carrying and n17 < 1 and not func63(param48) do
						n17 += RunService.Heartbeat:Wait()
					end
				end

				func86 = function(param49, param50)
					local n17 = 0

					while not str1.Steal.Carrying and n17 < n16 and not func63(param50) do
						n17 += RunService.Heartbeat:Wait()
					end

					if not str1.Steal.Carrying then
						flag52 = "The egg never reached the hand"
						return false
					end

					if func88(param49) then
						return true
					end
					local result14 = func87()
					if func89(result14) then
						flag52 = "Holding another egg that still matches, delivering it"
						return true
					end
					flag52 = "Wrong egg in hand, dropping it"
					func90(param50)
					return false
				end
			end

			local func91

			func91 = function(part4, param51)
				local eggState = tbl1.EggState
				local position = typeof(part4.CFrame) == "CFrame" and part4.CFrame.Position or nil
				if not position then
					return false
				end
				local n17 = 0
				local huge = math.huge
				local n18 = 0

				while n17 < 1.5 do
					if func63(param51) then
						return false
					end

					if str1.Steal.Carrying and not str1.Steal.WrongEgg(part4.Uid) then
						return true
					end

					if huge >= 0.06 then
						local uid4 = func82(part4.Uid, position)

						if uid4 then
							pcall(function()
								uid4.HoldDuration = 0
							end)

							n18 = 0

							if typeof(fireproximityprompt) == "function" then
								pcall(fireproximityprompt, uid4)
							end
						else
							n18 += 1
							if n18 >= 4 then
								return false
							end

							if type(eggState) == "table" and type(eggState.CarryFieldEgg) == "function" then
								pcall(eggState.CarryFieldEgg, part4.Uid)
							end
						end

						huge = 0
					end

					local result = RunService.Heartbeat:Wait()
					n17 += result
					huge += result
				end

				return str1.Steal.Carrying == true
			end

			local func92

			local value65 = func2(function()
				return ReplicatedStorage.Shared.Modules.Ragdoll
			end)

			func92 = function()
				local character = localPlayer.Character

				if type(value65) == "table" and type(value65.IsRagdolled) == "function" then
					local ok, result = pcall(value65.IsRagdolled, character)
					if ok and result == true then
						return true
					end
				end

				local num14 = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
				if num14 and num14 > workspace:GetServerTimeNow() then
					return true
				end
				character = character and character:FindFirstChildOfClass("Humanoid")
				if character then
					local state = character:GetState()
					return state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.FallingDown
				end
				return false
			end

			local func93

			func93 = function(flag84, param52)
				if str1.Steal.Carrying then
					return true
				end
				local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
				if not rfEggWorldAskFieldEggSnapshot or not rfEggWorldAskFieldEggSnapshot:IsA("RemoteFunction") then
					return false
				end
				local n17 = 0

				while n17 < 1 do
					if func63(param52) or str1.Steal.Carrying then
						return str1.Steal.Carrying == true
					end
					local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)
					ok = ok and type(result) == "table" and result.Records or nil

					if type(ok) == "table" then
						local flag85 = false

						for _, value66 in pairs(ok) do
							if type(value66) == "table" and value66.Uid == flag84 and (value66.State == "Slot" or value66.State == "Dropped") then
								flag85 = true
								break
							end
						end

						if not flag85 then
							return str1.Steal.Carrying == true
						end
					end

					n17 += task.wait(0.3)
				end

				return str1.Steal.Carrying == true
			end

			local func94

			local function func95(part5)
				local flag86 = str1.Root()
				local position = typeof(part5.CFrame) == "CFrame" and part5.CFrame.Position or nil
				if not flag86 or not position then
					return math.huge
				end
				return (flag86.Position - position).Magnitude
			end

			func94 = function(list14)
				local huge = math.huge
				local value67 = nil

				for _, item35 in ipairs(list14) do
					local flag87 = func95(item35)

					if flag87 < huge then
						huge = flag87
						value67 = item35
					end
				end

				return value67, huge
			end

			local n17
			n17 = 20
			local n18
			n18 = 90
			local func96, stealHome, func97, func98, func99, n19

			do
				local n20 = 6

				func96 = function(num15, param53, flag88, flag89, flag90, callback3)
					func76()
					local flag91 = str1.Root()
					if not flag91 then
						return false
					end
					local character = localPlayer.Character
					local position = flag91.Position
					local tbl93 = {}
					local position2 = nil
					local value68 = nil
					local value69 = nil
					local n21 = 0

					local function func100()
						if flag89 ~= nil then
							return true
						end
						return true
					end

					local function func101(param54)
						n21 += param54
						if func63(param53) then
							value68 = false
							return nil
						end

						if flag88 and not str1.Steal.Carrying then
							value68 = false
							value69 = "dropped"
							return nil
						end

						if callback3 then
							local result15 = callback3()

							if result15 then
								value68 = false
								value69 = result15
								return nil
							end
						end

						local flag92 = str1.Root()

						if not flag92 or n21 >= 25 or localPlayer.Character ~= character then
							value68 = false
							value69 = "respawned"
							return nil
						end

						return flag92
					end

					local connection = RunService.Heartbeat:Connect(function(deltaTime)
						if value68 ~= nil or func100() or str1.AntiGuard.Busy then
							return
						end
						local flag93 = func101(deltaTime)
						if not flag93 then
							return
						end

						if n15 < (flag93.Position - position).Magnitude then
							if flag90 then
								value68 = false
								value69 = "displaced"
								return
							end

							position = flag93.Position
						end

						local n22 = (flag89 or 400) * (os.clock() < (str1.SafeCarry.SlowUntil or 0) and str1.SafeCarry.SlowFactor or 1)
						local n23

						if str1.SafeCarry.Enabled and str1.SafeCarry.Pace then
							n23 = math.min(n22, str1.SafeCarry.Pace())
						else
							n23 = n22
						end

						local n24 = num15 - position
						local n25 = n23 * deltaTime
						local flag94 = n24.Magnitude <= math.max(n25, 0.05)
						position = flag94 and num15 or position + n24.Unit * n25
						local vector = Vector3.new(n24.X, 0, n24.Z)
						local cframe = vector.Magnitude > 0.05 and CFrame.lookAt(Vector3.zero, vector.Unit) or flag93.CFrame.Rotation

						pcall(function()
							flag93.CFrame = CFrame.new(position) * cframe
							flag93.AssemblyLinearVelocity = Vector3.zero
							flag93.AssemblyAngularVelocity = Vector3.zero
						end)

						if flag94 then
							value68 = true
						end
					end)

					local connection2 = RunService.PreSimulation:Connect(function(deltaTime)
						if value68 ~= nil or not func100() or str1.AntiGuard.Busy then
							return
						end
						local flag95 = func101(deltaTime)
						if not flag95 then
							return
						end
						local n22 = (flag89 or 400) * (os.clock() < (str1.SafeCarry.SlowUntil or 0) and str1.SafeCarry.SlowFactor or 1)
						local n23

						if str1.SafeCarry.Enabled and str1.SafeCarry.Pace then
							n23 = math.min(n22, str1.SafeCarry.Pace())
						else
							n23 = n22
						end

						if flag90 and position2 and (flag95.Position - position2).Magnitude > n15 + n23 * deltaTime then
							value68 = false
							value69 = "displaced"
							return
						end

						if func74(flag95, num15, n23, deltaTime, tbl93) then
							value68 = true
						end

						position2 = flag95.Position
						position = flag95.Position
					end)

					while value68 == nil do
						RunService.Heartbeat:Wait()
					end

					connection:Disconnect()
					connection2:Disconnect()

					if func100() and not value68 then
						func75()
					end

					if value68 then
						func78(num15, flag89 ~= nil)
					end

					return value68, value69
				end

				local tbl94 = {
					{
						Path = { "GearGiver_Slap", "Podium" },
						Offset = Vector3.new(-16.415, 21.072, -6.106),
					},
					{
						Path = { "World", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003" },
						Offset = Vector3.new(-26.776, 1.75, 18.665),
					},
					{
						Path = {
							"__OBJECTS",
							"Machines",
							"RiftMachine",
							"Rift",
							"Meshes/VoidPortal_Cube.003",
						},
						Offset = Vector3.new(-26.776, 1.75, 18.665),
					},
				}

				stealHome = function()
					for _, item36 in ipairs(tbl94) do
						local obj22 = workspace

						for _, item37 in ipairs(item36.Path) do
							obj22 = obj22 and obj22:FindFirstChild(item37) or nil
						end

						if obj22 and obj22:IsA("BasePart") then
							return obj22.CFrame:PointToWorldSpace(item36.Offset)
						end
					end

					return Vector3.new(528.7, 70.57, -364.11)
				end

				str1.StealHome = stealHome

				str1.InsideBase = function(obj)
					if not obj then
						obj = str1.Root()
						obj = obj and obj.Position
					end

					if obj == nil then
						return false
					end
					local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
					world = world and world:FindFirstChild("Areas")
					world = world and world:FindFirstChild("SeparationLine")
					return obj.X < (world and world:IsA("BasePart") and world.Position.X or 552)
				end

				local function func102(num16)
					if str1.AntiGuard.Busy then
						return false
					end
					local character = localPlayer.Character
					local flag96 = str1.Root()
					if not character or not flag96 then
						return false
					end
					local rotation = flag96.CFrame.Rotation
					local cFrame = CFrame.new(num16) * rotation

					pcall(function()
						character:PivotTo(cFrame)
					end)

					if (flag96.Position - num16).Magnitude > 3 then
						pcall(function()
							flag96.CFrame = cFrame
						end)
					end

					for _, descendant in ipairs(character:GetDescendants()) do
						if descendant:IsA("BasePart") then
							pcall(function()
								descendant.AssemblyLinearVelocity = Vector3.zero
								descendant.AssemblyAngularVelocity = Vector3.zero
							end)
						end
					end

					return true
				end

				local function func103(num17)
					if str1.AntiGuard.Busy then
						return
					end
					local character = localPlayer.Character
					local num18 = str1.Root()
					if not character or not num18 or not num17 then
						return
					end

					if (num18.Position - num17).Magnitude > 6 then
						func102(num17)
						return
					end

					for _, descendant in ipairs(character:GetDescendants()) do
						if descendant:IsA("BasePart") and descendant ~= num18 and (descendant.Position - num18.Position).Magnitude > 12 then
							pcall(function()
								descendant.CFrame = num18.CFrame
								descendant.AssemblyLinearVelocity = Vector3.zero
							end)
						end
					end
				end

				local function func104(param55, param56)
					local n21 = 0

					while true do
						if not (n21 < n20) then
							return not func63(param55)
						else
							if func63(param55) then
								break
							end
							local character = localPlayer.Character
							local result16 = func92()
							local flag97

							if not result16 and character then
								for _, descendant in ipairs(character:GetDescendants()) do
									if descendant:IsA("Constraint") and string.find(descendant.Name, "RagdollConstraint", 1, true) then
										result16 = true
										break
									end
								end

								flag97 = result16
							else
								flag97 = result16
							end

							if not flag97 then
								return not func63(param55)
							end
							func103(param56)
							n21 += RunService.Heartbeat:Wait()
						end
					end

					return false
				end

				local function func105(childName2)
					local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
					world = world and world:FindFirstChild("Areas")
					world = world and world:FindFirstChild("GuardAreas")
					local areaId = world and childName2 and childName2.AreaId and world:FindFirstChild(childName2.AreaId)
					return areaId and areaId:FindFirstChild("Guard") or nil
				end

				func97 = function(param57)
					local obj23 = func105(param57)
					return obj23 ~= nil and obj23:GetAttribute("GuardState") == "Sleeping"
				end

				local n21 = 3

				func98 = function(part6)
					local obj24 = func105(part6)
					local position = typeof(part6.CFrame) == "CFrame" and part6.CFrame.Position or nil
					if not obj24 or not position then
						return nil, nil
					end

					local ok, result = pcall(function()
						return obj24:GetPivot().Position
					end)

					if not ok then
						return nil, nil
					end
					local vector = Vector3.new(position.X - result.X, 0, position.Z - result.Z)
					if vector.Magnitude < 0.1 then
						return nil, nil
					end
					local n22 = result + vector.Unit * n21
					return Vector3.new(n22.X, position.Y + 3, n22.Z), result
				end

				local function func106(param58, param59)
					local tbl95 = { Landed = false, Destination = param59 }
					local antiGuard = str1.AntiGuard
					antiGuard.HitArms = antiGuard.HitArms + 1
					str1.AntiGuard.HitArmedAt = os.clock()

					tbl95.Link = localPlayer:GetAttributeChangedSignal("RagdollEndTime"):Connect(function()
						if tbl95.Landed or func63(param58) then
							return
						end
						local num19 = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
						if not num19 or num19 <= workspace:GetServerTimeNow() then
							return
						end
						local num20 = str1.Root()
						if not num20 then
							return
						end
						tbl95.Landed = true
						func76()
						str1.SafeCarry.JumpDistance = (tbl95.Destination - num20.Position).Magnitude
						str1.SafeCarry.JumpAt = os.clock()

						pcall(function()
							num20.CFrame = CFrame.new(tbl95.Destination)
							num20.AssemblyLinearVelocity = Vector3.zero
						end)
					end)

					tbl95.Stop = function()
						if tbl95.Link then
							tbl95.Link:Disconnect()
							tbl95.Link = nil
							str1.AntiGuard.HitArms = math.max(0, str1.AntiGuard.HitArms - 1)
						end
					end

					return tbl95
				end

				func99 = function(param60, flag98, callback4)
					local character = localPlayer.Character
					character = character and character:FindFirstChildOfClass("Humanoid")

					if character then
						character.PlatformStand = false
					end

					local n22 = 0
					local value70 = nil

					while true do
						if not flag98.Landed and n22 < n17 then
							if not func63(param60) then
								if callback4 then
									callback4(flag98)
								end

								if not str1.Steal.Carrying then
									value70 = value70 or n22
									if not (n22 - value70 > 1) then
										n22 += RunService.Heartbeat:Wait()
										continue
									end
								else
									n22 += RunService.Heartbeat:Wait()
									continue
								end
							end
						end

						break
					end

					flag98.Stop()
					return flag98.Landed
				end

				n19 = 20

				local function func107(part7, param61, param62, param63)
					local position = typeof(part7.CFrame) == "CFrame" and part7.CFrame.Position or nil
					if not position then
						return false
					end
					local n22 = 0
					local huge = math.huge

					while n22 < param62 do
						if func63(param61) then
							return false
						end

						if str1.Steal.Carrying and not str1.Steal.WrongEgg(part7.Uid) then
							return true
						end

						if huge >= 0.1 then
							local uid5 = func82(part7.Uid, position)

							if uid5 then
								pcall(function()
									uid5.HoldDuration = 0
								end)

								if typeof(fireproximityprompt) == "function" then
									pcall(fireproximityprompt, uid5)
								end
							else
								func85(part7.Uid)
							end

							huge = 0
						end

						if param63 then
							func103(param63)
						end

						local result = RunService.Heartbeat:Wait()
						n22 += result
						huge += result
					end

					return str1.Steal.Carrying == true
				end

				local function func108(part8, param64, param65, part9)
					local position = typeof(part8.CFrame) == "CFrame" and part8.CFrame.Position or nil
					if not position then
						return false
					end
					local n22 = position + Vector3.new(0, 3, 0)
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")

					if humanoid and character:FindFirstChildWhichIsA("Tool") then
						pcall(function()
							humanoid:UnequipTools()
						end)
					end

					if param65 then
						func78(n22, true)
						flag52 = "Waiting to stand up"
						if not func104(param64, n22) then
							return false
						end

						if str1.SafeCarry.Enabled and part9 == nil and str1.SafeCarry.Settle then
							if not str1.SafeCarry.Settle(param64, part8) then
								return false
							end
						end
					else
						flag52 = "Jumping to the egg"
						local num21 = str1.Root()

						if num21 and (n22 - num21.Position).Magnitude <= n18 then
							pcall(function()
								local rotation = num21.CFrame.Rotation
								num21.CFrame = CFrame.new(n22) * rotation
								num21.AssemblyLinearVelocity = Vector3.zero
								num21.AssemblyAngularVelocity = Vector3.zero
							end)
						elseif not func96(n22, param64, nil, 400) then
							return false
						end
					end

					if func63(param64) then
						return false
					end
					local flag99 = part9 and typeof(part9.CFrame) == "CFrame"
					local value71 = nil

					if flag99 then
						value71 = func106(param64, part9.CFrame.Position + Vector3.new(0, 3, 0))
					end

					local str8 = "FirstAreaEgg_" .. tostring(localPlayer.UserId)
					local uid6 = type(part8.Uid) == "string" and string.sub(part8.Uid, 1, #str8) == str8 and string.match(part8.Uid, "_([%w ]+:Slot_%d+)$") or nil
					part9 = part9 and uid6
					local flag100 = false

					if part9 then
						local eggState = tbl1.EggState

						if type(eggState) == "table" and type(eggState.CarryFieldEgg) == "function" then
							flag52 = "Taking the starter egg"

							task.spawn(function()
								pcall(eggState.CarryFieldEgg, part8.Uid, uid6)
							end)

							local n23 = 0

							while not str1.Steal.Carrying and n23 < 0.8 do
								if func63(param64) then
									return false
								end
								n23 += RunService.Heartbeat:Wait()
							end

							flag100 = str1.Steal.Carrying == true
						end
					end

					if not flag100 then
						flag52 = "Taking the egg"
						flag100 = func91(part8, param64)

						if not flag100 and not func63(param64) then
							func96(n22, param64, nil, 400)
							flag100 = func91(part8, param64)
						end
					end

					if not flag100 and not func93(part8.Uid, param64) then
						if value71 then
							value71.Stop()
						end

						tbl85[part8.Uid] = os.clock() + n12
						flag52 = "That egg would not come free"
						return false
					end

					if value71 then
						local reGuardPatrolForestStrike = networking:FindFirstChild("RE/GuardPatrol/ForestStrike")
						local obj25 = func105(part8) or func105({ AreaId = "Forest" })
						local humanoidRootPart = obj25 and obj25:FindFirstChild("HumanoidRootPart")

						if reGuardPatrolForestStrike and reGuardPatrolForestStrike:IsA("RemoteEvent") and humanoidRootPart then
							flag52 = "Calling the guard strike"

							pcall(function()
								reGuardPatrolForestStrike:FireServer({ EggUid = part8.Uid, GuardCFrame = humanoidRootPart.CFrame })
							end)
						end
					end

					str1.Steal.LastFinishedAt = os.clock()
					return true, value71
				end

				local huge = math.huge
				local huge2 = math.huge

				local function func109(num22, param66, param67)
					local value72 = nil
					local value73 = nil

					for _, child in ipairs(workspace:GetChildren()) do
						if child.Name == "SmartPromptPart" and child:IsA("BasePart") then
							local carryAreaEgg = child:FindFirstChild("CarryAreaEgg")

							if carryAreaEgg and carryAreaEgg:IsA("ProximityPrompt") then
								local magnitude = (child.Position - num22).Magnitude

								if magnitude < param66 then
									param66 = magnitude
									value72 = carryAreaEgg
									value73 = child
								end
							end
						end
					end

					if value72 and value73 and type(param67) == "string" and not func81(value73, param67, num22) then
						return nil
					end
					return value72, value73
				end

				local function func110(childName3)
					local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
					local obj26 = workspace:FindFirstChild(childName3) or areaEggSlotsClient and areaEggSlotsClient:FindFirstChild(childName3)
					if not obj26 then
						return nil
					end

					local ok, result = pcall(function()
						return obj26:GetPivot().Position
					end)

					return ok and result or nil
				end

				local function func111(flag101)
					local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
					if not rfEggWorldAskFieldEggSnapshot or not rfEggWorldAskFieldEggSnapshot:IsA("RemoteFunction") then
						return nil
					end
					local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)
					local records = ok and type(result) == "table" and result.Records or nil
					if type(records) ~= "table" then
						return nil
					end

					for _, record in pairs(records) do
						if type(record) == "table" and record.Uid == flag101 and typeof(record.BottomCFrame) == "CFrame" then
							return record.BottomCFrame.Position, true
						end
					end

					return nil, true
				end

				local function func112(childName4)
					local obj27 = workspace:FindFirstChild(childName4)
					if not obj27 then
						return false
					end

					for _, descendant in ipairs(obj27:GetDescendants()) do
						if descendant:IsA("JointInstance") or descendant:IsA("WeldConstraint") or descendant:IsA("RigidConstraint") then
							local ok, result, result2 = pcall(function()
								return descendant.Part0, descendant.Part1
							end)

							if ok then
								for _, item38 in ipairs({ result, result2 }) do
									if typeof(item38) == "Instance" and not item38:IsDescendantOf(obj27) then
										local model = item38:FindFirstAncestorOfClass("Model")
										if model and model ~= localPlayer.Character and Players:GetPlayerFromCharacter(model) then
											return true
										end
									end
								end
							end
						end
					end

					return false
				end

				local function func113(param68, param69)
					local state = 1
					local value74, carryUid, n22, vector, connection, n23, n24, huge3, num23, num24, n25, huge4, flag102, num25, num26, value75, now, flag103, n26, flag104, flag105, value76

					while true do
						if state == 1 then
							value74 = param68
							carryUid = param69

							if carryUid then
								state = 3
							else
								state = 2
							end
						elseif state == 2 then
							carryUid = str1.Steal.CarryUid
							state = 3
						elseif state == 3 then
							if type(carryUid) ~= "string" then
								state = 49
							else
								state = 4
							end
						elseif state == 4 then
							func76()
							flag52 = "Following the egg"
							n22 = nil
							vector = Vector3.zero

							connection = RunService.PreSimulation:Connect(function(deltaTime)
								local num27 = str1.Root()
								if not num27 or not n22 or str1.Steal.Carrying or func63(value74) then
									return
								end

								if func77() then
									if not str1.SafeCarry.Enabled and (num27.Position - n22).Magnitude > 2 then
										func102(n22)
									end

									return
								end

								local n27 = math.max(deltaTime, 0.0041666666666666666)
								local n28 = vector + (n22 - num27.Position) / math.max(0.08, n27)
								local enabled = str1.SafeCarry.Enabled and str1.SafeCarry.Pace() or n7 + vector.Magnitude

								if enabled < n28.Magnitude then
									n28 = n28.Unit * enabled
								end

								local assemblyLinearVelocity = n28 + Vector3.new(0, workspace.Gravity * n27 * 0.5, 0)

								pcall(function()
									num27.AssemblyLinearVelocity = assemblyLinearVelocity
									num27.AssemblyAngularVelocity = Vector3.zero
								end)
							end)

							n23 = 0
							n24 = 0
							huge3 = math.huge
							num23 = nil
							num24 = nil
							n25 = 0
							huge4 = math.huge
							state = 5
						elseif state == 5 then
							flag102 = false

							if not (n23 < huge2) then
								state = 46
							else
								state = 6
							end
						elseif state == 6 then
							if func63(value74) then
								state = 46
							else
								state = 7
							end
						elseif state == 7 then
							if str1.Steal.Carrying then
								state = 8
							else
								state = 11
							end
						elseif state == 8 then
							if str1.Steal.WrongEgg(carryUid) then
								state = 10
							else
								state = 9
							end
						elseif state == 9 then
							flag102 = true
							state = 46
						elseif state == 10 then
							flag52 = "Picked up the wrong egg, dropped it"
							state = 11
						elseif state == 11 then
							num25 = str1.Root()

							if not num25 then
								state = 46
							else
								state = 12
							end
						elseif state == 12 then
							num26 = func110(carryUid)

							if num26 then
								state = 19
							else
								state = 13
							end
						elseif state == 13 then
							if not (huge3 >= 0.5) then
								state = 20
							else
								state = 14
							end
						elseif state == 14 then
							num26, value75 = func111(carryUid)

							if num26 then
								state = 18
							else
								state = 15
							end
						elseif state == 15 then
							huge3 = 0

							if value75 then
								state = 16
							else
								state = 20
							end
						elseif state == 16 then
							n24 += 1

							if not (n24 >= 4) then
								state = 20
							else
								state = 17
							end
						elseif state == 17 then
							flag52 = "The egg is gone"
							state = 46
						elseif state == 18 then
							n24 = 0
							huge3 = 0
							state = 20
						elseif state == 19 then
							n24 = 0
							state = 20
						elseif state == 20 then
							if num26 then
								state = 21
							else
								state = 30
							end
						elseif state == 21 then
							now = os.clock()

							if num23 then
								state = 23
							else
								state = 22
							end
						elseif state == 22 then
							flag103 = num23
							state = 24
						elseif state == 23 then
							flag103 = num24
							state = 24
						elseif state == 24 then
							if flag103 then
								state = 25
							else
								state = 26
							end
						elseif state == 25 then
							flag103 = now > num24
							state = 26
						elseif state == 26 then
							if flag103 then
								state = 27
							else
								state = 29
							end
						elseif state == 27 then
							n26 = (num26 - num23) / math.max(now - num24, 0.0041666666666666666)

							if not (n26.Magnitude < 3000) then
								state = 29
							else
								state = 28
							end
						elseif state == 28 then
							vector = vector:Lerp(n26, 0.3)
							state = 29
						elseif state == 29 then
							n22 = num26 + Vector3.new(0, 3, 0)
							num23 = num26
							num24 = now
							state = 30
						elseif state == 30 then
							if not (n25 >= 0.4) then
								state = 34
							else
								state = 31
							end
						elseif state == 31 then
							if func112(carryUid) then
								state = 33
							else
								state = 32
							end
						elseif state == 32 then
							flag52 = "Egg dropped, taking it back"
							n25 = 0
							state = 34
						elseif state == 33 then
							flag52 = "Another player has the egg, following it until it drops"
							n25 = 0
							state = 34
						elseif state == 34 then
							if n22 then
								state = 36
							else
								state = 35
							end
						elseif state == 35 then
							flag104 = n22
							state = 37
						elseif state == 36 then
							flag104 = (n22 - num25.Position).Magnitude <= n19
							state = 37
						elseif state == 37 then
							if flag104 then
								state = 39
							else
								state = 38
							end
						elseif state == 38 then
							flag105 = flag104
							state = 40
						elseif state == 39 then
							flag105 = huge4 >= 0.1
							state = 40
						elseif state == 40 then
							if flag105 then
								state = 41
							else
								state = 45
							end
						elseif state == 41 then
							value76 = func109(n22 - Vector3.new(0, 3, 0), 6, carryUid)


							if value76 then
								state = 43
							else
								state = 42
							end
						elseif state == 42 then
							task.spawn(func85, carryUid)
							huge4 = 0
							state = 45
						elseif state == 43 then
							pcall(function()
								value76.HoldDuration = 0
							end)

							huge4 = 0

							if typeof(fireproximityprompt) ~= "function" then
								state = 45
							else
								state = 44
							end
						elseif state == 44 then
							pcall(fireproximityprompt, value76)
							state = 45
						elseif state == 45 then
							local result = RunService.Heartbeat:Wait()
							n23 += result
							huge4 += result
							huge3 += result
							n25 += result
							state = 5
						elseif state == 46 then
							connection:Disconnect()
							func75()

							if flag102 then
								state = 48
							else
								state = 47
							end
						elseif state == 47 then
							flag102 = str1.Steal.Carrying == true
							state = 48
						elseif state == 48 then
							return flag102
						elseif state == 49 then
							return false
						end
					end
				end

				local function func114(part10, param70)
					local position = typeof(part10.CFrame) == "CFrame" and part10.CFrame.Position or nil
					if not position then
						return false
					end

					if str1.InsideBase() and not str1.InsideBase(position) then
						local result17 = stealHome()

						if result17 then
							flag52 = "Leaving the base through the safe zone"
							if not func96(result17 + Vector3.new(0, 3, 0), param70, nil, 400) then
								return false
							end
						end
					end

					flag52 = "Flying to the egg"
					if not func96(position + Vector3.new(0, 3, 0), param70, nil, 400) then
						return false
					end
					flag52 = "Taking the egg"
					local flag106 = func107(part10, param70, 0.6, nil)

					if not flag106 and not func63(param70) then
						flag106 = func91(part10, param70)
					end

					if not flag106 and not func93(part10.Uid, param70) then
						tbl85[part10.Uid] = os.clock() + n12
						return false
					end
					str1.Steal.LastFinishedAt = os.clock()
					return true
				end

				local tbl96 = { Uid = nil, Freed = nil, Token = nil }
				local n22 = 3

				local function func115()
					local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
					world = world and world:FindFirstChild("Areas")
					local guardAreas = world and world:FindFirstChild("GuardAreas")
					local num28 = str1.Root()
					if not guardAreas or not num28 then
						return nil
					end
					local userId3 = tostring(localPlayer.UserId)
					local carryAreaId = str1.Steal.CarryAreaId and func105({ AreaId = tostring(str1.Steal.CarryAreaId) }) or nil
					local huge3 = math.huge
					local value77 = nil

					for _, child in ipairs(guardAreas:GetChildren()) do
						local guard = child:FindFirstChild("Guard")

						if guard then
							if tostring(guard:GetAttribute("TargetPlayer")) == userId3 or tostring(guard:GetAttribute("WakeTargetPlayer")) == userId3 then
								return guard
							end

							local ok, result = pcall(function()
								return guard:GetPivot().Position
							end)

							if ok then
								local magnitude = (result - num28.Position).Magnitude

								if magnitude < huge3 then
									value77 = guard
									huge3 = magnitude
								end
							end
						end
					end

					return carryAreaId or value77
				end

				local function func116(param71, param72, num29)
					local result18 = func115()
					if not result18 then
						return false
					end
					local flag107 = func106(param71, num29 + Vector3.new(0, 3, 0))
					local n23 = 0

					while true do
						if not flag107.Landed and n23 < n17 and not func63(param71) then
							local ok, result = pcall(function()
								return result18:GetPivot().Position
							end)

							local num30 = str1.Root()

							if not (not ok or not num30) then
								if n21 + 5 < (result - num30.Position).Magnitude then
									local vector = Vector3.new(num30.Position.X - result.X, 0, num30.Position.Z - result.Z)
									local n24 = result + (vector.Magnitude > 0.1 and vector.Unit * n21 or Vector3.zero)

									func96(Vector3.new(n24.X, result.Y + 3, n24.Z), param71, nil, 400, true, function()
										if flag107.Landed then
											return "hit"
										end
										return nil
									end)
								end

								n23 += RunService.Heartbeat:Wait()
								continue
							end
						end

						break
					end

					flag107.Stop()
					if not flag107.Landed then
						return false
					end
					return func113(param71, param72)
				end

				str1.SafeCarry.Dangers = {}
				str1.SafeCarry.DangerAt = 0

				str1.SafeCarry.RefreshDangers = function()
					local safeCarry = str1.SafeCarry
					local dangerAt = safeCarry.DangerAt
					if os.clock() - dangerAt < 1 then
						return safeCarry.Dangers
					end
					safeCarry.DangerAt = os.clock()
					local dangers = {}

					local function func117(part11)
						local ok, result, result2 = pcall(function()
							if part11:IsA("Model") then
								return part11:GetBoundingBox()
							end

							if part11:IsA("BasePart") then
								return part11.CFrame, part11.Size
							end
						end)

						if ok and result and result2 then
							local abs = math.abs
							local z = result2.Z
							local n23 = Vector3.new(math.abs(result2.X), 0, abs(z)) * 0.5
							local num31 = (result - result.Position):VectorToWorldSpace(n23)
							local x = n23.X
							local z2 = n23.Z
							local n24 = math.max(math.abs(num31.X), x, z2)
							local x2 = n23.X
							local z3 = n23.Z
							local n25 = math.max(math.abs(num31.Z), x2, z3)

							table.insert(dangers, {
								MinX = result.Position.X - n24,
								MaxX = result.Position.X + n24,
								MinZ = result.Position.Z - n25,
								MaxZ = result.Position.Z + n25,
								Name = part11.Name,
							})
						end
					end

					local function func118(flag108)
						if flag108 == "ScrambleLocalVisuals" or flag108 == "DrScrambleEvent" then
							return false
						end
						local lowered3 = string.lower(flag108)
						return string.find(lowered3, "portal", 1, true) or string.find(lowered3, "teleport", 1, true) or string.find(lowered3, "mech", 1, true) or string.find(lowered3, "arena", 1, true) or string.find(lowered3, "scramble", 1, true)
					end

					for _, child in ipairs(workspace:GetChildren()) do
						if (child:IsA("Model") or child:IsA("BasePart") or child:IsA("Folder")) and func118(child.Name) then
							if child:IsA("Folder") then
								for _, child2 in ipairs(child:GetChildren()) do
									func117(child2)
								end
							else
								func117(child)
							end
						end
					end

					local world = workspace:FindFirstChild("World")
					local build = world and world:FindFirstChild("Build")

					if build then
						for _, child in ipairs(build:GetChildren()) do
							if func118(child.Name) then
								for _, child2 in ipairs(child:GetChildren()) do
									func117(child2)
								end
							end
						end
					end

					safeCarry.Dangers = dangers
					return dangers
				end

				str1.SafeCarry.Avoid = function(obj, param73)
					for _, refreshDanger in ipairs(str1.SafeCarry.RefreshDangers()) do
						local n23 = refreshDanger.MinX - 12
						local n24 = refreshDanger.MaxX + 12
						local n25 = refreshDanger.MinZ - 12
						local n26 = refreshDanger.MaxZ + 12
						local value78, value79, value80 = ipairs({ { obj.X, param73.X - obj.X, n23, n24 }, { obj.Z, param73.Z - obj.Z, n25, n26 } })
						local flag109 = true
						local n27 = 0
						local n28 = 1

						for _, value81 in value78, value79, value80 do
							local first4 = value81[1]
							local second3 = value81[2]
							local third1 = value81[3]
							local entry3 = value81[4]

							if math.abs(second3) < 1e-06 then
								if first4 < third1 or first4 > entry3 then
									flag109 = false
								end
							else
								local n29 = (third1 - first4) / second3
								local n30 = (entry3 - first4) / second3

								if not (n30 < n29) then
									local value82 = n30
									n30 = n29
									n29 = value82
								end

								local n31 = math.max(n27, n30)
								local n32 = math.min(n28, n29)

								if not (n32 < n31) then
									n28 = n32
									n27 = n31
								else
									flag109 = false
									n28 = n32
									n27 = n31
								end
							end
						end

						if flag109 and not (obj.X >= n23 and obj.X <= n24 and obj.Z >= n25 and obj.Z <= n26) then
							local n29 = n25 - 2
							local n30 = n26 + 2
							local num32 = math.abs(obj.Z - n29) <= math.abs(obj.Z - n30) and n29 or n30

							if num32 < -440 or num32 > -290 then
								num32 = num32 == n29 and n30 or n29
							end

							local num33 = math.abs(obj.X - n23) <= math.abs(obj.X - n24) and n23 or n24

							if math.abs(obj.Z - num32) < 3 then
								num33 = math.abs(param73.X - n23) <= math.abs(param73.X - n24) and n23 or n24
							end

							return Vector3.new(num33, param73.Y, num32), refreshDanger.Name
						end
					end

					return param73, nil
				end

				str1.SafeCarry.NewHuman = function(flag110)
					local safeCarry = str1.SafeCarry
					local laneOffset = safeCarry.LaneOffset
					local num34

					num34 = {
						Clock = 0,
						Factor = 1,
						Target = 1,
						NextShift = 0,
						Phase = math.random() * 3.1415926535897931 * 2,
						Period = 2 + math.random() * 2.5,
						PauseUntil = 0,
						Lane = (math.random() * 2 - 1) * laneOffset,
						Step = function(num35, flag111, flag112)
							num34.Clock = num34.Clock + num35

							if num34.NextShift <= num34.Clock then
								num34.NextShift = num34.Clock + 0.5 + math.random()
								local n23 = math.max(safeCarry.SpeedJitter, 0)

								if flag110 then
									num34.Target = 1 - math.random() * n23
								else
									num34.Target = 1 + (math.random() * 2 - 1) * n23
								end
							end

							num34.Factor = num34.Factor + (num34.Target - num34.Factor) * math.min(num35 * 3, 1)
							local wobble = safeCarry.Wobble
							local n23 = math.sin(num34.Clock * 2 * 3.1415926535897931 / num34.Period + num34.Phase) * wobble
							flag112 = flag112 and flag111 and safeCarry.JumpsPerMinute > 0

							if flag112 then
								local n24 = safeCarry.JumpsPerMinute / 60 * num35
								flag112 = math.random() < n24
							end

							if flag112 then
								pcall(function()
									flag111.Jump = true
								end)
							end

							local flag113 = false

							if not flag110 then
								if num34.Clock < num34.PauseUntil then
									flag113 = true
								else
									local flag114 = safeCarry.PausesPerMinute > 0

									if flag114 then
										local n24 = safeCarry.PausesPerMinute / 60 * num35
										flag114 = math.random() < n24
									end

									if flag114 then
										num34.PauseUntil = num34.Clock + 0.3 + math.random() * 0.9
										flag113 = true
									end
								end
							end

							return num34.Factor, num34.Lane + n23, flag113
						end,
					}

					return num34
				end

				str1.SafeCarry.React = function(param74, param75)
					local n23 = math.max(0, math.min(param74, param75))
					local n24 = math.max(param74, param75, 0)
					return n23 + math.random() * (n24 - n23)
				end

				str1.SafeCarry.RunTo = function(obj, param76)
					local safeCarry = str1.SafeCarry
					local position = typeof(obj.CFrame) == "CFrame" and obj.CFrame.Position or nil
					if not position then
						return false
					end
					func76()
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")

					if humanoid then
						humanoid.PlatformStand = false

						if character:FindFirstChildWhichIsA("Tool") then
							pcall(function()
								humanoid:UnequipTools()
							end)
						end
					end

					local num36 = safeCarry.NewHuman(false)
					local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
					world = world and world:FindFirstChild("Areas")
					world = world and world:FindFirstChild("SeparationLine")
					local x = world and world:IsA("BasePart") and world.Position.X or 552
					local result19 = stealHome()
					local position2 = str1.Root()
					local str9 = "field"
					local z = position2 and position2.Position.Z or position.Z

					if position2 and result19 and position2.Position.X < x - 2 then
						z = result19.Z

						if (Vector3.new(position2.Position.X, 0, position2.Position.Z) - Vector3.new(result19.X, 0, result19.Z)).Magnitude > 20 then
							str9 = "safe"
						end
					end

					local n23 = math.clamp(z + num36.Lane, -425, -300)
					local n24 = position.Y + 3

					local function func119(num37)
						local flag115 = str1.Root()
						local character2 = localPlayer.Character
						local flag116 = not flag115 or not character2 or math.abs(flag115.Position.Y - num37) < 1
						local flag117

						if flag116 then
							flag117 = flag116
						else
							local snapLimit = safeCarry.SnapLimit
							flag117 = math.abs(flag115.Position.Y - num37) > snapLimit
						end

						if flag117 then
							return false
						end

						pcall(function()
							local rotation = flag115.CFrame.Rotation
							character2:PivotTo(CFrame.new(Vector3.new(flag115.Position.X, num37, flag115.Position.Z)) * rotation)
							flag115.AssemblyLinearVelocity = Vector3.new(flag115.AssemblyLinearVelocity.X, 0, flag115.AssemblyLinearVelocity.Z)
						end)

						return true
					end

					local function func120()
						if safeCarry.RunHeight <= 0.5 then
							return
						end
						func119(n24 + safeCarry.RunHeight)
					end

					if str9 == "field" then
						func120()
					end

					local now = os.clock()
					local now2 = os.clock()
					local now3 = os.clock()
					position2 = position2 and position2.Position or nil

					local function func121(part12, param77, num38, flag118)
						local vector = Vector3.new(param77.X - part12.Position.X, 0, param77.Z - part12.Position.Z)
						local magnitude = vector.Magnitude
						local unit = magnitude > 0.01 and vector.Unit or Vector3.zero

						if safeCarry.RunHeight > 0.5 and str9 == "field" and not flag118 then
							local runSpeed = safeCarry.RunSpeed
							local n25 = math.max(str1.WalkSpeed() * runSpeed * num38, 8)
							local n26 = math.clamp(safeCarry.ClimbShare, 0.1, 0.9)
							local magnitude2 = Vector3.new(position.X - part12.Position.X, 0, position.Z - part12.Position.Z).Magnitude

							if magnitude2 <= 3 then
								if func119(n24) then
									return
								end
							end

							local n27 = magnitude2 <= 3 and n24 or n24 + safeCarry.RunHeight
							if math.abs(n27 - part12.Position.Y) > 2 and func119(n27) then
								return
							end
							local n28 = math.clamp((n27 - part12.Position.Y) / 0.12, -n25 * n26, n25 * n26)
							local n29 = unit * math.min(math.sqrt(math.max(n25 * n25 - n28 * n28, 0)), magnitude / 0.05)

							pcall(function()
								part12.AssemblyLinearVelocity = Vector3.new(n29.X, n28, n29.Z)
							end)

							return
						end

						pcall(function()
							if flag118 or magnitude <= 0.01 then
								if humanoid then
									if safeCarry.RunStyle == "Walk" then
										humanoid:MoveTo(part12.Position)
									end

									humanoid:Move(Vector3.zero, false)
								end

								if safeCarry.RunStyle ~= "Walk" then
									part12.AssemblyLinearVelocity = Vector3.new(0, part12.AssemblyLinearVelocity.Y, 0)
								end
							elseif safeCarry.RunStyle == "Walk" then
								if humanoid then
									humanoid:MoveTo(part12.Position + unit * math.min(magnitude, 30))
								end
							else
								local runSpeed = safeCarry.RunSpeed
								local n25 = unit * math.min(math.max(str1.WalkSpeed() * runSpeed * num38, 8), magnitude / 0.05)
								part12.AssemblyLinearVelocity = Vector3.new(n25.X, part12.AssemblyLinearVelocity.Y, n25.Z)

								if safeCarry.RunAnimate and humanoid then
									humanoid:Move(unit, false)
								end
							end
						end)
					end

					while os.clock() - now < 240 do
						if func63(param76) then
							return false
						end
						local num39 = str1.Root()
						if not num39 then
							return false
						end
						local now4 = os.clock()
						local n25 = math.max(now4 - now2, 0.0041666666666666666)
						local vector = Vector3.new(position.X - num39.Position.X, 0, position.Z - num39.Position.Z)
						if str9 == "field" and vector.Magnitude <= 2.5 and (safeCarry.RunHeight <= 0.5 or num39.Position.Y - n24 < 4) then
							break
						end
						local value83, num40, flag119 = num36.Step(n25, humanoid, humanoid and humanoid.FloorMaterial ~= Enum.Material.Air)

						if vector.Magnitude <= 15 then
							flag119 = false
						end

						local vector2 = position

						if str9 == "safe" and result19 then
							if (Vector3.new(result19.X, 0, result19.Z) - Vector3.new(num39.Position.X, 0, num39.Position.Z)).Magnitude <= 6 then
								str9 = "field"
								func120()
							end

							flag52 = "Walking out to the safe zone"
							vector2 = result19
						else
							if not safeCarry.StraightRun and safeCarry.RunHeight <= 0.5 and math.abs(position.X - num39.Position.X) > 25 then
								vector2 = Vector3.new(position.X, position.Y, math.clamp(n23 + num40, -425, -300))
							end

							flag52 = string.format("Running to the egg, %d studs left", math.floor(vector.Magnitude + 0.5))
						end

						local value84, value85 = safeCarry.Avoid(num39.Position, vector2)

						if value85 then
							flag52 = "Walking around " .. tostring(value85)
						end

						func121(num39, value84, value83, flag119)

						if now4 - now3 >= 1.5 then
							if not flag119 and position2 and (num39.Position - position2).Magnitude < 3 and humanoid then
								pcall(function()
									humanoid.Jump = true
								end)
							end

							position2 = num39.Position
							now3 = now4
						end

						RunService.Heartbeat:Wait()
						now2 = now4
					end

					local value86 = str1.Root()

					if value86 then
						func121(value86, value86.Position, 1, true)
					end

					local vector = nil

					if value86 then
						local vector2 = Vector3.new(value86.Position.X - position.X, 0, value86.Position.Z - position.Z)
						local vector3 = vector2.Magnitude > 0.1 and vector2.Unit * 2 or Vector3.zero
						vector = Vector3.new(position.X + vector3.X, value86.Position.Y, position.Z + vector3.Z)
					end

					local connection = RunService.Heartbeat:Connect(function()
						local num41 = str1.Root()
						if not num41 or not vector or str1.Steal.Carrying or str1.AntiGuard.Busy then
							return
						end
						local vector2 = Vector3.new(vector.X - num41.Position.X, 0, vector.Z - num41.Position.Z)

						pcall(function()
							if vector2.Magnitude > 1.5 then
								local rotation = num41.CFrame.Rotation
								num41.CFrame = CFrame.new(vector.X, num41.Position.Y, vector.Z) * rotation
							end

							num41.AssemblyLinearVelocity = Vector3.new(0, math.min(num41.AssemblyLinearVelocity.Y, 0), 0)
						end)
					end)

					local function func122(param78)
						connection:Disconnect()
						return param78
					end

					local obj28 = func105(obj)
					local now4 = os.clock()
					local num42 = safeCarry.React(safeCarry.ReactMin, safeCarry.ReactMax)

					while true do
						if func63(param76) then
							return (func122(false))
						else
							local n25 = os.clock() - now4
							local n26 = safeCarry.RunWait + num42
							local flag120 = not safeCarry.WaitGuard or not obj28 or obj28:GetAttribute("GuardState") == "Sleeping"
							if n25 >= n26 and (flag120 or n25 >= n26 + 15) then
								break
							end
							flag52 = n25 < n26 and string.format("Waiting before the grab, %.1fs", n26 - n25) or "Waiting for the guard to sleep"
							RunService.Heartbeat:Wait()
						end
					end

					flag52 = "Taking the egg"
					local flag121 = func107(obj, param76, 0.8, nil)

					if not flag121 and not func63(param76) then
						flag121 = func91(obj, param76)
					end

					func122()
					if not flag121 then
						return false
					end
					str1.Steal.LastFinishedAt = os.clock()
					return true
				end

				str1.SafeCarry.Pace = function()
					local n23 = tonumber(str1.SafeCarry.RunSpeed) or 1
					return math.max(str1.WalkSpeed() * n23, 16)
				end

				str1.SafeCarry.Plan = function(param79, num43, num44)
					local safeCarry = str1.SafeCarry
					local character = localPlayer.Character

					if character then
						character:FindFirstChildOfClass("Humanoid")
					end

					local num45 = str1.WalkSpeed()
					num44 = num44 or safeCarry.Mult or 1

					if safeCarry.SameSpeedBigEggs then
						num44 = math.max(num44, safeCarry.LightMult)
					end

					local n23 = num45 * safeCarry.CarryRatio * num44
					local n24 = n23 * safeCarry.SpeedRatio
					local n25 = safeCarry.ExcessSeconds * n23
					local n26

					if num43 and num43 > n25 then
						n26 = math.min(n24, n23 * num43 / (num43 - n25))
					else
						n26 = n24
					end

					local guards = tbl1.Guards
					local flag122 = type(guards) == "table" and type(guards.Directory) == "table" and guards.Directory[tostring(param79)] or nil
					local n27 = type(flag122) == "table" and tonumber(flag122.WalkSpeed) or 0
					if not safeCarry.BeatGuard then
						return math.max(math.min(n23 * safeCarry.EasyRatio, n26), n23), true, n23, n26, n27
					end
					local n28 = math.max(n27 + safeCarry.GuardMargin, n23 * safeCarry.MinRatio)
					local n29 = math.max(n28, n27 * safeCarry.GuardRatio)

					if n26 < n28 then
						local n30 = n23 * safeCarry.SpeedRatio
						local n31 = safeCarry.StretchSeconds * n23
						local n32

						if num43 and num43 > n31 then
							n32 = math.min(n30, n23 * num43 / (num43 - n31))
						else
							n32 = n30
						end

						local n33 = n27 + math.max(safeCarry.GuardMargin, 1)
						if n33 <= n32 then
							return n33, true, n23, n32, n27
						end
					end

					return math.max(math.min(n29, n26), n23), n28 <= n26, n23, n26, n27
				end

				str1.SafeCarry.Unsafe = function(obj)
					local safeCarry = str1.SafeCarry
					if not safeCarry.Enabled or type(obj) ~= "table" or not obj.Uid or not safeCarry.Blocked[obj.Uid] then
						return nil
					end
					return string.format("the guard caught you with this %s before, skipping it", tostring(obj.Category))
				end

				str1.SafeCarry.Settle = function(param80, param81)
					local safeCarry = str1.SafeCarry
					local character = localPlayer.Character

					if character then
						character:FindFirstChildOfClass("Humanoid")
					end

					math.max(str1.WalkSpeed() * safeCarry.CarryRatio * (safeCarry.Seen[tostring(param81.Category)] or safeCarry.GuessMult) * safeCarry.WaitRate, 1)
					local baseWait = safeCarry.BaseWait
					local obj29 = func105(param81)

					while true do
						if func63(param80) then
							return false
						else
							local n23 = os.clock() - (safeCarry.JumpAt or 0)
							local flag123 = not safeCarry.WaitGuard or not obj29 or obj29:GetAttribute("GuardState") == "Sleeping"
							if n23 >= baseWait and (flag123 or n23 >= baseWait + 15) then
								break
							end

							if n23 < baseWait then
								flag52 = string.format("Letting the jump settle, %.1fs", baseWait - n23)
							else
								flag52 = "Waiting for the guard to sleep"
							end

							RunService.Heartbeat:Wait()
						end
					end

					return true
				end

				str1.MonitorAction = str1.MonitorAction or function(param82)
					local ok, result = pcall(debug.getconstants, param82)
					if not ok or type(result) ~= "table" then
						return false
					end

					for _, value87 in pairs(result) do
						local flag124 = type(value87) == "string"

						if flag124 then
							flag124 = value87 == "Relocate" or value87 == "SetWalkSpeed" or value87 == "BeginRagdoll" or value87 == "EndRagdoll" or value87 == "BeginImpulse"
						end

						if flag124 then
							return true
						end
					end

					return false
				end

				str1.SafeCarry.LineDropHome = function(param83)
					local safeCarry = str1.SafeCarry
					local steal = str1.Steal
					local carryUid = steal.CarryUid
					local result20 = stealHome()
					local flag125 = str1.Root()
					if type(carryUid) ~= "string" or not result20 or not flag125 then
						return false
					end
					local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
					world = world and world:FindFirstChild("Areas")
					world = world and world:FindFirstChild("SeparationLine")
					local x = world and world:IsA("BasePart") and world.Position.X or 552.2
					local y = world and world:IsA("BasePart") and world.Position.Y or 67.67
					local tbl97 = {}

					pcall(function()
						for _, item39 in ipairs({ RunService.Heartbeat, RunService.PreSimulation, RunService.PostSimulation }) do
							for _, getconnection in ipairs(getconnections(item39)) do
								local ok, result = pcall(function()
									return getconnection.Function
								end)

								if ok and type(result) == "function" then
									local ok2, result2 = pcall(debug.info, result, "s")

									if ok2 and string.find(tostring(result2), "UGI", 1, true) and not str1.MonitorAction(result) then
										local ok3, result3 = pcall(function()
											return getconnection.Enabled
										end)

										if not ok3 or result3 ~= false then
											if pcall(function()
												getconnection:Disable()
											end) then
												table.insert(tbl97, getconnection)
											end
										end
									end
								end
							end
						end
					end)

					local flag126 = false
					local connection = nil

					pcall(function()
						connection = networking["RE/RigSync/Refresh"].OnClientEvent:Connect(function(param84)
							if type(param84) == "table" and param84.Action == "Relocate" then
								flag126 = true
							end
						end)
					end)

					local currentCamera = workspace.CurrentCamera
					local value88 = nil

					local function func123()
						local value89 = value88
						local flag127

						if value88 then
							flag127 = value89
						else
							flag127 = not currentCamera
						end

						if flag127 then
							return
						end
						value88 = { Type = currentCamera.CameraType, CFrame = currentCamera.CFrame }

						pcall(function()
							currentCamera.CameraType = Enum.CameraType.Scriptable
							currentCamera.CFrame = value88.CFrame
						end)
					end

					local function func124()
						if not value88 or not currentCamera then
							return
						end
						local value90 = value88
						value88 = nil

						pcall(function()
							currentCamera.CameraType = value90.Type
						end)
					end

					local function func125()
						func124()

						if connection then
							connection:Disconnect()
							connection = nil
						end

						for _, item40 in ipairs(tbl97) do
							pcall(function()
								item40:Enable()
							end)
						end

						table.clear(tbl97)
					end

					local now = os.clock()

					local function func126(param85, param86, flag128, callback5)
						local n23 = 0

						while n23 < flag128 and not func63(param83) do
							local num46 = str1.Root()
							if not num46 then
								return false
							end

							if callback5 and callback5() then
								return true
							end
							local vector = Vector3.new(param85.X - num46.Position.X, 0, param85.Z - num46.Position.Z)
							if vector.Magnitude < 2.5 then
								return true
							end
							local n24 = vector.Unit * math.min(param86, vector.Magnitude / 0.05)

							pcall(function()
								num46.AssemblyLinearVelocity = Vector3.new(n24.X, num46.AssemblyLinearVelocity.Y, n24.Z)
							end)

							n23 += RunService.Heartbeat:Wait()
						end

						return false
					end

					func76()
					local n23 = math.clamp(flag125.Position.Z, -425, -300)
					local vector = Vector3.new(x + (safeCarry.Hops and safeCarry.HopStop or safeCarry.LineGap), y + 3.35, n23)

					local function func127()
						local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")

						local ok, result = pcall(function()
							return rfEggWorldAskFieldEggSnapshot:InvokeServer()
						end)

						local records = ok and type(result) == "table" and result.Records or nil

						if type(records) == "table" then
							for _, record in pairs(records) do
								if type(record) == "table" and record.Uid == carryUid then
									return record
								end
							end
						end

						return nil
					end

					local magnitude = Vector3.new(flag125.Position.X - x, 0, flag125.Position.Z - n23).Magnitude
					local max = math.max
					local carryRatio = safeCarry.CarryRatio
					local num47 = max(str1.WalkSpeed() * carryRatio * (tonumber(safeCarry.Mult) or safeCarry.LightMult), 1)
					local directMargin = safeCarry.DirectMargin
					local n24 = math.max(0, (magnitude - safeCarry.DirectBudget) / num47) + directMargin

					if safeCarry.CrossNow then
						n24 = safeCarry.DirectMargin
					end

					local function func128()
						local flag129 = str1.Root()
						if not flag129 then
							return
						end

						pcall(function()
							flag129.CFrame = CFrame.new(vector) * CFrame.Angles(0, 1.5707963267948966, 0)
							flag129.AssemblyLinearVelocity = Vector3.zero
							flag129.AssemblyAngularVelocity = Vector3.zero
						end)
					end

					func123()

					if safeCarry.Hops then
						local value91 = str1.Root()

						if value91 then
							local n25 = value91.Position.Y + safeCarry.HopLift
							local x2 = value91.Position.X
							local hopRatio = safeCarry.HopRatio
							local n26 = math.max(str1.WalkSpeed() * hopRatio, 40)

							while x2 - n26 > vector.X and steal.Carrying and not func63(param83) do
								x2 -= n26
								flag52 = string.format("Line Drop: hopping home, X %d", math.floor(x2))
								local n27 = 0

								while n27 < safeCarry.HopGap do
									local value92 = str1.Root()

									if value92 then
										pcall(function()
											value92.CFrame = CFrame.new(x2, n25, n23) * CFrame.Angles(0, 1.5707963267948966, 0)
											value92.AssemblyLinearVelocity = Vector3.zero
											value92.AssemblyAngularVelocity = Vector3.zero
										end)
									end

									n27 += RunService.Heartbeat:Wait()
								end
							end
						end
					end

					flag52 = "Line Drop: landing next to the line"
					func128()

					if safeCarry.Hops and steal.Carrying then
						local n25 = 0

						while n25 < safeCarry.DropDelay and steal.Carrying and not func63(param83) do
							n25 += RunService.Heartbeat:Wait()
						end

						if steal.Carrying then
							flag52 = "Line Drop: dropping the egg next to the line"
							local eggState = tbl1.EggState

							if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
								pcall(eggState.DropFieldEgg, "PlayerRequest")
							end

							local n26 = 0

							while steal.Carrying and n26 < 1 and not func63(param83) do
								n26 += RunService.Heartbeat:Wait()
							end
						end
					end

					func124()

					if safeCarry.ShakeTime > 0 then
						local vector2 = Vector3.new(x - safeCarry.ShakeInside, vector.Y, n23)
						local flag130 = false
						local n25 = 0

						while n25 < safeCarry.ShakeTime and steal.Carrying and not func63(param83) do
							flag52 = "Line Drop: shaking at the line"
							flag130 = not flag130
							local value93 = str1.Root()

							if value93 then
								pcall(function()
									value93.CFrame = CFrame.new(flag130 and vector2 or vector) * CFrame.Angles(0, 1.5707963267948966, 0)
									value93.AssemblyLinearVelocity = Vector3.zero
								end)
							end

							n25 += RunService.Heartbeat:Wait()
						end

						func128()
					end

					local flag131 = n24 < safeCarry.LineWait
					local n25 = 0
					local n26 = 1

					while true do
						local carrying2 = steal.Carrying and n25 < safeCarry.LineWait

						if carrying2 then
							carrying2 = not (flag131 and n25 >= n24)
						end

						if carrying2 and not func63(param83) then
							if flag131 then
								flag52 = string.format("Line Drop: stepping over the line in %.1fs", math.max(n24 - n25, 0))
							else
								flag52 = string.format("Line Drop: crossing needs %.1fs, waiting for the guard, %.0fs left", n24, safeCarry.LineWait - n25)
							end

							if flag126 and safeCarry.ReJump and n26 < 40 and not func92() then
								flag126 = false
								n26 += 1
								flag52 = "Line Drop: pulled back, jumping to the line again"
								func128()
							end

							n25 += RunService.Heartbeat:Wait()
							continue
						end

						break
					end

					if steal.Carrying and flag131 and n25 >= n24 and not func63(param83) then
						flag52 = "Line Drop: stepping over the line"
						local crossRatio = safeCarry.CrossRatio

						func126(result20, str1.WalkSpeed() * crossRatio, 6, function()
							return safeCarry.LastDelivered >= now or not steal.Carrying
						end)

						local n27 = 0

						while n27 < 1.5 and safeCarry.LastDelivered < now and steal.Carrying and not func63(param83) do
							n27 += RunService.Heartbeat:Wait()
						end

						if now <= safeCarry.LastDelivered then
							func125()
							return true
						end
					end

					if steal.Carrying then
						func125()
						flag52 = "Line Drop: the guard never came, dropping the egg"
						local eggState = tbl1.EggState

						if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
							pcall(eggState.DropFieldEgg, "PlayerRequest")
						end

						return false
					end

					if safeCarry.GetUp then
						task.spawn(function()
							local n27 = 0

							while n27 < 1.5 do
								local character = localPlayer.Character
								local humanoid = character and character:FindFirstChildOfClass("Humanoid")

								if humanoid then
									pcall(function()
										humanoid.PlatformStand = false
										local state = humanoid:GetState()

										if state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.FallingDown then
											humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
										end
									end)
								end

								n27 += RunService.Heartbeat:Wait()
							end
						end)
					end

					local n27 = 0

					while not safeCarry.SnapPickup and not safeCarry.GetUp and func92() and n27 < 6 and not func63(param83) do
						flag52 = "Line Drop: egg is down at the line, getting up"
						n27 += RunService.Heartbeat:Wait()
					end

					local n28 = 0

					while not func63(param83) and n28 < 4 do
						n28 += 1
						local num48 = func111(carryUid)

						if not num48 then
							func125()
							flag52 = "Line Drop: the egg is gone"
							return false
						end

						local result21 = func127()

						if result21 and result21.State == "Slot" then
							func125()
							flag52 = "Line Drop: the egg went back to its nest"
							return false
						end

						flag52 = "Line Drop: picking the egg up at the line"
						local n29

						if safeCarry.SnapPickup then
							local value94 = str1.Root()

							if value94 then
								pcall(function()
									value94.CFrame = CFrame.new(num48 + Vector3.new(0, 3, 0)) * CFrame.Angles(0, 1.5707963267948966, 0)
									value94.AssemblyLinearVelocity = Vector3.zero
								end)
							end

							n29 = 5
						else
							local pickupRatio = safeCarry.PickupRatio
							func126(num48, str1.WalkSpeed() * pickupRatio, 5)
							n29 = 2.5
						end

						local n30 = 0

						while not steal.Carrying and n30 < n29 and not func63(param83) do
							task.spawn(func85, carryUid)

							if safeCarry.SnapPickup then
								local flag132 = str1.Root()

								if flag132 and Vector3.new(flag132.Position.X - num48.X, 0, flag132.Position.Z - num48.Z).Magnitude > 6 then
									pcall(function()
										flag132.CFrame = CFrame.new(num48 + Vector3.new(0, 3, 0)) * CFrame.Angles(0, 1.5707963267948966, 0)
									end)
								end
							end

							n30 += task.wait(0.15)
						end

						if steal.Carrying and not steal.WrongEgg(carryUid) then
							break
						end
					end

					if not steal.Carrying then
						func125()
						flag52 = "Line Drop: could not pick the egg up again"
						return false
					end

					local flag133 = str1.Root()

					if flag133 and flag133.Position.X - x > safeCarry.FarFromLine then
						func125()
						flag52 = "Line Drop: egg ended up far from the line, carrying it home safely"
						return str1.SafeCarry.Home(param83)
					end

					flag52 = "Line Drop: stepping over the line"
					local crossRatio = safeCarry.CrossRatio

					func126(result20, str1.WalkSpeed() * crossRatio, 6, function()
						return safeCarry.LastDelivered >= now or not steal.Carrying
					end)

					local value95 = str1.Root()

					if value95 then
						pcall(function()
							value95.AssemblyLinearVelocity = Vector3.new(0, value95.AssemblyLinearVelocity.Y, 0)
						end)
					end

					local n29 = 0

					while n29 < 2 and safeCarry.LastDelivered < now and steal.Carrying and not func63(param83) do
						n29 += RunService.Heartbeat:Wait()
					end

					func125()
					return safeCarry.LastDelivered >= now
				end

				str1.SafeCarry.Home = function(param87)
					local safeCarry = str1.SafeCarry
					local result22 = stealHome()
					local flag134 = str1.Root()
					if not result22 or not flag134 then
						return false
					end
					func76()
					local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
					world = world and world:FindFirstChild("Areas")
					world = world and world:FindFirstChild("SeparationLine")
					local n23 = (world and world:IsA("BasePart") and world.Position.X or 552) - 7
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")

					if humanoid then
						humanoid.PlatformStand = false
					end

					local now = os.clock()
					local n24 = 0

					local function func129()
						local flag135 = str1.Root()
						if not flag135 then
							return
						end
						local num49, flag136, num50, num51, num52 = safeCarry.Plan(str1.Steal.CarryAreaId, (Vector3.new(flag135.Position.X, 0, flag135.Position.Z) - Vector3.new(result22.X, 0, result22.Z)).Magnitude + math.max(0, safeCarry.Height) * 2, safeCarry.Mult)
						local n25 = num49 * safeCarry.CarryScale
						n24 = n25
						safeCarry.PlanOk = flag136
						safeCarry.FloorSpeed = safeCarry.BeatGuard and math.min(num52 + math.max(safeCarry.GuardMargin, 1), num51) or 0
						flag52 = string.format("Carrying home at %d (carry %d, guard %d, max %d)%s", math.floor(n25 + 0.5), math.floor(num50 + 0.5), math.floor(num52 + 0.5), math.floor(num51 + 0.5), flag136 and "" or ", guard is faster, going at your max safe speed")
					end

					local function func130()
						local n25 = math.max(0, safeCarry.Height)
						local flag137 = str1.Root()
						local character2 = localPlayer.Character
						if n25 <= 0.5 or not flag137 or not character2 then
							return
						end
						local n26 = result22.Y + n25
						if flag137.Position.Y >= n26 - 2 then
							return
						end
						local rotation = flag137.CFrame.Rotation
						local n27 = CFrame.new(Vector3.new(flag137.Position.X, n26, flag137.Position.Z)) * rotation

						pcall(function()
							character2:PivotTo(n27)
							flag137.AssemblyLinearVelocity = Vector3.zero
							flag137.AssemblyAngularVelocity = Vector3.zero
						end)
					end

					func129()
					local num53 = safeCarry.NewHuman(true)
					local flag138 = str1.Root()
					local n25 = math.clamp((flag138 and flag138.Position.Z or result22.Z) + num53.Lane, -425, -300)
					local now2 = os.clock()

					if safeCarry.CarryReact > 0 then
						local n26 = os.clock() + safeCarry.React(0, safeCarry.CarryReact)

						while os.clock() < n26 and not func63(param87) do
							RunService.Heartbeat:Wait()
						end
					end

					local n26 = 0

					if safeCarry.CarryStyle ~= "Walk" then
						func130()
					end

					while not func63(param87) do
						local num54 = str1.Root()
						if not num54 then
							return false
						end

						if not str1.Steal.Carrying then
							if now <= safeCarry.LastDelivered then
								return true
							end
							task.wait(0.1)
							if now <= safeCarry.LastDelivered then
								return true
							end

							if safeCarry.LastFailed >= now then
								flag52 = "Delivery was rewound, too fast for your speed"
								return false
							end

							if not safeCarry.PlanOk and str1.Steal.CarryUid then
								safeCarry.Blocked[str1.Steal.CarryUid] = true
								flag52 = string.format("The guard caught you with %s, it is faster than your max safe speed, skipping this egg", tostring(safeCarry.Category))
								return false
							end

							n26 += 1
							if safeCarry.RecoverTries < n26 then
								flag52 = "The egg is gone"
								return false
							end
							flag52 = "Egg dropped, taking it back"
							if not func113(param87) then
								flag52 = "Could not take the egg back"
								return false
							end
							local n27 = 0

							while func92() and n27 < 4 and not func63(param87) do
								n27 += RunService.Heartbeat:Wait()
							end

							local n28 = math.min(now, os.clock())
							func129()

							if safeCarry.CarryStyle ~= "Walk" then
								func130()
							end

							num54 = str1.Root()
							if not num54 then
								return false
							end
							now = n28
						end

						local now3 = os.clock()
						local n27 = math.max(now3 - now2, 0.0041666666666666666)
						local carryStyle = safeCarry.CarryStyle == "Walk"
						local n28 = carryStyle and 0 or math.max(0, safeCarry.Height)
						local num55, num56 = num53.Step(n27, n28 <= 0.5 and humanoid or nil, humanoid and humanoid.FloorMaterial ~= Enum.Material.Air)
						local n29 = math.clamp(n25 + num56, -425, -300)
						local vector = num54.Position.X > n23 + 2 and Vector3.new(n23, num54.Position.Y, n29) or result22
						local value96, value97 = safeCarry.Avoid(num54.Position, vector)

						if value97 then
							vector = value96
						end

						local vector2 = Vector3.new(vector.X - num54.Position.X, 0, vector.Z - num54.Position.Z)
						if vector2.Magnitude < 2 and vector == result22 then
							break
						end
						local n30 = math.max(n24 * num55, safeCarry.FloorSpeed or 0)

						if os.clock() < (safeCarry.SlowUntil or 0) then
							n30 *= safeCarry.SlowFactor
						end

						if carryStyle then
							pcall(function()
								if humanoid and vector2.Magnitude > 0.01 then
									humanoid:MoveTo(num54.Position + vector2.Unit * math.min(vector2.Magnitude, 30))
								end
							end)
						elseif n28 > 0.5 then
							local n31 = math.clamp(safeCarry.ClimbShare, 0.1, 0.9)
							local y = result22.Y
							local n32 = math.max(0, num54.Position.X - n23)
							local n33 = n28 * math.sqrt(1 - n31 * n31) / n31
							local n34 = y + n28

							if vector == result22 or n32 <= n33 then
								n34 = y + n28 * math.clamp((vector == result22 and 0 or n32) / math.max(n33, 1), 0, 1)
							end

							local n35 = math.clamp((n34 - num54.Position.Y) / 0.12, -n30 * n31, n30 * n31)
							local num57 = math.sqrt(math.max(n30 * n30 - n35 * n35, 0))
							local vector3 = vector2.Magnitude > 0.01 and vector2.Unit * math.min(num57, vector2.Magnitude / 0.05) or Vector3.zero

							pcall(function()
								num54.AssemblyLinearVelocity = Vector3.new(vector3.X, n35, vector3.Z)
							end)
						else
							local vector3 = vector2.Magnitude > 0.01 and vector2.Unit * math.min(n30, vector2.Magnitude / 0.05) or Vector3.zero

							pcall(function()
								num54.AssemblyLinearVelocity = Vector3.new(vector3.X, num54.AssemblyLinearVelocity.Y, vector3.Z)

								if safeCarry.RunAnimate and humanoid and vector2.Magnitude > 0.01 then
									humanoid:Move(vector2.Unit, false)
								end
							end)
						end

						RunService.Heartbeat:Wait()
						now2 = now3
					end

					if humanoid then
						pcall(function()
							local value98 = str1.Root()

							if safeCarry.CarryStyle == "Walk" and value98 then
								humanoid:MoveTo(value98.Position)
							end

							humanoid:Move(Vector3.zero, false)
						end)
					end

					local n27 = 0

					while n27 < 2 and not func63(param87) do
						if now <= safeCarry.LastDelivered then
							return true
						end

						if safeCarry.LastFailed >= now then
							flag52 = "Delivery was rewound, too fast for your speed"
							return false
						end

						if not str1.Steal.Carrying then
							break
						end
						n27 += RunService.Heartbeat:Wait()
					end

					if str1.Steal.Carrying then
						task.wait(0.2)
						local eggState = tbl1.EggState

						if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
							pcall(eggState.DropFieldEgg, "PlayerRequest")
						end
					end

					return safeCarry.LastDelivered >= now
				end

				local function func131(param88)
					local antiGuard = str1.AntiGuard

					if antiGuard.Enabled and not str1.SafeCarry.LineDrop and not str1.BossPortalUp() then
						local n23 = 0

						while not antiGuard.Busy and n23 < 1 and not func63(param88) do
							flag52 = "Waiting for Anti Guard to start"
							n23 += RunService.Heartbeat:Wait()
						end

						local busy = antiGuard.Busy
						local n24 = 0

						while antiGuard.Busy and n24 < 30 and not func63(param88) do
							flag52 = "Anti Guard is slipping past the guard"
							n24 += RunService.Heartbeat:Wait()
						end

						if busy then
							local n25 = 0
							local n26 = 0

							while n25 < 10 and not func63(param88) do
								local result23 = func92()
								local ok, result = pcall(str1.Steal.HeldByMe)
								ok = ok and result == true
								local flag139 = not result23
								if flag139 and not ok then
									break
								end

								if flag139 and ok and not antiGuard.Busy then
									n26 += RunService.Heartbeat:Wait()
									if n26 >= 0.3 then
										break
									end
									continue
								end

								flag52 = result23 and "The guard hit you, waiting until you can move" or "Waiting for Anti Guard to finish"
								n25 += RunService.Heartbeat:Wait()
								n26 = 0
							end

							local ok, result = pcall(str1.Steal.HeldByMe)

							if ok and not result then
								str1.Steal.Carrying = false
							end

							local safeCarry = str1.SafeCarry
							local result24 = stealHome()
							local n27 = result24 and safeCarry.Enabled and safeCarry.CarryStyle ~= "Walk" and safeCarry.Height > 0.5 and result24.Y + safeCarry.Height or nil
							local n28 = 0

							while n28 < 0.8 and str1.Steal.Carrying and not func63(param88) do
								flag52 = n28 < 0.6 and "Anti Guard done, rising up" or "Anti Guard done, getting ready"
								local num58 = str1.Root()

								if num58 and n27 then
									local n29 = n27 - num58.Position.Y
									local n30 = n28 < 0.6 and math.clamp(n29 / math.max(0.6 - n28, 0.1), -120, 120) or math.clamp(n29 / 0.2, -30, 30)

									pcall(function()
										num58.AssemblyLinearVelocity = Vector3.new(0, n30, 0)
									end)
								end

								n28 += RunService.Heartbeat:Wait()
							end

							local ok2, result2 = pcall(str1.Steal.HeldByMe)

							if ok2 and not result2 then
								str1.Steal.Carrying = false
							else
								str1.SafeCarry.SlowUntil = os.clock() + 2
							end
						end
					end

					local n23 = 0

					while not str1.Steal.Carrying and n23 < n16 and not func63(param88) do
						flag52 = "Checking the egg in hand"
						n23 += RunService.Heartbeat:Wait()
					end

					if not str1.Steal.Carrying then
						flag52 = "The egg is gone, staying to look for it"
						if not func113(param88) then
							flag52 = "The egg is gone"
							return false
						end
					end

					if str1.SafeCarry.LineDrop then
						return str1.SafeCarry.LineDropHome(param88)
					end

					if str1.SafeCarry.Enabled then
						return str1.SafeCarry.Home(param88)
					end
					local result25 = stealHome()
					local flag140 = str1.Root()
					if not result25 or not flag140 then
						return false
					end
					local n24 = math.max(flag140.Position.Y, result25.Y) + n10

					local function func132()
						if tbl96.Uid and tbl96.Freed and str1.Steal.Carrying then
							return "priority"
						end
						return nil
					end

					local flag141 = true
					local n25 = 0

					while true do
						local flag142 = str1.Root()

						if not flag142 then
							return false
						else
							flag52 = "Flying home"
							local position = flag142.Position
							local n26 = math.max(n24, position.Y)
							local value99, flag143 = func96(Vector3.new(position.X + (result25.X - position.X) * 0.25, position.Y + (n26 - position.Y) * 0.7, position.Z + (result25.Z - position.Z) * 0.25), param88, flag141, nil, nil, func132)

							if value99 then
								value99, flag143 = func96(Vector3.new(result25.X, n26, result25.Z), param88, flag141, nil, nil, func132)
							end

							if value99 then
								value99, flag143 = func96(result25, param88, flag141, nil, nil, func132)
							end

							if value99 then
								local character = localPlayer.Character
								character = character and character:FindFirstChildOfClass("Humanoid")

								if character then
									character.PlatformStand = false
								end

								task.wait(0.2)
								if not str1.Steal.Carrying then
									flag52 = "Arrived without the egg"
									return false
								end
								local eggState = tbl1.EggState

								if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
									pcall(eggState.DropFieldEgg, "PlayerRequest")
								end

								return true
							end

							if flag143 == "priority" then
								local uid2 = tbl96.Uid
								local freed = tbl96.Freed
								local value100 = tbl96
								tbl96.Uid = nil
								value100.Freed = nil
								local num59 = str1.Root()
								if not num59 or not uid2 or not freed then
									return false
								end

								if (freed - num59.Position).Magnitude <= n7 * n22 then
									flag52 = "Best egg fell nearby, swapping eggs"
									local eggState = tbl1.EggState

									if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
										pcall(eggState.DropFieldEgg, "PlayerRequest")
									end

									local n27 = 0

									while str1.Steal.Carrying and n27 < 1 do
										n27 += RunService.Heartbeat:Wait()
									end

									if not func113(param88, uid2) then
										return false
									end
								else
									flag52 = "Best egg fell far away, riding a guard hit to it"
									if not func116(param88, uid2, freed) then
										return false
									end
								end

								local value101 = str1.Root()
								n25 = 0

								if value101 then
									n24 = math.max(value101.Position.Y, result25.Y) + n10
								end

								continue
							end

							if flag143 == "dropped" and n25 < huge then
								n25 += 1
								if not func113(param88) then
									return false
								end
								continue
							end

							break
						end
					end

					return false
				end

				local function func133(param89)
					local n23 = tonumber(param89) or 0
					local tbl98 = { "", "K", "M", "B", "T", "Qa", "Qi" }
					local n24 = 1

					while math.abs(n23) >= 1000 and n24 < #tbl98 do
						n23 /= 1000
						n24 += 1
					end

					return string.format(n24 == 1 and "%.0f%s" or "%.2f%s", n23, tbl98[n24])
				end

				local function func134(flag144)
					if not flag144 then
						return "None"
					end
					local format = string.format
					local category2 = tostring(flag144.Category)
					local n23 = tonumber(flag144.Scale) or 0
					local func135 = tostring
					local areaId = flag144.AreaId
					local str10 = format("%s  %.2fx  |  value %s  |  %s", category2, n23, func133(flag144.Value), func135(areaId))
					local str11

					if flag144.State == "Dropped" then
						str11 = str10 .. "  |  dropped"
					elseif flag144.State == "Carried" then
						str11 = str10 .. "  |  carried by a player"
					else
						str11 = str10
					end

					return str11
				end

				local flag145 = false
				local n23 = 0.5
				local n24 = 0.6
				local n25 = 0
				local n26 = 0

				local function func136()
					local value102 = n11
					str1.Steal.Active = true
					str1.Steal.Carrying = str1.Steal.Carrying == true

					if not str1.Steal.Carrying then
						str1.Steal.CarryUid = nil
					end

					local value103 = func70(false, true)
					local value104 = nil
					local value105 = nil
					local lastSkip = nil

					for _, item41 in ipairs(value103) do
						if item41.State == "Carried" then
							value105 = value105 or item41
						elseif not str1.StockWaits(item41) then
							local value106 = str1.SafeCarry.Unsafe(item41)

							if value106 then
								lastSkip = lastSkip or value106
							else
								value104 = item41
								break
							end
						end
					end

					local tbl99 = { value104 }
					uid = value104 and value104.Uid or nil
					str1.Steal.Wanted = value104 ~= nil
					str6 = func134(value104)

					if value105 then
						str6 ..= "  |  watching " .. tostring(value105.Category)
					end

					if not value104 then
						str1.Steal.Active = false
						lastSkip = lastSkip or str1.SafeCarry.LastSkip
						str1.SafeCarry.LastSkip = nil
						flag52 = value105 and "Best egg is carried, waiting for it" or lastSkip and "Skipped: " .. lastSkip or "No egg matches"
						return false
					end

					if not str1.ClaimMovement("steal") then
						str1.Steal.Active = false
						flag52 = "Waiting for Auto Place"
						return false
					end

					if str1.Treadmill.Riding or str1.OnBelt() then
						str1.ExitBelt()
					end

					flag145 = true
					str1.HoldBelt()

					local function func137(param90)
						flag52 = param90
						local flag146 = func114(value104, value102)
						local value107 = nil
						local flag147 = false

						if flag146 then
							if func86(value104.Uid, value102) then
								flag147 = func131(value102)
								value107 = nil
							else
								value107 = flag52
							end
						end

						func80()
						str1.Steal.Active = false
						str1.Steal.LastFinishedAt = os.clock()
						flag52 = flag147 and "Delivered" or value107 or flag146 and "Run ended" or "That egg would not come free"
						return true
					end

					local num60 = str1.Root()
					local position = typeof(value104.CFrame) == "CFrame" and value104.CFrame.Position or nil

					if num60 and position then
						local num61 = (position - num60.Position).Magnitude <= n19
						local areaId = value104.AreaId
						local flag148 = localPlayer:GetAttribute("AreaId") == areaId
						if num61 or flag148 then
							return (func137("Target is right here, taking it"))
						end
					end

					if str1.SafeCarry.Enabled and str1.SafeCarry.Approach == "Run" then
						local flag149 = str1.SafeCarry.RunTo(value104, value102)
						local flag150, flag151

						if flag149 then
							if func86(value104.Uid, value102) then
								flag150 = func131(value102)
								flag151 = nil
							else
								flag150 = false
								flag151 = flag52
							end
						else
							tbl85[value104.Uid] = os.clock() + n12
							flag150 = false
							flag151 = nil
						end

						func80()
						str1.Steal.Active = false
						str1.Steal.LastFinishedAt = os.clock()
						flag52 = flag150 and "Delivered" or flag151 or flag149 and "Run ended" or "That egg would not come free"
						return true
					end

					local value108 = func70(true)
					local str12 = "FirstAreaEgg_" .. tostring(localPlayer.UserId)
					local tbl100 = {}

					for _, item42 in ipairs(value108) do
						if func97(item42) or type(item42.Uid) == "string" and string.sub(item42.Uid, 1, #str12) == str12 then
							table.insert(tbl100, item42)
						end
					end

					if #tbl100 ~= 0 then
						value108 = tbl100
					end

					local flag152, num62 = func94(value108)

					if not flag152 then
						str1.Steal.Active = false
						flag52 = "No egg matches"
						return false
					end

					if flag152.Uid == value104.Uid then
						return (func137("Target is the closest egg, taking it"))
					end
					local value109, num63 = func98(flag152)
					local flag153

					if num63 and num60 then
						local value110, value111, value112 = ipairs(value108)
						local huge3 = math.huge
						flag153 = flag152

						for _, value113 in value110, value111, value112 do
							local position2 = typeof(value113.CFrame) == "CFrame" and value113.CFrame.Position or nil

							if value113.Uid ~= value104.Uid and value113.AreaId == flag152.AreaId and position2 then
								local magnitude = (position2 - num60.Position).Magnitude

								if (position2 - num63).Magnitude > n18 then
									magnitude += n18
								end

								if magnitude < huge3 then
									huge3 = magnitude
									flag153 = value113
								end
							end
						end
					else
						flag153 = flag152
					end

					flag52 = string.format("Sleeping guard egg %d studs away", math.floor(num62 + 0.5))

					if not flag153 then
						str1.Steal.Active = false
						flag52 = "No egg matches"
						return false
					end

					local flag154, flag155 = func108(flag153, value102, false, tbl99[1])
					if not flag154 then
						str1.Steal.Active = false
						return false
					end
					local uid2 = nil
					local uid3 = value104.Uid
					local n27 = 0

					while true do
						if flag155 and not func63(value102) then
							flag52 = "Holding for the guard hit"

							if func99(value102, flag155, function(param91)
								if not uid2 and tbl96.Uid and tbl96.Freed then
									uid2 = tbl96.Uid
									param91.Destination = tbl96.Freed + Vector3.new(0, 3, 0)
									local value114 = tbl96
									tbl96.Uid = nil
									value114.Freed = nil
									flag52 = "Best egg fell, jumping to it instead"
								end
							end) then
								n27 += 1

								if uid2 then
									uid3 = uid2
									func113(value102, uid2)
									break
								else
									local entry4 = tbl99[n27]
									local value115
									value115, flag155 = func108(entry4, value102, true, tbl99[n27 + 1])

									if value115 then
										if entry4 and type(entry4.Uid) == "string" then
											uid3 = entry4.Uid
										end

										continue
									end
								end
							end
						end

						break
					end

					if not func86(uid3, value102) then
						local value116 = flag52
						func80()
						str1.Steal.Active = false
						str1.Steal.LastFinishedAt = os.clock()
						flag52 = value116
						return true
					end

					local flag156 = func131(value102)
					func80()
					str1.Steal.Active = false
					str1.Steal.LastFinishedAt = os.clock()
					flag52 = flag156 and "Delivered" or "Run ended"
					return true
				end

				local eggState = tbl1.EggState

				if type(eggState) == "table" then
					for _, item43 in ipairs({ "FieldRefreshed", "FieldShifted", "FieldGone", "SnapshotRefreshed" }) do
						local entry5 = eggState[item43]

						if type(entry5) == "table" and type(entry5.Connect) == "function" then
							local ok, result = pcall(entry5.Connect, entry5, function()
								tbl2.Wake()
							end)

							if ok and result then
								func4(function()
									pcall(function()
										result:Disconnect()
									end)
								end)
							end
						end
					end
				end

				tbl2.Add(function()
					local value117 = nil

					if value58 then
						value117 = type(value58.Set) == "function"
					end

					if value117 then
						pcall(value58.Set, nil, flag52)
					end

					local value118 = nil

					if value59 then
						value118 = type(value59.Set) == "function"
					end

					if value118 then
						pcall(value59.Set, nil, str6)
					end

					if not str1.Toggle(flag51, false) then
						return false
					end
					local num64, flag157, num65 = func64()

					if num64 then
						if flag157 == "night" then
							func67()
						end

						str1.Movement.StealFirst = true
						str1.Steal.Wanted = false

						if flag53 then
							n11 += 1
							str1.Steal.Active = false
							func80()
							str1.StopWalking()
						end

						local n27 = math.max(0, math.ceil(num64 - num65))

						if flag157 == "wall" then
							flag52 = string.format("Field wall up, %ds", n27)
						else
							flag52 = string.format("Night, going again in %ds", n27)
						end

						return false
					end

					if tbl87 and n14 == math.huge then
						n14 = os.clock() + n13
					end

					if flag53 then
						return true
					end

					if func68() then
						flag52 = "Night over, waiting for the field to reset"
						tbl2.Wake()
						return false
					end

					local stealFirst = str1.Movement.StealFirst
					local owner = str1.Movement.Owner
					local placeWanted = str1.Movement.PlaceWanted and not stealFirst

					if not placeWanted then
						placeWanted = owner ~= nil and owner ~= "steal" and owner ~= "treadmill" and owner ~= "scramble"
					end

					if placeWanted then
						if n25 <= os.clock() then
							n25 = os.clock() + n23
							local ok, result = pcall(func70, false, false)
							ok = ok and type(result) == "table" and result[1] ~= nil and not str1.StockWaits(result[1])
							str1.Steal.Wanted = ok

							if ok then
								str1.Movement.StealFirst = true
							end
						end

						if str1.Steal.Wanted then
							local func138 = tostring
							owner = owner or "Auto Place"
							flag52 = "Egg found, waiting for " .. func138(owner) .. " to stop"
						else
							flag52 = "Waiting for " .. tostring(owner or "Auto Place")
						end

						return true
					end

					if os.clock() < n26 then
						return true
					end
					str1.Movement.StealFirst = false
					flag53 = true

					task.spawn(function()
						local ok = pcall(func136)

						if flag145 then
							flag145 = false
							str1.ReleaseBelt()
						end

						if not ok then
							func80()
							str1.Steal.Active = false
						end

						local flag158 = uid
						uid = nil
						local flag159 = flag158 and tbl43[flag158]

						if flag159 and flag159.Once then
							tbl43[flag158] = nil
						end

						local value119 = tbl96
						local value120 = tbl96
						tbl96.Uid = nil
						value119.Freed = nil
						value120.Token = nil

						if flag52 == "Delivered" and not str1.IsNight() then
							str1.Movement.StealFirst = true
						end

						if not str1.Steal.Wanted then
							n26 = os.clock() + n24
						end

						str1.ReleaseMovement("steal")
						flag53 = false
						tbl2.Wake()
					end)

					return true
				end)
			end

			flag51 = value2

			func48 = function()
				n11 += 1
				table.clear(tbl85)
				str1.Steal.Active = false
				str1.Steal.Wanted = false
				local flag160 = str1.Toggle(flag51, false)
				str1.Shield("steal", flag160)

				if not flag160 then
					str1.Movement.StealFirst = false
					table.clear(tbl43)
					table.clear(tbl44)
					table.clear(tbl45)
				end

				func80()
				str1.StopWalking()
				tbl2.Wake()
			end

			do
				local function func139()
					n11 += 1
					str1.Steal.Active = false
					func80()
					str1.StopWalking()
				end

				local function func140()
					if str1.Toggle(flag51, false) then
						return true
					end

					if flag51 and type(flag51.Set) == "function" then
						pcall(flag51.Set, flag51, true)
					end

					return false
				end

				str1.CancelSteal = function(param92)
					if type(param92) ~= "string" then
						return
					end
					tbl43[param92] = nil
					tbl44[param92] = nil
					tbl45[param92] = true

					if flag53 and uid == param92 then
						func139()
					end

					tbl2.Wake()
				end

				str1.StealQueue = function()
					local tbl101 = {}

					for k in pairs(tbl43) do
						table.insert(tbl101, k)
					end

					table.sort(tbl101, function(flag161, param93)
						local at = tbl43[flag161].At
						local at2 = tbl43[param93].At
						if at ~= at2 then
							return at < at2
						end
						return flag161 < param93
					end)

					return tbl101
				end

				str1.PrioritizeSteal = function(param94)
					if type(param94) ~= "string" or func66() then
						return
					end
					local n20 = 0

					for _, value121 in pairs(tbl43) do
						if value121.At < n20 then
							n20 = value121.At
						end
					end

					tbl43[param94] = { At = n20 - 1, Once = false }
					tbl45[param94] = nil
					tbl85[param94] = nil

					if func140() and flag53 and not str1.Steal.Carrying and uid ~= param94 then
						func139()
					end

					tbl2.Wake()
				end

				str1.MoveInPlan = function(param95, num66)
					if type(param95) ~= "string" or num66 ~= -1 and num66 ~= 1 or func66() then
						return
					end
					local list15 = str1.StealPlan()
					local foundAt2 = table.find(list15, param95)
					local n20 = foundAt2 and foundAt2 + num66
					if not n20 or n20 < 1 or n20 > #list15 then
						return
					end
					table.remove(list15, foundAt2)
					table.insert(list15, n20, param95)
					local n21 = math.max(foundAt2, n20)

					for i, item44 in ipairs(list15) do
						if i <= n21 or tbl43[item44] then
							local entry6 = tbl43[item44]

							if entry6 then
								entry6.At = i
							else
								tbl43[item44] = { At = i, Once = false }
							end

							tbl45[item44] = nil
						end
					end

					if flag53 and not str1.Steal.Carrying and uid and list15[1] ~= uid then
						func139()
					end

					tbl2.Wake()
				end

				str1.StealPlan = function()
					if not str1.Toggle(flag51, false) or str1.IsNight() then
						return {}, nil
					end
					local tbl102 = {}

					if uid then
						table.insert(tbl102, uid)
					end

					local ok, result = pcall(func70, false, true)

					if ok and type(result) == "table" then
						for _, item45 in ipairs(result) do
							if item45.Uid ~= uid then
								table.insert(tbl102, item45.Uid)
							end
						end
					end

					return tbl102, uid
				end

				str1.SetPriority = function(param96, param97)
					if param97 then
						str1.PrioritizeSteal(param96)
					else
						str1.CancelSteal(param96)
					end
				end

				str1.ResortSteal = function()
					if flag53 and not str1.Steal.Carrying and uid and not tbl43[uid] then
						local ok, result = pcall(func70, false, true)

						if ok and type(result) == "table" then
							local value122 = nil

							for _, item46 in ipairs(result) do
								if item46.State ~= "Carried" then
									value122 = item46
									break
								else
									value122 = nil
								end
							end

							if not value122 or value122.Uid ~= uid then
								func139()
							end
						end
					end

					tbl2.Wake()
				end

				str1.StealNow = function(param98, flag162)
					if type(param98) ~= "string" or func66() then
						return
					end

					if not tbl43[param98] then
						local n20 = 0

						for _, value123 in pairs(tbl43) do
							if value123.At > n20 then
								n20 = value123.At
							end
						end

						tbl43[param98] = { At = n20 + 1, Once = flag162 == true }
					end

					tbl45[param98] = nil
					tbl85[param98] = nil
					local flag163 = func140() and flag53 and not str1.Steal.Carrying and uid ~= param98

					if flag163 then
						flag163 = not (uid and tbl43[uid])
					end

					if flag163 then
						func139()
					end

					tbl2.Wake()
				end
			end

			func4(function()
				str1.GodMode(false)
				str1.ReleaseMovement("steal")
				func80()
			end)
		end

		str1.UiQueue = {}

		str1.UiDefer = function(param99)
			table.insert(str1.UiQueue, param99)
		end

		str1.Notify = function(param100, param101)
			if type(obj1) == "table" and type(obj1.Notify) == "function" then
				pcall(obj1.Notify, param100, param101, 5)
			end
		end

		local connection = RunService.Heartbeat:Connect(function()
			local uiQueue = str1.UiQueue
			if #uiQueue == 0 then
				return
			end
			str1.UiQueue = {}

			for _, item47 in ipairs(uiQueue) do
				pcall(item47)
			end
		end)

		func4(function()
			pcall(function()
				connection:Disconnect()
			end)
		end)

		str1.Rift = { Requirements = {}, At = 0, Busy = false, Next = 0, Handles = {}, Restart = {} }

		str1.RiftOn = function(param102)
			local flag164 = str1.Rift.Handles[param102]
			return flag164 ~= nil and str1.Toggle(flag164, false) == true
		end

		do
			local n8 = 8

			local function func141(param103)
				local directory = tbl1.Assets and tbl1.Assets.Directory
				local flag165 = type(directory) == "table" and directory[tostring(param103)] or nil
				return type(flag165) == "table" and flag165 or nil
			end

			str1.EggRarity = function(obj)
				local assetCategory4 = func141(obj.AssetCategory)
				local rarity = assetCategory4 and assetCategory4.Rarity or nil
				local flag166 = type(rarity) == "table"

				if flag166 then
					flag166 = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				return flag166 or 0
			end

			str1.EggIncome = function(obj)
				local n9 = func141(obj.AssetCategory)
				n9 = n9 and tonumber(n9.EarningRate) or 0
				local n10 = tonumber(obj.AssetScale) or 0
				if n10 <= 0 then
					return 0
				end
				local n11 = n10 > 5 and (n10 / 5) ^ 1.2 * 19.637875755794113 or n10 ^ 1.85
				local mutations = tbl1.Mutations
				local flag167 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n12 = 1

				if flag167 then
					local ok
					ok, n12 = pcall(mutations.EarningsFor, type(obj.Mutations) == "table" and obj.Mutations or {})
					ok = ok and type(n12) == "number"
					local n13 = 1

					if not ok then
						n12 = n13
					end
				end

				return n9 * n11 * n12
			end

			str1.RiftShortfall = function()
				local tbl103 = {}

				for _, requirement in ipairs(str1.Rift.Requirements) do
					tbl103[requirement] = (tbl103[requirement] or 0) + 1
				end

				if next(tbl103) == nil then
					return tbl103
				end
				local save = tbl1.Save
				local flag168 = type(save) == "table" and type(save.Get) == "function"
				local result = nil

				if flag168 then
					local ok
					ok, result = pcall(save.Get)
					result = ok and type(result) == "table" and result or nil
				end

				if not result then
					return {}
				end
				local tbl104 = {}
				local func142 = pairs
				local equippedAssets = result.EquippedAssets or {}

				for _, equippedAsset in func142(equippedAssets) do
					tbl104[equippedAsset] = true
				end

				local func143 = pairs
				local inventory = result.Inventory or {}

				for k, value124 in func143(inventory) do
					local str13 = type(value124) == "table" and tostring(value124.Category) or nil
					local flag169

					if str13 then
						flag169 = (tbl103[str13] or 0) > 0
					else
						flag169 = str13
					end

					flag169 = flag169 and value124.InFuse ~= true and value124.IsFavorite ~= true and not tbl104[k]

					if flag169 then
						tbl103[str13] = tbl103[str13] - 1
					end
				end

				for k, value125 in pairs(tbl103) do
					if value125 <= 0 then
						tbl103[k] = nil
					end
				end

				return tbl103
			end

			local function func144()
				for k in pairs(str1.Rift.Handles) do
					if str1.RiftOn(k) then
						return true
					end
				end

				return false
			end

			tbl2.Add(function()
				local rift = str1.Rift
				local busy = rift.Busy

				if not busy then
					local next_ = rift.Next
					busy = os.clock() < next_
				end

				if busy or not func144() then
					return false
				end
				rift.Busy = true
				rift.Next = os.clock() + n8


				task.spawn(function()
					local rfScrambleTradeInAskState = networking:FindFirstChild("RF/ScrambleTradeIn/AskState")

					if rfScrambleTradeInAskState and rfScrambleTradeInAskState:IsA("RemoteFunction") then
						local ok, result = pcall(rfScrambleTradeInAskState.InvokeServer, rfScrambleTradeInAskState)

						if ok and type(result) == "table" then
							local requirements = {}

							if result.Unlocked == true and type(result.Requirements) == "table" and str1.Lab.BannerOk(result.BannerId) then
								for _, requirement in ipairs(result.Requirements) do
									table.insert(requirements, tostring(requirement))
								end
							end

							rift.Requirements = requirements
							rift.At = os.clock()
						end
					end

					rift.Busy = false
					tbl2.Wake()
				end)

				return false
			end)
		end

		local tbl105
		tbl105 = { "Always", "Steal Idle", "After Steal", "Night Only" }
		local tbl106
		tbl106 = { "Biggest Size", "Highest Value", "Smallest Size", "Backpack Order" }
		local flag170
		flag170 = tbl105[1]
		local flag171
		flag171 = tbl106[2]
		local tbl107
		tbl107 = {}
		local tbl108
		tbl108 = {}
		local n8
		n8 = 0

		do
			local function func145()
				if type(str1.PlaceEggRefresh) == "function" then
					str1.PlaceEggRefresh()
				end
			end

			local function func146(list16)
				local tbl109 = {}

				if type(list16) == "table" then
					for k, value126 in pairs(list16) do
						k = value126 == true and type(k) == "string" and k or type(value126) == "string" and value126 or nil

						if k then
							table.insert(tbl109, k)
						end
					end
				end

				return tbl109
			end

			str1.PlaceEggStatusRow = obj5:CreateText({ Name = "Pen Status", Text = "Pen status unknown" })

			str1.PlaceEggHandle = obj5:CreateToggle({
				Name = "Auto Place Egg",
				Default = false,
				Callback = function()
					if type(str1.PlaceEggRestart) == "function" then
						str1.PlaceEggRestart()
					end
				end,
			})

			local placeEggHandle = str1.PlaceEggHandle

			obj5:CreateDropdown({
				Name = "Place Egg Rule",
				Options = tbl105,
				Default = tbl105[1],
				SubOf = placeEggHandle,
				Callback = function(value)
					if table.find(tbl105, value) then
						flag170 = value
					end
				end,
			})

			obj5:CreateDropdown({
				Name = "Place Egg Order",
				Options = tbl106,
				Default = tbl106[2],
				SubOf = placeEggHandle,
				Callback = function(value)
					if table.find(tbl106, value) then
						flag171 = value
					end
				end,
			})

			local tbl110 = {}

			for i = 2, #list3 do
				table.insert(tbl110, list3[i])
			end

			if #tbl110 > 0 then
				func6(obj5:CreateMultiDropdown({
					Name = "Place Rarities",
					Note = "Only place eggs of the picked rarities (empty = all)",
					Options = tbl110,
					Default = {},
					SubOf = placeEggHandle,
					Callback = function(value)
						local tbl111 = {}

						for _, item48 in ipairs(func146(value)) do
							local entry7 = tbl8[item48]

							if entry7 and entry7 > 0 then
								tbl111[entry7] = true
							end
						end

						tbl107 = tbl111
						func145()
					end,
				}))
			end

			local tbl112 = {}
			local tbl113 = {}
			local directory = tbl1.Assets and tbl1.Assets.Directory
			local tbl114 = {}

			if type(directory) == "table" then
				for k, value127 in pairs(directory) do
					local rarity = type(value127) == "table" and value127.Rarity or nil
					local flag172 = type(rarity) == "table"

					if flag172 then
						flag172 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					flag172 = flag172 or nil

					if flag172 then
						table.insert(tbl114, {
							Category = tostring(k),
							Name = tostring(value127.DisplayName or k),
							Rarity = flag172,
							RarityName = tostring(rarity.DisplayName or rarity._id or flag172),
						})
					end
				end
			end

			table.sort(tbl114, function(param104, param105)
				if param104.Rarity ~= param105.Rarity then
					return param104.Rarity > param105.Rarity
				end
				return param104.Name < param105.Name
			end)

			for _, item49 in ipairs(tbl114) do
				local formatted4 = string.format("%s [%s]", item49.Name, item49.RarityName)

				if tbl113[formatted4] then
					formatted4 = string.format("%s [%s] (%s)", item49.Name, item49.RarityName, item49.Category)
				end

				table.insert(tbl112, formatted4)
				tbl113[formatted4] = item49.Category
			end

			if #tbl112 > 0 then
				func6(obj5:CreateMultiDropdown({
					Name = "Place Specific Eggs",
					Note = "Only place these eggs (empty = all)",
					Options = tbl112,
					Default = {},
					SubOf = placeEggHandle,
					Callback = function(value)
						local tbl115 = {}

						for _, item50 in ipairs(func146(value)) do
							if tbl113[item50] then
								tbl115[tbl113[item50]] = true
							end
						end

						tbl108 = tbl115
						func145()
					end,
				}))
			end

			local tbl116 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}

			local n9 = 0
			local str14 = "M/s"

			local function func147(flag173, flag174)
				if flag173 ~= nil then
					n9 = math.max(0, math.floor(tonumber(flag173) or n9))
				end

				if flag174 ~= nil then
					str14 = tostring(flag174)
				end

				n8 = n9 * (tbl116[str14] or tbl116["M/s"]).Mult
			end

			func5(obj5, {
				Name = "Min Place Value",
				Note = "Skip eggs worth less than this (0 = off)",
				SubOf = placeEggHandle,
				Legacy = "Place Min Value",
				SectionName = "Auto Place Egg",
				OnRaw = function(num67)
					func147(math.floor(num67 / 1000), "K/s")
				end,
			})
		end

		do
			local n9 = 5
			local n10 = 26
			local n11 = 6
			local n12 = 8
			local n13 = 0
			local n14 = 30
			local n15 = 12
			local placeEggHandle = nil
			local placeEggStatusRow = nil
			local str15 = "Pen status unknown"
			local flag175 = false
			local tbl117 = {}
			local n16 = 0
			local value128 = nil
			local n17 = 30

			local function func148(childName5, param106)
				local obj30 = networking:FindFirstChild(childName5)
				if not obj30 or not obj30:IsA("RemoteFunction") then
					return false, nil
				end
				return pcall(obj30.InvokeServer, obj30, param106)
			end

			local function func149(param107)
				local directory = tbl1.Assets and tbl1.Assets.Directory
				local flag176 = type(directory) == "table" and directory[tostring(param107.AssetCategory)] or nil
				return type(flag176) == "table" and flag176 or nil
			end

			local function func150(param108)
				local rarity = func149(param108)
				rarity = rarity and rarity.Rarity or nil
				local flag177 = type(rarity) == "table"

				if flag177 then
					flag177 = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				return flag177 or 0
			end

			local function func151(param109)
				local n18 = func149(param109)
				n18 = n18 and tonumber(n18.EarningRate) or 0
				local n19 = tonumber(param109.AssetScale) or 0
				if n19 <= 0 then
					return 0
				end
				local n20 = n19 > 5 and (n19 / 5) ^ 1.2 * 19.637875755794113 or n19 ^ 1.85
				local mutations = tbl1.Mutations
				local flag178 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n21 = 1

				if flag178 then
					local ok
					ok, n21 = pcall(mutations.EarningsFor, type(param109.Mutations) == "table" and param109.Mutations or {})
					ok = ok and type(n21) == "number"
					local n22 = 1

					if not ok then
						n21 = n22
					end
				end

				return n18 * n20 * n21
			end

			local function func152()
				local tbl118 = {}
				local backpack = localPlayer:FindFirstChildOfClass("Backpack")
				if not backpack then
					return tbl118
				end
				local n18 = 0

				for _, child in ipairs(backpack:GetChildren()) do
					local attribute = child:GetAttribute("UID")

					if type(attribute) == "string" then
						n18 += 1
						tbl118[attribute] = n18
					end
				end

				return tbl118
			end

			local function func153()
				local eggState = tbl1.EggState
				if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return {}
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return {}
				end
				local result26 = func152()
				local tbl119 = str1.Lab.StockTargets()
				local tbl120 = {}

				if str1.RiftOn("Place") then
					tbl120 = str1.RiftShortfall()

					for _, value129 in pairs(result) do
						if type(value129) == "table" and value129.Placement ~= nil then
							local assetCategory5 = tostring(value129.AssetCategory)

							if (tbl120[assetCategory5] or 0) > 0 then
								tbl120[assetCategory5] = tbl120[assetCategory5] - 1
							end
						end
					end
				end

				local tbl121 = {}

				for k, value130 in pairs(result) do
					if type(value130) == "table" and value130.Placement == nil and not tbl117[k] and not str1.Lab.Reserved[k] then
						local assetCategory6 = tostring(value130.AssetCategory)

						if (tbl119[assetCategory6] or 0) > 0 then
							tbl119[assetCategory6] = tbl119[assetCategory6] - 1
						else
							local value131 = func151(value130)
							local assetCategory7 = tostring(value130.AssetCategory)
							local flag179 = next(tbl107) == nil or tbl107[func150(value130)] == true
							local flag180 = next(tbl108) == nil or tbl108[assetCategory7] == true
							local flag181 = n8 <= 0 or value131 >= n8
							local flag182 = (tbl120[assetCategory7] or 0) > 0

							if flag182 then
								tbl120[assetCategory7] = tbl120[assetCategory7] - 1
							end

							if str1.Lab.PlaceOn and str1.Lab.IsLabPet(assetCategory7) then
								flag182 = true
							end

							flag181 = str1.Toggle(str1.PlaceEggHandle, false) == true and flag179 and flag180 and flag181

							if flag182 or flag181 then
								table.insert(tbl121, {
									Uid = k,
									Scale = tonumber(value130.AssetScale) or 0,
									Income = value131,
									Slot = result26[k] or math.huge,
									Rift = flag182,
								})
							end
						end
					end
				end

				table.sort(tbl121, function(param110, param111)
					if param110.Rift ~= param111.Rift then
						return param110.Rift
					end

					if flag171 == tbl106[2] and param110.Income ~= param111.Income then
						return param110.Income > param111.Income
					end

					if flag171 == tbl106[3] and param110.Scale ~= param111.Scale then
						return param110.Scale < param111.Scale
					end

					if flag171 == tbl106[4] and param110.Slot ~= param111.Slot then
						return param110.Slot < param111.Slot
					end
					return param110.Scale > param111.Scale
				end)

				return tbl121
			end

			local function func154(flag183)
				if flag183 == 0 then
					return false
				end

				if not str1.Toggle(placeEggHandle, false) then
					return true
				end
				local steal = str1.Steal
				if flag170 == tbl105[2] then
					return not steal.Active and not steal.Carrying
				end

				if flag170 == tbl105[3] then
					local flag184 = steal.LastFinishedAt > 0
					local flag185

					if flag184 then
						local lastFinishedAt = steal.LastFinishedAt
						flag185 = os.clock() - lastFinishedAt <= n15
					else
						flag185 = flag184
					end

					return flag185
				end

				if flag170 == tbl105[4] then
					return str1.IsNight()
				end
				return true
			end

			local function func155()
				local eggState = tbl1.EggState
				local flag186 = type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function"
				local n18 = 0

				if flag186 then
					local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)

					if ok and type(result) == "table" then
						for _, value132 in pairs(result) do
							if type(value132) == "table" and value132.Placement ~= nil then
								n18 += 1
							end
						end
					end
				end

				local save = tbl1.Save
				local flag187 = type(save) == "table" and type(save.Get) == "function"
				local value133 = nil

				if flag187 then
					local ok, result = pcall(save.Get)
					value133 = ok and type(result) == "table" and result or nil
				end

				local flag188 = value133 and type(value133.EquippedAssets) == "table"
				local n19 = 0

				if flag188 then
					for k in pairs(value133.EquippedAssets) do
						n19 += 1
					end
				end

				local value134 = func2(function()
					return ReplicatedStorage.Data.Bases
				end)

				local flag189 = type(value134) == "table" and type(value134.GetAssetEquipCapacity) == "function"
				local ok = nil

				if flag189 then
					local result
					ok, result = pcall(value134.GetAssetEquipCapacity, value133 and tonumber(value133.BaseUpgradeLevel) or 0)
					ok = ok and tonumber(result) or nil
				end

				if not ok then
					local rfPenRosterAskWearLimit = networking:FindFirstChild("RF/PenRoster/AskWearLimit")

					if rfPenRosterAskWearLimit and rfPenRosterAskWearLimit:IsA("RemoteFunction") then
						local result
						ok, result = pcall(rfPenRosterAskWearLimit.InvokeServer, rfPenRosterAskWearLimit)
						ok = ok and tonumber(result) or nil
					end
				end

				local n20 = ok or 0
				return n20 - n18 - n19, n20, n18, n19
			end

			local n18 = -0.5
			local n19 = -24

			local function func156()
				local eggState = tbl1.EggState
				local tbl122 = {}
				if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return tbl122
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return tbl122
				end

				for _, value135 in pairs(result) do
					local placement = type(value135) == "table" and value135.Placement or nil
					local localCFrame = type(placement) == "table" and placement.LocalCFrame or nil

					if typeof(localCFrame) == "CFrame" then
						table.insert(tbl122, Vector2.new(localCFrame.Position.X, localCFrame.Position.Z))
					end
				end

				return tbl122
			end

			local obj31 = Random.new()

			local function func157(list17)
				local tbl123 = {}

				for i = n19, 8, 4 do
					for i2 = 4, 30, 4 do
						local vector2 = Vector2.new(i, i2)
						local flag190 = true

						for _, item51 in ipairs(list17) do
							if (item51 - vector2).Magnitude < n9 then
								flag190 = false
								break
							end
						end

						if flag190 then
							table.insert(tbl123, CFrame.new(i, n18, i2))
						end
					end
				end

				for i = #tbl123, 2, -1 do
					local value136 = obj31:NextInteger(1, i)
					local entry8 = tbl123[i]
					tbl123[i] = tbl123[value136]
					tbl123[value136] = entry8
				end

				return tbl123
			end

			local function func158()
				local value137, value138, value139, value140 = func155()
				local eggState = tbl1.EggState
				local flag191 = type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function"
				local n20 = 0

				if flag191 then
					local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)

					if ok and type(result) == "table" then
						for _, value141 in pairs(result) do
							if type(value141) == "table" and value141.Placement == nil then
								n20 += 1
							end
						end
					end
				end

				str15 = string.format("Eggs placed %d/%d  -  %d/%d pets equipped, %d in bag", value139, 30, value140, value138, n20)
				return value137, value139
			end

			local function func159(num68, callback6)
				local flag192 = str1.Root()
				if not flag192 then
					return false
				end
				local position = flag192.Position
				local n20 = (num68 - position).Magnitude / math.max(400, 1) + 3
				local value142 = nil
				local n21 = 0

				local connection2 = RunService.Heartbeat:Connect(function(deltaTime)
					if value142 ~= nil or str1.AntiGuard.Busy then
						return
					end
					n21 += deltaTime
					local flag193 = str1.Root()
					if not flag193 or callback6() or n21 > n20 then
						value142 = false
						return
					end

					if (flag193.Position - position).Magnitude > 6 then
						position = flag193.Position
					end

					local n22 = num68 - position
					local n23 = n7 * deltaTime
					local flag194 = n22.Magnitude <= math.max(n23, 0.05)
					position = flag194 and num68 or position + n22.Unit * n23
					local vector = Vector3.new(n22.X, 0, n22.Z)
					local cframe = vector.Magnitude > 0.05 and CFrame.lookAt(Vector3.zero, vector.Unit) or flag193.CFrame.Rotation

					pcall(function()
						flag193.CFrame = CFrame.new(position) * cframe
						flag193.AssemblyLinearVelocity = Vector3.zero
						flag193.AssemblyAngularVelocity = Vector3.zero
					end)

					if flag194 then
						value142 = true
					end
				end)

				while value142 == nil do
					RunService.Heartbeat:Wait()
				end

				connection2:Disconnect()
				return value142
			end

			local function func160()
				local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
				world = world and world:FindFirstChild("Areas")
				world = world and world:FindFirstChild("SeparationLine")
				return world and world:IsA("BasePart") and world.Position.X or 552
			end

			local value143 = nil

			local function func161(num69)
				local flag195 = str1.Root()
				if not flag195 or type(str1.StealHome) ~= "function" then
					return nil
				end
				local result27 = func160()
				if flag195.Position.X < result27 == num69.X < result27 then
					return nil
				end
				local ok, result = pcall(str1.StealHome)
				if not ok or typeof(result) ~= "Vector3" then
					return nil
				end

				if (result - num69).Magnitude <= 12 or (flag195.Position - result).Magnitude <= 12 then
					return nil
				end
				return result
			end

			value143 = function(num70, callback7, flag196, flag197)
				local flag198 = str1.Root()
				if not flag198 then
					return false
				end

				if not flag197 then
					local flag199 = func161(num70)
					if flag199 and not value143(flag199, callback7, flag196, true) then
						return false
					end

					if callback7 and callback7() then
						return false
					end
					flag198 = str1.Root()
					if not flag198 then
						return false
					end
				end

				str1.Shield(flag196 or "place", true)
				str1.Driving = str1.Driving + 1
				task.wait(0.2)
				local n20 = num70 + Vector3.new(0, 3, 0)
				local n21 = math.max(flag198.Position.Y, n20.Y) + n17

				local ok, result = pcall(function()
					return func159(Vector3.new(flag198.Position.X, n21, flag198.Position.Z), callback7) and func159(Vector3.new(n20.X, n21, n20.Z), callback7) and func159(n20, callback7)
				end)

				ok = ok and result == true
				str1.Driving = math.max(0, str1.Driving - 1)
				str1.Shield(flag196 or "place", false)
				return ok
			end

			str1.FlyTo = function(param112, param113, flag200)
				return value143(param112, param113, flag200 or "fly")
			end

			local function func162()
				local eggState = tbl1.EggState
				if type(eggState) ~= "table" or type(eggState.PlantEgg) ~= "function" then
					return false
				end
				local result28 = func153()
				if not func154(#result28) then
					return false
				end
				func158()
				local value144, value145, value146 = func155()
				local n20 = n14 - (tonumber(value146) or 0)
				if n20 <= 0 then
					return false
				end
				local penAnch = str1.PenAnchor()
				if not penAnch then
					return false
				end
				str1.Movement.PlaceWanted = true
				if not str1.ClaimMovement("place") then
					return "waiting"
				end
				local flag201 = n16

				local function func163()
					local flag202 = str1.Toggle(placeEggHandle, false) == true
					local flag203 = flag201 ~= n16

					if not flag203 then
						flag203 = not (flag202 or str1.Lab.PlaceOn)
					end

					if flag203 then
						return true
					end

					if str1.IsNight() then
						return false
					end
					return flag202 and flag170 == tbl105[4] or str1.Movement.StealFirst
				end

				if str1.Treadmill.Riding or str1.OnBelt() then
					str1.ExitBelt()
				end

				local function func164()
					str1.HoldBelt()
					local ok, result = pcall(value143, penAnch, func163)
					str1.ReleaseBelt()
					return ok and result and true or false
				end

				if str1.DistanceTo(penAnch) > n10 then
					str15 = "Flying to the pen"

					if not func164() then
						str1.LeaveBelt()
						n13 = os.clock() + n11
						return false
					end
				end

				str1.LeaveBelt()
				if func163() then
					return false
				end

				local function func165()
					if str1.DistanceTo(penAnch) <= n10 then
						return true
					end

					if func163() then
						return false
					end
					str15 = "Pen out of reach, flying back"
					return func164() and str1.DistanceTo(penAnch) <= n10
				end

				if not func165() then
					str15 = "Could not reach the pen, trying again soon"
					n13 = os.clock() + n11
					return false
				end

				local result29 = func156()
				local n21 = 0
				local n22 = 0

				for _, item52 in ipairs(result28) do
					if not (n21 >= n20 or func163()) then
						if not func165() then
							str15 = "Pen out of reach, stopping this pass"
							break
						else
							local ok, result = pcall(eggState.WearEggTool, item52.Uid)

							if ok and result ~= false then
								task.wait(0.15)
								local n23 = 0
								local flag204 = false

								for _, item53 in ipairs(func157(result29)) do
									if not (func163() or n23 >= n12) then
										n23 += 1
										local AskPlaceEgg, flag205 = func148("RF/EggWorld/AskPlaceEgg", { Uid = item52.Uid, LocalCFrame = item53 })

										if AskPlaceEgg and flag205 ~= false then
											table.insert(result29, Vector2.new(item53.Position.X, item53.Position.Z))
											n21 += 1
											flag204 = true
											break
										else
											continue
										end
									end

									break
								end

								if flag204 then
									n22 = 0
									continue
								else
									tbl117[item52.Uid] = true
									n22 += 1
									if not (n22 >= 2) then
										continue
									end
								end
							else
								tbl117[item52.Uid] = true
								continue
							end
						end
					end

					break
				end

				if type(eggState.DoffEggTool) == "function" then
					pcall(eggState.DoffEggTool)
				end

				if n21 == 0 then
					n13 = os.clock() + n11
				end

				return n21 > 0
			end

			tbl2.Add(function()
				local value147, value148 = func158()

				if placeEggStatusRow and type(placeEggStatusRow.Set) == "function" then
					pcall(placeEggStatusRow.Set, placeEggStatusRow, str15)
				end

				local num71 = tonumber(value148)
				local flag206 = num71 ~= nil and value128 ~= nil and num71 < value128

				if num71 then
					value128 = num71
				end

				if flag206 then
					table.clear(tbl117)
				end

				if not str1.Toggle(placeEggHandle, false) and not str1.Lab.PlaceOn then
					str1.Movement.PlaceWanted = false
					str1.ReleaseMovement("place")
					return false
				end

				if flag175 then
					return false
				end

				if os.clock() < n13 then
					str1.Movement.PlaceWanted = false
					return false
				end

				if str1.Movement.StealFirst and not str1.IsNight() then
					str1.Movement.PlaceWanted = false
					return false
				end
				flag175 = true

				task.spawn(function()
					local ok, result = pcall(func162)

					if not (ok and result == "waiting") then
						str1.Movement.PlaceWanted = false
					end

					str1.ReleaseMovement("place")
					flag175 = false
					tbl2.Wake()
				end)

				return false
			end)

			placeEggHandle = str1.PlaceEggHandle
			placeEggStatusRow = str1.PlaceEggStatusRow

			str1.PlaceEggRestart = function()
				table.clear(tbl117)
				n16 += 1
				str1.StopWalking()
				tbl2.Wake()
			end

			str1.PlaceEggRefresh = function()
				table.clear(tbl117)
				tbl2.Wake()
			end

			str1.Rift.Restart.Place = function()
				table.clear(tbl117)
				tbl2.Wake()
			end
		end

		local save = tbl1.Save

		if type(save) == "table" and type(save.FieldSignal) == "function" then
			for _, item54 in ipairs({ "EggInventory", "EquippedAssets", "BaseUpgradeLevel" }) do
				local ok, result = pcall(save.FieldSignal, item54)

				if ok and type(result) == "table" and type(result.Connect) == "function" then
					local ok2, result2 = pcall(result.Connect, result, function()
						tbl2.Wake()
					end)

					if ok2 and result2 then
						func4(function()
							pcall(function()
								result2:Disconnect()
							end)
						end)
					end
				end
			end
		end

		str1.Steal.HeldByMe = function()
			local carryUid = str1.Steal.CarryUid
			local character = localPlayer.Character
			if type(carryUid) ~= "string" or not character then
				return false
			end
			local obj32 = workspace:FindFirstChild(carryUid)
			if not obj32 then
				return false
			end

			for _, descendant in ipairs(obj32:GetDescendants()) do
				if descendant:IsA("WeldConstraint") or descendant:IsA("JointInstance") then
					local ok, result, result2 = pcall(function()
						return descendant.Part0, descendant.Part1
					end)

					local value149

					if ok then
						value149 = result and result:IsDescendantOf(character) or result2 and result2:IsDescendantOf(character)
					else
						value149 = ok
					end

					if value149 then
						return true
					end
				end
			end

			return false
		end

		do
			local n9 = 0

			local connection2 = RunService.Heartbeat:Connect(function(deltaTime)
				n9 += deltaTime
				if n9 < 0.2 then
					return
				end
				n9 = 0
				local steal = str1.Steal

				if not steal.Carrying then
					if steal.GuessedDrop then
						local ok, result = pcall(steal.HeldByMe)

						if ok and result then
							steal.GuessedDrop = false
							steal.Carrying = true
							steal.HeldSeenAt = os.clock()
						end
					end

					return
				end

				local ok, result = pcall(steal.HeldByMe)
				if not ok or result then
					steal.HeldSeenAt = os.clock()
					return
				end

				if os.clock() - (steal.HeldSeenAt or 0) > 0.8 then
					steal.Carrying = false
					steal.GuessedDrop = true
					steal.LastFinishedAt = os.clock()
					tbl2.Wake()
				end
			end)

			func4(function()
				pcall(function()
					connection2:Disconnect()
				end)
			end)
		end

		do
			local eggState = tbl1.EggState
			local carryChanged = type(eggState) == "table" and eggState.CarryChanged or nil

			if type(carryChanged) == "table" and type(carryChanged.Connect) == "function" then
				local ok, result = pcall(carryChanged.Connect, carryChanged, function(param114)
					local carrying = type(param114) == "table" and param114.IsCarrying == true

					if str1.Steal.Carrying and not carrying then
						str1.Steal.LastFinishedAt = os.clock()
					end

					str1.Steal.GuessedDrop = false

					if carrying then
						str1.Steal.HeldSeenAt = os.clock()
					end

					if carrying and type(param114.Uid) == "string" then
						str1.Steal.CarryUid = param114.Uid
						str1.Steal.CarryAreaId = param114.AreaId
						local mult = tonumber(param114.SpeedMultiplier)

						if mult and mult > 0 then
							str1.SafeCarry.Mult = mult
							str1.SafeCarry.Category = param114.AssetCategory

							if param114.AssetCategory ~= nil then
								local assetCategory8 = tostring(param114.AssetCategory)
								str1.SafeCarry.Seen[assetCategory8] = math.min(str1.SafeCarry.Seen[assetCategory8] or mult, mult)
							end
						end
					end

					str1.Steal.Carrying = carrying
					tbl2.Wake()
				end)

				if ok and result then
					func4(function()
						pcall(function()
							result:Disconnect()
						end)
					end)
				end
			end
		end

		pcall(function()
			local reEggWorldFieldEggRedeemVerdict = networking:FindFirstChild("RE/EggWorld/FieldEggRedeemVerdict")
			local reAlertsRaise = networking:FindFirstChild("RE/Alerts/Raise")

			if reEggWorldFieldEggRedeemVerdict and reEggWorldFieldEggRedeemVerdict:IsA("RemoteEvent") then
				local connection2 = reEggWorldFieldEggRedeemVerdict.OnClientEvent:Connect(function()
					str1.SafeCarry.LastDelivered = os.clock()
				end)

				func4(function()
					connection2:Disconnect()
				end)
			end

			if reAlertsRaise and reAlertsRaise:IsA("RemoteEvent") then
				local connection2 = reAlertsRaise.OnClientEvent:Connect(function(param115)
					if type(param115) == "table" and type(param115.Text) == "string" and string.find(param115.Text, "Delivery failed", 1, true) then
						str1.SafeCarry.LastFailed = os.clock()
					end
				end)

				func4(function()
					connection2:Disconnect()
				end)
			end
		end)

		do
			local n9 = 10
			local n10 = 1
			local n11 = 5

			local function func166(childName6)
				local obj33 = networking:FindFirstChild(childName6)
				if not obj33 or not obj33:IsA("RemoteFunction") then
					return false, nil, nil
				end
				local ok, result, result2 = pcall(obj33.InvokeServer, obj33)
				return ok, result, result2
			end

			local n12 = 0
			local flag207 = false

			local function func167(flag208, flag209, param116)
				if flag208 and flag209 ~= false then
					n12 = 0
					flag207 = false
					return true
				end

				if flag208 and tostring(param116) == "Already using treadmill" then
					n12 = 0
					flag207 = false
					return true
				end

				if flag208 and tostring(param116) == "Not grounded" and str1.Grounded() then
					n12 += 1

					if n12 >= 2 then
						n12 = 0

						if not flag207 then
							flag207 = true
							pcall(str1.UndoSwap)
						elseif type(str1.RequestRespawn) == "function" then
							flag207 = false
							str1.RequestRespawn()
						end
					end
				end

				return false
			end

			local value150 = nil
			local value151 = nil
			local flag210 = false
			local n13 = 0
			local flag211 = false
			local treadmill = str1.Treadmill

			local function func168()
				return str1.Toggle(value150, false)
			end

			local function func169()
				local movement = str1.Movement
				return movement.PlaceWanted or movement.ScrambleWanted or movement.MutationWanted or movement.FracturedWanted or movement.Owner ~= nil and movement.Owner ~= "treadmill" or str1.Steal.Active or str1.Steal.Carrying
			end

			local function func170()
				local flag212 = n13
				if func169() or not str1.ClaimMovement("treadmill") then
					return false
				end

				local function func171()
					return flag212 ~= n13 or not func168() or str1.Movement.Owner ~= "treadmill" or func169()
				end

				if str1.BeltHeld() then
					str1.ResetBelt()
				end

				local flag213 = str1.Belt()
				if not flag213 then
					return false
				end
				local n14 = flag213.Position + Vector3.new(0, flag213.Size.Y / 2, 0)

				if n9 < str1.DistanceTo(n14 + Vector3.new(0, 2, 0)) then
					if type(str1.FlyTo) ~= "function" or not str1.FlyTo(n14, func171, "treadmill") then
						return false
					end
				end

				if func171() then
					return false
				end
				treadmill.Riding = func167(func166("RF/Treadmill/AskWearStill"))
				return treadmill.Riding
			end

			tbl2.Add(function()
				if not func168() then
					if treadmill.Riding and not flag210 then
						flag210 = true

						task.spawn(function()
							pcall(str1.ExitBelt)
							flag210 = false
							tbl2.Wake()
						end)
					end

					return false
				end

				if flag210 or func169() then
					return false
				end

				if treadmill.Riding and str1.Toggle(value151, true) and str1.OnBelt() then
					if os.clock() >= (treadmill.NextCheck or 0) and not str1.Flying and str1.Grounded() then
						treadmill.NextCheck = os.clock() + n11
						flag210 = true

						task.spawn(function()
							local ok, result = pcall(function()
								return func167(func166("RF/Treadmill/AskWearStill"))
							end)

							treadmill.Riding = ok and result == true

							if not treadmill.Riding then
								treadmill.NextTry = 0
							end

							flag210 = false
							tbl2.Wake()
						end)
					end

					return false
				end

				if os.clock() < (treadmill.NextTry or 0) then
					return false
				end
				treadmill.NextCheck = 0
				treadmill.NextTry = os.clock() + (treadmill.LastFailed and 3 or 4)
				flag210 = true

				task.spawn(function()
					local ok, result = pcall(func170)
					treadmill.LastFailed = not (ok and result == true)
					str1.ReleaseMovement("treadmill")
					flag210 = false
					tbl2.Wake()
				end)

				return false
			end)

			task.spawn(function()
				while not flag211 do
					task.wait(3)

					if not func168() and not func169() and not str1.Flying and str1.OnBelt() and str1.Grounded() then
						func167(func166("RF/Treadmill/AskWearStill"))
					end
				end
			end)

			task.spawn(function()
				local n14 = 0

				while not flag211 do
					local value152 = task.wait(0.25)

					if not func168() or not treadmill.Riding or func169() then
						n14 = 0
					elseif str1.OnBelt() then
						n14 = 0
					else
						n14 += value152

						if n14 >= 1.5 then
							treadmill.Riding = false
							treadmill.NextTry = 0
							tbl2.Wake()
							n14 = 0
						end
					end
				end
			end)

			task.spawn(function()
				local n14 = 0
				local n15 = 0
				local position = nil

				while not flag211 do
					local num72 = task.wait(0.25)
					n14 = math.max(0, n14 - num72)
					local riding = treadmill.Riding and func168() and not func169()
					local flag214 = str1.Root()
					local character = localPlayer.Character
					character = character and character:FindFirstChildOfClass("Humanoid")

					if riding or not (str1.Flying or str1.Movement.Owner ~= nil or str1.Movement.PlaceWanted or character ~= nil and character.MoveDirection.Magnitude > 0.1) or not flag214 or not str1.OnBelt() then
						position = flag214 and flag214.Position
						n15 = 0
						position = position or nil
					else
						local vector = Vector3.new(flag214.Position.X, 0, flag214.Position.Z)
						position = position and (vector - Vector3.new(position.X, 0, position.Z)).Magnitude < 0.5

						if position then
							n15 += num72
						else
							n15 = 0
						end

						position = flag214.Position

						if n15 >= n10 and n14 <= 0 then
							pcall(str1.ExitBelt)
							n14 = 1.5
							n15 = 0
						end
					end
				end
			end)

			func4(function()
				flag211 = true
				treadmill.Riding = false
			end)

			value150 = obj6:CreateToggle({
				Name = "Auto Treadmill",
				Default = false,
				Callback = function()
					n13 += 1
					str1.StopWalking()
					tbl2.Wake()
				end,
			})

			value151 = obj6:CreateToggle({ Name = "Stay On Treadmill", Default = true })
			pcall(function()
				obj6:CreateToggle({
					Name = "Auto Use Admin Treadmill",
					Note = "Automatically rides the Admin Treadmill whenever the event spawns on the map",
					Default = true,
					Callback = function(v)
						treadmill.AdminTreadmill = v ~= false
						treadmill.NextTry = 0
						tbl2.Wake()
					end,
				})
			end)
		end

		do
			local n9 = 4
			local n10 = 10
			local value153 = nil
			local flag215 = false
			local n11 = 0
			local tbl124 = {}
			local tbl125 = { MinRarity = 0, MinIncome = 0, Eggs = {} }

			local function func172(childName7, param117)
				local obj34 = networking:FindFirstChild(childName7)
				if not obj34 or not obj34:IsA("RemoteFunction") then
					return false, nil
				end
				return pcall(obj34.InvokeServer, obj34, param117)
			end

			local function func173(param118)
				local flag216 = tbl125.MinRarity > 0
				local flag217

				if flag216 then
					local minRarity = tbl125.MinRarity
					flag217 = str1.EggRarity(param118) < minRarity
				else
					flag217 = flag216
				end

				if flag217 then
					return false
				end
				local flag218 = tbl125.MinIncome > 0

				if flag218 then
					local minIncome = tbl125.MinIncome
					flag218 = str1.EggIncome(param118) < minIncome
				end

				if flag218 then
					return false
				end

				if next(tbl125.Eggs) ~= nil and tbl125.Eggs[tostring(param118.AssetCategory)] ~= true then
					return false
				end
				return true
			end

			local function func174()
				local eggState = tbl1.EggState
				if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return {}
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return {}
				end
				local flag219 = str1.Toggle(value153, false) == true
				local Hatch = str1.RiftOn("Hatch") and str1.RiftShortfall() or {}
				local tbl126 = {}
				local tbl127 = {}

				for k, value154 in pairs(result) do
					local flag220 = type(value154) == "table" and value154.Placement ~= nil

					if flag220 then
						flag220 = (tbl124[k] or 0) <= os.clock()
					end

					if flag220 then
						local ok2, result2 = pcall(eggState.IsReadyToHatch, k)

						if ok2 and result2 == true then
							local assetCategory9 = tostring(value154.AssetCategory)

							if (Hatch[assetCategory9] or 0) > 0 then
								Hatch[assetCategory9] = Hatch[assetCategory9] - 1
								table.insert(tbl126, k)
							elseif flag219 and func173(value154) then
								table.insert(tbl127, k)
							end
						end
					end
				end

				for _, item55 in ipairs(tbl127) do
					table.insert(tbl126, item55)
				end

				return tbl126
			end

			local function func175()
				return str1.Toggle(value153, false) or str1.RiftOn("Hatch")
			end

			local function func176()
				local flag221 = n11
				local result30 = func174()
				local n12 = 0

				for _, item56 in ipairs(result30) do
					if not (n12 >= n9 or flag221 ~= n11 or not func175()) then
						local AskHatch, flag222 = func172("RF/EggWorld/AskHatch", item56)

						if AskHatch and flag222 ~= false then
							task.wait(0.35)
							func172("RF/EggWorld/AskFinishHatch", item56)
							n12 += 1
							tbl124[item56] = nil
						else
							tbl124[item56] = os.clock() + n10
						end

						task.wait(0.2)
						continue
					end

					break
				end

				return n12 > 0
			end

			tbl2.Add(function()
				if not func175() or flag215 then
					return false
				end
				flag215 = true

				task.spawn(function()
					pcall(func176)
					flag215 = false
				end)

				return false
			end)

			local function hatch()
				n11 += 1
				table.clear(tbl124)
				tbl2.Wake()
			end

			value153 = obj7:CreateToggle({ Name = "Auto Hatch", Default = false, Callback = hatch })

			obj7:CreateDropdown({
				Name = "Hatch Min Rarity",
				Note = "Hatch eggs of the chosen rarity and every rarity above it",
				Options = list3,
				Default = list3[1],
				SubOf = value153,
				Callback = function(value)
					tbl125.MinRarity = tbl8[value] or 0
					hatch()
				end,
			})

			local tbl128 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}

			local tbl129 = { Slider = nil, Value = 0, Unit = "M/s" }

			local function func177(flag223, flag224)
				if flag223 ~= nil then
					tbl129.Value = math.max(0, math.floor(tonumber(flag223) or tbl129.Value))
				end

				if flag224 ~= nil then
					tbl129.Unit = tostring(flag224)
				end

				tbl125.MinIncome = tbl129.Value * (tbl128[tbl129.Unit] or tbl128["M/s"]).Mult
				hatch()
			end

			tbl129.Slider = func5(obj7, {
				Name = "Min Hatch Value",
				Note = "Skip eggs worth less than this (0 = off)",
				SubOf = value153,
				Legacy = "Hatch Min Value",
				SectionName = "Auto Hatch & Equip",
				OnRaw = function(num73)
					func177(math.floor(num73 / 1000), "K/s")
				end,
			})

			local tbl130 = {}
			local tbl131 = {}
			local directory = tbl1.Assets and tbl1.Assets.Directory
			local n12 = 0

			while (type(directory) ~= "table" or next(directory) == nil) and n12 < 2 do
				n12 += task.wait(0.1)

				if type(tbl1.Assets) ~= "table" then
					tbl1.Assets = func2(function()
						return ReplicatedStorage.Data.Assets
					end)
				end

				directory = tbl1.Assets and tbl1.Assets.Directory
			end

			local tbl132 = {}

			if type(directory) == "table" then
				for k, value155 in pairs(directory) do
					local rarity = type(value155) == "table" and value155.Rarity or nil
					local flag225 = type(rarity) == "table"
					local flag226

					if flag225 then
						flag226 = tonumber(rarity.RarityNumber or rarity.Rank)
					else
						flag226 = flag225
					end

					flag226 = flag226 or nil

					if flag226 then
						table.insert(tbl132, {
							Category = tostring(k),
							Name = tostring(value155.DisplayName or k),
							Rarity = flag226,
							RarityName = tostring(rarity.DisplayName or rarity._id or flag226),
						})
					end
				end
			end

			table.sort(tbl132, function(param119, param120)
				if param119.Rarity ~= param120.Rarity then
					return param119.Rarity > param120.Rarity
				end
				return param119.Name < param120.Name
			end)

			for _, item57 in ipairs(tbl132) do
				local formatted5 = string.format("%s [%s]", item57.Name, item57.RarityName)

				if tbl131[formatted5] then
					formatted5 = string.format("%s [%s] (%s)", item57.Name, item57.RarityName, item57.Category)
				end

				table.insert(tbl130, formatted5)
				tbl131[formatted5] = item57.Category
			end

			if #tbl130 > 0 then
				func6(obj7:CreateMultiDropdown({
					Name = "Hatch Specific Eggs",
					Note = "Only hatch these eggs (empty = all)",
					Options = tbl130,
					Default = {},
					SubOf = value153,
					Callback = function(value)
						local eggs = {}

						if type(value) == "table" then
							for k, value156 in pairs(value) do
								k = value156 == true and type(k) == "string" and k or type(value156) == "string" and value156 or nil

								if k and tbl131[k] then
									eggs[tbl131[k]] = true
								end
							end
						end

						tbl125.Eggs = eggs
						hatch()
					end,
				}))
			end

			str1.Rift.Restart.Hatch = hatch
		end

		do
			local n9 = 5
			local n10 = 30
			local value157 = nil
			local flag227 = false
			local n11 = 0
			local tbl133 = {}
			local n12 = 0
			local flag228 = true
			local value158 = nil
			local n13 = -math.huge

			local function func178(flag229)
				local value159 = func2(function()
					return ReplicatedStorage.Data.Bases
				end)

				if type(value159) == "table" and type(value159.GetAssetEquipCapacity) == "function" then
					local ok, result = pcall(value159.GetAssetEquipCapacity, flag229 and tonumber(flag229.BaseUpgradeLevel) or 0)
					if ok and tonumber(result) then
						return math.floor(tonumber(result))
					end
				end

				if value158 and os.clock() - n13 < n10 then
					return value158
				end
				local rfPenRosterAskWearLimit = networking:FindFirstChild("RF/PenRoster/AskWearLimit")

				if rfPenRosterAskWearLimit and rfPenRosterAskWearLimit:IsA("RemoteFunction") then
					local ok, result = pcall(rfPenRosterAskWearLimit.InvokeServer, rfPenRosterAskWearLimit)

					if ok and tonumber(result) then
						local n14 = math.floor(tonumber(result))
						local now = os.clock()
						value158 = n14
						n13 = now
						return value158
					end
				end

				return value158 or 0
			end

			local function func179(param121)
				local directory = tbl1.Assets and tbl1.Assets.Directory
				local flag230 = type(directory) == "table" and directory[tostring(param121.Category)] or nil
				local n14 = type(flag230) == "table" and tonumber(flag230.EarningRate) or 0
				local n15 = tonumber(param121.Scale) or 0
				if n14 <= 0 or n15 <= 0 then
					return 0
				end
				local n16 = n15 > 5 and (n15 / 5) ^ 1.2 * 19.637875755794113 or n15 ^ 1.85
				local mutations = tbl1.Mutations
				local flag231 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n17 = 1

				if flag231 then
					local ok
					ok, n17 = pcall(mutations.EarningsFor, type(param121.Mutations) == "table" and param121.Mutations or {})
					ok = ok and type(n17) == "number"
					local n18 = 1

					if not ok then
						n17 = n18
					end
				end

				return n14 * n16 * n17
			end

			local function func180()
				local save2 = tbl1.Save
				local flag232 = type(save2) == "table" and type(save2.Get) == "function"
				local result = nil

				if flag232 then
					local ok
					ok, result = pcall(save2.Get)
					result = ok and type(result) == "table" and result or nil
				end

				if not result then
					return nil
				end
				local tbl134 = {}
				local tbl135 = {}
				local func181 = pairs
				local equippedAssets = result.EquippedAssets or {}

				for _, equippedAsset in func181(equippedAssets) do
					if type(equippedAsset) == "string" then
						tbl134[equippedAsset] = true
						table.insert(tbl135, equippedAsset)
					end
				end

				local tbl136 = {}
				local func182 = pairs
				local inventory = result.Inventory or {}

				for k, value160 in func182(inventory) do
					if type(value160) == "table" and value160.InFuse ~= true then
						table.insert(tbl136, { Uid = k, Income = func179(value160), Equipped = tbl134[k] == true })
					end
				end

				table.sort(tbl136, function(param122, param123)
					if param122.Income ~= param123.Income then
						return param122.Income > param123.Income
					end
					return tostring(param122.Uid) < tostring(param123.Uid)
				end)

				return tbl136, tbl134, #tbl135, result
			end

			local function func183(list18, param124)
				local tbl137 = {}
				local flag233 = false

				for i, item58 in ipairs(list18) do
					if not (i > param124) then
						if not item58.Equipped then
							table.insert(tbl137, item58.Uid)

							if not tbl133[item58.Uid] then
								flag233 = true
							end
						end

						continue
					end

					break
				end

				return tbl137, flag233
			end


			tbl2.Add(function()
				if not str1.Toggle(value157, false) then
					return false
				end
				local value161, value162, value163, value164 = func180()

				if value161 then
					local value165 = func178(value164)
					local value166, flag234 = func183(value161, value165)

					if (flag234 or flag228) and not flag227 and os.clock() >= n12 then
						for _, item59 in ipairs(value166) do
							tbl133[item59] = true
						end

						flag228 = false
						flag227 = true
						n12 = os.clock() + n9
						local flag235 = n11

						task.spawn(function()
							local rfHaulFetchWearBestStatus = networking:FindFirstChild("RF/Haul/FetchWearBestStatus")
							local isRemoteFunction = rfHaulFetchWearBestStatus and rfHaulFetchWearBestStatus:IsA("RemoteFunction")
							local flag236 = true

							if isRemoteFunction then
								local ok, result = pcall(rfHaulFetchWearBestStatus.InvokeServer, rfHaulFetchWearBestStatus)
								flag236 = ok and result ~= false and result ~= nil
							end

							local rfHaulWearBest = networking:FindFirstChild("RF/Haul/WearBest")

							if flag236 and flag235 == n11 and rfHaulWearBest and rfHaulWearBest:IsA("RemoteFunction") then
								pcall(rfHaulWearBest.InvokeServer, rfHaulWearBest)
							end

							flag227 = false
							tbl2.Wake()
						end)
					end
				end

				return false
			end)

			value157 = obj7:CreateToggle({
				Name = "Auto Equip Best",
				Note = "Equip Best when a better pet appears",
				Default = false,
				Callback = function()
					n11 += 1
					table.clear(tbl133)
					n12 = 0
					flag228 = true
					tbl2.Wake()
				end,
			})

			local save2 = tbl1.Save

			if type(save2) == "table" and type(save2.FieldSignal) == "function" then
				for _, item60 in ipairs({ "Inventory", "EquippedAssets" }) do
					local ok, result = pcall(save2.FieldSignal, item60)

					if ok and type(result) == "table" and type(result.Connect) == "function" then
						local ok2, result2 = pcall(result.Connect, result, function()
							flag228 = true
							tbl2.Wake()
						end)

						if ok2 and result2 then
							func4(function()
								pcall(function()
									result2:Disconnect()
								end)
							end)
						end
					end
				end
			end
		end

		local n9
		n9 = 3
		local n10
		n10 = 50
		local tbl138
		tbl138 = { "Rarity Only", "Value Only", "Rarity And Value", "Rarity Or Value" }
		local tbl139, tbl140, tbl141, tbl142, value167

		do
			local value168 = func2(function()
				return ReplicatedStorage.Shared.Util.AssetItems
			end)

			tbl139 = {}
			tbl140 = {}
			tbl141 = {}
			tbl142 = {}
			local directory = tbl1.Assets and tbl1.Assets.Directory
			local tbl143 = {}
			local tbl144 = {}

			if type(directory) == "table" then
				for k, value169 in pairs(directory) do
					local rarity = type(value169) == "table" and value169.Rarity or nil
					local flag237 = type(rarity) == "table"
					local rarity2

					if flag237 then
						rarity2 = tonumber(rarity.RarityNumber or rarity.Rank)
					else
						rarity2 = flag237
					end

					rarity2 = rarity2 or nil

					if rarity2 then
						local rarityName = tostring(rarity.DisplayName or rarity._id or rarity2)
						tbl143[rarity2] = tbl143[rarity2] or rarityName
						local insert = table.insert
						local tbl145 = { Category = tostring(k) }
						local func184 = tostring
						k = value169.DisplayName or k
						tbl145.Name = func184(k)
						tbl145.Rarity = rarity2
						tbl145.RarityName = rarityName
						insert(tbl144, tbl145)
					end
				end
			end

			local tbl146 = {}

			for k in pairs(tbl143) do
				table.insert(tbl146, k)
			end

			table.sort(tbl146)

			for _, item61 in ipairs(tbl146) do
				local formatted6 = string.format("%d - %s", item61, tbl143[item61])
				table.insert(tbl139, formatted6)
				tbl140[formatted6] = item61
			end

			table.sort(tbl144, function(param125, param126)
				if param125.Rarity ~= param126.Rarity then
					return param125.Rarity < param126.Rarity
				end
				return param125.Name < param126.Name
			end)

			for _, item62 in ipairs(tbl144) do
				local formatted7 = string.format("%s [%s]", item62.Name, item62.RarityName)

				if tbl142[formatted7] then
					formatted7 = string.format("%s [%s] (%s)", item62.Name, item62.RarityName, item62.Category)
				end

				table.insert(tbl141, formatted7)
				tbl142[formatted7] = item62.Category
			end

			local function func185(param127)
				for _, item63 in ipairs(tbl139) do
					if tbl140[item63] == param127 then
						return item63
					end
				end

				return tbl139[1]
			end

			local value170 = nil
			value167 = nil
			local value171 = nil
			local value172 = nil
			local first5 = tbl138[1]
			local n11 = 3
			local n12 = 0
			local flag238 = true
			local tbl147 = {}
			local first6 = tbl138[1]
			local n13 = 3
			local n14 = 0
			local flag239 = true
			local tbl148 = {}
			local flag240 = false
			local n15 = 0

			local function func186(param128)
				local n16 = tonumber(param128) or 0
				local tbl149 = { "", "K", "M", "B", "T", "Qa", "Qi" }
				local n17 = 1

				while math.abs(n16) >= 1000 and n17 < #tbl149 do
					n16 /= 1000
					n17 += 1
				end

				return string.format(n17 == 1 and "$%.0f%s" or "$%.2f%s", n16, tbl149[n17])
			end

			local function func187(list19, tbl150)
				local tbl151 = {}

				if type(list19) == "table" then
					for k, value173 in pairs(list19) do
						k = value173 == true and type(k) == "string" and k

						if k then
							value173 = k
						else
							value173 = type(value173) == "string" and value173
						end

						value173 = value173 or nil

						if value173 then
							tbl151[tbl150 and tbl150[value173] or value173] = true
						end
					end
				end

				return tbl151
			end

			local function func188(param129)
				local directory2 = tbl1.Assets and tbl1.Assets.Directory
				local flag241 = type(directory2) == "table" and directory2[tostring(param129)] or nil
				local rarity = type(flag241) == "table" and flag241.Rarity or nil
				local flag242 = type(rarity) == "table"

				if flag242 then
					flag242 = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				return flag242 or math.huge
			end

			local function func189(param130)
				local directory2 = tbl1.Assets and tbl1.Assets.Directory
				local flag243 = type(directory2) == "table" and directory2[tostring(param130.Category)] or nil
				local n16 = type(flag243) == "table" and tonumber(flag243.EarningRate) or 0
				local n17 = tonumber(param130.Scale) or 0
				if n16 <= 0 or n17 <= 0 then
					return 0
				end
				local n18 = n17 > 5 and (n17 / 5) ^ 1.2 * 19.637875755794113 or n17 ^ 1.85
				local mutations = tbl1.Mutations
				local flag244 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n19 = 1

				if flag244 then
					local ok
					ok, n19 = pcall(mutations.EarningsFor, type(param130.Mutations) == "table" and param130.Mutations or {})
					local flag245 = ok and type(n19) == "number"
					local n20 = 1

					if not flag245 then
						n19 = n20
					end
				end

				return n16 * n18 * n19
			end

			local function func190(param131)
				return type(param131) == "table" and next(param131) ~= nil
			end

			local function func191()
				local save2 = tbl1.Save
				if type(save2) ~= "table" or type(save2.Get) ~= "function" then
					return nil
				end
				local ok, result = pcall(save2.Get)
				return ok and type(result) == "table" and result or nil
			end

			local function func192()
				local result31 = func191()
				local tbl152 = {}
				if not result31 then
					return tbl152, 0
				end
				local tbl153 = {}
				local func193 = pairs
				local equippedAssets = result31.EquippedAssets or {}

				for _, equippedAsset in func193(equippedAssets) do
					tbl153[equippedAsset] = true
				end

				local func194 = pairs
				local inventory = result31.Inventory or {}
				local n16 = 0

				for k, value174 in func194(inventory) do
					local flag246 = type(value174) == "table" and value174.InFuse ~= true and value174.IsFavorite ~= true and not tbl153[k] and not tbl147[tostring(value174.Category)]

					if flag246 then
						flag246 = not (flag238 and func190(value174.Mutations))
					end

					if flag246 then
						local num74 = func189(value174)
						local category3 = func188(value174.Category) <= n11
						local flag247 = n12 > 0 and num74 < n12

						if first5 ~= tbl138[2] then
							if first5 == tbl138[3] then
								flag247 = category3 and flag247
							elseif first5 == tbl138[4] then
								flag247 = category3 or flag247
							else
								flag247 = category3
							end
						end

						if flag247 then
							table.insert(tbl152, k)
							local flag248 = type(value168) == "table" and type(value168.SalePrice) == "function"
							local flag249 = false
							local result = nil

							if flag248 then
								flag249, result = pcall(value168.SalePrice, value174)
							end

							n16 += flag249 and tonumber(result) or num74 * 100
						end
					end
				end

				return tbl152, n16
			end

			local function func195()
				local tbl154 = {}
				local eggState = tbl1.EggState
				if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return tbl154, 0
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return tbl154, 0
				end
				local character = localPlayer.Character
				character = character and character:FindFirstChildWhichIsA("Tool")
				character = character and character:GetAttribute("UID") or nil
				local eggRecords = tbl1.EggRecords
				local value175, value176, value177 = pairs(result)
				local n16 = 0

				for k, value178 in value175, value176, value177 do
					local flag250 = type(value178) == "table" and value178.Placement == nil and k ~= character and not tbl148[tostring(value178.AssetCategory)]

					if flag250 then
						flag250 = not (flag239 and func190(value178.Mutations))
					end

					if flag250 then
						local flag251 = func189({ Category = value178.AssetCategory, Scale = value178.AssetScale, Mutations = value178.Mutations })
						local assetCategory10 = func188(value178.AssetCategory) <= n13
						local flag252 = n14 > 0 and flag251 < n14
						local value179

						if first6 == tbl138[2] then
							value179 = flag252
						elseif first6 == tbl138[3] then
							value179 = assetCategory10 and flag252
						elseif first6 ~= tbl138[4] then
							value179 = assetCategory10
						else
							value179 = assetCategory10 or flag252
						end

						if value179 then
							table.insert(tbl154, k)

							if type(eggRecords) == "table" and type(eggRecords.SellPrice) == "function" then
								local ok2, result2 = pcall(eggRecords.SellPrice, value178)
								n16 += ok2 and tonumber(result2) or 0
							end
						end
					end
				end

				return tbl154, n16
			end

			local function func196(list20, list21)
				local rePetSatchelSellSelection = networking:FindFirstChild("RE/PetSatchel/SellSelection")
				if not rePetSatchelSellSelection or not rePetSatchelSellSelection:IsA("RemoteEvent") then
					return false
				end
				local n16 = math.max(#list20, #list21)
				local n17 = 1

				while n17 <= n16 do
					local tbl155 = {}
					local tbl156 = {}

					for i = n17, n17 + n10 - 1 do
						if list20[i] then
							table.insert(tbl155, list20[i])
						end

						if list21[i] then
							table.insert(tbl156, list21[i])
						end
					end

					pcall(rePetSatchelSellSelection.FireServer, rePetSatchelSellSelection, { Eggs = tbl156, Assets = tbl155 })
					n17 += n10

					if n17 <= n16 then
						task.wait(0.3)
					end
				end

				return true
			end

			local function func197(list22, list23)
				local flag253 = flag240

				if not flag240 then
					flag253 = #list22 == 0 and #list23 == 0
				end

				if flag253 then
					return
				end
				flag240 = true
				n15 = os.clock() + n9

				task.spawn(function()
					pcall(func196, list22, list23)
					flag240 = false
					tbl2.Wake()
				end)
			end

			local lastPetPreviewText = nil
			local lastEggPreviewText = nil
			tbl2.Add(function()
				local flag254 = str1.Toggle(value170, false)
				local flag255 = str1.Toggle(value167, false)
				local list24, value180 = func192()
				local list25, value181 = func195()

				if value171 and type(value171.Set) == "function" then
					local nextPetText = string.format("Pet matches  -  %d pets for %s", #list24, func186(value180))
					if nextPetText ~= lastPetPreviewText then
						lastPetPreviewText = nextPetText
						pcall(value171.Set, value171, nextPetText)
					end
				end

				if value172 and type(value172.Set) == "function" then
					local nextEggText = string.format("Egg matches  -  %d eggs for %s", #list25, func186(value181))
					if nextEggText ~= lastEggPreviewText then
						lastEggPreviewText = nextEggText
						pcall(value172.Set, value172, nextEggText)
					end
				end

				local value182 = flag240
				local flag256

				if flag240 then
					flag256 = value182
				else
					flag256 = os.clock() < n15
				end

				local flag257

				if flag256 then
					flag257 = flag256
				else
					flag257 = not (flag254 or flag255)
				end

				if flag257 then
					return false
				end
				func197(flag254 and list24 or {}, flag255 and list25 or {})
				return false
			end)

			value171 = obj8:CreateText({ Name = "Pet Sell Preview", Text = "Pet matches  -  0 pets" })

			value170 = obj8:CreateToggle({
				Name = "Auto Sell Pet",
				Default = false,
				Callback = function()
					tbl2.Wake()
				end,
			})

			obj8:CreateButton({
				Name = "Sell Pets Now",
				ButtonText = "Sell",
				ConfirmText = "Sold!",
				SubOf = value170,
				Callback = function()
					func197(func192(), {})
				end,
			})

			obj8:CreateDropdown({
				Name = "Sell Pet Rule",
				Note = "Which checks must pass to sell",
				Options = tbl138,
				Default = tbl138[1],
				SubOf = value170,
				Callback = function(value)
					if table.find(tbl138, value) then
						first5 = value
						tbl2.Wake()
					end
				end,
			})

			obj8:CreateDropdown({
				Name = "Pet Max Rarity",
				Note = "Sell pets at or below this rarity",
				Options = tbl139,
				Default = func185(3),
				SubOf = value170,
				Callback = function(value)
					n11 = tbl140[value] or n11
					tbl2.Wake()
				end,
			})

			local tbl157 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}

			local function func198(flag258, param132, param133, callback8)
				local n16 = 0
				local str16 = "M/s"

				local function func199(flag259, flag260)
					if flag259 ~= nil then
						n16 = math.max(0, math.floor(tonumber(flag259) or n16))
					end

					if flag260 ~= nil then
						str16 = tostring(flag260)
					end

					callback8(n16 * (tbl157[str16] or tbl157["M/s"]).Mult)
					tbl2.Wake()
				end

				return (func5(obj8, {
					Name = flag258 == "Pet Value Threshold" and "Pet Sell Value" or flag258 == "Egg Value Threshold" and "Egg Sell Value" or flag258,
					Note = param132,
					SubOf = param133,
					Legacy = flag258,
					SectionName = "Auto Sell",
					OnRaw = function(num75)
						func199(math.floor(num75 / 1000), "K/s")
					end,
				}))
			end

			func198("Pet Value Threshold", "Sell pets worth less than this (0 = off)", value170, function(param134)
				n12 = param134
			end)

			local value183 = nil

			value183 = obj8:CreateToggle({
				Name = "Keep Mutated Pets",
				Note = "Never sell mutated pets",
				Default = true,
				SubOf = value170,
				Callback = function()
					flag238 = str1.Toggle(value183, true)
					tbl2.Wake()
				end,
			})

			func6(obj8:CreateMultiDropdown({
				Name = "Blacklist Sell Pets",
				Note = "These pets are never sold",
				Options = tbl141,
				Default = {},
				SubOf = value170,
				Callback = function(value)
					tbl147 = func187(value, tbl142)
					tbl2.Wake()
				end,
			}))

			obj8 = (obj2._bhLayout and obj2._bhLayout.SellEgg) or obj8
			value172 = obj8:CreateText({ Name = "Egg Sell Preview", Text = "Egg matches  -  0 eggs" })

			value167 = obj8:CreateToggle({
				Name = "Auto Sell Egg",
				Note = "Sell bag eggs matching the rules below",
				Default = false,
				Callback = function()
					tbl2.Wake()
				end,
			})

			obj8:CreateButton({
				Name = "Sell Eggs Now",
				Note = "Sell matching eggs once",
				ButtonText = "Sell",
				ConfirmText = "Sold!",
				SubOf = value167,
				Callback = function()
					local result32 = func195()
					func197({}, result32)
				end,
			})

			obj8:CreateDropdown({
				Name = "Sell Egg Rule",
				Note = "Which checks must pass to sell",
				Options = tbl138,
				Default = tbl138[1],
				SubOf = value167,
				Callback = function(value)
					if table.find(tbl138, value) then
						first6 = value
						tbl2.Wake()
					end
				end,
			})

			obj8:CreateDropdown({
				Name = "Egg Max Rarity",
				Note = "Sell eggs at or below this rarity",
				Options = tbl139,
				Default = func185(3),
				SubOf = value167,
				Callback = function(value)
					n13 = tbl140[value] or n13
					tbl2.Wake()
				end,
			})

			func198("Egg Value Threshold", "Sell eggs worth less than this (0 = off)", value167, function(param135)
				n14 = param135
			end)

			local value184 = nil

			value184 = obj8:CreateToggle({
				Name = "Keep Mutated Eggs",
				Note = "Never sell mutated eggs",
				Default = true,
				SubOf = value167,
				Callback = function()
					flag239 = str1.Toggle(value184, true)
					tbl2.Wake()
				end,
			})

			func6(obj8:CreateMultiDropdown({
				Name = "Blacklist Sell Eggs",
				Note = "These eggs are never sold",
				Options = tbl141,
				Default = {},
				SubOf = value167,
				Callback = function(value)
					tbl148 = func187(value, tbl142)
					tbl2.Wake()
				end,
			}))

			pcall(function()
				local labSec = (obj2._bhLayout and obj2._bhLayout.SellLab) or obj8
				local sellLab = {
					Skins = {},
					Rule = tbl138[1],
					MaxRarity = 0,
					IncomeLimit = 0,
					KeepMutated = true,
					KeepPets = {},
					Handle = nil,
					Preview = nil,
				}
				str1.SellLab = sellLab
				local labPetOpts, labPetMap, seenPetIds = {}, {}, {}
				local okData, tradeData = pcall(function()
					return require(ReplicatedStorage.Data.ScrambleTradeIn)
				end)
				local banners = (okData and type(tradeData) == "table" and type(tradeData.Banners) == "table" and tradeData.Banners) or {}
				for _, b in ipairs(banners) do
					if type(b) == "table" and b.EggSkin ~= nil then
						sellLab.Skins[tostring(b.EggSkin)] = true
						for _, p in ipairs(type(b.Pets) == "table" and b.Pets or {}) do
							local aid = type(p) == "table" and p.AssetId ~= nil and tostring(p.AssetId) or nil
							if aid and not seenPetIds[aid] then
								seenPetIds[aid] = true
								local dir = tbl1.Assets and tbl1.Assets.Directory
								local entry = type(dir) == "table" and dir[aid] or nil
								local dName = type(entry) == "table" and tostring(entry.DisplayName or aid) or aid
								if labPetMap[dName] then dName = dName .. " (" .. aid .. ")" end
								labPetMap[dName] = aid
								table.insert(labPetOpts, dName)
							end
						end
					end
				end
				table.sort(labPetOpts)
				local function matchLabEggs()
					local list, totalVal = {}, 0
					local eggState = tbl1.EggState
					if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then return list, totalVal end
					local ok, ownerEggs = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
					if not ok or type(ownerEggs) ~= "table" then return list, totalVal end
					local char = localPlayer.Character
					local tool = char and char:FindFirstChildWhichIsA("Tool")
					local heldUid = tool and tool:GetAttribute("UID") or nil
					local eggRecords = tbl1.EggRecords
					for uid, rec in pairs(ownerEggs) do
						local skin = type(rec) == "table" and rec.EggSkin ~= nil and tostring(rec.EggSkin) or nil
						if skin and sellLab.Skins[skin] and rec.Placement == nil and uid ~= heldUid and not (str1.Lab and str1.Lab.Reserved and str1.Lab.Reserved[uid]) then
							if not sellLab.KeepPets[tostring(rec.AssetCategory)] and not (sellLab.KeepMutated and func191(rec.Mutations)) then
								local inc = func192({ Category = rec.AssetCategory, Scale = rec.AssetScale, Mutations = rec.Mutations })
								local rarOk = func190(rec.AssetCategory) <= sellLab.MaxRarity
								local valOk = sellLab.IncomeLimit > 0 and inc < sellLab.IncomeLimit
								local pass = false
								if sellLab.Rule == tbl138[2] then pass = valOk
								elseif sellLab.Rule == tbl138[3] then pass = rarOk and valOk
								elseif sellLab.Rule == tbl138[4] then pass = rarOk or valOk
								else pass = rarOk end
								if pass then
									table.insert(list, uid)
									if type(eggRecords) == "table" and type(eggRecords.SellPrice) == "function" then
										local okP, pr = pcall(eggRecords.SellPrice, rec)
										totalVal += (okP and tonumber(pr) or 0)
									end
								end
							end
						end
					end
					return list, totalVal
				end
				sellLab.Eggs = matchLabEggs
				sellLab.Preview = labSec:CreateText({ Name = "Lab Egg Sell Preview", Text = "Lab egg matches  -  0 eggs" })
				sellLab.Handle = labSec:CreateToggle({
					Name = "Auto Sell Lab Egg",
					Note = "Sell eggs traded from Dr Scramble that match the filters below",
					Default = false,
					Callback = function() tbl2.Wake() end,
				})
				labSec:CreateButton({
					Name = "Sell Lab Eggs Now",
					Note = "Sell matching Lab eggs once",
					ButtonText = "Sell",
					ConfirmText = "Sold!",
					SubOf = sellLab.Handle,
					Callback = function()
						local m = matchLabEggs()
						func197({}, m)
					end,
				})
				labSec:CreateDropdown({
					Name = "Sell Lab Egg Rule",
					Note = "Which checks must pass to sell",
					Options = tbl138,
					Default = tbl138[1],
					SubOf = sellLab.Handle,
					Callback = function(v)
						if table.find(tbl138, v) then
							sellLab.Rule = v
							tbl2.Wake()
						end
					end,
				})
				local labRarOpts = { "Off" }
				for _, r in ipairs(tbl139) do table.insert(labRarOpts, r) end
				labSec:CreateDropdown({
					Name = "Lab Egg Max Rarity",
					Note = "Sell Lab eggs at or below this rarity (Off = none by rarity)",
					Options = labRarOpts,
					Default = "Off",
					SubOf = sellLab.Handle,
					Callback = function(v)
						sellLab.MaxRarity = tbl140[v] or 0
						tbl2.Wake()
					end,
				})
				func5(labSec, {
					Name = "Lab Egg Sell Value",
					Note = "Sell Lab eggs worth less than this (0 = off)",
					SubOf = sellLab.Handle,
					Legacy = "Lab Egg Value Threshold",
					SectionName = "Auto Sell Lab Egg",
					OnRaw = function(raw)
						sellLab.IncomeLimit = math.max(0, tonumber(raw) or 0)
						tbl2.Wake()
					end,
				})
				local keepMutLabToggle = nil
				keepMutLabToggle = labSec:CreateToggle({
					Name = "Keep Mutated Lab Eggs",
					Note = "Never sell mutated Lab eggs",
					Default = true,
					SubOf = sellLab.Handle,
					Callback = function()
						sellLab.KeepMutated = str1.Toggle(keepMutLabToggle, true)
						tbl2.Wake()
					end,
				})
				if #labPetOpts > 0 then
					func6(labSec:CreateMultiDropdown({
						Name = "Keep Lab Pets",
						Note = "Lab eggs of these pets are never sold",
						Options = labPetOpts,
						Default = {},
						SubOf = sellLab.Handle,
						Callback = function(v)
							sellLab.KeepPets = func187(v, labPetMap)
							tbl2.Wake()
						end,
					}))
				end
				local lastLabPreviewText = nil
				tbl2.Add(function()
					local matches, val = matchLabEggs()
					if sellLab.Preview and type(sellLab.Preview.Set) == "function" then
						local nextLabText = string.format("Lab egg matches  -  %d eggs for %s", #matches, func186(val))
						if nextLabText ~= lastLabPreviewText then
							lastLabPreviewText = nextLabText
							pcall(sellLab.Preview.Set, sellLab.Preview, nextLabText)
						end
					end
					if flag240 or os.clock() < n15 or not str1.Toggle(sellLab.Handle, false) then
						return false
					end
					func197({}, matches)
					return false
				end)
			end)
		end

		local save2 = tbl1.Save

		if type(save2) == "table" and type(save2.FieldSignal) == "function" then
			for _, item64 in ipairs({ "Inventory", "EggInventory", "EquippedAssets" }) do
				local ok, result = pcall(save2.FieldSignal, item64)

				if ok and type(result) == "table" and type(result.Connect) == "function" then
					local ok2, result2 = pcall(result.Connect, result, function()
						tbl2.Wake()
					end)

					if ok2 and result2 then
						func4(function()
							pcall(function()
								result2:Disconnect()
							end)
						end)
					end
				end
			end
		end

		local n11
		n11 = 2
		local n12
		n12 = 3
		local n13
		n13 = 20
		local tbl158
		tbl158 = { "Lowest Rarity First", "Highest Rarity First", "Most Copies First", "Lowest Value First" }
		local tbl159
		tbl159 = { "Lowest To Highest", "Highest To Lowest" }
		local list26
		list26 = {}
		local tbl160
		tbl160 = {}
		local tbl161
		tbl161 = {}
		local tbl162
		tbl162 = {}

		do
			local directory = tbl1.Assets and tbl1.Assets.Directory
			local tbl163 = {}
			local tbl164 = {}

			if type(directory) == "table" then
				for k, value185 in pairs(directory) do
					local rarity = type(value185) == "table" and value185.Rarity or nil
					local flag261 = type(rarity) == "table"

					if flag261 then
						flag261 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					flag261 = flag261 or nil

					if flag261 then
						local str17 = tostring(rarity.DisplayName or rarity._id or flag261)
						tbl163[flag261] = tbl163[flag261] or str17

						table.insert(tbl164, {
							Category = tostring(k),
							Name = tostring(value185.DisplayName or k),
							Rarity = flag261,
							RarityName = str17,
						})
					end
				end
			end

			local tbl165 = {}

			for k in pairs(tbl163) do
				table.insert(tbl165, k)
			end

			table.sort(tbl165)

			for _, item65 in ipairs(tbl165) do
				local formatted8 = string.format("%d - %s", item65, tbl163[item65])
				table.insert(list26, formatted8)
				tbl160[formatted8] = item65
			end

			table.sort(tbl164, function(param136, param137)
				if param136.Rarity ~= param137.Rarity then
					return param136.Rarity < param137.Rarity
				end
				return param136.Name < param137.Name
			end)

			for _, item66 in ipairs(tbl164) do
				local formatted9 = string.format("%s [%s]", item66.Name, item66.RarityName)

				if tbl162[formatted9] then
					formatted9 = string.format("%s [%s] (%s)", item66.Name, item66.RarityName, item66.Category)
				end

				table.insert(tbl161, formatted9)
				tbl162[formatted9] = item66.Category
			end
		end

		do
			local function func200(param138)
				for _, item67 in ipairs(list26) do
					if tbl160[item67] == param138 then
						return item67
					end
				end

				return list26[#list26]
			end

			local value186 = nil
			local value187 = nil
			local first7 = tbl158[1]
			local first8 = tbl159[1]
			local n14 = 6
			local tbl166 = {}
			local flag262 = true
			local flag263 = true
			local flag264 = false
			local n15 = 0
			local n16 = 0
			local n17 = 0
			local tbl167 = {}

			local function func201(childName8, flag265)
				local obj35 = networking:FindFirstChild(childName8)
				if not obj35 or not obj35:IsA("RemoteFunction") then
					return false, nil
				end

				if flag265 == nil then
					return pcall(obj35.InvokeServer, obj35)
				end
				return pcall(obj35.InvokeServer, obj35, flag265)
			end

			local function func202()
				local save3 = tbl1.Save
				if type(save3) ~= "table" or type(save3.Get) ~= "function" then
					return nil
				end
				local ok, result = pcall(save3.Get)
				return ok and type(result) == "table" and result or nil
			end

			local function func203(param139)
				local directory = tbl1.Assets and tbl1.Assets.Directory
				return type(directory) == "table" and directory[tostring(param139)] or nil
			end

			local function func204(param140)
				local value188 = func203(param140)
				local rarity = type(value188) == "table" and value188.Rarity or nil
				local flag266 = type(rarity) == "table"

				if flag266 then
					flag266 = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				return flag266 or math.huge
			end

			local function func205(param141)
				local value189 = func203(param141)
				return tostring(type(value189) == "table" and value189.DisplayName or param141)
			end

			local function func206(param142)
				local category4 = func203(param142.Category)
				local n18 = type(category4) == "table" and tonumber(category4.EarningRate) or 0
				local n19 = tonumber(param142.Scale) or 0
				if n18 <= 0 or n19 <= 0 then
					return 0
				end
				local n20 = n19 > 5 and (n19 / 5) ^ 1.2 * 19.637875755794113 or n19 ^ 1.85
				local mutations = tbl1.Mutations
				local flag267 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n21 = 1

				if flag267 then
					local ok
					ok, n21 = pcall(mutations.EarningsFor, type(param142.Mutations) == "table" and param142.Mutations or {})
					ok = ok and type(n21) == "number"
					local n22 = 1

					if not ok then
						n21 = n22
					end
				end

				return n18 * n20 * n21
			end

			local function func207(param143)
				return type(param143) == "table" and next(param143) ~= nil
			end

			local function func208(param144)
				local n18 = tonumber(param144) or 0
				local tbl168 = { "", "K", "M", "B", "T", "Qa", "Qi" }
				local n19 = 1

				while math.abs(n18) >= 1000 and n19 < #tbl168 do
					n18 /= 1000
					n19 += 1
				end

				return string.format(n19 == 1 and "$%.0f%s" or "$%.2f%s", n18, tbl168[n19])
			end

			local function func209(param145)
				local fuseKernel = tbl1.FuseKernel
				if type(fuseKernel) ~= "table" or type(fuseKernel.PriceFor) ~= "function" then
					return nil
				end
				local ok, result = pcall(fuseKernel.PriceFor, param145)
				return ok and tonumber(result) or nil
			end

			local function func210(param146, param147, tbl169)
				local flag268 = type(param147) == "table" and param147.IsFavorite ~= true and not tbl169[param146] and func204(param147.Category) <= n14 and (next(tbl166) == nil or tbl166[tostring(param147.Category)] == true)

				if flag268 then
					flag268 = not (flag262 and func207(param147.Mutations))
				end

				if flag268 then
					flag268 = (tbl167[param146] or 0) <= os.clock()
				end

				return flag268
			end

			local function func211(param148)
				local inventory = type(param148.Inventory) == "table" and param148.Inventory or {}
				local tbl170 = {}
				local func212 = pairs
				local equippedAssets = param148.EquippedAssets or {}

				for _, equippedAsset in func212(equippedAssets) do
					tbl170[equippedAsset] = true
				end

				local tbl171 = {}
				local tbl172 = {}

				for i = 1, 3 do
					local fusionSlots2 = type(param148.FusionSlots) == "table" and param148.FusionSlots[i] or nil

					if fusionSlots2 ~= nil and type(inventory[fusionSlots2]) == "table" then
						table.insert(tbl171, fusionSlots2)
						tbl172[fusionSlots2] = true
					end
				end

				local tbl173 = {}

				for k, value190 in pairs(inventory) do
					if not tbl172[k] and type(value190) == "table" and value190.InFuse ~= true and func210(k, value190, tbl170) then
						local category5 = tostring(value190.Category)
						tbl173[category5] = tbl173[category5] or {}
						table.insert(tbl173[category5], { Uid = k, Item = value190, Income = func206(value190) })
					end
				end

				local function func213(param149)
					table.sort(param149, function(param150, param151)
						if param150.Income ~= param151.Income then
							if first8 == tbl159[2] then
								return param150.Income > param151.Income
							end
							return param150.Income < param151.Income
						end

						return tostring(param150.Uid) < tostring(param151.Uid)
					end)
				end

				if #tbl171 > 0 then
					local str18 = tostring(inventory[tbl171[1]].Category)
					local flag269 = true

					for _, item68 in ipairs(tbl171) do
						local entry9 = inventory[item68]

						if tostring(entry9.Category) ~= str18 or not func210(item68, entry9, tbl170) then
							flag269 = false
						end
					end

					local list27 = tbl173[str18] or {}

					if flag269 and #tbl171 + #list27 >= 3 then
						func213(list27)
						local tbl174 = { Category = str18, Load = {}, Items = {} }

						for _, item69 in ipairs(tbl171) do
							table.insert(tbl174.Items, inventory[item69])
						end

						for i = 1, 3 - #tbl171 do
							table.insert(tbl174.Load, list27[i].Uid)
							table.insert(tbl174.Items, list27[i].Item)
						end

						return tbl174
					end

					if flag263 then
						return { Category = str18, Eject = tbl171 }
					end
					return nil, "Machine holds pets that cannot finish a fuse"
				end

				local value191 = nil
				local value192 = nil

				for k, value193 in pairs(tbl173) do
					if #value193 >= 3 then
						local num76 = func204(k)
						local n18 = 0

						for _, item70 in ipairs(value193) do
							n18 += item70.Income
						end

						local tbl175

						if first7 == tbl158[2] then
							tbl175 = { -num76, -#value193 }
						elseif first7 == tbl158[3] then
							tbl175 = { -#value193, num76 }
						elseif first7 == tbl158[4] then
							tbl175 = { n18 / #value193, num76 }
						else
							tbl175 = { num76, -#value193 }
						end

						local flag270 = value191 == nil or tbl175[1] < value191[1]
						local flag271

						if flag270 then
							flag271 = flag270
						else
							local flag272 = tbl175[1] == value191[1]

							if flag272 then
								local flag273 = tbl175[2] < value191[2]

								if flag273 then
									flag271 = flag273
								else
									flag271 = tbl175[2] == value191[2] and k < value192
								end
							else
								flag271 = flag272
							end
						end

						if flag271 then
							value191 = tbl175
							value192 = k
						end
					end
				end

				if not value192 then
					return nil, "No three matching pets"
				end
				local entry10 = tbl173[value192]
				func213(entry10)
				local tbl176 = { Category = value192, Load = {}, Items = {} }

				for i = 1, 3 do
					table.insert(tbl176.Load, entry10[i].Uid)
					table.insert(tbl176.Items, entry10[i].Item)
				end

				return tbl176
			end

			local function func214(flag274)
				local result33 = func202()
				if not result33 then
					return
				end

				if result33.FusionLocked == true then
					if type(result33.FusionEggReward) == "table" and os.clock() >= n17 then
						n17 = os.clock() + n12
						func201("RF/Fusery/FinishReveal")
					end

					return
				end

				local flag275 = func211(result33)
				if not flag275 then
					return
				end

				if flag275.Eject then
					for _, item71 in ipairs(flag275.Eject) do
						if flag274 ~= n15 then
							return
						end
						func201("RF/Fusery/EjectPet", item71)
						task.wait(0.35)
					end

					return
				end

				local items2 = func209(flag275.Items)
				local money = tonumber(result33.Money)
				if items2 and money and money < items2 then
					return
				end

				for _, item72 in ipairs(flag275.Load) do
					if flag274 ~= n15 then
						return
					end
					local LoadPet, flag276 = func201("RF/Fusery/LoadPet", item72)
					if not LoadPet or flag276 == false then
						tbl167[item72] = os.clock() + n13
						return
					end
					task.wait(0.35)
				end

				if flag274 ~= n15 then
					return
				end
				local BeginFuse, flag277 = func201("RF/Fusery/BeginFuse")

				if BeginFuse and flag277 ~= false then
					n17 = os.clock() + n12
				end
			end

			local function func215(flag278)
				if not flag278 then
					return "Fuse status unknown"
				end

				if flag278.FusionLocked == true then
					return "Machine is fusing, waiting for the egg"
				end
				local list28, flag279 = func211(flag278)
				if not list28 then
					return flag279 or "No three matching pets"
				end

				if list28.Eject then
					return string.format("Would eject %d %s that cannot finish a fuse", #list28.Eject, func205(list28.Category))
				end
				local items3 = func209(list28.Items)
				local money2 = tonumber(flag278.Money)
				local str19 = items3 and money2 and money2 < items3 and "  (not enough money)" or ""
				return string.format("Next fuse  -  3 %s for %s%s", func205(list28.Category), items3 and func208(items3) or "?", str19)
			end

			tbl2.Add(function()
				local result34 = func202()

				if value187 and type(value187.Set) == "function" then
					pcall(value187.Set, value187, func215(result34))
				end

				if not str1.Toggle(value186, false) or flag264 or os.clock() < n16 then
					return false
				end
				flag264 = true
				n16 = os.clock() + n11
				local value194 = n15

				task.spawn(function()
					pcall(func214, value194)
					flag264 = false
					tbl2.Wake()
				end)

				return false
			end)

			value187 = obj9:CreateText({ Name = "Fuse Preview", Text = "Fuse status unknown" })

			value186 = obj9:CreateToggle({
				Name = "Auto Fuse Machine",
				Note = "Fuse 3 same pets into an egg, nonstop",
				Default = false,
				Callback = function()
					n15 += 1
					table.clear(tbl167)
					n16 = 0
					tbl2.Wake()
				end,
			})

			obj9:CreateDropdown({
				Name = "Fuse Priority Mode",
				Options = tbl158,
				Default = tbl158[1],
				SubOf = value186,
				Callback = function(value)
					if table.find(tbl158, value) then
						first7 = value
						tbl2.Wake()
					end
				end,
			})

			obj9:CreateDropdown({
				Name = "Pets To Use",
				Options = tbl159,
				Default = tbl159[1],
				SubOf = value186,
				Callback = function(value)
					if table.find(tbl159, value) then
						first8 = value
						tbl2.Wake()
					end
				end,
			})

			obj9:CreateDropdown({
				Name = "Max Rarity to Fuse",
				Options = list26,
				Default = func200(6),
				SubOf = value186,
				Callback = function(value)
					n14 = tbl160[value] or n14
					tbl2.Wake()
				end,
			})

			func6(obj9:CreateMultiDropdown({
				Name = "Specific Species to Fuse",
				Note = "Only fuse these species (empty = all)",
				Options = tbl161,
				Default = {},
				SubOf = value186,
				Callback = function(value)
					local tbl177 = {}

					if type(value) == "table" then
						for k, value195 in pairs(value) do
							k = value195 == true and type(k) == "string" and k or type(value195) == "string" and value195 or nil

							if k and tbl162[k] then
								tbl177[tbl162[k]] = true
							end
						end
					end

					tbl166 = tbl177
					tbl2.Wake()
				end,
			}))

			local value196 = nil

			value196 = obj9:CreateToggle({
				Name = "Skip Mutated Pets",
				Default = true,
				SubOf = value186,
				Callback = function()
					flag262 = str1.Toggle(value196, true)
					tbl2.Wake()
				end,
			})

			local value197 = nil

			value197 = obj9:CreateToggle({
				Name = "Eject Incomplete Slots",
				Note = "Take out pets that can't make a set",
				Default = true,
				SubOf = value186,
				Callback = function()
					flag263 = str1.Toggle(value197, true)
					tbl2.Wake()
				end,
			})
		end

		local save3 = tbl1.Save

		if type(save3) == "table" and type(save3.FieldSignal) == "function" then
			for _, item73 in ipairs({
				"Inventory",
				"EquippedAssets",
				"FusionSlots",
				"FusionLocked",
				"FusionEggReward",
				"Money",
			}) do
				local ok, result = pcall(save3.FieldSignal, item73)

				if ok and type(result) == "table" and type(result.Connect) == "function" then
					local ok2, result2 = pcall(result.Connect, result, function()
						tbl2.Wake()
					end)

					if ok2 and result2 then
						func4(function()
							pcall(function()
								result2:Disconnect()
							end)
						end)
					end
				end
			end
		end

		n2 = 2
		n3 = 25
		n4 = 4
		tbl9 = { "Match Any", "Match All" }

		do
			local tbl178 = { "Golden", "Silver", "Rainbow", "Boss", "Monstrous", "Sakura", "GreatBloom" }
			str2 = "Any Mutation"
			tbl10 = { "Off" }
			tbl11 = {}
			tbl12 = {}
			tbl13 = {}
			tbl14 = { "Any Mutation" }
			tbl15 = {}
			local directory = tbl1.Assets and tbl1.Assets.Directory
			local tbl179 = {}
			local tbl180 = {}

			if type(directory) == "table" then
				for k, value198 in pairs(directory) do
					local rarity = type(value198) == "table" and value198.Rarity or nil
					local flag280 = type(rarity) == "table"
					local flag281

					if flag280 then
						flag281 = tonumber(rarity.RarityNumber or rarity.Rank)
					else
						flag281 = flag280
					end

					flag281 = flag281 or nil

					if flag281 then
						local str20 = tostring(rarity.DisplayName or rarity._id or flag281)
						tbl179[flag281] = tbl179[flag281] or str20

						table.insert(tbl180, {
							Category = tostring(k),
							Name = tostring(value198.DisplayName or k),
							Rarity = flag281,
							RarityName = str20,
						})
					end
				end
			end

			local tbl181 = {}

			for k in pairs(tbl179) do
				table.insert(tbl181, k)
			end

			table.sort(tbl181)

			for _, item74 in ipairs(tbl181) do
				local formatted10 = string.format("%d - %s", item74, tbl179[item74])
				table.insert(tbl10, formatted10)
				tbl11[formatted10] = item74
			end

			table.sort(tbl180, function(param152, param153)
				if param152.Rarity ~= param153.Rarity then
					return param152.Rarity < param153.Rarity
				end
				return param152.Name < param153.Name
			end)

			for _, item75 in ipairs(tbl180) do
				local formatted11 = string.format("%s [%s]", item75.Name, item75.RarityName)

				if tbl13[formatted11] then
					formatted11 = string.format("%s [%s] (%s)", item75.Name, item75.RarityName, item75.Category)
				end

				table.insert(tbl12, formatted11)
				tbl13[formatted11] = item75.Category
			end

			local tbl182 = {}
			local mutations = tbl1.Mutations

			if type(mutations) == "table" and type(mutations.IdSet) == "table" then
				for k in pairs(mutations.IdSet) do
					table.insert(tbl182, tostring(k))
				end
			end

			if #tbl182 == 0 then
				tbl182 = table.clone(tbl178)
			end

			table.sort(tbl182, function(param154, param155)
				return func7(param154) < func7(param155)
			end)

			for _, item76 in ipairs(tbl182) do
				local value199 = func7(item76)
				table.insert(tbl14, value199)
				tbl15[value199] = item76
			end
		end

		value4 = nil
		value5 = nil
		value6 = nil
		createText = nil
		flag4 = tbl9[2]
		value7 = nil
		flag5 = false
		tbl16 = {}
		n5 = 0
		tbl17 = {}
		flag6 = false
		n6 = 0
		tbl18 = {}

		func8 = function()
			local save4 = tbl1.Save
			if type(save4) ~= "table" or type(save4.Get) ~= "function" then
				return nil
			end
			local ok, result = pcall(save4.Get)
			return ok and type(result) == "table" and result or nil
		end

		local function func216(param156)
			local directory = tbl1.Assets and tbl1.Assets.Directory
			return type(directory) == "table" and directory[tostring(param156)] or nil
		end

		func9 = function(param157)
			local value200 = func216(param157)
			local rarity = type(value200) == "table" and value200.Rarity or nil
			local flag282 = type(rarity) == "table"

			if flag282 then
				flag282 = tonumber(rarity.RarityNumber or rarity.Rank)
			end

			return flag282 or 0
		end

		func10 = function(param158)
			local category6 = func216(param158.Category)
			local n14 = type(category6) == "table" and tonumber(category6.EarningRate) or 0
			local n15 = tonumber(param158.Scale) or 0
			if n14 <= 0 or n15 <= 0 then
				return 0
			end
			local n16 = n15 > 5 and (n15 / 5) ^ 1.2 * 19.637875755794113 or n15 ^ 1.85
			local mutations = tbl1.Mutations
			local flag283 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
			local n17 = 1

			if flag283 then
				local ok, result = pcall(mutations.EarningsFor, type(param158.Mutations) == "table" and param158.Mutations or {})

				if ok and type(result) == "number" then
					n17 = result
				end
			end

			return n14 * n16 * n17
		end
	end

	local obj36, obj37

	do
		do
			local function func217(list29)
				local tbl183 = {}

				if type(list29.Mutations) == "table" then
					for k, mutation in pairs(list29.Mutations) do
						if type(mutation) == "string" then
							tbl183[mutation] = true
						elseif mutation == true and type(k) == "string" then
							tbl183[k] = true
						end
					end
				end

				if type(list29.BaseMutation) == "string" and list29.BaseMutation ~= "" then
					tbl183[list29.BaseMutation] = true
				end

				return tbl183
			end

			local function func218(param159)
				if tbl17[tostring(param159.Category)] then
					return true
				end
				local n7 = 0
				local n8 = 0

				if value7 then
					n7 = 1

					if func9(param159.Category) >= value7 then
						n8 = 1
					end
				end

				if flag5 or next(tbl16) ~= nil then
					n7 += 1
					local value201 = func217(param159)

					if flag5 and next(value201) ~= nil then
						n8 += 1
					else
						local flag284 = false

						for k in pairs(value201) do
							if tbl16[k] then
								flag284 = true
								break
							end
						end

						if flag284 then
							n8 += 1
						end
					end
				end

				if n5 > 0 then
					n7 += 1

					if n5 <= func10(param159) then
						n8 += 1
					end
				end

				if n7 == 0 then
					return false
				end

				if flag4 == tbl9[2] then
					return n8 == n7
				end
				return n8 > 0
			end

			local function func219(param160)
				return (tbl18[param160] or 0) > os.clock()
			end

			local function func220(list30)
				local tbl184 = {}
				local value202, value203, value204 = pairs(list30.Inventory or {})
				local n7 = 0

				for k, value205 in value202, value203, value204 do
					if type(value205) == "table" and func218(value205) then
						n7 += 1

						if value205.IsFavorite ~= true and not func219(k) then
							table.insert(tbl184, k)
						end
					end
				end

				return tbl184, n7
			end

			local function func221(param161, param162, flag285)
				local tbl185 = {}
				local inventory = param161.Inventory or {}
				local func222 = pairs
				local equippedAssets = param161.EquippedAssets or {}

				for _, equippedAsset in func222(equippedAssets) do
					local entry11 = inventory[equippedAsset]

					if type(entry11) == "table" and not func219(equippedAsset) then
						if param162 then
							if entry11.IsFavorite ~= true then
								table.insert(tbl185, equippedAsset)
							end
						else
							local isFavorite = entry11.IsFavorite == true

							if isFavorite then
								isFavorite = not (flag285 and func218(entry11))
							end

							if isFavorite then
								table.insert(tbl185, equippedAsset)
							end
						end
					end
				end

				return tbl185
			end

			local function func223(list31, param163)
				local rePetSatchelWriteFavourite = networking:FindFirstChild("RE/PetSatchel/WriteFavourite")
				if not rePetSatchelWriteFavourite or not rePetSatchelWriteFavourite:IsA("RemoteEvent") then
					return
				end

				for i, item77 in ipairs(list31) do
					if not (i > n3) then
						tbl18[item77] = os.clock() + n4
						pcall(rePetSatchelWriteFavourite.FireServer, rePetSatchelWriteFavourite, item77, param163)
						task.wait(0.12)
						continue
					end

					break
				end
			end

			local function func224(list32, param164)
				if flag6 or #list32 == 0 then
					return false
				end
				flag6 = true
				n6 = os.clock() + n2

				task.spawn(function()
					pcall(func223, list32, param164)
					flag6 = false
					tbl2.Wake()
				end)

				return true
			end

			tbl2.Add(function()
				local result35 = func8()
				if not result35 then
					return false
				end
				local flag286 = str1.Toggle(value4, false)
				local list33, value206 = func220(result35)

				if createText and type(createText.Set) == "function" then
					local func225 = pairs
					local inventory = result35.Inventory or {}
					local n7 = 0

					for _, value207 in func225(inventory) do
						if type(value207) == "table" and value207.IsFavorite == true then
							n7 += 1
						end
					end

					pcall(createText.Set, createText, string.format("Favorite matches  -  %d pets, %d to mark  |  %d favorited", value206, #list33, n7))
				end

				local value208 = flag6
				local flag287

				if flag6 then
					flag287 = value208
				else
					flag287 = os.clock() < n6
				end

				if flag287 then
					return false
				end

				if flag286 and func224(list33, true) then
					return false
				end

				if str1.Toggle(value5, false) then
					if func224(func221(result35, true, false), true) then
						return false
					end
				elseif str1.Toggle(value6, false) then
					func224(func221(result35, false, flag286), false)
				end

				return false
			end)

			createText = obj4.CreateText
			createText = createText(obj4, { Name = "Favorite Preview", Text = "Favorite matches  -  0 pets" })

			value4 = obj4:CreateToggle({
				Name = "Auto Favorite Pet",
				Note = "Favorite pets matching the rules below",
				Default = false,
				Callback = function()
					table.clear(tbl18)
					tbl2.Wake()
				end,
			})

			obj4:CreateButton({
				Name = "Favorite Pets Now",
				Note = "Favorite matching pets once",
				ButtonText = "Favorite",
				ConfirmText = "Done!",
				SubOf = value4,
				Callback = function()
					local result36 = func8()

					if result36 then
						func224(func220(result36), true)
					end
				end,
			})

			obj4:CreateDropdown({
				Name = "Favorite Rule",
				Note = "Pass any check or all checks",
				Options = tbl9,
				Default = tbl9[2],
				SubOf = value4,
				Callback = function(value)
					if table.find(tbl9, value) then
						flag4 = value
						tbl2.Wake()
					end
				end,
			})

			obj4:CreateDropdown({
				Name = "Favorite Min Rarity",
				Note = "Favorite pets of the chosen rarity and every rarity above it (Off = skip)",
				Options = tbl10,
				Default = "Off",
				SubOf = value4,
				Callback = function(value)
					value7 = tbl11[value]
					tbl2.Wake()
				end,
			})

			func6(obj4:CreateMultiDropdown({
				Name = "Favorite Mutations",
				Note = "Mutation check (empty = skip)",
				Options = tbl14,
				Default = {},
				SubOf = value4,
				Callback = function(value)
					local tbl186 = {}
					local flag288 = false

					if type(value) == "table" then
						for k, value209 in pairs(value) do
							k = value209 == true and type(k) == "string" and k or type(value209) == "string" and value209 or nil

							if k == str2 then
								flag288 = true
							elseif k then
								tbl186[tbl15[k] or k] = true
							end
						end
					end

					flag5 = flag288
					tbl16 = tbl186
					tbl2.Wake()
				end,
			}))

			local tbl187 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}

			local n7 = 0
			local str21 = "M/s"

			local function func226(flag289, flag290)
				if flag289 ~= nil then
					n7 = math.max(0, math.floor(tonumber(flag289) or n7))
				end

				if flag290 ~= nil then
					str21 = tostring(flag290)
				end

				n5 = n7 * (tbl187[str21] or tbl187["M/s"]).Mult
				tbl2.Wake()
			end

			func5(obj4, {
				Name = "Min Favorite Value",
				Note = "Value check (0 = skip)",
				SubOf = value4,
				Legacy = "Favorite Min Value",
				SectionName = "Auto Favorite",
				OnRaw = function(num77)
					func226(math.floor(num77 / 1000), "K/s")
				end,
			})

			func6(obj4:CreateMultiDropdown({
				Name = "Always Favorite Species",
				Note = "Always favorite these species",
				Options = tbl12,
				Default = {},
				SubOf = value4,
				Callback = function(value)
					local tbl188 = {}

					if type(value) == "table" then
						for k, value210 in pairs(value) do
							k = value210 == true and type(k) == "string" and k or type(value210) == "string" and value210
							local flag291 = k or nil

							if flag291 and tbl13[flag291] then
								tbl188[tbl13[flag291]] = true
							end
						end
					end

					tbl17 = tbl188
					tbl2.Wake()
				end,
			}))

			value5 = obj4:CreateToggle({
				Name = "Auto Favorite Equipped",
				Note = "Keep equipped pets favorited",
				Default = false,
				Callback = function()
					tbl2.Wake()
				end,
			})

			value6 = obj4:CreateToggle({
				Name = "Auto Unfavorite Equipped",
				Note = "Unfavorite equipped pets not in the rules",
				Default = false,
				Callback = function()
					tbl2.Wake()
				end,
			})

			obj4:CreateButton({
				Name = "Favorite Equipped Now",
				Note = "Favorite all equipped pets once",
				ButtonText = "Favorite",
				ConfirmText = "Done!",
				Callback = function()
					local result37 = func8()

					if result37 then
						func224(func221(result37, true, false), true)
					end
				end,
			})

			obj4:CreateButton({
				Name = "Unfavorite Equipped Now",
				Note = "Unfavorite all equipped pets once",
				ButtonText = "Unfavorite",
				ConfirmText = "Done!",
				Callback = function()
					local result38 = func8()

					if result38 then
						func224(func221(result38, false, false), false)
					end
				end,
			})
		end

		local save = tbl1.Save

		if type(save) == "table" and type(save.FieldSignal) == "function" then
			for _, item78 in ipairs({ "Inventory", "EquippedAssets" }) do
				local ok, result = pcall(save.FieldSignal, item78)

				if ok and type(result) == "table" and type(result.Connect) == "function" then
					local ok2, result2 = pcall(result.Connect, result, function()
						tbl2.Wake()
					end)

					if ok2 and result2 then
						func4(function()
							pcall(function()
								result2:Disconnect()
							end)
						end)
					end
				end
			end
		end

		local function func227()
			local tbl189 = {}

			local function func228(param165)
				local entry12 = tbl189[param165]
				if type(entry12) ~= "string" then
					return ""
				end
				return entry12
			end

			local function func229(param166, text)
				param166.AutoLocalize = false
				param166.Text = text
			end

			local n7 = 0
			local value211 = nil

			local function func230()
				if not value211 then
					return
				end

				for _, item79 in ipairs(value211) do
					func229(item79[1], func228(item79[2]))
				end
			end

			local connection = UserInputService.InputBegan:Connect(function(input)
				local userInputType = input.UserInputType

				if userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch or userInputType == Enum.UserInputType.Keyboard or userInputType == Enum.UserInputType.Gamepad1 then
					n7 = os.clock()
				end
			end)

			func4(function()
				pcall(function()
					connection:Disconnect()
				end)
			end)

			local function manual()
				return os.clock() - n7 <= 1
			end

			local screenGui = nil
			local uiScale = nil
			local list34 = {}
			local value212 = nil
			local value213 = nil

			local function func231()
				if not uiScale then
					return
				end
				local currentCamera = workspace.CurrentCamera
				currentCamera = currentCamera and currentCamera.ViewportSize or Vector2.new(1280, 720)

				if currentCamera.X < 1 then
					currentCamera = Vector2.new(1280, 720)
				end

				uiScale.Scale = math.clamp(math.min(currentCamera.X / 1280, currentCamera.Y / 720), 0.72, 1.35)
			end

			local function hide()
				if screenGui then
					screenGui.Enabled = false
				end
			end

			local font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
			local colorSequence = ColorSequence.new
			local value214 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255))
			local value215 = ColorSequenceKeypoint.new(0.486, Color3.fromRGB(255, 255, 255))
			local value216 = ColorSequenceKeypoint.new(0.519, Color3.fromRGB(221, 221, 221))
			local new = ColorSequenceKeypoint.new
			local color = Color3.fromRGB
			local tbl190 = { value214, value215, value216 }

			do
				local values = table.pack(new(1, color(236, 236, 236)))
				table.move(values, 1, values.n, 4, tbl190)
			end

			local value217 = colorSequence(tbl190)
			local new2 = ColorSequenceKeypoint.new
			local color2 = Color3.fromRGB
			local colorSequence2 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 36, 84)), new2(1, color2(0, 31, 54)) })
			local colorSequence3 = ColorSequence.new
			local value218 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 193, 194))
			local value219 = ColorSequenceKeypoint.new(0.057, Color3.fromRGB(255, 132, 123))
			local new3 = ColorSequenceKeypoint.new
			local color3 = Color3.fromRGB
			local tbl191 = { value218, value219 }

			do
				local values = table.pack(new3(1, color3(239, 28, 28)))
				table.move(values, 1, values.n, 3, tbl191)
			end

			local flag292 = colorSequence3(tbl191)
			local colorSequence4 = ColorSequence.new
			local value220 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 193, 194))
			local value221 = ColorSequenceKeypoint.new(0.015, Color3.fromRGB(255, 132, 123))
			local new4 = ColorSequenceKeypoint.new
			local color4 = Color3.fromRGB
			local tbl192 = { value220, value221 }

			do
				local values = table.pack(new4(1, color4(239, 28, 28)))
				table.move(values, 1, values.n, 3, tbl192)
			end

			local flag293 = colorSequence4(tbl192)
			local colorSequence5 = ColorSequence.new
			local value222 = ColorSequenceKeypoint.new(0, Color3.fromRGB(92, 94, 106))
			local value223 = ColorSequenceKeypoint.new(0.057, Color3.fromRGB(70, 71, 82))
			local new5 = ColorSequenceKeypoint.new
			local color5 = Color3.fromRGB
			local tbl193 = { value222, value223 }

			do
				local values = table.pack(new5(1, color5(38, 39, 46)))
				table.move(values, 1, values.n, 3, tbl193)
			end

			local value224 = colorSequence5(tbl193)

			local function createUIStroke(parent, applyStrokeMode, thickness, color6)
				local uiStroke = Instance.new("UIStroke")
				uiStroke.Name = func3()
				uiStroke.ApplyStrokeMode = applyStrokeMode
				uiStroke.Color = color6 or Color3.fromRGB(0, 0, 0)
				uiStroke.LineJoinMode = Enum.LineJoinMode.Round
				uiStroke.Thickness = thickness
				uiStroke.Transparency = 0
				uiStroke.Parent = parent
				return uiStroke
			end

			local function createUIGradient(parent, color6, rotation)
				local uiGradient = Instance.new("UIGradient")
				uiGradient.Name = func3()
				uiGradient.Color = color6
				uiGradient.Rotation = rotation or 90
				uiGradient.Parent = parent
				return uiGradient
			end

			local function createUIStroke2(parent, textSize)
				parent.FontFace = font
				parent.TextColor3 = Color3.fromRGB(255, 255, 255)
				parent.TextStrokeTransparency = 1
				parent.TextSize = textSize
				parent.LineHeight = 1
				local uiStroke = Instance.new("UIStroke")
				uiStroke.Name = func3()
				uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
				uiStroke.Color = Color3.fromRGB(0, 0, 0)
				uiStroke.LineJoinMode = Enum.LineJoinMode.Round
				uiStroke.Thickness = math.max(1, textSize * 0.08)
				uiStroke.Transparency = 0
				uiStroke.Parent = parent
				return uiStroke
			end

			local function func232(param167, num78)
				local uIStroke2 = createUIStroke2(param167, num78)
				createUIGradient(uIStroke2, colorSequence2, 90)
				createUIGradient(param167, value217, 90)
				uIStroke2.Thickness = math.max(1, num78 * 0.065)
			end

			local function func233()
				if screenGui then
					return
				end
				screenGui = Instance.new("ScreenGui")
				screenGui.Name = func3()
				screenGui.DisplayOrder = 2e9
				screenGui.IgnoreGuiInset = true
				screenGui.ResetOnSpawn = false
				screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				screenGui.Enabled = false
				local textButton = Instance.new("TextButton")
				textButton.Name = func3()
				textButton.AutoButtonColor = false
				textButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				textButton.BackgroundTransparency = 0.45
				textButton.BorderSizePixel = 0
				textButton.Modal = true
				textButton.Size = UDim2.fromScale(1, 1)
				textButton.Text = ""
				textButton.ZIndex = 1
				textButton.Parent = screenGui
				local frame = Instance.new("Frame")
				frame.Name = func3()
				frame.Active = true
				frame.AnchorPoint = Vector2.new(0.5, 0.5)
				frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				frame.BackgroundTransparency = 0.18
				frame.Position = UDim2.fromScale(0.5, 0.5)
				frame.Size = UDim2.fromOffset(430, 316)
				frame.ZIndex = 10
				frame.Parent = screenGui
				uiScale = Instance.new("UIScale")
				uiScale.Name = func3()
				uiScale.Parent = frame
				createUIStroke(frame, Enum.ApplyStrokeMode.Border, 2)
				local frame2 = Instance.new("Frame")
				frame2.Name = func3()
				frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				frame2.BorderSizePixel = 0
				frame2.Position = UDim2.fromOffset(22, 22)
				frame2.Size = UDim2.fromOffset(5, 26)
				frame2.ZIndex = 12
				frame2.Parent = frame
				createUIGradient(frame2, flag292, 90)
				createUIStroke(frame2, Enum.ApplyStrokeMode.Border, 1.4)
				local textLabel = Instance.new("TextLabel")
				textLabel.Name = func3()
				textLabel.BackgroundTransparency = 1
				textLabel.Position = UDim2.fromOffset(38, 20)
				textLabel.Size = UDim2.fromOffset(370, 30)
				textLabel.TextXAlignment = Enum.TextXAlignment.Left
				textLabel.TextYAlignment = Enum.TextYAlignment.Center
				textLabel.ZIndex = 12
				textLabel.Parent = frame
				func232(textLabel, 21)
				func229(textLabel, func228("Title"))
				local frame3 = Instance.new("Frame")
				frame3.Name = func3()
				frame3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				frame3.BackgroundTransparency = 0.82
				frame3.BorderSizePixel = 0
				frame3.Position = UDim2.fromOffset(22, 58)
				frame3.Size = UDim2.fromOffset(386, 1)
				frame3.ZIndex = 12
				frame3.Parent = frame
				local textLabel2 = Instance.new("TextLabel")
				textLabel2.Name = func3()
				textLabel2.BackgroundTransparency = 1
				textLabel2.Position = UDim2.fromOffset(22, 68)
				textLabel2.Size = UDim2.fromOffset(386, 24)
				textLabel2.TextXAlignment = Enum.TextXAlignment.Left
				textLabel2.TextYAlignment = Enum.TextYAlignment.Center
				textLabel2.ZIndex = 12
				textLabel2.Parent = frame
				createUIStroke2(textLabel2, 17)
				textLabel2.TextColor3 = Color3.fromRGB(255, 72, 72)
				createUIGradient(textLabel2, ColorSequence.new(Color3.fromRGB(255, 132, 123), Color3.fromRGB(239, 28, 28)), 90)
				func229(textLabel2, func228("Warn"))
				local textLabel3 = Instance.new("TextLabel")
				textLabel3.Name = func3()
				textLabel3.BackgroundTransparency = 1
				textLabel3.Position = UDim2.fromOffset(22, 98)
				textLabel3.Size = UDim2.fromOffset(386, 74)
				textLabel3.TextWrapped = true
				textLabel3.TextXAlignment = Enum.TextXAlignment.Left
				textLabel3.TextYAlignment = Enum.TextYAlignment.Top
				textLabel3.ZIndex = 12
				textLabel3.Parent = frame
				createUIStroke2(textLabel3, 15)
				textLabel3.LineHeight = 1.14
				textLabel3.TextTransparency = 0.12
				func229(textLabel3, func228("Body"))
				local textLabel4 = Instance.new("TextLabel")
				textLabel4.Name = func3()
				textLabel4.BackgroundTransparency = 1
				textLabel4.Position = UDim2.fromOffset(22, 176)
				textLabel4.Size = UDim2.fromOffset(386, 46)
				textLabel4.TextWrapped = true
				textLabel4.TextXAlignment = Enum.TextXAlignment.Left
				textLabel4.TextYAlignment = Enum.TextYAlignment.Top
				textLabel4.ZIndex = 12
				textLabel4.Parent = frame
				createUIStroke2(textLabel4, 14)
				textLabel4.LineHeight = 1.12
				textLabel4.TextColor3 = Color3.fromRGB(255, 176, 120)
				func229(textLabel4, func228("Tip"))

				local function func234(param168, param169, color7)
					local textButton2 = Instance.new("TextButton")
					textButton2.Name = func3()
					textButton2.Active = true
					textButton2.AutoButtonColor = false
					textButton2.BackgroundTransparency = 1
					textButton2.BorderSizePixel = 0
					textButton2.Position = UDim2.fromOffset(param168, 244)
					textButton2.Size = UDim2.fromOffset(param169, 46)
					textButton2.Text = ""
					textButton2.ZIndex = 14
					textButton2.Parent = frame
					local frame4 = Instance.new("Frame")
					frame4.Name = func3()
					frame4.AnchorPoint = Vector2.new(0.5, 0.5)
					frame4.BackgroundColor3 = color7 and Color3.fromRGB(175, 0, 0) or Color3.fromRGB(24, 25, 30)
					frame4.BorderSizePixel = 0
					frame4.Position = UDim2.fromScale(0.5, 0.5)
					frame4.Size = UDim2.fromScale(1, 0.92)
					frame4.ZIndex = 12
					frame4.Parent = textButton2
					createUIStroke(frame4, Enum.ApplyStrokeMode.Border, 1.6)
					local frame5 = Instance.new("Frame")
					frame5.Name = func3()
					frame5.AnchorPoint = Vector2.new(0.5, 0)
					frame5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					frame5.BorderSizePixel = 0
					frame5.Position = UDim2.fromScale(0.5, 0)
					frame5.Size = UDim2.fromScale(1, 0.9)
					frame5.ZIndex = 12
					frame5.Parent = frame4
					createUIGradient(frame5, color7 and flag292 or value224, 90)
					local frame6 = Instance.new("Frame")
					frame6.Name = func3()
					frame6.AnchorPoint = Vector2.new(0.5, 0.5)
					frame6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					frame6.BorderSizePixel = 0
					frame6.Position = UDim2.fromScale(0.5, 0.5)
					frame6.Size = UDim2.fromScale(0.965, 0.88)
					frame6.ZIndex = 13
					frame6.Parent = frame5
					createUIGradient(frame6, color7 and flag293 or value224, 90)
					local textLabel5 = Instance.new("TextLabel")
					textLabel5.Name = func3()
					textLabel5.AnchorPoint = Vector2.new(0.5, 0.5)
					textLabel5.BackgroundTransparency = 1
					textLabel5.Position = UDim2.fromScale(0.5, 0.5)
					textLabel5.Size = UDim2.fromScale(0.9, 0.6)
					textLabel5.TextWrapped = true
					textLabel5.ZIndex = 15
					textLabel5.Parent = textButton2
					func232(textLabel5, 17)
					return textButton2, textLabel5
				end

				local value225, value226 = func234(22, 184, false)
				local value227, value228 = func234(224, 184, true)
				func229(value226, func228("Cancel"))
				func229(value228, func228("Accept"))

				value211 = {
					{ textLabel, "Title" },
					{ textLabel2, "Warn" },
					{ textLabel3, "Body" },
					{ textLabel4, "Tip" },
					{ value226, "Cancel" },
					{ value228, "Accept" },
				}

				func230()

				list34[#list34 + 1] = value225.MouseButton1Click:Connect(function()
					if value213 then
						value213()
					end
				end)

				list34[#list34 + 1] = value227.MouseButton1Click:Connect(function()
					if value212 then
						value212()
					end
				end)

				local currentCamera = workspace.CurrentCamera

				if currentCamera then
					list34[#list34 + 1] = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(func231)
				end

				func231()
				screenGui.Parent = value1
			end

			local function func235()
				func233()
				func231()

				if screenGui then
					screenGui.Enabled = true
				end
			end

			func4(function()
				for _, item80 in ipairs(list34) do
					pcall(function()
						item80:Disconnect()
					end)
				end

				table.clear(list34)

				if screenGui then
					pcall(function()
						screenGui:Destroy()
					end)

					screenGui = nil
				end
			end)

			return {
				Manual = manual,
				Hide = hide,
				Show = function(list35, callback9, callback10)
					for k, value229 in pairs(list35) do
						tbl189[k] = value229
					end

					func230()

					value212 = function()
						hide()

						if callback9 then
							callback9()
						end
					end

					value213 = function()
						hide()

						if callback10 then
							callback10()
						end
					end

					func235()
					func230()
				end,
			}
		end

		str1.HopPrompt = func227()

		str1.MechBoot = function(obj38)
			local ok, result = pcall(function()
				return require(ReplicatedStorage.Shared.Util.ScrambleBossHazards)
			end)

			local mech = {
				Handle = nil,
				Row = nil,
				Status = "Idle",
				Shown = nil,
				Busy = false,
				Generation = 0,
				Hazards = {},
				TravelSpeed = 250,
				Radius = 18,
				SwingGap = 0.12,
				Dodge = true,
				TryBall = true,
				Leave = true,
				HopWindow = 3,
				OpenSeconds = 900,
				ChainPath = "ChilliLibrary/SAE_BossHop.json",
				ChainUntil = 0,
				ChainCycle = nil,
				ArmedCycle = nil,
				HopStamp = 0,
				ArrivedByHop = false,
				HopDelay = 5,
				HopConfirmed = false,
				HopNote = nil,
				HopAt = nil,
				Hopping = false,
				LoadedAt = os.clock(),
				BaitSpeed = 225,
				Interval = 1800,
				Run = nil,
				SwapTools = true,
				SwapIndex = 1,
				SwapSince = 0,
				MainHold = 0.3,
				SecondHold = 0.4,
				LastSwing = 0,
				Links = {},
			}

			str1.Mech = mech

			local function func236()
				return str1.Toggle(mech.Handle, false) == true
			end

			local function func237()
				return workspace:FindFirstChild("ScrambleArena")
			end

			local function func238()
				return workspace:FindFirstChild("ScrambleArenaPortal")
			end

			local function func239()
				return localPlayer:GetAttribute("InScrambleArena") == true
			end

			mech.StealFirst = function()
				local steal = str1.Steal
				local movement = str1.Movement
				if movement.PlaceWanted == true then
					return "Auto Place Egg goes first"
				end

				if movement.MutationWanted == true then
					return "Scrambled Mutation goes first"
				end

				if str1.Toggle(value2, false) == true and steal ~= nil and (steal.Wanted == true or steal.Carrying == true or steal.Active == true) then
					return "Auto Steal goes first"
				end
				return nil
			end

			pcall(function()
				local scheduleIntervalSeconds = require(ReplicatedStorage.Shared.Flags.ScrambleBossFlags).ScheduleIntervalSeconds
				local interval = type(scheduleIntervalSeconds) == "table" and tonumber(scheduleIntervalSeconds.Value) or nil

				if interval and interval > 0 then
					mech.Interval = interval
				end
			end)

			mech.Clock = function(num79)
				local n7 = math.max(0, math.floor(num79 + 0.5))
				return string.format("%d:%02d", math.floor(n7 / 60), n7 % 60)
			end

			mech.Timer = function()
				local serverTimeNow = workspace:GetServerTimeNow()
				local scrambleArena = workspace:FindFirstChild("ScrambleArena")
				scrambleArena = scrambleArena and tonumber(scrambleArena:GetAttribute("SpawnsAt")) or 0

				if workspace:FindFirstChild("ScrambleArenaPortal") then
					if serverTimeNow < scrambleArena then
						return "Mech portal is open  |  boss spawns in " .. mech.Clock(scrambleArena - serverTimeNow)
					end
					return "Mech portal is open now"
				end

				local interval = mech.Interval
				return "Next Mech portal in " .. mech.Clock(math.ceil(serverTimeNow / interval) * interval - serverTimeNow)
			end

			local function func240(instance7)
				if not instance7 then
					return nil
				end
				local hitbox = instance7:FindFirstChild("Hitbox", true)
				if hitbox and hitbox:IsA("BasePart") then
					return hitbox
				end

				for _, descendant in ipairs(instance7:GetDescendants()) do
					if descendant:IsA("TouchTransmitter") and descendant.Parent and descendant.Parent:IsA("BasePart") then
						return descendant.Parent
					end
				end

				return nil
			end

			local function func241(flag294)
				local flag295 = str1.Root()
				if not flag295 or not flag294 or type(firetouchinterest) ~= "function" then
					return
				end

				pcall(function()
					firetouchinterest(flag295, flag294, 0)
					task.wait(0.05)
					firetouchinterest(flag295, flag294, 1)
				end)
			end

			local function func242(param170, param171)
				if not mech.Dodge or not ok or type(result) ~= "table" or type(result.Contains) ~= "function" then
					return false
				end

				for k, hazard in pairs(mech.Hazards) do
					local n7 = tonumber(hazard.At) or 0
					local n8 = tonumber(hazard.Warn) or 0
					if n7 + (tonumber(hazard.Duration) or 0.5) + 1.5 < param171 then
						mech.Hazards[k] = nil
						continue
					end

					if param171 >= n7 - n8 - 0.1 then
						local ok2, result2 = pcall(result.Contains, hazard, param170, param171)
						if ok2 and result2 then
							return true
						end
					end
				end

				return false
			end

			local function func243()
				local character = localPlayer.Character
				local backpack = localPlayer:FindFirstChildOfClass("Backpack")

				for _, item81 in ipairs({ character, backpack }) do
					if item81 then
						for _, child in ipairs(item81:GetChildren()) do
							if child:IsA("Tool") and tostring(child:GetAttribute("ItemType")) == "Gear" then
								if string.find(string.lower(tostring(child:GetAttribute("GearName") or "")), "scrambler", 1, true) then
									return child
								end
							end
						end
					end
				end

				return nil
			end

			local function func244()
				local lastSwing = mech.LastSwing
				if os.clock() - lastSwing < mech.SwingGap then
					return
				end
				mech.LastSwing = os.clock()
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				local findBat = type(str1.FindBat) == "function" and str1.FindBat() or nil
				local swapTools = mech.SwapTools and func243() or nil
				local obj39

				if findBat and swapTools and findBat ~= swapTools then
					local secondHold = mech.SwapIndex == 2 and mech.SecondHold or mech.MainHold
					local swapSince = mech.SwapSince

					if os.clock() - swapSince >= secondHold then
						mech.SwapIndex = mech.SwapIndex == 2 and 1 or 2
						mech.SwapSince = os.clock()
					end

					obj39 = mech.SwapIndex == 2 and swapTools or findBat
				else
					obj39 = findBat or swapTools
				end

				if not obj39 or not humanoid then
					return
				end

				if obj39.Parent ~= character then
					pcall(function()
						humanoid:EquipTool(obj39)
					end)
				end

				pcall(function()
					obj39:Activate()
				end)
			end

			local function func245(num80, param172)
				local character = localPlayer.Character
				local flag296 = str1.Root()
				if not character or not flag296 then
					return
				end

				if (flag296.Position - num80).Magnitude > 3 then
					pcall(function()
						character:PivotTo(CFrame.lookAt(num80, Vector3.new(param172.X, num80.Y, param172.Z)))
						flag296.AssemblyLinearVelocity = Vector3.zero
					end)
				end
			end

			local function func246(instance8)
				local mech2 = instance8:FindFirstChild("Mech")
				local hitbox = mech2 and mech2:FindFirstChild("Hitbox")
				if hitbox and hitbox:IsA("BasePart") then
					return hitbox.Position, mech2
				end

				for _, child in ipairs(instance8:GetChildren()) do
					if child:IsA("Model") and child.Name ~= "Ball" and child.Name ~= "LeaveTeleport" and child.Name ~= "Structure" then
						local hitbox2 = child:FindFirstChild("Hitbox")
						if hitbox2 and hitbox2:IsA("BasePart") then
							return hitbox2.Position, child
						end
					end
				end

				return nil, nil
			end

			local function func247(instance9, part13)
				local ball = instance9:FindFirstChild("Ball")
				if not ball then
					return false
				end
				local position = ball:GetBoundingBox().Position
				local n7 = (tonumber(instance9:GetAttribute("FloorY")) or position.Y) + 3
				local n8 = tonumber(instance9:GetAttribute("CoreStage")) or 0

				if instance9:GetAttribute("BallStunned") == true then
					mech.Run = nil
					local vector = Vector3.new(part13.Position.X - position.X, 0, part13.Position.Z - position.Z)
					local unit = vector.Magnitude > 1 and vector.Unit or Vector3.new(1, 0, 0)
					func245(Vector3.new(position.X, n7, position.Z) + unit * 10, position)
					func244()
					mech.Status = string.format("Smashing the core  |  stage %d / 3  |  core %s", n8, tostring(instance9:GetAttribute("CoreHealth") or "?"))
					return true
				end

				local str22 = tostring(instance9:GetAttribute("BallTarget"))
				local attribute = instance9:GetAttribute("BallCoil")

				if not mech.Run and str22 == tostring(localPlayer.UserId) and type(attribute) == "string" and attribute ~= "" then
					local coils = instance9:FindFirstChild("Coils")
					local attribute2 = coils and coils:FindFirstChild(attribute)
					attribute2 = attribute2 and attribute2:GetAttribute("Home")

					if typeof(attribute2) == "Vector3" then
						local vector = Vector3.new(attribute2.X - position.X, 0, attribute2.Z - position.Z)

						if vector.Magnitude > 1 then
							mech.Run = {
								Goal = Vector3.new(attribute2.X, n7, attribute2.Z) + vector.Unit * 40,
								Until = os.clock() + 8,
								Coil = attribute,
							}
						end
					end
				end

				if mech.Run then
					local vector = Vector3.new(mech.Run.Goal.X - part13.Position.X, 0, mech.Run.Goal.Z - part13.Position.Z)
					local flag297 = vector.Magnitude < 4

					if not flag297 then
						local until_ = mech.Run.Until
						flag297 = os.clock() > until_
					end

					if flag297 then
						mech.Run = nil

						pcall(function()
							part13.AssemblyLinearVelocity = Vector3.new(0, part13.AssemblyLinearVelocity.Y, 0)
						end)
					else
						local n9 = vector.Unit * mech.BaitSpeed

						pcall(function()
							part13.AssemblyLinearVelocity = Vector3.new(n9.X, part13.AssemblyLinearVelocity.Y, n9.Z)
						end)

						mech.Status = string.format("Baiting the ball into %s  |  stage %d / 3", mech.Run.Coil, n8)
					end

					return true
				end

				local vector = Vector3.new(part13.Position.X - position.X, 0, part13.Position.Z - position.Z)

				if vector.Magnitude > 18 or vector.Magnitude < 6 then
					local vector2 = vector.Magnitude < 1 and Vector3.new(1, 0, 0) or vector.Unit
					func245(Vector3.new(position.X, n7, position.Z) + vector2 * 12, position)
				end

				mech.Status = string.format("Ball phase, waiting for it to lock on  |  stage %d / 3", n8)
				return true
			end

			local function func248(instance10, part14)
				local scrambleHuman = instance10:FindFirstChild("ScrambleHuman")
				if not scrambleHuman then
					return false
				end
				local humanoidRootPart = scrambleHuman:FindFirstChild("HumanoidRootPart") or scrambleHuman.PrimaryPart or scrambleHuman:FindFirstChildWhichIsA("BasePart")
				local position = humanoidRootPart and humanoidRootPart.Position or scrambleHuman:GetPivot().Position
				humanoidRootPart = humanoidRootPart and humanoidRootPart.AssemblyLinearVelocity or Vector3.zero
				local n7 = position + Vector3.new(humanoidRootPart.X, 0, humanoidRootPart.Z) * 0.15
				local vector = Vector3.new(part14.Position.X - n7.X, 0, part14.Position.Z - n7.Z)
				local vector2 = vector.Magnitude > 1 and vector.Unit * 5 or Vector3.zero
				local n8 = Vector3.new(n7.X, part14.Position.Y, n7.Z) + vector2
				local character = localPlayer.Character

				pcall(function()
					character:PivotTo(CFrame.lookAt(n8, Vector3.new(position.X, n8.Y, position.Z)))
				end)

				func244()
				mech.Status = string.format("Chasing Dr Scramble  |  hits %s / %s", tostring(instance10:GetAttribute("HumanHits") or 0), tostring(instance10:GetAttribute("HumanNeeded") or 3))
				return true
			end

			local function func249()
				local result39 = func237()
				local num81 = str1.Root()
				local character = localPlayer.Character
				character = character and character:FindFirstChildOfClass("Humanoid")
				if not result39 or not num81 then
					return
				end
				local str23 = tostring(result39:GetAttribute("Phase"))
				local n7 = tonumber(result39:GetAttribute("Health")) or 0
				local n8 = tonumber(result39:GetAttribute("MaxHealth")) or 0

				if tostring(result39:GetAttribute("GrabVictim")) == tostring(localPlayer.UserId) and character then
					character.Jump = true
					func244()
					mech.Status = "Grabbed, breaking free"
					return
				end

				if str23 == "Ball" and mech.TryBall and func247(result39, num81) then
					return
				end

				if str23 == "Human" and func248(result39, num81) then
					return
				end
				local flag298, obj40 = func246(result39)

				if not flag298 then
					local n9 = (tonumber(result39:GetAttribute("SpawnsAt")) or 0) - workspace:GetServerTimeNow()
					mech.Status = n9 > 0 and "In the arena  |  boss spawns in " .. mech.Clock(n9) or string.format("Phase %s, waiting for the boss", str23)
					return
				end

				local serverTimeNow = workspace:GetServerTimeNow()
				local n9 = (tonumber(result39:GetAttribute("FloorY")) or flag298.Y) + 3
				local value230 = nil
				local value231 = nil

				for i = 0, 15 do
					local n10 = i / 16 * 3.1415926535897931 * 2
					local vector = Vector3.new
					local radius = mech.Radius
					local n11 = flag298.X + math.cos(n10) * radius
					local radius2 = mech.Radius
					local num82 = vector(n11, n9, flag298.Z + math.sin(n10) * radius2)
					local magnitude = (num82 - num81.Position).Magnitude

					if func242(num82, serverTimeNow) or func242(num82, serverTimeNow + 0.4) then
						magnitude += 10000
					end

					if not value230 or magnitude < value230 then
						value230 = magnitude
						value231 = num82
					end
				end

				if value231 then
					func245(value231, flag298)
				end

				func244()
				obj40 = obj40 and obj40:GetAttribute("Overheated") == true
				mech.Status = string.format("Fighting %s  |  boss %d / %d%s", str23, math.floor(n7 + 0.5), math.floor(n8 + 0.5), obj40 and "  |  OVERHEAT" or "")
			end

			local function func250()
				local result40 = func237()
				local flag299 = func240(result40 and result40:FindFirstChild("LeaveTeleport"))
				if not flag299 then
					return
				end
				local character = localPlayer.Character

				pcall(function()
					character:PivotTo(CFrame.new(flag299.Position + Vector3.new(0, 3, 0)))
				end)

				task.wait(0.2)
				func241(flag299)
			end

			local function func251(flag300)
				local result41 = func238()
				local flag301 = func240(result41)
				if not result41 or not flag301 then
					return false
				end
				local stealHome2 = type(str1.StealHome) == "function" and str1.StealHome() or nil

				if stealHome2 and str1.InsideBase() then
					local respawned = mech.Respawned == true
					local n7 = stealHome2 + Vector3.new(0, 3, 0)
					local travelSpeed = respawned and math.min(mech.TravelSpeed, 300) or mech.TravelSpeed
					local now = os.clock()
					local exitTo = nil

					while true do
						if not (os.clock() - now < 20) then
							exitTo = 1
							break
						else
							if flag300 ~= mech.Generation or not func236() or func239() or mech.StealFirst() then
								exitTo = 2
								break
							else
								local num83 = str1.Root()

								if num83 then
									local n8 = n7 - num83.Position

									if n8.Magnitude <= 4 then
										exitTo = 1
										break
									else
										mech.Status = respawned and "Respawned, going out through the safe zone" or "Leaving the base through the safe zone"
										local magnitude = n8.Magnitude
										local n9 = math.min(travelSpeed * RunService.Heartbeat:Wait(), magnitude)

										pcall(function()
											local rotation = num83.CFrame.Rotation
											num83.CFrame = CFrame.new(num83.Position + n8.Unit * n9) * rotation
											num83.AssemblyLinearVelocity = Vector3.zero
										end)

										continue
									end
								end
							end

							break
						end
					end

					if exitTo ~= 1 then
						if exitTo == 2 then
							return false
						end
						return false
					end

					if respawned then
						mech.Status = "Respawned, resting in the safe zone"
						local n8 = 0

						while n8 < 0.75 do
							local value232 = str1.Root()

							if value232 then
								pcall(function()
									value232.AssemblyLinearVelocity = Vector3.zero
								end)
							end

							n8 += RunService.Heartbeat:Wait()
						end
					end
				end

				mech.Respawned = false

				for i = 1, 5 do
					if not (flag300 ~= mech.Generation or not func236() or func239() or mech.StealFirst()) then
						local flag302 = str1.Root()

						if not (not flag302 or not flag301.Parent) then
							mech.Status = "Teleporting to the Mech portal"

							pcall(function()
								flag302.CFrame = flag301.CFrame + Vector3.new(0, 1, 0)
								flag302.AssemblyLinearVelocity = Vector3.zero
								flag302.AssemblyAngularVelocity = Vector3.zero
							end)

							func241(flag301)
							local n7 = os.clock() + 0.6

							while os.clock() < n7 and not func239() do
								RunService.Heartbeat:Wait()
							end

							continue
						end
					end

					break
				end

				if func239() then
					return true
				end
				local position = flag301.Position
				local now = os.clock()
				local exitTo2 = nil
				local num84

				while true do
					if not (os.clock() - now < 60) then
						exitTo2 = 1
						break
					else
						if flag300 ~= mech.Generation or not func236() or func239() or mech.StealFirst() then
							exitTo2 = 1
							break
						else
							num84 = str1.Root()

							if not num84 then
								exitTo2 = 2
								break
							else
								local vector = Vector3.new(position.X - num84.Position.X, 0, position.Z - num84.Position.Z)

								if not (vector.Magnitude <= 14) then
									local n7 = vector.Unit * math.min(mech.TravelSpeed, vector.Magnitude / 0.05)
									mech.Status = string.format("Going to the Mech portal, %d studs", math.floor(vector.Magnitude + 0.5))

									pcall(function()
										num84.AssemblyLinearVelocity = Vector3.new(n7.X, num84.AssemblyLinearVelocity.Y, n7.Z)
									end)

									RunService.Heartbeat:Wait()
									continue
								end
							end
						end

						break
					end
				end

				if exitTo2 ~= 1 then
					if exitTo2 == 2 then
						return false
					end

					pcall(function()
						num84.AssemblyLinearVelocity = Vector3.zero
					end)

					func241(flag301)
					task.wait(0.4)

					if not func239() then
						pcall(function()
							local rfScrambleBossEnterArena = networking:FindFirstChild("RF/ScrambleBoss/EnterArena")

							if rfScrambleBossEnterArena then
								rfScrambleBossEnterArena:InvokeServer()
							end
						end)
					end
				end

				local now2 = os.clock()

				while not func239() and os.clock() - now2 < 5 do
					task.wait(0.1)
				end

				return func239()
			end

			local function func252()
				mech.Busy = true
				mech.Generation = mech.Generation + 1
				local generation = mech.Generation
				str1.Shield("mech", true)

				pcall(function()
					if str1.Treadmill and str1.Treadmill.Riding or type(str1.OnBelt) == "function" and str1.OnBelt() then
						str1.ExitBelt()
					end
				end)

				if not func239() and not mech.StealFirst() then
					pcall(func251, generation)
				end

				while generation == mech.Generation and func236() and func239() and not mech.StealFirst() do
					local result42 = func237()
					local flag303 = result42 and tostring(result42:GetAttribute("Phase")) or ""

					if flag303 == "Defeated" or flag303 == "Final" or flag303 == "Ended" or flag303 == "Won" then
						mech.Status = "Dr Scramble defeated, going back home"


						if not mech.DefeatedAt and type(mech.StartChain) == "function" then
							pcall(mech.StartChain)
						end

						mech.DefeatedAt = mech.DefeatedAt or os.clock()
						local leave = mech.Leave

						if leave then
							local defeatedAt = mech.DefeatedAt
							leave = os.clock() - defeatedAt > 1
						end

						if leave then
							pcall(func250)
							task.wait(2)
						else
							task.wait(0.3)
						end
					else
						pcall(func249)
						RunService.Heartbeat:Wait()
					end
				end

				if func239() and mech.StealFirst() then
					mech.Status = tostring(mech.StealFirst()) .. ", leaving the arena"
					pcall(func250)
					local n7 = 0

					while func239() and n7 < 5 do
						n7 += task.wait(0.2)
					end
				end

				mech.DefeatedAt = nil
				mech.Run = nil
				str1.Shield("mech", false)
				str1.ReleaseMovement("mech")
				mech.Busy = false
				tbl2.Wake()
			end

			pcall(function()
				local reScrambleBossHazard = networking:FindFirstChild("RE/ScrambleBoss/Hazard")

				if reScrambleBossHazard and reScrambleBossHazard:IsA("RemoteEvent") then
					table.insert(mech.Links, reScrambleBossHazard.OnClientEvent:Connect(function(param173)
						if type(param173) == "table" then
							mech.Hazards[param173.Id or #mech.Hazards + 1] = param173
						end
					end))
				end
			end)

			table.insert(mech.Links, localPlayer.CharacterAdded:Connect(function()
				mech.Respawned = true
			end))

			mech.Row = obj38:CreateText({ Name = "Mech Status", Text = "Idle" })

			mech.Handle = obj38:CreateToggle({
				Name = "Auto Mech Boss",
				Default = false,
				Callback = function()
					if not func236() then
						mech.Generation = mech.Generation + 1
					end

					tbl2.Wake()
				end,
			})

			for _, item82 in ipairs({
				{ "Mech Tween Speed", 100, 1000, 250, 10, "studs/s", "TravelSpeed" },
				{ "Main Weapon Hold", 0, 1.5, 0.3, 0.01, "s", "MainHold" },
				{ "Scrambler Hold", 0, 1.5, 0.4, 0.01, "s", "SecondHold" },
			}) do
				obj38:CreateSlider({
					Name = item82[1],
					Min = item82[2],
					Max = item82[3],
					Default = item82[4],
					Increment = item82[5],
					Unit = item82[6],
					SubOf = mech.Handle,
					Callback = function(value)
						mech[item82[7]] = math.clamp(tonumber(value) or item82[4], item82[2], item82[3])
					end,
				})
			end

			for _, item83 in ipairs({
				{ "Swap Two Weapons", "SwapTools" },
				{ "Dodge Attacks", "Dodge" },
				{ "Ball And Core Phase", "TryBall" },
				{ "Leave After Fight", "Leave" },
			}) do
				obj38:CreateToggle({
					Name = item83[1],
					Default = true,
					SubOf = mech.Handle,
					Callback = function(value)
						mech[item83[2]] = value ~= false
					end,
				})
			end

			mech.HopHandle = obj38:CreateToggle({
				Name = "Boss Server Hop",
				Note = "After each boss, hops to a less crowded server to fight again",
				Default = false,
				SubOf = mech.Handle,
				Callback = function()
					mech.HopAt = nil

					if not str1.Toggle(mech.HopHandle, false) then
						mech.HopConfirmed = false
						mech.HopNote = nil
						pcall(str1.HopPrompt.Hide)
						return
					end

					mech.ArmedCycle = math.floor(workspace:GetServerTimeNow() / mech.Interval)
					if not str1.HopPrompt.Manual() then
						mech.HopConfirmed = true
						return
					end
					mech.ArrivedByHop = false
					mech.HopConfirmed = false

					if not pcall(str1.HopPrompt.Show, {
						Title = "Boss Server Hop",
						Warn = "WARNING",
						Body = "After you beat a Mech boss, Boss Server Hop keeps joining less crowded servers. It fights the boss wherever one is still up and hops again when there is none. Turn it off to stop hopping.",
						Tip = "",
						Cancel = "Cancel",
						Accept = "Turn On",
					}, function()
						mech.HopConfirmed = true
						tbl2.Wake()
					end, function()
						pcall(function()
							mech.HopHandle:Set(false)
						end)
					end) then
						mech.HopConfirmed = true
					end
				end,
			})

			mech.PortalCloses = function()
				local interval = mech.Interval
				return math.floor(workspace:GetServerTimeNow() / mech.Interval) * interval + mech.OpenSeconds
			end

			mech.SaveChain = function()
				if type(writefile) ~= "function" then
					return
				end

				pcall(function()
					if type(isfolder) == "function" and type(makefolder) == "function" and not isfolder("ChilliLibrary") then
						makefolder("ChilliLibrary")
					end

					writefile(mech.ChainPath, game:GetService("HttpService"):JSONEncode({ Until = mech.ChainUntil, Cycle = mech.ChainCycle, HopAt = mech.HopStamp }))
				end)
			end

			mech.StartChain = function()
				if not str1.Toggle(mech.HopHandle, false) or not mech.HopConfirmed then
					return
				end
				local serverTimeNow = workspace:GetServerTimeNow()
				local chainCycle = math.floor(serverTimeNow / mech.Interval)
				if mech.ChainUntil > serverTimeNow or mech.ChainCycle == chainCycle and mech.ArrivedByHop then
					return
				end
				mech.ChainCycle = chainCycle
				mech.ChainUntil = math.min(serverTimeNow + mech.HopWindow * 60, mech.PortalCloses())
				mech.SaveChain()
			end

			pcall(function()
				if type(isfile) == "function" and isfile(mech.ChainPath) then
					local data = game:GetService("HttpService"):JSONDecode(readfile(mech.ChainPath))

					if type(data) == "table" then
						mech.ChainUntil = tonumber(data.Until) or 0
						mech.ChainCycle = tonumber(data.Cycle)
						mech.HopStamp = tonumber(data.HopAt) or 0
						mech.ArrivedByHop = workspace:GetServerTimeNow() - mech.HopStamp < 120
					end
				end
			end)

			obj38:CreateSlider({
				Name = "Keep Hopping For",
				Note = "Keeps fighting every boss it finds and hopping for this long",
				Min = 1,
				Max = 15,
				Default = 3,
				Increment = 1,
				Unit = "min",
				SubOf = mech.Handle,
				Callback = function(value)
					mech.HopWindow = math.clamp(math.floor(tonumber(value) or 3), 1, 15)
				end,
			})

			pcall(function()
				local masteryState = { Loop = 0, On = false }
				function masteryState.Run(token)
					if type(str1.ScrambleRead) ~= "function" or type(str1.ScrambleRequest) ~= "function" then return end
					local snap = str1.ScrambleRead(true)
					local st = type(snap) == "table" and snap.State or nil
					if type(st) ~= "table" or snap.Ready == false or snap.Enabled == false then return end
					local dataFolder = ReplicatedStorage:FindFirstChild("Data")
					local masteryMod = dataFolder and dataFolder:FindFirstChild("ScrambleMastery")
					local okM, masteryData = pcall(require, masteryMod)
					if not okM or type(masteryData) ~= "table" or type(masteryData.Milestones) ~= "table" then return end
					local claimed = type(st.ClaimedMilestoneIds) == "table" and st.ClaimedMilestoneIds or {}
					local kills = tonumber(st.Mastery) or 0
					local toClaim = {}
					for _, ms in ipairs(masteryData.Milestones) do
						local reqKills = type(ms) == "table" and tonumber(ms.Kills) or nil
						if reqKills and ms.Id and not claimed[ms.Id] and kills >= reqKills then
							local okP, pres = pcall(masteryData.Presentation, ms.Reward)
							local title = okP and type(pres) == "table" and (pres.Title or pres.Name) or nil
							table.insert(toClaim, { Id = ms.Id, Text = (title and tostring(title) or "a reward") .. " at " .. reqKills .. " kills" })
						end
					end
					local okF, finalMs = pcall(masteryData.FinalMilestone)
					if okF and type(finalMs) == "table" and claimed[finalMs.Id] and masteryData.InfiniteMilestoneId then
						local okC, infCount = pcall(masteryData.ClaimableInfiniteCount, st)
						if okC and (tonumber(infCount) or 0) > 0 then
							table.insert(toClaim, { Id = masteryData.InfiniteMilestoneId, Text = "the repeat reward" })
						end
					end
					for _, item in ipairs(toClaim) do
						if token ~= masteryState.Loop or not masteryState.On then return end
						local res = str1.ScrambleRequest("Milestone", item.Id)
						if type(res) == "table" and res.Ok == true then
							str1.Notify("Boss Mastery", "Claimed " .. item.Text)
						end
						task.wait(1)
					end
				end
				obj38:CreateToggle({
					Name = "Auto Claim Mastery",
					Note = "Claims Boss Mastery rewards as soon as they unlock",
					Default = false,
					Callback = function(v)
						masteryState.Loop += 1
						masteryState.On = v == true
						if not masteryState.On then return end
						local tok = masteryState.Loop
						task.spawn(function()
							while tok == masteryState.Loop and masteryState.On do
								pcall(masteryState.Run, tok)
								task.wait(10)
							end
						end)
					end,
				})
				func4(function()
					masteryState.Loop += 1
					masteryState.On = false
				end)
			end)

			tbl2.Add(function()
				if not func236() or not str1.Toggle(mech.HopHandle, false) or not mech.HopConfirmed then
					mech.HopAt = nil
					mech.HopNote = nil
					return false
				end

				if mech.Hopping then
					return false
				end
				local serverTimeNow = workspace:GetServerTimeNow()

				if mech.ChainUntil > 0 and serverTimeNow >= mech.ChainUntil then
					mech.ChainUntil = 0
					mech.SaveChain()
				end

				if mech.ChainUntil <= serverTimeNow then
					local n7 = math.floor(serverTimeNow / mech.Interval)
					local n8 = serverTimeNow - n7 * mech.Interval
					local flag304 = (mech.ArmedCycle == n7 or mech.ChainCycle ~= n7) and n8 >= 20 and n8 < mech.OpenSeconds

					if flag304 then
						local loadedAt = mech.LoadedAt
						flag304 = os.clock() - loadedAt >= 8
					end

					if flag304 and not mech.Busy and not func239() and not func238() then
						pcall(mech.StartChain)
					end

					if mech.ArmedCycle ~= n7 then
						mech.ArmedCycle = nil
					end
				end

				if mech.ChainUntil <= serverTimeNow then
					local interval = mech.Interval
					local n7 = serverTimeNow - math.floor(serverTimeNow / mech.Interval) * interval
					mech.HopAt = nil

					if mech.OpenSeconds <= n7 then
						mech.HopNote = "Boss hop waits for the next portal"
					elseif mech.ArrivedByHop and mech.ChainCycle == math.floor(serverTimeNow / mech.Interval) then
						mech.HopNote = "Boss hop is done for this portal"
					elseif mech.Busy or func239() or func238() then
						mech.HopNote = "Boss hop starts after this boss"
					else
						mech.HopNote = "Looking for the boss here"
					end

					return false
				end

				local n7 = mech.ChainUntil - serverTimeNow

				if mech.Busy or func239() or func238() then
					mech.HopAt = nil
					mech.HopNote = "Boss hop on, " .. mech.Clock(n7) .. " left"
					return false
				end

				local loadedAt = mech.LoadedAt

				if os.clock() - loadedAt < 8 then
					mech.HopAt = nil
					mech.HopNote = "Looking for the boss here"
					return false
				end

				local steal = str1.Steal
				local flag305 = str1.Toggle(value2, false) == true and steal

				if flag305 then
					flag305 = steal.Wanted == true or steal.Carrying == true or steal.Active == true
				end

				if flag305 then
					mech.HopAt = nil
					mech.HopNote = "A filtered egg is here, stealing before the hop"
					return false
				end

				local value233 = mech
				local hopAt = mech.HopAt

				if not hopAt then
					local hopDelay = mech.HopDelay
					hopAt = os.clock() + hopDelay
				end

				value233.HopAt = hopAt
				local hopAt2 = mech.HopAt
				if os.clock() < hopAt2 then
					mech.HopNote = string.format("No boss here, hopping in %ds  |  %s left", math.ceil(mech.HopAt - os.clock()), mech.Clock(n7))
					return false
				end

				if type(str1.ServerHop) ~= "function" then
					mech.HopNote = "Server hop is not ready"
					return false
				end
				mech.Hopping = true
				mech.HopNote = "Joining a less crowded server"
				mech.HopStamp = workspace:GetServerTimeNow()
				mech.SaveChain()

				task.spawn(function()
					local ok2, result2 = pcall(str1.ServerHop, "Least Players")
					local flag306 = ok2 and tostring(result2) or "error"
					mech.Hopping = false

					if flag306 == "waiting" then
						mech.HopAt = os.clock() + 15
						mech.HopNote = "Teleporting to the next server"
					elseif flag306 == "fetch" then
						mech.HopAt = os.clock() + 10
						mech.HopNote = "Server list unavailable, trying again soon"
					else
						mech.HopAt = os.clock() + 3
						mech.HopNote = "Hop did not land, trying again"
					end
				end)

				return false
			end)

			tbl2.Add(function()
				local row = mech.Row

				if not func236() then
					mech.Status = "Off  |  " .. mech.Timer()
				elseif not mech.Busy then
					if func239() then
						mech.Status = "In the arena"
					else
						mech.Status = mech.Timer()
					end

					if mech.HopNote then
						mech.Status = mech.Status .. "  |  " .. mech.HopNote
					end
				end

				if row and mech.Shown ~= mech.Status and type(row.Set) == "function" then
					mech.Shown = mech.Status
					pcall(row.Set, row, mech.Status)
				end

				local invisibilityHandle = str1.InvisibilityHandle
				local flag307 = invisibilityHandle ~= nil and str1.Toggle(invisibilityHandle, false)
				local busy = func236()

				if busy then
					busy = mech.Busy or func239() or func238()
				end

				if busy then
					mech.InvisResumeAt = nil

					if not str1.InvisMech then
						str1.InvisMech = true

						if flag307 then
							str1.Notify("Invisibility", "Invisibility is paused for the Mech boss and comes back after it.")
						end
					end
				elseif str1.InvisMech and not mech.Busy then
					mech.InvisResumeAt = mech.InvisResumeAt or os.clock() + 5

					if mech.InvisResumeAt <= os.clock() then
						mech.InvisResumeAt = nil
						str1.InvisMech = false

						if flag307 then
							str1.Notify("Invisibility", "The Mech boss is over, Invisibility is back on.")
						end
					end
				end

				if not func236() or mech.Busy then
					return true
				end

				if func239() or func238() then
					local str24 = mech.StealFirst()
					if str24 then
						mech.Status = str24 .. "  |  " .. mech.Timer()
						return true
					end
					local character = localPlayer.Character
					if character and character:GetAttribute("InvisApplied") == true then
						mech.Status = "Leaving Invisibility for the boss"
						return true
					end

					if not str1.ClaimMovement("mech") then
						mech.Status = "Waiting for " .. tostring(str1.Movement.Owner or "movement")
						return true
					end
					task.spawn(func252)
					return true
				end

				return true
			end)

			func4(function()
				str1.InvisMech = false
				mech.Generation = mech.Generation + 1

				for _, link in ipairs(mech.Links) do
					pcall(function()
						link:Disconnect()
					end)
				end

				pcall(str1.Shield, "mech", false)
				pcall(str1.ReleaseMovement, "mech")
			end)
		end

		str1.MechBoot((obj2._bhLayout and obj2._bhLayout.MechBoss) or obj3)

		pcall(function()
			local bfSec = obj2._bhLayout and obj2._bhLayout.Butterfly
			if bfSec then
				local bfState = {
					Mode = "Stand",
					Priority = "Rarest",
					Speed = 320,
					Tiers = {},
					TradeTiers = {},
					SmartTrade = false,
					LastActionAt = 0,
					LastCountsText = nil,
					LastStatusText = nil,
				}
				local bfStatus = bfSec:CreateText({ Name = "Butterfly Status", Text = "Off" })
				local bfCounts = bfSec:CreateText({ Name = "Butterflies", Text = "Green 0  |  Blue 0  |  Purple 0  |  Golden 0  |  Essence 0" })
				local function setBfStatus(txt)
					if txt ~= bfState.LastStatusText then
						bfState.LastStatusText = txt
						pcall(bfStatus.Set, bfStatus, txt)
					end
				end
				local bfHandle = bfSec:CreateToggle({
					Name = "Auto Butterfly Bloom",
					Default = false,
					Callback = function(v)
						setBfStatus(v and "Waiting for Butterfly Bloom event" or "Off")
						tbl2.Wake()
					end,
				})
				bfSec:CreateDropdown({
					Name = "Catch Mode",
					Options = { "Stand", "Chase", "Circle", "Patrol" },
					Default = "Stand",
					SubOf = bfHandle,
					Callback = function(v) bfState.Mode = tostring(v or "Stand") end,
				})
				bfSec:CreateDropdown({
					Name = "Catch Priority",
					Note = "Only for Chase mode",
					Options = { "Rarest", "Nearest" },
					Default = "Rarest",
					SubOf = bfHandle,
					Callback = function(v) bfState.Priority = tostring(v or "Rarest") end,
				})
				local bfTierOpts = { "Radiant Butterfly", "Amethyst Butterfly", "Sapphire Butterfly", "Emerald Butterfly" }
				for _, t in ipairs(bfTierOpts) do bfState.Tiers[t] = true end
				func6(bfSec:CreateMultiDropdown({
					Name = "Catch Butterflies",
					Note = "Only for Chase mode",
					Options = bfTierOpts,
					Default = bfTierOpts,
					SubOf = bfHandle,
					Callback = function(list)
						table.clear(bfState.Tiers)
						for _, item in ipairs(type(list) == "table" and list or {}) do
							bfState.Tiers[tostring(item)] = true
						end
					end,
				}))
				bfSec:CreateSlider({
					Name = "Tween Speed  ",
					Min = 100,
					Max = 600,
					Default = 320,
					Increment = 10,
					Unit = "studs/s",
					SubOf = bfHandle,
					Callback = function(v) bfState.Speed = math.clamp(tonumber(v) or 320, 100, 600) end,
				})
				local tradeUpHandle = bfSec:CreateToggle({
					Name = "Auto Trade Up",
					Default = false,
					Callback = function() tbl2.Wake() end,
				})
				bfSec:CreateMultiDropdown({
					Name = "Trade Up Tiers",
					Options = { "Emerald To Sapphire", "Sapphire To Amethyst", "Amethyst To Radiant" },
					Default = {},
					SubOf = tradeUpHandle,
					Callback = function(list)
						table.clear(bfState.TradeTiers)
						for _, item in ipairs(type(list) == "table" and list or {}) do
							bfState.TradeTiers[tostring(item)] = true
						end
						tbl2.Wake()
					end,
				})
				bfSec:CreateToggle({
					Name = "Smart Trade For Essence",
					Default = false,
					SubOf = tradeUpHandle,
					Callback = function(v) bfState.SmartTrade = v == true; tbl2.Wake() end,
				})
				local craftEssenceHandle = bfSec:CreateToggle({
					Name = "Auto Craft Essence",
					Default = false,
					Callback = function() tbl2.Wake() end,
				})

				local essState = {
					Handle = nil,
					Row = nil,
					Loop = 0,
					MinRarity = 0,
					MinIncome = 0,
					Priority = "Highest Value",
					SkipMutated = true,
					Status = "Off",
					Targets = {},
					LastTryAt = 0,
				}
				essState.Handle = bfSec:CreateToggle({
					Name = "Auto Use Enchanted Essence",
					Default = false,
					Callback = function(v)
						essState.Status = v and "Waiting for Enchanted Essence" or "Off"
						if essState.Row and type(essState.Row.Set) == "function" then
							pcall(essState.Row.Set, essState.Row, essState.Status)
						end
						tbl2.Wake()
					end,
				})
				essState.Row = bfSec:CreateText({ Name = "Essence Status", Text = "Off", SubOf = essState.Handle })
				bfSec:CreateDropdown({
					Name = "Essence Min Rarity",
					Note = "Only eggs of this rarity and above get the essence",
					Options = list3,
					Default = list3[1],
					SubOf = essState.Handle,
					Callback = function(v) essState.MinRarity = tbl8[v] or 0; tbl2.Wake() end,
				})
				func5(bfSec, {
					Name = "Essence Min Value",
					Note = "Skip eggs worth less than this (0 = off)",
					SubOf = essState.Handle,
					OnRaw = function(raw) essState.MinIncome = math.max(0, tonumber(raw) or 0); tbl2.Wake() end,
				})
				func6(bfSec:CreateMultiDropdown({
					Name = "Essence Target Eggs",
					Note = "Only use the essence on these eggs (empty = all)",
					Options = str33.EggOptions or {},
					Default = {},
					SubOf = essState.Handle,
					Callback = function(list)
						table.clear(essState.Targets)
						for _, item in ipairs(type(list) == "table" and list or {}) do
							essState.Targets[tostring(item)] = true
						end
						tbl2.Wake()
					end,
				}))
				bfSec:CreateDropdown({
					Name = "Essence Priority",
					Note = "Which egg gets the essence first",
					Options = { "Highest Value", "Best Rarity", "Biggest Size" },
					Default = "Highest Value",
					SubOf = essState.Handle,
					Callback = function(v) essState.Priority = tostring(v); tbl2.Wake() end,
				})
				bfSec:CreateToggle({
					Name = "Essence Skip Enchanted Eggs",
					Note = "Skip eggs that already got Enchanted, other mutations still get the essence",
					Default = true,
					SubOf = essState.Handle,
					Callback = function(v) essState.SkipMutated = v == true; tbl2.Wake() end,
				})

				tbl2.Add(function()
					local save = tbl1.Save and type(tbl1.Save.Get) == "function" and tbl1.Save.Get() or nil
					local bfData = type(save) == "table" and (save.Butterflies or save.ButterflyBloom) or nil
					local gCnt = tonumber(type(bfData) == "table" and (bfData.Green or bfData.Emerald) or 0) or 0
					local bCnt = tonumber(type(bfData) == "table" and (bfData.Blue or bfData.Sapphire) or 0) or 0
					local pCnt = tonumber(type(bfData) == "table" and (bfData.Purple or bfData.Amethyst) or 0) or 0
					local rCnt = tonumber(type(bfData) == "table" and (bfData.Golden or bfData.Radiant) or 0) or 0
					local eCnt = tonumber(type(bfData) == "table" and (bfData.Essence or bfData.EnchantedEssence) or 0) or 0
					local countsTxt = string.format("Green %d  |  Blue %d  |  Purple %d  |  Golden %d  |  Essence %d", gCnt, bCnt, pCnt, rCnt, eCnt)
					if countsTxt ~= bfState.LastCountsText then
						bfState.LastCountsText = countsTxt
						pcall(bfCounts.Set, bfCounts, countsTxt)
					end

					local now = os.clock()
					if str1.Toggle(bfHandle, false) then
						local bloomActive = workspace:GetAttribute("Event_ButterflyBloom") == true
						if bloomActive then
							setBfStatus("Butterfly Bloom active (" .. bfState.Mode .. ")")
							if now - bfState.LastActionAt >= 1.0 then
								bfState.LastActionAt = now
								local netRem = networking:FindFirstChild("RF/Butterflies/AskClaimNet")
								if netRem and netRem:IsA("RemoteFunction") then
									pcall(netRem.InvokeServer, netRem)
								end
							end
						else
							setBfStatus("Waiting for Butterfly Bloom event")
						end
					end

					if str1.Toggle(tradeUpHandle, false) and now - bfState.LastActionAt >= 0.8 then
						local tradeRem = networking:FindFirstChild("RF/Butterflies/AskTradeUp")
						if tradeRem and tradeRem:IsA("RemoteFunction") then
							local map = {
								{ Label = "Emerald To Sapphire", From = "Green", Count = gCnt },
								{ Label = "Sapphire To Amethyst", From = "Blue", Count = bCnt },
								{ Label = "Amethyst To Radiant", From = "Purple", Count = pCnt },
							}
							for _, entry in ipairs(map) do
								if (bfState.SmartTrade or bfState.TradeTiers[entry.Label]) and entry.Count >= 10 then
									bfState.LastActionAt = now
									pcall(tradeRem.InvokeServer, tradeRem, entry.From)
									break
								end
							end
						end
					end

					if str1.Toggle(craftEssenceHandle, false) and now - bfState.LastActionAt >= 1.0 then
						local craftRem = networking:FindFirstChild("RF/Butterflies/AskCraftEssence")
						if craftRem and craftRem:IsA("RemoteFunction") and rCnt >= 1 then
							bfState.LastActionAt = now
							pcall(craftRem.InvokeServer, craftRem)
						end
					end

					if str1.Toggle(essState.Handle, false) and now - essState.LastTryAt >= 2.0 then
						essState.LastTryAt = now
						local useRem = networking:FindFirstChild("RF/BossMastery/AskUseMutationConsumable")
						local eggState = tbl1.EggState
						if useRem and useRem:IsA("RemoteFunction") and type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function" then
							local okE, ownerEggs = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
							if okE and type(ownerEggs) == "table" then
								local bestUid, bestScore = nil, -1
								for uid, egg in pairs(ownerEggs) do
									if type(egg) == "table" and egg.Placement ~= nil then
										local mut = tostring(egg.Mutation or "")
										local rar = str1.EggRarity(egg)
										local inc = str1.EggIncome(egg)
										local passMut = not (essState.SkipMutated and mut == "Enchanted")
										local passRar = rar >= (essState.MinRarity or 0)
										local passInc = inc >= (essState.MinIncome or 0)
										if passMut and passRar and passInc then
											local score = essState.Priority == "Best Rarity" and rar or (essState.Priority == "Biggest Size" and (tonumber(egg.Scale) or 1) or inc)
											if score > bestScore then
												bestScore, bestUid = score, uid
											end
										end
									end
								end
								if bestUid then
									local okU, resU = pcall(useRem.InvokeServer, useRem, bestUid)
									if okU and type(resU) == "table" and resU.Success == true then
										essState.Status = "Applied Enchanted Essence!"
										if essState.Row and type(essState.Row.Set) == "function" then
											pcall(essState.Row.Set, essState.Row, essState.Status)
										end
									end
								end
							end
						end
					end
					return false
				end)
			end

			local wispSec = obj2._bhLayout and obj2._bhLayout.Wisp
			if wispSec then
				local lastWispText = nil
				local wispRow = wispSec:CreateText({ Name = "Wisp Status", Text = "Off" })
				local function setWispText(txt)
					if txt ~= lastWispText then
						lastWispText = txt
						pcall(wispRow.Set, wispRow, txt)
					end
				end
				local wispHandle = wispSec:CreateToggle({
					Name = "Auto Wisp",
					Note = "Completes the Wisp stages to unlock the Enchanted Tree (requires 50B Speed Power)",
					Default = false,
					Callback = function(v)
						setWispText(v and "Reading your Wisp..." or "Off")
						tbl2.Wake()
					end,
				})
				local banjoHandle = wispSec:CreateToggle({
					Name = "Auto Banjo Cricket",
					Note = "Solves the Enchanted Tree mushroom puzzle and claims Cricket's Banjo",
					Default = false,
					Callback = function(v)
						if v and not str1.Toggle(wispHandle, false) then
							setWispText("Banjo Cricket: Waiting for Enchanted Tree")
						end
						tbl2.Wake()
					end,
				})
				local lastWispCall = 0
				tbl2.Add(function()
					local now = os.clock()
					if now - lastWispCall < 2.0 then return false end
					local wispOn = str1.Toggle(wispHandle, false)
					local banjoOn = str1.Toggle(banjoHandle, false)
					if not wispOn and not banjoOn then return false end
					lastWispCall = now
					if wispOn then
						local wispRem = networking:FindFirstChild("RF/WispCompanion/Request")
						local save = tbl1.Save and type(tbl1.Save.Get) == "function" and tbl1.Save.Get() or nil
						local wState = type(save) == "table" and save.WispCompanion or nil
						if type(wState) == "table" and wState.Unlocked == true then
							setWispText("Wisp Completed (Enchanted Tree Unlocked)")
						elseif wispRem and wispRem:IsA("RemoteFunction") then
							if type(wState) == "table" and wState.Accepted ~= true then
								pcall(wispRem.InvokeServer, wispRem, "Accept")
								setWispText("Wisp Quest Accepted - Progressing...")
							else
								pcall(wispRem.InvokeServer, wispRem, "Claim")
								pcall(wispRem.InvokeServer, wispRem, "Advance")
								local stg = type(wState) == "table" and tonumber(wState.Stage) or 1
								setWispText("Wisp Stage " .. tostring(stg or 1) .. " Active")
							end
						end
					end
					if banjoOn then
						local aimRem = networking:FindFirstChild("RE/BanjoCricket/Aim")
						local claimRem = networking:FindFirstChild("RF/BanjoCricket/AskClaim")
						if aimRem and aimRem:IsA("RemoteEvent") then
							for _, mush in ipairs(CollectionService:GetTagged("BanjoCricketMushroom")) do
								pcall(aimRem.FireServer, aimRem, mush)
							end
						end
						if claimRem and claimRem:IsA("RemoteFunction") then
							local okC, resC = pcall(claimRem.InvokeServer, claimRem)
							if okC and resC == true then
								setWispText("Done, Cricket's Banjo is yours!")
							end
						end
					end
					return false
				end)
			end
		end)

		do
			local n7 = 1
			local n8 = 1
			local value234 = nil
			local value235 = nil
			local flag308 = false
			local n9 = 0
			local n10 = 0
			local n11 = 0
			local value236 = nil
			local n12 = 0
			local str25 = ""
			local flag309 = false

			local function func253(childName9, flag310)
				local obj41 = networking:FindFirstChild(childName9)
				if not obj41 or not obj41:IsA("RemoteFunction") then
					return false, nil, nil
				end

				if flag310 == nil then
					return pcall(obj41.InvokeServer, obj41)
				end
				return pcall(obj41.InvokeServer, obj41, flag310)
			end

			local function func254()
				local save2 = tbl1.Save
				if type(save2) ~= "table" or type(save2.Get) ~= "function" then
					return nil
				end
				local ok, result = pcall(save2.Get)
				return ok and type(result) == "table" and result or nil
			end

			local function func255(param174)
				local directory = tbl1.Assets and tbl1.Assets.Directory
				local flag311 = type(directory) == "table" and directory[tostring(param174)] or nil
				return tostring(type(flag311) == "table" and flag311.DisplayName or param174)
			end

			local function func256(flag312)
				if not flag312 and type(value236) == "table" and os.clock() < n11 then
					return value236
				end
				n11 = os.clock() + n8
				local AskState, value237 = func253("RF/ScrambleTradeIn/AskState")

				if AskState and type(value237) == "table" then
					value236 = value237
					n12 = os.clock()
				end

				return value236
			end

			local function func257()
				local tbl194 = {}
				local eggState = tbl1.EggState

				if type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function" then
					local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)

					if ok and type(result) == "table" then
						for k, value238 in pairs(result) do
							if type(value238) == "table" and value238.Placement ~= nil then
								tbl194[k] = true
							end
						end
					end
				end

				return tbl194
			end

			local function func258(param175, param176)
				local requirements = type(param175) == "table" and param175.Requirements or nil
				if type(requirements) ~= "table" or #requirements == 0 then
					return nil, "No active recipe", {}
				end
				local result43 = func257()
				local tbl195 = {}
				local tbl196 = {}

				for _, requirement in ipairs(requirements) do
					tbl195[tostring(requirement)] = {}
				end

				local func259 = pairs
				local eggInventory = param176.EggInventory or {}

				for k, value239 in func259(eggInventory) do
					local flag313 = type(value239) == "table" and tostring(value239.AssetCategory) or nil
					local value240 = flag313 and tbl195[flag313] or nil

					if value240 then
						if result43[k] then
							tbl196[flag313] = true
						else
							local baseMutation2 = value239.BaseMutation ~= nil and value239.BaseMutation ~= "Normal" or type(value239.Mutations) == "table" and next(value239.Mutations) ~= nil
							table.insert(value240, { Uid = k, Scale = tonumber(value239.AssetScale) or 0, Mutated = baseMutation2 })
						end
					end
				end

				for _, value241 in pairs(tbl195) do
					table.sort(value241, function(param177, param178)
						if param177.Mutated ~= param178.Mutated then
							return param178.Mutated
						end
						return param177.Scale < param178.Scale
					end)
				end

				local tbl197 = {}
				local tbl198 = {}
				local tbl199 = {}
				local value242 = nil

				for i, requirement in ipairs(requirements) do
					local entry13 = tbl195[tostring(requirement)]
					local func260 = ipairs
					entry13 = entry13 or {}
					local value243 = nil

					for _, value244 in func260(entry13) do
						if not tbl198[value244.Uid] then
							value243 = value244
							break
						else
							value243 = nil
						end
					end

					if value243 then
						tbl198[value243.Uid] = true
						tbl199[i] = value243.Uid
						table.insert(tbl197, value243.Uid)
					elseif not value242 then
						if tbl196[tostring(requirement)] then
							value242 = "Need a " .. func255(requirement) .. " egg, yours is placed on a nest"
						else
							value242 = "Need a " .. func255(requirement) .. " egg"
						end
					end
				end

				if value242 then
					return nil, value242, tbl198, tbl199
				end
				return tbl197, nil, tbl198, tbl199
			end

			local tbl200 = {}

			local function func261()
				local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
				playerGui = playerGui and playerGui:FindFirstChild("DrScrambleTradeIn")
				local drScrambleTradeInMain = playerGui and playerGui:FindFirstChild("DrScrambleTradeInMain")
				playerGui = playerGui and playerGui:FindFirstChild("DrScrambleTradeInInventory", true)
				local sacrificeInputs = drScrambleTradeInMain and drScrambleTradeInMain:FindFirstChild("SacrificeInputs")
				if not drScrambleTradeInMain or not playerGui or not sacrificeInputs then
					return nil
				end
				return { Main = drScrambleTradeInMain, Inventory = playerGui, Inputs = sacrificeInputs }
			end

			local function func262(instance11)
				if typeof(instance11) ~= "Instance" or not instance11:IsA("GuiButton") then
					return false
				end
				local ok, result = pcall(getconnections, instance11.Activated)
				if not ok or type(result) ~= "table" or #result == 0 then
					return false
				end
				local flag314 = false

				for _, item84 in ipairs(result) do
					local ok2, result2 = pcall(function()
						return item84.Function
					end)

					ok2 = ok2 and type(result2) == "function"
					local value245 = nil

					if ok2 then
						local ok3, result3 = pcall(debug.getupvalues, result2)
						ok3 = ok3 and type(result3) == "table"
						value245 = nil

						if ok3 then
							value245 = nil

							for i = 1, #result3 do
								if type(result3[i]) == "function" then
									value245 = result3[i]
									break
								else
									value245 = nil
								end
							end
						end
					end

					if value245 then
						flag314 = pcall(value245) or flag314
					else
						flag314 = pcall(function()
							item84:Fire()
						end) or flag314
					end
				end

				return flag314
			end

			local function func263(instance12)
				instance12 = instance12 and instance12:FindFirstChild("Full")
				return instance12 ~= nil and instance12.Visible == true
			end

			local function func264(param179, flag315)
				for i = 1, flag315 do
					if not func263(param179.Inputs:FindFirstChild("Input" .. i)) then
						return false
					end
				end

				return flag315 > 0
			end

			local function func265(param180, tbl201)
				local result44 = func261()
				local requirements = type(param180) == "table" and param180.Requirements or nil
				if not result44 or type(requirements) ~= "table" then
					return false
				end

				for i = 1, #requirements do
					local obj42 = result44.Inputs:FindFirstChild("Input" .. i)
					local entry14 = tbl201[i]
					local flag316 = obj42 and entry14 and not func263(obj42)

					if flag316 then
						flag316 = (tbl200[entry14] or 0) <= os.clock()
					end

					if flag316 then
						local empty = obj42:FindFirstChild("Empty")

						if func262(empty and empty:FindFirstChild("Add")) then
							local scrollingFrame = result44.Inventory:FindFirstChild("ScrollingFrame")
							local n13 = 0
							local value246 = nil

							while n13 < 2 do
								value246 = scrollingFrame and scrollingFrame:FindFirstChild("Egg_" .. entry14)
								if not value246 then
									n13 += task.wait(0.1)
									continue
								end
								break
							end

							if value246 then
								func262(value246)
							end

							local n14 = 0

							while n14 < 2 and not func263(obj42) do
								n14 += task.wait(0.1)
							end

							if result44.Inventory.Visible then
								if not func262(result44.Inventory:FindFirstChild("Close")) then
									result44.Inventory.Visible = false
								end
							end
						end

						if not func263(obj42) then
							tbl200[entry14] = os.clock() + 30
						end
					end
				end

				return func264(result44, #requirements)
			end

			local function func266()
				local value247 = value236
				if type(value247) ~= "table" then
					return "Lab status unknown"
				end

				if value247.Unlocked ~= true then
					return "Lab is locked on this account"
				end
				local tbl202 = {}
				local func267 = ipairs
				local requirements = value247.Requirements or {}

				for _, requirement in func267(requirements) do
					table.insert(tbl202, func255(requirement))
				end

				local n13 = (tonumber(value247.SecondsUntilRotation) or 0) - os.clock() - n12

				if n13 < 0 then
					n13 = 0
				end

				local formatted12 = string.format("%s  -  needs %s  -  pity %s/%s  -  free rerolls %s  -  rotates in %d:%02d", tostring(value247.BannerDisplayName or value247.BannerId or "Lab"), #tbl202 > 0 and table.concat(tbl202, ", ") or "unknown", tostring(value247.PityCount or 0), tostring(value247.PityThreshold or 0), tostring(value247.FreeRefreshesRemaining or 0), math.floor(n13 / 60), math.floor(n13 % 60))
				local str26

				if str25 ~= "" then
					str26 = formatted12 .. "  -  " .. str25
				else
					str26 = formatted12
				end

				return str26
			end

			local function func268(flag317)
				local value248 = func256(true)
				if type(value248) ~= "table" or value248.Unlocked ~= true then
					return
				end

				if value248.PendingReward ~= nil and value248.PendingReward ~= false then
					local AskFinishReveal, flag318 = func253("RF/ScrambleTradeIn/AskFinishReveal")
					str25 = AskFinishReveal and flag318 ~= false and "Reward claimed" or "Reward claim failed"
					n11 = 0
					return
				end

				if not str1.Lab.BannerOk(value248.BannerId) then
					str1.Lab.Reserved = {}
					str25 = "Waiting for " .. str1.Lab.PickedText()
					return
				end

				local result45 = func254()
				if not result45 then
					return
				end
				local flag319, flag320, flag321, flag322 = func258(value248, result45)
				local flag323 = str1.Toggle(value234, false)
				str1.Lab.Reserved = flag323 and flag321 or {}
				flag323 = flag323 and flag317 == n9
				local flag324 = false

				if flag323 then
					local result
					flag324, result = pcall(func265, value248, flag322 or {})
					flag324 = flag324 and result == true
				end

				if not flag319 then
					str25 = flag320 or "Recipe not ready"
					local flag325 = flag317 == n9 and str1.Toggle(value235, false)
					local flag326

					if flag325 then
						flag326 = (tonumber(value248.FreeRefreshesRemaining) or 0) > 0
					else
						flag326 = flag325
					end

					if flag326 then
						local AskRefresh, flag327, flag328 = func253("RF/ScrambleTradeIn/AskRefresh")

						if AskRefresh and flag327 ~= false then
							str25 = "Recipe rerolled"
						else
							str25 = tostring(flag328 or "Reroll rejected")
						end

						n11 = 0
					end

					return
				end

				if not str1.Toggle(value234, false) then
					str25 = "Ready to trade in"
					return
				end

				if flag317 ~= n9 then
					return
				end

				if flag324 then
					local result46 = func261()

					if result46 and func262(result46.Main:FindFirstChild("Sacrifice", true)) then
						str25 = "Trade-in sent"
						n11 = 0
						return
					end
				end

				local AskTradeIn, flag329, flag330 = func253("RF/ScrambleTradeIn/AskTradeIn", flag319)

				if AskTradeIn and flag329 ~= false then
					str25 = "Trade-in sent"
				else
					str25 = tostring(flag330 or "Trade rejected")
				end

				n11 = 0
			end

			local flag331 = obj3:CreateText({ Name = "Lab Status", Text = "Loading Lab data..." })
			local tbl203 = {}
			local byName3 = {}

			for _, item85 in ipairs(str1.Lab.BannerList()) do
				table.insert(tbl203, item85.Name)
				byName3[item85.Name] = item85.Id
			end

			func6(obj3:CreateMultiDropdown({
				Name = "Lab Banners",
				Note = "Only trade and steal for these banners (empty = all)",
				Options = tbl203,
				Default = {},
				Callback = function(value)
					local banners = {}

					if type(value) == "table" then
						for k, value249 in pairs(value) do
							k = value249 == true and type(k) == "string" and k or type(value249) == "string" and value249 or nil

							if k and byName3[k] then
								banners[byName3[k]] = true
							end
						end
					end

					str1.Lab.Banners = banners
					str25 = ""
					n10 = 0
					n11 = 0
					str1.Rift.Next = 0

					if type(str1.Lab.ForceSteal) == "function" then
						pcall(str1.Lab.ForceSteal)
					end

					tbl2.Wake()
				end,
			}))

			value234 = obj3:CreateToggle({
				Name = "Auto Lab Trade-In",
				Default = false,
				Callback = function()
					if not str1.Toggle(value234, false) then
						str1.Lab.Reserved = {}
					end

					n9 += 1
					str25 = ""
					n10 = 0
					n11 = 0
					tbl2.Wake()
				end,
			})

			value235 = obj3:CreateToggle({
				Name = "Auto Reroll Lab Recipe",
				Default = false,
				Callback = function()
					n9 += 1
					str25 = ""
					n10 = 0
					n11 = 0
					tbl2.Wake()
				end,
			})

			str1.Lab.PlaceHandle = obj3:CreateToggle({
				Name = "Auto Place Lab Reward Eggs",
				Note = "Places the reward eggs from Lab trades",
				Default = false,
				Callback = function(value)
					if type(value) ~= "boolean" then
						value = str1.Toggle(str1.Lab.PlaceHandle, false)
					end

					str1.Lab.PlaceOn = value == true

					if type(str1.PlaceEggRefresh) == "function" then
						pcall(str1.PlaceEggRefresh)
					end

					tbl2.Wake()
				end,
			})

			tbl2.Add(function()
				local flag332 = str1.Toggle(value234, false)
				local value250 = str1.Toggle(value235, false)
				local n13 = (flag332 or value250) and 1 or 30
				local flag333 = not flag309

				if flag333 then
					flag333 = value236 == nil or n11 == 0 or os.clock() - n12 >= n13
				end

				if flag333 then
					flag309 = true

					task.spawn(function()
						pcall(func256, true)
						flag309 = false
					end)
				end

				if flag331 and type(flag331.Set) == "function" then
					pcall(flag331.Set, flag331, func266())
				end

				local flag334 = flag308

				if not flag308 then
					flag334 = not (flag332 or value250)
				end

				if flag334 or os.clock() < n10 then
					return false
				end
				flag308 = true
				n10 = os.clock() + n7
				local value251 = n9

				task.spawn(function()
					pcall(func268, value251)
					flag308 = false
					tbl2.Wake()
				end)

				return false
			end)
		end

		local n7
		n7 = 6
		local n8
		n8 = 1.5
		local n9
		n9 = 400
		local vector
		vector = Vector3.new(2120, -120, -355)
		local list36
		list36 = { "LostPart1", "LostPart2" }
		local tbl204

		tbl204 = {
			{ Label = "Scrambled Mutation", Id = "MutationConsumable" },
			{ Label = "2x Cash Booster", Id = "CashBooster" },
			{ Label = "1.25x Speed", Id = "SpeedBoost" },
			{ Label = "2x Treadmill Booster", Id = "TreadmillBooster" },
		}

		local list37
		list37 = {}

		for _, item86 in ipairs(tbl204) do
			list37[#list37 + 1] = item86.Label
		end

		local tbl205
		tbl205 = {}
		local tbl206
		tbl206 = {}
		local tbl207
		tbl207 = { Keep = 0, Handle = nil, Picked = { ["Scrambled Mutation"] = true } }
		local snapshot
		snapshot = nil
		local n10
		n10 = -math.huge
		local flag335
		flag335 = false
		local n11
		n11 = 0
		local n12
		n12 = 0
		local str27
		str27 = ""
		local str28
		str28 = ""
		local flag336
		flag336 = { Tool = nil, EquipAt = 0 }
		local n13
		n13 = 16
		local flag337
		flag337 = false
		local list38
		list38 = { Index = 1, Since = 0, Tool = nil }
		local flag338
		flag338 = { Latch = false, Ended = false }
		local flag339
		flag339 = false
		local n14
		n14 = 0
		local value252
		value252 = nil
		local func269

		local function func270()
			local packages = ReplicatedStorage:FindFirstChild("Packages")
			packages = packages and packages:FindFirstChild("Networking")
			packages = packages and packages:FindFirstChild("RF/Scramble/Request")
			if packages and packages:IsA("RemoteFunction") then
				return packages
			end
			return nil
		end

		func269 = function(payload, ...)
			local result47 = func270()
			if not result47 then
				return nil
			end
			local packed1 = table.pack(...)

			local ok, result = pcall(function()
				return result47:InvokeServer(payload, table.unpack(packed1, 1, packed1.n))
			end)

			if not ok or type(result) ~= "table" then
				return nil
			end

			if type(result.Snapshot) == "table" then
				snapshot = result.Snapshot
				n10 = os.clock()
			elseif payload == "Snapshot" and type(result.State) == "table" then
				snapshot = result
				n10 = os.clock()
			end

			return result
		end

		local func271

		func271 = function(flag340)
			if flag340 or snapshot == nil or os.clock() - n10 >= n7 then
				func269("Snapshot")
			end

			return snapshot
		end
		str1.ScrambleRequest = func269
		str1.ScrambleRead = func271

		local func272

		func272 = function()
			local value253 = snapshot
			return type(value253) == "table" and type(value253.State) == "table" and value253.State or nil
		end

		local func273

		func273 = function()
			local value254 = snapshot
			if type(value254) ~= "table" or value254.Enabled == false or type(value254.State) ~= "table" then
				return false
			end
			local eventEndsAt = tonumber(value254.EventEndsAt)
			return eventEndsAt == nil or workspace:GetServerTimeNow() < eventEndsAt
		end

		local func274

		func274 = function()
			local value255 = snapshot
			local window = type(value255) == "table" and value255.Window or nil
			if type(window) ~= "table" then
				return false, nil
			end
			local serverTimeNow = workspace:GetServerTimeNow()
			local startsAt = tonumber(window.StartsAt)
			local endsAt = tonumber(window.EndsAt)
			local active2 = window.Active == true

			if not active2 then
				active2 = startsAt and endsAt and serverTimeNow >= startsAt and serverTimeNow < endsAt
			end

			if active2 then
				return true, endsAt and math.max(0, endsAt - serverTimeNow) or nil
			end
			local nextAt = tonumber(window.NextAt)
			return false, nextAt and math.max(0, nextAt - serverTimeNow) or nil
		end

		local func275

		func275 = function(param181, param182)
			local lostParts = type(param181) == "table" and param181.LostParts or nil
			if type(lostParts) ~= "table" then
				return false
			end

			if lostParts[param182] then
				return true
			end

			for _, lostPart in pairs(lostParts) do
				if lostPart == param182 then
					return true
				end
			end

			return false
		end

		local func276

		func276 = function(param183)
			local n15 = 0

			for _, item87 in ipairs(list36) do
				if func275(param183, item87) then
					n15 += 1
				end
			end

			return n15
		end

		local func277

		local function func278(param184)
			local n15 = math.max(0, math.floor(tonumber(param184) or 0))
			if n15 >= 3600 then
				return string.format("%dh %dm", n15 // 3600, n15 % 3600 // 60)
			end
			return string.format("%dm %ds", n15 // 60, n15 % 60)
		end

		func277 = function()
			local result48 = func272()
			if not result48 then
				return "Dr Scramble event is not running"
			end

			if not func273() then
				return "Dr Scramble event has ended"
			end
			local value256, flag341 = func274()
			local flag342

			if value256 then
				flag342 = "Outbreak live " .. func278(flag341 or 0)
			else
				flag342 = value256
			end

			flag342 = flag342 or flag341 and "Outbreak in " .. func278(flag341) or "Outbreak soon"
			local completed = result48.Completed == true and "Vault claimed"

			if not completed then
				completed = string.format("Lost %d/2  Drone %d/3", func276(result48), math.min(3, tonumber(result48.DroneParts) or 0))
			end

			if value256 then
				local n15 = 0

				for _, value257 in pairs(tbl205) do
					if (tonumber(value257.Health) or 0) > 0 then
						n15 += 1
					end
				end

				flag342 ..= string.format("  %d drones", n15)
			end

			local formatted13 = string.format("Samples %d  -  %s  -  %s", tonumber(result48.Samples) or 0, completed, flag342)

			if str28 ~= "" and str1.Toggle(nil, false) then
				formatted13 ..= "  -  " .. str28
			end

			if str27 ~= "" then
				formatted13 ..= "  -  " .. str27
			end

			return formatted13
		end

		local func279

		func279 = function()
			return str1.Root()
		end

		local func280

		func280 = function(num85, callback11, flag343, flag344)
			local n15 = flag344 or 400
			local result49 = func279()
			if not result49 then
				return false
			end
			flag343 = flag343 or 1
			if (result49.Position - num85).Magnitude <= flag343 then
				return true
			end
			str1.Shield("scramble", true)
			local n16 = os.clock() + 6

			while not str1.Swapped() and os.clock() < n16 and not callback11() do
				str27 = "Waiting for the character to settle"
				RunService.Heartbeat:Wait()
			end

			local value258 = func279() or result49
			local character = localPlayer.Character
			str1.Driving = str1.Driving + 1
			local position = value258.Position
			local value259 = nil
			local n17 = (num85 - position).Magnitude / n15 + 3
			local n18 = 0

			local connection = RunService.Heartbeat:Connect(function(deltaTime)
				if value259 ~= nil or str1.AntiGuard.Busy then
					return
				end
				n18 += deltaTime
				local result50 = func279()
				if not result50 or callback11() or n18 > n17 or localPlayer.Character ~= character then
					value259 = false
					return
				end

				if (result50.Position - position).Magnitude > 8 then
					position = result50.Position
				end

				local n19 = num85 - position
				local n20 = n15 * deltaTime
				local flag345 = n19.Magnitude <= math.max(n20, flag343)
				position = flag345 and num85 or position + n19.Unit * n20
				local vector2 = Vector3.new(n19.X, 0, n19.Z)
				local cframe = vector2.Magnitude > 0.05 and CFrame.lookAt(Vector3.zero, vector2.Unit) or result50.CFrame.Rotation

				pcall(function()
					result50.CFrame = CFrame.new(position) * cframe
					result50.AssemblyLinearVelocity = Vector3.zero
					result50.AssemblyAngularVelocity = Vector3.zero
				end)

				if flag345 then
					value259 = true
				end
			end)

			while value259 == nil do
				RunService.Heartbeat:Wait()
			end

			connection:Disconnect()
			str1.Driving = math.max(0, str1.Driving - 1)
			str1.Shield("scramble", false)
			return value259
		end

		local func281

		func281 = function(instance13)
			if typeof(instance13) ~= "Instance" or not instance13:IsA("ProximityPrompt") then
				return false
			end

			local ok = pcall(function()
				instance13:InputHoldBegin()
				local n15 = tonumber(type(str1.PromptHold) == "function" and str1.PromptHold(instance13) or instance13.HoldDuration) or 0

				if n15 > 0 then
					task.wait(n15 + 0.2)
				end

				instance13:InputHoldEnd()
			end)

			if not ok and type(fireproximityprompt) == "function" then
				ok = pcall(fireproximityprompt, instance13)
			end

			return ok
		end

		local func282

		local function func283()
			local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
			world = world and world:FindFirstChild("SecretZones")
			return world and world:FindFirstChild("Cave") or nil
		end

		func282 = function(childName10)
			local teleporter = func283()
			teleporter = teleporter and teleporter:FindFirstChild("Teleporter")
			teleporter = teleporter and teleporter:FindFirstChild(childName10)
			teleporter = teleporter and teleporter:FindFirstChild("SecretZonePrompt", true)
			return teleporter and teleporter:IsA("ProximityPrompt") and teleporter or nil
		end

		local func284

		func284 = function(part15, param185)
			part15 = part15 and part15.Parent
			if part15 and part15:IsA("Attachment") then
				return part15.WorldPosition
			end

			if part15 and part15:IsA("BasePart") then
				return part15.Position
			end
			return param185
		end

		local func285

		func285 = function()
			local result51 = func279()
			if not result51 then
				return false
			end
			local position = result51.Position
			local vector2 = Vector3.new(position.X - vector.X, 0, position.Z - vector.Z)
			return position.Y < -60 and vector2.Magnitude < 160
		end

		local func286

		local function func287()
			local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
			world = world and world:FindFirstChild("Areas")
			world = world and world:FindFirstChild("SeparationLine")
			return world and world:IsA("BasePart") and world.Position.X or 552
		end

		func286 = function(part16)
			if not part16 then
				part16 = func279()
				part16 = part16 and part16.Position
			end

			return part16 ~= nil and part16.X < func287()
		end

		local connection = localPlayer.CharacterAdded:Connect(function()
			str1.ScrambleRespawned = true
			flag336.Tool = nil
			flag336.EquipAt = 0
		end)

		func4(function()
			pcall(function()
				connection:Disconnect()
			end)
		end)

		local func288

		func288 = function(callback12, flag346)
			if not func286() then
				str1.ScrambleRespawned = false
				return true
			end

			if flag346 and func286(flag346) then
				return true
			end

			local function func289()
				str27 = "Respawned, resting in the safe zone"
				local n15 = os.clock() + 0.75

				while os.clock() < n15 do
					if callback12() then
						return false
					end
					task.wait(0.1)
				end

				str1.ScrambleRespawned = false
				return true
			end

			local stealHome3 = type(str1.StealHome) == "function" and str1.StealHome() or nil
			if not stealHome3 then
				str1.ScrambleRespawned = false
				return true
			end
			local scrambleRespawned = str1.ScrambleRespawned == true

			if str1.DistanceTo(stealHome3) <= 12 then
				if scrambleRespawned then
					return (func289())
				end
				return true
			end

			str27 = scrambleRespawned and "Respawned, easing out through the safe zone" or "Leaving the base through the safe zone"
			local func290 = func280
			local num86 = func290(stealHome3 + Vector3.new(0, 3, 0), callback12, 3, scrambleRespawned and math.min(400, 300) or nil)
			if num86 and scrambleRespawned then
				return (func289())
			end
			return num86
		end

		local func291, func292

		do
			local function func293(param186, param187, param188)
				local result52 = func279()
				if not result52 then
					return false
				end
				str1.Shield("scramblefly", true)
				local position = result52.Position
				local flag347 = true

				if Vector3.new(param186.X - position.X, 0, param186.Z - position.Z).Magnitude > 250 then
					local n15 = math.max(position.Y, param186.Y, 98)
					flag347 = func280(Vector3.new(position.X, n15, position.Z), param187, 2) and func280(Vector3.new(param186.X, n15, param186.Z), param187, 2)
				end

				flag347 = flag347 and func280(param186, param187, math.min(param188, 2))
				str1.Shield("scramblefly", false)
				return flag347
			end

			local function func294()
				local stealHome4 = type(str1.StealHome) == "function" and str1.StealHome() or nil
				return stealHome4 and stealHome4 + Vector3.new(0, 3, 0) or nil
			end

			func291 = function(num87, param189, flag348)
				local n15 = flag348 or 6
				if str1.DistanceTo(num87) <= n15 then
					return true
				end
				local result53 = func286()
				local flag349 = func286(num87)

				if result53 and not flag349 then
					if not func288(param189, num87) then
						return false
					end
				elseif flag349 and not result53 then
					local result54 = func294()

					if result54 and (result54 - num87).Magnitude > 12 and str1.DistanceTo(result54) > 12 then
						str27 = "Coming back through the safe zone"
						if not func293(result54, param189, 3) then
							return false
						end
					end
				end

				return func293(num87, param189, n15)
			end

			func292 = function(callback13)
				if func286() or callback13() or str1.IsNight() or str1.WallSealed() then
					return
				end
				local result55 = func294()

				if result55 then
					str27 = "Coming back through the safe zone"
					func291(result55, callback13, 4)
				end
			end
		end

		local func295, func296, func297

		do
			local function func298(callback14)
				if func285() then
					return true
				end
				local Entry = func282("Entry")
				local num88 = func284(Entry, Vector3.new(2125.7, 73.1, -295.4))
				str27 = "Flying to the Secret Cave"
				if not func291(num88, callback14, 6) then
					return false
				end

				for i = 1, 4 do
					if callback14() then
						return false
					end
					str27 = "Entering the Secret Cave"
					func281(Entry or func282("Entry"))
					local n15 = os.clock() + 1.5

					while os.clock() < n15 and not func285() do
						RunService.Heartbeat:Wait()
					end

					if func285() then
						return true
					end
				end

				str27 = "Cave door missed, flying in"
				local quest = type(snapshot) == "table" and snapshot.Quest or nil
				local position = type(quest) == "table" and type(quest.EscapedExperiment) == "table" and quest.EscapedExperiment.Position or nil

				if typeof(position) == "Vector3" then
					pcall(str1.FlyTo, position, callback14, "scramble")
				end

				return func285()
			end

			local function func299(childName11)
				local quest = type(snapshot) == "table" and snapshot.Quest or nil
				local flag350 = type(quest) == "table" and quest[childName11] or nil
				local position = type(flag350) == "table" and flag350.Position or nil
				if typeof(position) == "Vector3" then
					return position
				end
				local drScrambleEvent = workspace:FindFirstChild("DrScrambleEvent")
				drScrambleEvent = drScrambleEvent and drScrambleEvent:FindFirstChild(childName11)
				if drScrambleEvent and drScrambleEvent:IsA("Model") then
					return drScrambleEvent:GetPivot().Position
				end
				return nil
			end

			local function func300(param190)
				local value260 = snapshot
				local interactions = type(value260) == "table" and value260.Interactions or nil
				return math.max(4, (type(interactions) == "table" and tonumber(interactions[param190]) or 12) - 4)
			end

			func295 = function(param191)
				local result56 = func272()
				if not result56 or result56.Discovered == true then
					return true
				end
				local EscapedExperiment = func299("EscapedExperiment")
				if not EscapedExperiment or not func298(param191) then
					return false
				end
				str27 = "Talking to the Escaped Experiment"
				if not func280(EscapedExperiment, param191, func300("NpcRadius")) then
					return false
				end
				local Discover = func269("Discover")
				func271(true)
				return Discover ~= nil and func272() ~= nil and func272().Discovered == true
			end

			func296 = function(callback15)
				local result57 = func272()
				local flag351 = not result57 or result57.Completed == true

				if not flag351 then
					local n15 = #list36
					flag351 = func276(result57) >= n15
				end

				if flag351 then
					return
				end

				if result57.Discovered ~= true and not func295(callback15) then
					return
				end

				for _, item88 in ipairs(list36) do
					if callback15() then
						return
					end

					if not func275(func272(), item88) then
						local drScrambleEvent = workspace:FindFirstChild("DrScrambleEvent")
						drScrambleEvent = drScrambleEvent and drScrambleEvent:FindFirstChild(item88)
						drScrambleEvent = drScrambleEvent and drScrambleEvent:FindFirstChild("Hitbox", true)
						local claimLostPart = drScrambleEvent and drScrambleEvent:FindFirstChild("ClaimLostPart", true)
						local position = drScrambleEvent and drScrambleEvent:IsA("BasePart") and drScrambleEvent.Position or func299(item88)

						if position then
							str27 = "Flying to " .. (item88 == "LostPart1" and "Lost Part 1" or "Lost Part 2")

							if func291(position + Vector3.new(0, 2, 0), callback15, 3) then
								str27 = "Collecting the lost part"
								local n15 = position + Vector3.new(0, 2.5, 0)
								local character = localPlayer.Character
								str1.Shield("scramble", true)
								str1.Driving = str1.Driving + 1

								local connection2 = RunService.Heartbeat:Connect(function()
									local flag352 = str1.Root()
									if not flag352 or flag352.Parent ~= character or str1.AntiGuard.Busy or str1.Movement.Owner ~= "scramble" then
										return
									end

									pcall(function()
										local rotation = flag352.CFrame.Rotation
										flag352.CFrame = CFrame.new(n15) * rotation
										flag352.AssemblyLinearVelocity = Vector3.zero
										flag352.AssemblyAngularVelocity = Vector3.zero
									end)
								end)

								for i = 1, 4 do
									if not callback15() then
										claimLostPart = claimLostPart or drScrambleEvent and drScrambleEvent:FindFirstChild("ClaimLostPart", true)
										func281(claimLostPart)
										task.wait(0.6)
										func271(true)
										if not func275(func272(), item88) then
											continue
										end
									end

									break
								end

								connection2:Disconnect()
								str1.Driving = math.max(0, str1.Driving - 1)
								str1.Shield("scramble", false)
								if callback15() then
									return
								end
								continue
							end
						end
					end
				end
			end

			func297 = function(param192)
				local result58 = func272()
				if not result58 or result58.Completed == true then
					return
				end
				local totalParts = tonumber(result58.TotalParts)

				if not totalParts then
					totalParts = func276(result58) + (tonumber(result58.DroneParts) or 0)
				end

				if totalParts < 5 then
					return
				end
				local ExperimentVault = func299("ExperimentVault")
				if not ExperimentVault or not func298(param192) then
					return
				end
				str27 = "Opening the Experiment Vault"
				if not func280(ExperimentVault, param192, func300("VaultRadius")) then
					return
				end
				func269("Vault")
				func271(true)
				local result59 = func272()

				if result59 and result59.Completed == true then
					str27 = "Vault opened, The Scrambler unlocked"
				end
			end
		end

		local func301

		func301 = function()
			local function func302(instance14)
				if not instance14 or not instance14:IsA("Tool") then
					return false
				end

				if tostring(instance14:GetAttribute("ItemType")) ~= "MutationConsumable" then
					return false
				end
				local attribute = instance14:GetAttribute("MutationId") or instance14:GetAttribute("MutationTemplate")
				if attribute ~= nil then
					return tostring(attribute) == "Scrambled"
				end
				return string.find(string.lower(instance14.Name), "scrambled", 1, true) ~= nil
			end

			local character = localPlayer.Character

			if character then
				for _, child in ipairs(character:GetChildren()) do
					if func302(child) then
						return child, true
					end
				end
			end

			local backpack = localPlayer:FindFirstChildOfClass("Backpack")

			if backpack then
				for _, child in ipairs(backpack:GetChildren()) do
					if func302(child) then
						return child, false
					end
				end
			end

			return nil, false
		end

		local func303

		func303 = function(param193, param194)
			local shopPurchases = type(param193) == "table" and param193.ShopPurchases or nil
			local flag353 = type(shopPurchases) == "table" and shopPurchases[param194.Id] or nil
			if type(flag353) ~= "table" then
				return 0
			end
			local shopPeriod = type(snapshot) == "table" and snapshot.ShopPeriod or nil
			if flag353.Period ~= nil and shopPeriod ~= nil and flag353.Period ~= shopPeriod then
				return 0
			end
			return tonumber(flag353.Count) or 0
		end

		local func304

		func304 = function(callback16)
			local value261 = func271(true)
			if type(value261) ~= "table" or type(value261.Shop) ~= "table" then
				return
			end

			for _, item89 in ipairs(tbl204) do
				if callback16() then
					return
				end

				if tbl207.Picked[item89.Label] == true then
					for i = 1, 10 do
						local value262 = snapshot
						local result60 = func272()
						local value263, value264, value265 = ipairs(type(value262) == "table" and value262.Shop or {})
						local value266 = nil

						for _, value267 in value263, value264, value265 do
							if type(value267) == "table" and value267.Id == item89.Id then
								value266 = value267
							end
						end

						if not (not value266 or not result60 or callback16()) then
							local purchaseLimit = tonumber(value266.PurchaseLimit)

							if not (purchaseLimit and func303(result60, value266) >= purchaseLimit) then
								if not ((tonumber(result60.Samples) or 0) - (tonumber(value266.Price) or math.huge) < tbl207.Keep) then
									local Shop = func269("Shop", value266.Id, { Quote = value266.Quote, Sequence = tonumber(result60.ShopSequence) or 0 })

									if not (type(Shop) ~= "table" or Shop.Ok ~= true) then
										str27 = "Bought " .. item89.Label
										task.wait(0.4)
										continue
									end
								end
							end
						end

						break
					end
				end
			end
		end

		local n15, n16, n17, tbl208, tbl209, flag354, n18, n19, n20, n21
		local func305, func306, func307, func308, func309, value268, func310, func311, func312, func313

		do
			local n22
			n22 = 98
			n15 = 12
			n16 = 20
			n17 = 3

			tbl208 = {
				Vector3.new(2000, 90, -360),
				Vector3.new(2700, 90, -370),
				Vector3.new(3400, 90, -365),
				Vector3.new(4100, 90, -360),
				Vector3.new(4800, 90, -370),
				Vector3.new(5500, 90, -360),
				Vector3.new(5900, 90, -365),
			}

			tbl209 = {}
			local num89
			num89 = { Link = nil, Goal = nil, Look = nil, Character = nil }
			local func314

			do
				local userId = localPlayer.UserId
				local list39 = {}

				for _, item90 in ipairs({
					{ Label = "Scrap Drone", Tier = "ScrapDrone" },
					{ Label = "Reactor Drone", Tier = "ReactorDrone" },
					{ Label = "Augmented Drone", Tier = "AugmentedDrone" },
				}) do
					list39[#list39 + 1] = item90.Label
				end

				local tbl210 = { ScrapDrone = true, ReactorDrone = true, AugmentedDrone = true }
				local value269 = ({ "Nearest", "Rare First", "Most HP First" })[1]
				flag354 = ({ "Tween", "Teleport" })[1]
				n18 = 110
				n19 = 1.5
				n20 = 0
				n21 = -math.huge

				local function func315(param195)
					local flag355 = type(param195) == "table" and tonumber(param195.OwnerUserId) or nil
					return flag355 == nil or flag355 == userId
				end

				local function func316(part17)
					if typeof(part17) == "CFrame" then
						return part17.Position
					end

					if typeof(part17) == "Vector3" then
						return part17
					end
					return nil
				end

				local function func317(childName12, param196)
					local obj43 = networking:FindFirstChild(childName12)
					if not obj43 or not obj43:IsA("RemoteEvent") then
						return
					end

					local connection2 = obj43.OnClientEvent:Connect(function(...)
						pcall(param196, ...)
					end)

					func4(function()
						pcall(function()
							connection2:Disconnect()
						end)
					end)
				end

				func317("RE/Scramble/Drones", function(param197)
					if type(param197) ~= "table" then
						return
					end
					local func318 = pairs
					local upserts = type(param197.Upserts) == "table" and param197.Upserts or {}

					for _, upsert in func318(upserts) do
						if type(upsert) == "table" and upsert.Id ~= nil and func315(upsert) then
							local id = tostring(upsert.Id)
							local attributes = type(upsert.Attributes) == "table" and upsert.Attributes or {}
							local tbl211 = tbl205[id] or {}
							tbl211.Id = id
							tbl211.Position = func316(upsert.CFrame) or tbl211.Position
							tbl211.Health = tonumber(upsert.Health) or tbl211.Health or 1
							tbl211.Tier = tostring(attributes.ScrambleTier or tbl211.Tier or "")
							tbl211.Area = tostring(attributes.ScrambleArea or tbl211.Area or "")
							tbl211.Seen = os.clock()
							tbl205[id] = tbl211
						end
					end

					local func319 = pairs
					local removed = type(param197.Removed) == "table" and param197.Removed or {}

					for k, value270 in func319(removed) do
						local tbl212 = tbl205
						local func320 = tostring
						value270 = type(value270) == "string" and value270
						tbl212[func320(value270 or k)] = nil
					end
				end)

				func317("RE/Scramble/Effect", function(flag356, param198, param199)
					if flag356 ~= "Hit" or type(param199) ~= "table" or param199.DroneId == nil then
						return
					end
					local entry15 = tbl205[tostring(param199.DroneId)]
					if not entry15 then
						return
					end
					entry15.Position = func316(param198) or entry15.Position
					entry15.Health = (tonumber(entry15.Health) or 1) - (tonumber(param199.Amount) or 1)

					if type(param199.Motion) == "string" and string.find(param199.Motion, "\"Death\"", 1, true) then
						entry15.Health = 0
					end

					if entry15.Health <= 0 then
						tbl205[entry15.Id] = nil
					end
				end)

				func317("RE/Scramble/Drops", function(flag357)
					local func321 = pairs
					flag357 = type(flag357) == "table" and flag357 or {}

					for _, value271 in func321(flag357) do
						if type(value271) == "table" and value271.Id ~= nil and func315(value271) then
							local position5 = func316(value271.Position) or func316(value271.Origin)

							if position5 then
								tbl206[tostring(value271.Id)] = {
									Position = position5,
									Radius = tonumber(value271.Radius) or 6,
									ExpiresAt = tonumber(value271.ExpiresAt),
									Kind = value271.Kind,
								}
							end
						end
					end
				end)

				func317("RE/Scramble/State", function(list40)
					if type(list40) ~= "table" then
						return
					end

					if list40.Patch == true and type(snapshot) == "table" then
						for k, value272 in pairs(list40) do
							if k ~= "Patch" then
								snapshot[k] = value272
							end
						end
					elseif type(list40.State) == "table" then
						snapshot = list40
					end

					n10 = os.clock()
				end)

				func317("RE/Scramble/RemoveDrops", function(flag358)
					local func322 = pairs
					flag358 = type(flag358) == "table" and flag358 or {}

					for k, value273 in func322(flag358) do
						local tbl213 = tbl206
						local func323 = tostring
						value273 = type(value273) == "string" and value273
						k = value273 or k
						tbl213[func323(k)] = nil
					end
				end)

				func305 = function(str29)
					local scrambleLocalVisuals = workspace:FindFirstChild("ScrambleLocalVisuals")
					return scrambleLocalVisuals and scrambleLocalVisuals:FindFirstChild("PersonalDrone_" .. str29) or nil
				end

				local value274 = nil
				local n23 = 0
				local gcDroneTries = 0

				local function func324()
					if value274 ~= nil then
						return value274
					end
					if gcDroneTries >= 2 or os.clock() < n23 or type(getgc) ~= "function" or not func274() then
						return nil
					end
					gcDroneTries += 1
					n23 = os.clock() + 45

					for _, item91 in ipairs(getgc(false)) do
						if type(item91) == "function" and islclosure(item91) then
							local ok, result = pcall(debug.info, item91, "s")

							if ok and type(result) == "string" and string.find(result, "PersonalDrones", 1, true) then
								local ok2, result2 = pcall(debug.getupvalues, item91)

								if ok2 and type(result2) == "table" then
									for _, value275 in pairs(result2) do
										if type(value275) == "table" then
											local key, value276 = next(value275)
											if type(value276) == "table" and value276.OwnerUserId ~= nil and value276.CFrame ~= nil then
												value274 = value275
												return value275
											end
										end
									end

									continue
								end
							end
						end
					end

					return nil
				end

				local function func325()
					local result61 = func324()
					if not result61 then
						return
					end

					for k, value277 in pairs(result61) do
						if type(value277) == "table" and func315(value277) then
							local str30 = tostring(value277.Id or k)
							local attributes = type(value277.Attributes) == "table" and value277.Attributes or {}
							local entry16 = tbl205[str30]
							local health = tonumber(value277.Health)

							if not entry16 then
								entry16 = { Id = str30 }
								health = health or 1
								entry16.Health = health
								tbl205[str30] = entry16
							elseif health then
								entry16.Health = math.min(health, tonumber(entry16.Health) or health)
							end

							entry16.Position = func316(value277.CFrame) or entry16.Position
							entry16.Tier = tostring(attributes.ScrambleTier or entry16.Tier or "")
							entry16.Area = tostring(attributes.ScrambleArea or entry16.Area or "")

							if attributes.DroneState == "Death" then
								entry16.Health = 0
							end
						end
					end

					for k in pairs(tbl205) do
						if result61[k] == nil then
							tbl205[k] = nil
						end
					end
				end

				func306 = function()
					pcall(func325)
					local scrambleLocalVisuals = workspace:FindFirstChild("ScrambleLocalVisuals")
					if not scrambleLocalVisuals then
						return
					end

					for _, child in ipairs(scrambleLocalVisuals:GetChildren()) do
						local attribute = child:GetAttribute("ScrambleDroneId")

						if child:IsA("Model") and attribute ~= nil and string.sub(child.Name, 1, 14) == "PersonalDrone_" then
							local str31 = tostring(attribute)

							if child:GetAttribute("DroneState") == "Death" then
								tbl205[str31] = nil
							elseif not tbl205[str31] then
								local ok, result = pcall(child.GetPivot, child)

								tbl205[str31] = {
									Id = str31,
									Position = ok and result.Position or nil,
									Health = tonumber(child:GetAttribute("Health")) or 1,
									Tier = tostring(child:GetAttribute("ScrambleTier") or ""),
									Area = tostring(child:GetAttribute("ScrambleArea") or ""),
									Seen = os.clock(),
								}
							end
						end
					end
				end

				func307 = function(part18)
					local id2 = func305(part18.Id)
					local hitbox = id2 and id2:FindFirstChild("Hitbox")
					if hitbox and hitbox:IsA("BasePart") then
						return hitbox.Position
					end

					if id2 and id2.PrimaryPart then
						return id2.PrimaryPart.Position
					end
					return part18.Position
				end

				func308 = function()
					local list41 = {}
					local now = os.clock()

					for k, value278 in pairs(tbl205) do
						local tier = value278.Tier == nil or value278.Tier == "" or tbl210[value278.Tier] == true

						if tier then
							tier = (tonumber(value278.Health) or 0) > 0
						end

						tier = tier and value278.Position

						if tier then
							tier = (tbl209[k] or 0) <= now
						end

						if tier then
							list41[#list41 + 1] = value278
						end
					end

					return list41
				end

				func314 = function()
					local result62 = func279()
					if not result62 then
						return nil
					end
					local huge = math.huge
					local value279 = nil

					for _, item92 in ipairs(func308()) do
						local magnitude = ((func307(item92) or item92.Position) - result62.Position).Magnitude
						local flag359 = value269
						local n24

						if flag359 == "Rare First" then
							if item92.Tier == "AugmentedDrone" then
								n24 = magnitude - 200000
							elseif item92.Tier ~= "ReactorDrone" then
								n24 = magnitude
							else
								n24 = magnitude - 100000
							end
						elseif flag359 == "Most HP First" then
							n24 = magnitude - (tonumber(item92.Health) or 0) * 100000
						else
							n24 = magnitude
						end

						if n24 < huge then
							huge = n24
							value279 = item92
						end
					end

					return value279
				end
			end

			local func326

			func326 = function()
				local result63 = func279()
				if not result63 then
					return nil, nil
				end
				local serverTimeNow = workspace:GetServerTimeNow()
				local huge = math.huge
				local value280 = nil
				local value281 = nil

				for k, value282 in pairs(tbl206) do
					if value282.ExpiresAt and value282.ExpiresAt < serverTimeNow then
						tbl206[k] = nil
					else
						local magnitude = (value282.Position - result63.Position).Magnitude

						if value282.Kind == "Part" then
							magnitude -= 100000
						end

						if magnitude < huge then
							huge = magnitude
							value280 = k
							value281 = value282
						end
					end
				end

				return value280, value281
			end

			func309 = function()
				if not num89.Link then
					if num89.SwapWait then
						num89.SwapWait = nil
						str1.Shield("scramble", false)
					end

					return
				end

				num89.Link:Disconnect()
				local value283 = num89
				local value284 = num89
				local value285 = num89
				num89.Link = nil
				value283.Goal = nil
				value284.Look = nil
				value285.Character = nil
				local value286 = num89
				local value287 = num89
				local value288 = num89
				local value289 = num89
				num89.Track = nil
				value286.Dir = nil
				value287.Last = nil
				value288.LastAt = nil
				value289.Vel = nil
				str1.Driving = math.max(0, str1.Driving - 1)
				str1.Shield("scramble", false)
			end

			func4(func309)
			local func327

			func327 = function(goal, look, track)
				if track ~= num89.Track then
					local value290 = num89
					local value291 = num89
					num89.Last = nil
					value290.LastAt = nil
					value291.Vel = nil
				end

				local value292 = num89
				local value293 = num89
				num89.Goal = goal
				value292.Look = look
				value293.Track = track
				local character = localPlayer.Character

				if num89.Link and num89.Character ~= character then
					func309()
					local value294 = num89
					local value295 = num89
					num89.Goal = goal
					value294.Look = look
					value295.Track = track
				end

				if num89.Link or not character then
					return
				end

				if not str1.Swapped() then
					str1.Shield("scramble", true)
					num89.SwapWait = num89.SwapWait or os.clock() + 6
					local swapWait = num89.SwapWait
					if os.clock() < swapWait then
						str27 = "Waiting for the character to settle"
						return
					end
				end

				if num89.SwapWait then
					num89.SwapWait = nil
				else
					str1.Shield("scramble", true)
				end

				num89.Character = character
				str1.Driving = str1.Driving + 1

				num89.Link = RunService.Heartbeat:Connect(function(deltaTime)
					local flag360 = str1.Root()
					local goal2 = num89.Goal
					if not flag360 or not goal2 or flag360.Parent ~= num89.Character or str1.AntiGuard.Busy or str1.Movement.Owner ~= "scramble" then
						return
					end
					local position = flag360.Position

					if num89.Track then
						local ok, last = pcall(num89.Track)

						if ok and typeof(last) == "Vector3" then
							local now = os.clock()

							if not num89.Last or not num89.LastAt then
								local value296 = num89
								num89.Last = last
								value296.LastAt = now
							elseif (last - num89.Last).Magnitude > 0.01 then
								local n23 = math.max(now - num89.LastAt, 0.0041666666666666666)
								local n24 = (last - num89.Last) / n23

								if n24.Magnitude < 400 then
									local n25 = math.clamp(n23 * 12, 0.2, 0.8)
									num89.Vel = num89.Vel and num89.Vel:Lerp(n24, n25) or n24
								end

								local value297 = num89
								num89.Last = last
								value297.LastAt = now
							elseif now - num89.LastAt > 0.25 and num89.Vel then
								num89.Vel = num89.Vel:Lerp(Vector3.zero, math.clamp(deltaTime * 6, 0, 1))
							end

							local vel = num89.Vel or Vector3.zero
							local look2 = num89.Last + vel * (math.clamp(now - num89.LastAt, 0, 0.25) + 0.1)
							local vector2 = Vector3.new(position.X - look2.X, 0, position.Z - look2.Z)

							if vector2.Magnitude > 0.5 then
								local unit = vector2.Unit
								local n23 = math.clamp(deltaTime * 5, 0, 1)
								local dir = num89.Dir and num89.Dir:Lerp(unit, n23) or unit
								num89.Dir = dir.Magnitude > 0.01 and dir.Unit or unit
							end

							goal2 = look2 + (num89.Dir or Vector3.new(0, 0, 1)) * n13 + Vector3.new(0, -1, 0)
							local value298 = num89
							num89.Goal = goal2
							value298.Look = look2

							if (goal2 - position).Magnitude <= 40 then
								local n23 = math.max(deltaTime, 0.0041666666666666666)
								local n24 = vel + (goal2 - position) / math.max(0.1, n23)
								local n25 = math.max(400, vel.Magnitude + 80)

								if n25 < n24.Magnitude then
									n24 = n24.Unit * n25
								end

								local assemblyLinearVelocity = n24 + Vector3.new(0, workspace.Gravity * n23 * 0.5, 0)
								local vector3 = Vector3.new(look2.X - position.X, 0, look2.Z - position.Z)

								pcall(function()
									if vector3.Magnitude > 0.05 then
										flag360.CFrame = CFrame.lookAt(position, position + vector3.Unit)
									end

									flag360.AssemblyLinearVelocity = assemblyLinearVelocity
									flag360.AssemblyAngularVelocity = Vector3.zero
								end)

								return
							end
						end
					end

					local vector2

					if not (Vector3.new(goal2.X - position.X, 0, goal2.Z - position.Z).Magnitude > 250) then
						vector2 = goal2
					else
						local n23 = math.max(n22, goal2.Y)
						vector2 = position.Y < n23 - 2 and Vector3.new(position.X, n23, position.Z) or Vector3.new(goal2.X, n23, goal2.Z)
					end

					local n23 = vector2 - position
					local n24 = n9 * deltaTime
					local n25 = n23.Magnitude <= n24 and vector2 or position + n23.Unit * n24
					local look2 = num89.Look or goal2
					local vector3 = Vector3.new(look2.X - n25.X, 0, look2.Z - n25.Z)
					local cframe = vector3.Magnitude > 0.05 and CFrame.lookAt(Vector3.zero, vector3.Unit) or flag360.CFrame.Rotation

					pcall(function()
						flag360.CFrame = CFrame.new(n25) * cframe
						flag360.AssemblyLinearVelocity = Vector3.zero
						flag360.AssemblyAngularVelocity = Vector3.zero
					end)
				end)
			end

			do
				local function func328(instance15)
					if typeof(instance15) ~= "Instance" or not instance15:IsA("Tool") then
						return false
					end
					local attribute = instance15:GetAttribute("GearName")
					local gears = tbl1.Gears
					local directory = type(gears) == "table" and gears.Directory or nil
					local flag361 = type(attribute) == "string" and type(directory) == "table" and directory[attribute] or nil
					local flag362 = type(flag361) == "table"
					local flag363

					if flag362 then
						flag363 = flag361.ToolController == "Slap" or flag361.SlapPower ~= nil
					else
						flag363 = flag362
					end

					return flag363
				end

				local function func329(instance16)
					if typeof(instance16) ~= "Instance" or not instance16:IsA("Tool") then
						return false
					end

					if tostring(instance16:GetAttribute("ItemType")) ~= "Gear" then
						return false
					end
					local str32 = tostring(instance16:GetAttribute("GearName") or "")
					if str32 == "" then
						return false
					end
					return string.find(string.lower(str32), "scrambler", 1, true) ~= nil
				end

				local function func330()
					return localPlayer.Character, localPlayer:FindFirstChildOfClass("Backpack")
				end

				local function func331()
					local value299 = str1.FindBat()
					if value299 then
						return value299
					end
					local value300, value301 = func330()

					for _, item93 in ipairs({ value300, value301 }) do
						if item93 then
							for _, child in ipairs(item93:GetChildren()) do
								if func328(child) or func329(child) then
									return child
								end
							end
						end
					end

					return nil
				end

				flag336.Valid = function(instance17)
					if typeof(instance17) ~= "Instance" or not instance17:IsA("Tool") then
						return false
					end
					return str1.IsBatTool(instance17) or func328(instance17) or func329(instance17)
				end

				flag336.Owned = function(obj)
					if typeof(obj) ~= "Instance" or not obj:IsA("Tool") then
						return false
					end
					local flag364, value302 = func330()
					local parent = obj.Parent
					return parent ~= nil and (parent == flag364 or parent == value302)
				end

				flag336.Name = function(obj)
					if func329(obj) then
						return "The Scrambler"
					end
					return tostring(obj:GetAttribute("GearName") or obj.Name)
				end

				flag336.Put = function(obj, obj44, parent)
					local equipAt = flag336.EquipAt
					if os.clock() - equipAt < 0.4 then
						return false
					end
					flag336.EquipAt = os.clock()

					pcall(function()
						obj44:EquipTool(obj)
					end)

					if obj.Parent ~= parent then
						pcall(function()
							obj.Parent = parent
						end)
					end

					return obj.Parent == parent
				end

				local function func332()
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
					if not character or not humanoid or humanoid.Health <= 0 then
						return nil, false
					end
					local tool = character:FindFirstChildWhichIsA("Tool")

					if tool ~= nil and flag336.Valid(tool) then
						flag336.Tool = tool
						str28 = flag336.Name(tool)
						return tool, true
					end

					if not flag336.Owned(flag336.Tool) then
						flag336.Tool = func331()
					end

					local tool2 = flag336.Tool
					if not tool2 then
						str28 = ""
						return nil, false
					end
					str28 = flag336.Name(tool2)
					flag336.Put(tool2, humanoid, character)
					return tool2, tool2.Parent == character
				end

				local function func333()
					local obj45, value303 = func332()

					if obj45 and value303 then
						if flag337 then
							pcall(function()
								obj45:Activate()
							end)

							task.defer(function()
								pcall(function()
									obj45:Deactivate()
								end)
							end)
						else
							pcall(function()
								obj45:Deactivate()
								obj45:Activate()
							end)
						end
					end

					return obj45 ~= nil
				end

				local function func334()
					local value304, value305 = func330()
					local value306 = nil
					local value307 = nil
					local value308 = nil

					for _, item94 in ipairs({ value304, value305 }) do
						if item94 then
							for _, child in ipairs(item94:GetChildren()) do
								if flag336.Valid(child) then
									if func329(child) then
										value306 = value306 or child
									elseif str1.IsBatTool(child) and (value307 == nil or not str1.IsBatTool(value307)) then
										if value308 then
											value307 = child
										else
											value308 = value307
											value307 = child
										end
									elseif value307 == nil then
										value307 = child
									elseif value308 == nil then
										value308 = child
									end
								end
							end
						end
					end

					return value307, value306 or value308
				end

				local function func335(obj46)
					pcall(function()
						obj46:Activate()
					end)

					task.defer(function()
						pcall(function()
							obj46:Deactivate()
						end)
					end)
				end

				list38.SpamUntil = 0
				list38.List = {}
				list38.Dirty = true
				list38.BuiltAt = 0
				list38.NextBag = 0
				list38.Links = {}

				list38.Click = function(obj)
					pcall(obj.Deactivate, obj)
					pcall(obj.Activate, obj)
				end

				list38.Rebuild = function()
					list38.Dirty = false
					list38.BuiltAt = os.clock()
					table.clear(list38.List)
					local value309, value310 = func330()

					for _, item95 in ipairs({ value309, value310 }) do
						if item95 then
							for _, child in ipairs(item95:GetChildren()) do
								if flag336.Valid(child) then
									list38.List[#list38.List + 1] = child
								end
							end
						end
					end
				end

				list38.Beat = RunService.Heartbeat:Connect(function()
					local now = os.clock()
					if now >= list38.SpamUntil then
						return
					end

					if list38.Dirty or now - list38.BuiltAt > 1 then
						list38.Rebuild()
					end

					local character = localPlayer.Character
					local flag365 = now >= list38.NextBag

					if flag365 then
						list38.NextBag = now + 0.25
					end

					for _, item96 in ipairs(list38.List) do
						local parent = item96.Parent

						if parent == character then
							list38.Click(item96)
						elseif flag365 and parent ~= nil then
							list38.Click(item96)
						end
					end
				end)

				list38.Unwatch = function()
					for i = #list38.Links, 1, -1 do
						pcall(function()
							list38.Links[i]:Disconnect()
						end)

						list38.Links[i] = nil
					end
				end

				list38.Watch = function(obj)
					list38.Unwatch()
					list38.Dirty = true
					if not obj then
						return
					end


					list38.Links[#list38.Links + 1] = obj.ChildAdded:Connect(function(child)
						if not child:IsA("Tool") then
							return
						end
						list38.Dirty = true
						local spamUntil = list38.SpamUntil

						if os.clock() < spamUntil and flag336.Valid(child) then
							list38.Click(child)
							task.defer(list38.Click, child)
						end
					end)

					list38.Links[#list38.Links + 1] = obj.ChildRemoved:Connect(function(child)
						if child:IsA("Tool") then
							list38.Dirty = true
						end
					end)

					task.defer(function()
						local backpack = localPlayer:FindFirstChildOfClass("Backpack") or localPlayer:WaitForChild("Backpack", 5)

						if backpack and localPlayer.Character == obj then
							list38.Links[#list38.Links + 1] = backpack.ChildAdded:Connect(function()
								list38.Dirty = true
							end)

							list38.Links[#list38.Links + 1] = backpack.ChildRemoved:Connect(function()
								list38.Dirty = true
							end)
						end
					end)
				end

				list38.Watch(localPlayer.Character)
				list38.CharLink = localPlayer.CharacterAdded:Connect(list38.Watch)

				func4(function()
					list38.SpamUntil = 0
					list38.Unwatch()

					for _, item97 in ipairs({ "Beat", "CharLink" }) do
						if list38[item97] then
							pcall(function()
								list38[item97]:Disconnect()
							end)

							list38[item97] = nil
						end
					end
				end)

				local function func336()
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
					if not character or not humanoid or humanoid.Health <= 0 then
						return false
					end
					local flag366, flag367 = func334()
					if not flag366 or not flag367 then
						return func333()
					end
					local tbl214 = { flag366, flag367 }
					local tbl215 = { 0.3, 0.4 }
					local entry17 = tbl214[list38.Index]

					if list38.Tool ~= entry17 then
						local value311 = list38
						local value312 = list38
						local now = os.clock()
						value311.Tool = entry17
						value312.Since = now
					end

					local parent3 = entry17.Parent == character

					if parent3 then
						local since = list38.Since
						parent3 = os.clock() - since >= tbl215[list38.Index]
					end

					if parent3 then
						list38.Index = list38.Index == 1 and 2 or 1
						entry17 = tbl214[list38.Index]
						local value313 = list38
						local value314 = list38
						local now = os.clock()
						value313.Tool = entry17
						value314.Since = now
					end

					flag336.Tool = entry17
					str28 = flag336.Name(entry17)

					if entry17.Parent ~= character then
						pcall(function()
							humanoid:EquipTool(entry17)
						end)

						if entry17.Parent ~= character then
							pcall(function()
								entry17.Parent = character
							end)
						end

						list38.Since = os.clock()

						if entry17.Parent == character then
							func335(entry17)
							task.defer(func335, entry17)
						end

						return true
					end

					func335(entry17)
					return true
				end

				local function func337(callback17, num90, flag368)
					local now = os.clock()
					local n23 = now + n17

					while os.clock() < n23 and not callback17() do
						local value315, flag369 = func326()
						local flag370 = not flag369

						if not flag370 then
							if num90 then
								flag370 = (flag369.Position - num90).Magnitude > (flag368 or 40)
							else
								flag370 = num90
							end
						end

						if flag370 then
							if num90 and os.clock() - now < 1.2 then
								task.wait(0.1)
								continue
							end
							return
						end

						if func286() and not func286(flag369.Position) then
							func309()
							str27 = "Leaving the base through the safe zone"
							if not func291(flag369.Position + Vector3.new(0, 2.5, 0), callback17, 6) then
								return
							end
							continue
						end

						str27 = flag369.Kind == "Part" and "Picking up a Drone Part" or "Picking up Samples"
						func327(flag369.Position + Vector3.new(0, 2.5, 0), flag369.Position)
						local n24 = os.clock() + 2.5

						while tbl206[value315] and os.clock() < n24 and not callback17() do
							task.wait(0.1)
						end

						tbl206[value315] = nil
						n23 = os.clock() + 1.2
					end
				end

				local function func338(humanoid3, callback18)
					local now = os.clock()
					local n23 = tonumber(humanoid3.Health) or 0
					local value316 = nil
					local value317 = nil
					local value318 = nil
					local flag371 = false

					while not callback18() do
						local entry18 = tbl205[humanoid3.Id]
						local flag372 = not entry18

						if not flag372 then
							flag372 = (tonumber(entry18.Health) or 0) <= 0
						end

						if flag372 then
							return true
						end
						local id3 = func305(humanoid3.Id)
						if id3 and id3:GetAttribute("DroneState") == "Death" then
							tbl205[humanoid3.Id] = nil
							return true
						end
						local result64 = func279()
						local flag373 = result64 ~= nil and entry18.Position ~= nil

						if flag373 then
							flag373 = (result64.Position - (func307(entry18) or entry18.Position)).Magnitude <= 30
						end

						if flag373 and not id3 then
							local now2 = value316 or os.clock()
							if os.clock() - now2 > 1.5 then
								tbl205[humanoid3.Id] = nil
								return false
							end
							value316 = now2
						else
							value316 = nil
						end

						local n24 = tonumber(entry18.Health) or 0

						if n24 ~= n23 then
							value317 = nil
							n23 = n24
						end

						if n16 < os.clock() - now then
							tbl209[humanoid3.Id] = os.clock() + 30
							return false
						end
						local position = func307(entry18) or entry18.Position
						local result65 = func279()
						if not result65 then
							return false
						end

						if func286() and not func286(position) then
							func309()
							str27 = "Leaving the base through the safe zone"
							if not func291(position, callback18, 12) then
								return false
							end

							if callback18() then
								return false
							end
						end

						if not value318 then
							local value319 = nil
							local isBasePart = nil

							value318 = function()
								local entry19 = tbl205[humanoid3.Id]
								if not entry19 then
									return nil
								end

								if not value319 or not value319.Parent then
									value319 = func305(humanoid3.Id)
									local hitbox = value319 and value319:FindFirstChild("Hitbox")
									isBasePart = hitbox and hitbox:IsA("BasePart") and hitbox or value319 and value319.PrimaryPart or nil
								end

								if isBasePart and isBasePart.Parent then
									return isBasePart.Position
								end
								return entry19.Position
							end
						end

						if flag337 then
							func327(position + Vector3.new(0, -1, 16), position, value318)
						else
							func327(position + Vector3.new(0, -1, 5), position)
						end

						if (result65.Position - position).Magnitude <= 60 and not flag337 then
							func332()
						end

						local magnitude = (result65.Position - position).Magnitude
						local flag374 = false

						if flag337 then
							flag374 = math.max(12, n13 + 7)
						end

						local flag375 = magnitude <= (flag374 or 12)

						if flag375 then
							if flag337 then
								list38.SpamUntil = os.clock() + 0.2
							end

							local now2 = value317 or os.clock()
							if os.clock() - now2 > 8 then
								tbl209[humanoid3.Id] = os.clock() + 30
								return false
							end
							local flag376 = false

							if flag337 then
								flag376 = func336()
							end

							if flag376 or not flag337 and func333() then
								str27 = string.format("Smashing %s  %d HP", entry18.Tier ~= "" and entry18.Tier or "drone", math.max(0, tonumber(entry18.Health) or 0))
								value317 = now2
							elseif not flag371 then
								str27 = "No bat found, get any bat to smash drones"
								flag371 = true
								value317 = now2
							else
								value317 = now2
							end
						else
							str27 = "Flying to a drone"
						end

						local wait = task.wait
						local flag377 = false

						if not flag337 then
							flag375 = flag377
						end

						wait(flag375 and 0.03 or 0.1)
					end

					return false
				end

				local function func339(callback19)
					for _, item98 in ipairs(tbl208) do
						if callback19() then
							return false
						end
						str27 = "Looking for drones"
						func327(item98)
						local n23 = os.clock() + 12

						while os.clock() < n23 and not callback19() do
							func306()
							if #func308() > 0 then
								return true
							end

							if str1.DistanceTo(item98) < 8 then
								break
							end
							task.wait(0.2)
						end
					end

					return #func308() > 0
				end

				local function func340()
					local serverTimeNow = workspace:GetServerTimeNow()
					local flag378, flag379 = func274()
					if flag378 and flag379 and flag379 < 25 then
						return next(tbl206) ~= nil
					end

					for _, value320 in pairs(tbl206) do
						if value320.Kind == "Part" or value320.ExpiresAt and value320.ExpiresAt - serverTimeNow < 30 then
							return true
						end
					end

					return false
				end

				local value321 = nil

				local function func341()
					local window = type(snapshot) == "table" and snapshot.Window or nil
					return type(window) == "table" and window.Index or nil
				end

				local function func342(callback20)
					local flag380 = value321 ~= nil and value321 == func341()

					while not callback20() do
						RunService.Heartbeat:Wait()

						if not callback20() then
							func306()

							if func340() then
								func337(callback20)
							end

							local flag381, flag382, flag383, flag384, flag385, flag386, position, flag387, magnitude, flag388, flag389, flag390, vector2, flag391, n23, value322, n24, flag392, flag393, flag394

							if func286() then
								func309()

								if func288(callback20) then
									flag381 = func314()
									flag382 = not flag381 and next(tbl206) ~= nil

									if flag382 then
										func337(callback20)
										func306()
										flag381 = func314()
									end

									if not flag381 then
										flag383 = not func274()
										flag384 = flag383 or flag380

										if not flag384 then
											value321 = func341()
											flag385 = true
											flag380 = true

											if not func339(callback20) then
												break
											else
												continue
											end
										end
									else
										flag386 = func307(flag381)
										position = flag386 or flag381.Position
										flag387 = func279()
										magnitude = flag387 and (flag387.Position - position).Magnitude or 0
										flag388 = flag354 == "Teleport"
										flag387 = flag388 and flag387

										if flag387 then
											flag389 = func286() and not func286(position)
											flag387 = not flag389
										end

										if flag387 then
											flag390 = magnitude > n15 and magnitude <= n18 and os.clock() >= n20 and os.clock() - n21 >= n19

											if flag390 then
												n21 = os.clock()
												vector2 = Vector3.new
												flag391 = false

												if flag337 then
													flag391 = 16
												end

												flag391 = flag391 or 5
												n23 = position + vector2(0, -1, flag391)
												func327(n23, position)
												value322 = func279()

												if value322 then
													str27 = "Teleporting to the next drone"

													pcall(function()
														value322.CFrame = CFrame.lookAt(n23, Vector3.new(position.X, n23.Y, position.Z))
														value322.AssemblyLinearVelocity = Vector3.zero
														value322.AssemblyAngularVelocity = Vector3.zero
													end)

													n24 = os.clock() + 0.8

													while true do
														flag392 = os.clock() < n24
														flag393 = flag392 and not callback20()

														if flag393 then
															flag394 = func279()
															flag394 = flag394 and (flag394.Position - n23).Magnitude > 40

															if flag394 then
																n20 = os.clock() + 30
																str27 = "Teleport pulled back, tweening"
																break
															else
																RunService.Heartbeat:Wait()
																continue
															end
														end

														break
													end
												end
											end
										end

										func338(flag381, callback20)
										continue
									end
								end
							else
								flag381 = func314()
								flag382 = not flag381 and next(tbl206) ~= nil

								if flag382 then
									func337(callback20)
									func306()
									flag381 = func314()
								end

								if not flag381 then
									flag383 = not func274()
									flag384 = flag383 or flag380

									if not flag384 then
										value321 = func341()
										flag385 = true
										flag380 = true

										if not func339(callback20) then
											break
										else
											continue
										end
									end
								else
									flag386 = func307(flag381)
									position = flag386 or flag381.Position
									flag387 = func279()
									magnitude = flag387 and (flag387.Position - position).Magnitude or 0
									flag388 = flag354 == "Teleport"
									flag387 = flag388 and flag387

									if flag387 then
										flag389 = func286() and not func286(position)
										flag387 = not flag389
									end

									if flag387 then
										flag390 = magnitude > n15 and magnitude <= n18 and os.clock() >= n20 and os.clock() - n21 >= n19

										if flag390 then
											n21 = os.clock()
											vector2 = Vector3.new
											flag391 = false

											if flag337 then
												flag391 = 16
											end

											flag391 = flag391 or 5
											n23 = position + vector2(0, -1, flag391)
											func327(n23, position)
											value322 = func279()

											if value322 then
												str27 = "Teleporting to the next drone"

												pcall(function()
													value322.CFrame = CFrame.lookAt(n23, Vector3.new(position.X, n23.Y, position.Z))
													value322.AssemblyLinearVelocity = Vector3.zero
													value322.AssemblyAngularVelocity = Vector3.zero
												end)

												n24 = os.clock() + 0.8

												while true do
													flag392 = os.clock() < n24
													flag393 = flag392 and not callback20()

													if flag393 then
														flag394 = func279()
														flag394 = flag394 and (flag394.Position - n23).Magnitude > 40

														if flag394 then
															n20 = os.clock() + 30
															str27 = "Teleport pulled back, tweening"
															break
														else
															RunService.Heartbeat:Wait()
															continue
														end
													end

													break
												end
											end
										end
									end

									func338(flag381, callback20)
									continue
								end
							end
						end

						break
					end

					func337(callback20)
					func309()
				end

				local tbl216 = { LostPart1 = "Mechanical Gear", LostPart2 = "Wiring Harness" }

				str1.ScrambleLostPart = function(param200)
					return func275(func272(), param200)
				end

				value268 = nil

				func310 = function()
					local result66 = func272()
					if not result66 then
						return "Lost Parts: no event data"
					end
					local drScrambleEvent = workspace:FindFirstChild("DrScrambleEvent")
					local list42 = {}
					local n23 = 0
					local n24 = 0

					for _, item99 in ipairs(list36) do
						local value323 = drScrambleEvent and drScrambleEvent:FindFirstChild(item99)

						if value323 then
							n23 += 1
						end

						if func275(result66, item99) then
							n24 += 1
						elseif value323 then
							local ok, result = pcall(value323.GetPivot, value323)
							local flag395 = ok and str1.DistanceTo(result.Position) or nil
							list42[#list42 + 1] = flag395 and string.format("%s %d studs", tbl216[item99], math.floor(flag395)) or tbl216[item99]
						else
							list42[#list42 + 1] = tbl216[item99] .. " not on map"
						end
					end

					local formatted14 = string.format("Lost Parts on map %d/2  -  Collected %d/2", n23, n24)

					if #list42 > 0 then
						formatted14 ..= "  -  " .. table.concat(list42, "  -  ")
					end

					return formatted14
				end

				local function func343(callback21)
					if not func285() then
						return true
					end
					local Exit = func282("Exit")
					local flag396 = func284(Exit, nil)
					if not flag396 then
						return false
					end
					str27 = "Leaving the Secret Cave"
					if not func280(flag396, callback21, 4) then
						return false
					end

					for i = 1, 4 do
						if callback21() then
							return false
						end
						func281(Exit or func282("Exit"))
						local n23 = os.clock() + 1.5

						while os.clock() < n23 and func285() do
							RunService.Heartbeat:Wait()
						end

						if not func285() then
							return true
						end
					end

					return not func285()
				end

				local function func344()
					return str1.IsNight() or str1.WallSealed()
				end

				local function func345(callback22)
					if not func344() then
						return true
					end
					func309()

					while func344() and not callback22() do
						str27 = str1.IsNight() and "Night, waiting for the wall to drop" or "Waiting for the wall to drop"
						RunService.Heartbeat:Wait()
					end

					return not callback22()
				end

				func311 = function()
					if not str1.Toggle(nil, false) or not func273() then
						return false
					end

					if flag338.Ended then
						return false
					end

					if func274() then
						return true
					end
					func306()
					return #func308() > 0 or next(tbl206) ~= nil
				end

				func312 = function()
					local result67 = func272()
					if not result67 or result67.Completed == true or not func273() then
						return false
					end
					local totalParts2 = tonumber(result67.TotalParts)

					if not totalParts2 then
						totalParts2 = func276(result67) + (tonumber(result67.DroneParts) or 0)
					end

					local flag397 = str1.Toggle(nil, false)

					if flag397 then
						local n23 = #list36
						flag397 = func276(result67) < n23
					end

					local flag398 = str1.Toggle(nil, false) and (totalParts2 >= 5 or result67.Discovered ~= true)
					return flag397 or flag398
				end

				func313 = function(flag399)
					local function func346()
						return flag399 ~= n11 or str1.Movement.Owner ~= "scramble"
					end

					local function func347()
						return func346() or not func311() or func344()
					end

					while true do
						if func311() and not func346() then
							if func345(func346) then
								pcall(func342, func347)
								if func344() then
									continue
								end
							end
						end

						break
					end

					func309()
					if func346() or func311() then
						return
					end

					if not func312() then
						func292(func346)
						str27 = ""
						return
					end

					if not func345(func346) then
						return
					end
					func271(true)
					local result68 = func272()
					if not result68 then
						return
					end

					if not func312() then
						str27 = ""
						return
					end

					if str1.Toggle(nil, false) and result68.Discovered ~= true then
						pcall(func295, func346)
					end

					if str1.Toggle(nil, false) then
						pcall(func296, function()
							return func346() or not str1.Toggle(nil, false) or func311() or func344()
						end)
					end

					if str1.Toggle(nil, false) then
						pcall(func297, function()
							return func346() or not str1.Toggle(nil, false) or func311() or func344()
						end)
					end

					if func285() and not func346() then
						pcall(func343, func346)
					end

					if not func285() and not func311() then
						pcall(func292, func346)
					end
				end
			end
		end

		local func348

		func348 = function(callback23)
			if not (str1.Treadmill.Riding or str1.OnBelt()) then
				return true
			end

			for i = 1, 3 do
				if callback23() then
					return false
				end
				str27 = "Jumping off the treadmill"
				str1.Treadmill.Riding = false
				task.spawn(str1.LeaveBelt)
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoid then
					pcall(function()
						humanoid.Sit = false
						humanoid.Jump = true
						humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					end)
				end

				local result69 = func279()

				if result69 then
					local position = result69.Position
					local n22 = position + Vector3.new(0, 18, 0)
					local now = os.clock()

					while true do
						RunService.Heartbeat:Wait()
						local result70 = func279()

						if not result70 then
							break
						else
							local n23 = math.min(1, (os.clock() - now) / 0.25)

							pcall(function()
								local rotation = result70.CFrame.Rotation
								result70.CFrame = CFrame.new(position:Lerp(n22, n23)) * rotation
								result70.AssemblyLinearVelocity = Vector3.zero
								result70.AssemblyAngularVelocity = Vector3.zero
							end)

							if not (n23 >= 1) then
								continue
							end
							break
						end
					end
				end

				if not (str1.Treadmill.Riding or str1.OnBelt()) then
					return true
				end
			end

			return not str1.OnBelt()
		end

		tbl207.Handle = obj3:CreateToggle({
			Name = "Auto Buy Scramble Shop",
			Note = "Buy the picked items with Samples",
			Default = false,
			Callback = function()
				n14 = 0
				tbl2.Wake()
			end,
		})

		func6(obj3:CreateMultiDropdown({
			Name = "Scramble Shop Items",
			Options = list37,
			Default = { "Scrambled Mutation" },
			SubOf = tbl207.Handle,
			Callback = function(value)
				local picked = {}

				if type(value) == "table" then
					for k, value324 in pairs(value) do
						if value324 == true and type(k) == "string" then
							picked[k] = true
						elseif type(value324) == "string" then
							picked[value324] = true
						end
					end
				end

				tbl207.Picked = picked
			end,
		}))

		obj3:CreateSlider({
			Name = "Keep Samples",
			Note = "Never spend below this many Samples",
			Min = 0,
			Max = 10000,
			Default = 0,
			Increment = 25,
			Unit = "",
			SubOf = tbl207.Handle,
			Callback = function(value)
				tbl207.Keep = math.max(0, tonumber(value) or 0)
			end,
		})

		local tbl217
		tbl217 = { "Highest Value", "Best Rarity", "Biggest Size" }
		local str33

		do
			local tbl218 = { idle = "#8C93A6", work = "#FFC857", good = "#57E08A", stop = "#FF6B6B" }
			local n22 = 6

			str33 = {
				Handle = nil,
				BuyHandle = nil,
				Loop = 0,
				MinRarity = 0,
				MinIncome = 0,
				Priority = tbl217[1],
				SkipMutated = true,
				Targets = {},
				Cooldown = 0,
				Status = "Idle",
				State = "idle",
				Detail = "Turn it on to start applying Scrambled",
				RarityColor = "#FFFFFF",
				Icon = "",
				Ui = {},
				Row = nil,
				Left = 0,
				Pen = 0,
				Match = 0,
				Tries = 0,
				Hits = 0,
				Locked = nil,
				Short = false,
				EggOptions = {},
				EggCategory = {},
			}

			local directory = tbl1.Assets and tbl1.Assets.Directory
			local tbl219 = {}

			if type(directory) == "table" then
				for k, value325 in pairs(directory) do
					local rarity = type(value325) == "table" and value325.Rarity or nil
					local flag400 = type(rarity) == "table"

					if flag400 then
						flag400 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					flag400 = flag400 or nil

					if flag400 then
						table.insert(tbl219, {
							Category = tostring(k),
							Name = tostring(value325.DisplayName or k),
							Rarity = flag400,
							RarityName = tostring(rarity.DisplayName or rarity._id or flag400),
						})
					end
				end
			end

			table.sort(tbl219, function(param201, param202)
				if param201.Rarity ~= param202.Rarity then
					return param201.Rarity > param202.Rarity
				end
				return param201.Name < param202.Name
			end)

			for _, item100 in ipairs(tbl219) do
				local formatted15 = string.format("%s [%s]", item100.Name, item100.RarityName)

				if str33.EggCategory[formatted15] then
					formatted15 = string.format("%s [%s] (%s)", item100.Name, item100.RarityName, item100.Category)
				end

				table.insert(str33.EggOptions, formatted15)
				str33.EggCategory[formatted15] = item100.Category
			end

			local function func349(param203)
				local directory2 = tbl1.Assets and tbl1.Assets.Directory
				return type(directory2) == "table" and directory2[tostring(param203)] or nil
			end

			local function func350(param204)
				local assetCategory11 = func349(param204.AssetCategory)
				local rarity = type(assetCategory11) == "table" and assetCategory11.Rarity or nil
				local flag401 = type(rarity) == "table"

				if flag401 then
					flag401 = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				return flag401 or 0
			end

			local function func351(param205)
				local assetCategory12 = func349(param205.AssetCategory)
				local n23 = type(assetCategory12) == "table" and tonumber(assetCategory12.EarningRate) or 0
				local n24 = tonumber(param205.AssetScale) or 0
				if n23 <= 0 or n24 <= 0 then
					return 0
				end
				return n23 * (n24 > 5 and (n24 / 5) ^ 1.2 * 19.637875755794113 or n24 ^ 1.85)
			end

			local function func352(list43)
				if tostring(list43.BaseMutation or "") == "Scrambled" then
					return true
				end

				if type(list43.Mutations) == "table" then
					for k, mutation in pairs(list43.Mutations) do
						if type(mutation) == "string" and mutation == "Scrambled" then
							return true
						end

						if type(k) == "string" and k == "Scrambled" and mutation ~= false then
							return true
						end
					end
				end

				return false
			end

			local function func353()
				local eggState = tbl1.EggState
				if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return {}
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return {}
				end
				local list44 = {}

				for k, value326 in pairs(result) do
					if type(value326) == "table" and value326.Placement ~= nil then
						value326.Uid = value326.Uid or k
						list44[#list44 + 1] = value326
					end
				end

				return list44
			end

			local function func354(childName13)
				childName13 = childName13 and childName13.Uid

				if childName13 then
					local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
					local obj47 = areaEggSlotsClient and areaEggSlotsClient:FindFirstChild(childName13)

					if obj47 then
						local ok, result = pcall(function()
							return obj47:GetPivot().Position
						end)

						if ok and typeof(result) == "Vector3" then
							return result
						end
					end
				end

				if type(str1.PenAnchor) == "function" then
					local ok, result = pcall(str1.PenAnchor)
					if ok and typeof(result) == "Vector3" then
						return result
					end
				end

				return nil
			end

			local function func355(param206, flag402)
				local num91 = func354(param206)
				if num91 == nil then
					return true
				end

				if str1.DistanceTo(num91) <= n22 then
					return true
				end

				local function func356()
					if flag402 ~= str33.Loop or not str1.Toggle(str33.Handle, false) then
						return true
					end

					if str1.Movement.PlaceWanted == true then
						return true
					end
					return str1.Movement.ScrambleWanted == true or str1.Steal.Wanted == true
				end

				if str1.Treadmill.Riding or str1.OnBelt() then
					str1.ExitBelt()
				end

				str1.HoldBelt()
				local ok, result = pcall(str1.FlyTo, num91 + Vector3.new(0, 3, 0), func356, "mutation")
				str1.ReleaseBelt()
				str1.LeaveBelt()
				result = ok and result
				local flag403

				if result then
					local n23 = n22 + 4
					flag403 = str1.DistanceTo(num91) <= n23
				else
					flag403 = result
				end

				return flag403
			end

			local func357 = func301

			local function func358(obj48)
				if not obj48 then
					return 0
				end
				local num92 = tonumber(obj48:GetAttribute("Uses"))
				if num92 ~= nil then
					return num92
				end
				local matched = string.match(obj48.Name, "%[X(%d+)%]")
				return tonumber(matched) or 1
			end

			local function func359()
				local result71 = func357()
				if not result71 then
					return nil, 0
				end
				local value327 = func358(result71)
				if value327 <= 0 then
					return nil, 0
				end
				return result71, value327
			end

			str33.Grip = function(obj)
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				if not character or not humanoid or not obj or obj.Parent == nil then
					return false
				end

				if obj.Parent ~= character then
					pcall(function()
						humanoid:EquipTool(obj)
					end)

					if obj.Parent ~= character then
						pcall(function()
							obj.Parent = character
						end)
					end

					task.wait(0.2)
				end

				return obj.Parent == character
			end

			local function func360()
				if not str1.Toggle(str33.BuyHandle, false) or flag339 then
					return false
				end
				flag339 = true
				local flag404 = false

				local ok, result = pcall(function()
					flag404 = str33.Purchase()
				end)

				flag339 = false

				if not ok then
					str33.Status = "Buy failed: " .. tostring(result)
				end

				return flag404
			end

			str33.Purchase = function()
				local n23 = 0
				local short = false

				for i = 1, 10 do
					local flag405 = n23 == 0 and func271(true) or snapshot
					local result72 = func272()

					if not (type(flag405) ~= "table" or type(result72) ~= "table") then
						local value328, value329, value330 = ipairs(type(flag405.Shop) == "table" and flag405.Shop or {})
						local value331 = nil

						for _, value332 in value328, value329, value330 do
							if type(value332) == "table" and value332.Id == "MutationConsumable" then
								value331 = value332
							end
						end

						if value331 then
							local purchaseLimit2 = tonumber(value331.PurchaseLimit)

							if not (purchaseLimit2 and func303(result72, value331) >= purchaseLimit2) then
								local huge = tonumber(value331.Price) or math.huge

								if (tonumber(result72.Samples) or 0) - huge < tbl207.Keep then
									short = true

									if n23 == 0 then
										str33.Status = "Need " .. tostring(math.floor(huge)) .. " Samples"
									end

									break
								else
									local Shop = func269("Shop", value331.Id, { Quote = value331.Quote, Sequence = tonumber(result72.ShopSequence) or 0 })

									if not (type(Shop) ~= "table" or Shop.Ok ~= true) then
										n23 += 1
										task.wait(0.4)
										continue
									end
								end
							end
						end
					end

					break
				end

				if n23 > 0 then
					str33.Status = string.format("Bought %d Scrambled", n23)
					str33.Short = short
					return true
				end

				str33.Short = short
				return false
			end

			local function func361()
				local pen = 0
				local match = 0
				local n23 = -1
				local value333 = nil

				for _, item101 in ipairs(func353()) do
					pen += 1
					local skipMutated = str33.SkipMutated and func352(item101)
					local flag406 = false

					if skipMutated then
						flag406 = true
					end

					local flag407 = not flag406

					if flag407 then
						local minRarity = str33.MinRarity
						flag407 = func350(item101) < minRarity
					end

					if flag407 then
						flag406 = true
					end

					local flag408 = not flag406 and str33.MinIncome > 0

					if flag408 then
						local minIncome = str33.MinIncome
						flag408 = func351(item101) < minIncome
					end

					if flag408 then
						flag406 = true
					end

					if not flag406 and next(str33.Targets) ~= nil and str33.Targets[tostring(item101.AssetCategory)] ~= true then
						flag406 = true
					end

					if not flag406 then
						match += 1
						local n24

						if str33.Priority == tbl217[2] then
							n24 = func350(item101) * 1000 + (tonumber(item101.AssetScale) or 0)
						elseif str33.Priority == tbl217[3] then
							n24 = tonumber(item101.AssetScale) or 0
						else
							n24 = func351(item101)
						end

						local flag409 = n24 > n23

						if not flag409 and value333 ~= nil and n24 == n23 and item101.Uid == str33.Locked then
							n23 = n24
							value333 = item101
						elseif flag409 then
							n23 = n24
							value333 = item101
						end
					end
				end

				local value334 = str33
				str33.Pen = pen
				value334.Match = match
				return value333
			end

			local function func362(param207)
				if typeof(param207) ~= "Color3" then
					return "#FFFFFF"
				end
				local floor = math.floor
				local n23 = param207.B * 255 + 0.5
				return string.format("#%02X%02X%02X", math.floor(param207.R * 255 + 0.5), math.floor(param207.G * 255 + 0.5), floor(n23))
			end

			local function func363(param208)
				local ok, result = pcall(Color3.fromHex, param208)
				if not ok or typeof(result) ~= "Color3" then
					return param208
				end
				local value335, value336, value337 = result:ToHSV()
				return func362(Color3.fromHSV(value335, math.min(value336, 0.78), math.max(value337, 0.82)))
			end

			local function func364(flag410)
				local value338 = func349(flag410 and flag410.AssetCategory)
				local icon = type(value338) == "table" and value338.Icon or nil
				if icon == nil then
					return ""
				end

				if tonumber(icon) then
					return "rbxassetid://" .. tostring(icon)
				end
				return tostring(icon)
			end

			local function func365(flag411)
				local value339 = func349(flag411 and flag411.AssetCategory)
				local rarity = type(value339) == "table" and value339.Rarity or nil
				local flag412 = type(rarity) == "table"

				if flag412 then
					flag412 = tostring(rarity.DisplayName or rarity._id or "")
				end

				return flag412 or "", func363(func362(type(rarity) == "table" and rarity.Color or nil))
			end

			local function func366(param209)
				if type(param209) ~= "table" then
					return "No egg selected"
				end
				local assetCategory13 = func349(param209.AssetCategory)
				local flag413 = type(assetCategory13) == "table"

				if flag413 then
					flag413 = tostring(assetCategory13.DisplayName or param209.AssetCategory)
				end

				return flag413 or tostring(param209.AssetCategory)
			end

			local function func367()
				local idle = tbl218[str33.State] or tbl218.idle

				if str33.Ui.Accent and type(str33.Ui.Accent.Set) == "function" then
					str33.Ui.Accent.Set({ Background = idle })
				end

				if str33.Ui.Title and type(str33.Ui.Title.Set) == "function" then
					str33.Ui.Title.Set({ Text = str33.Status, Color = idle })
				end

				if str33.Ui.Egg and type(str33.Ui.Egg.Set) == "function" then
					str33.Ui.Egg.Set({ Text = str33.Detail, Color = str33.RarityColor })
				end

				if str33.Ui.Meta and type(str33.Ui.Meta.Set) == "function" then
					str33.Ui.Meta.Set({
						Text = string.format("Charges %d  Eggs %d/%d  Tries %d  Applied %d", str33.Left, str33.Match, str33.Pen, str33.Tries, str33.Hits),
					})
				end

				if str33.Ui.Icon and type(str33.Ui.Icon.Set) == "function" then
					str33.Ui.Icon.Set({ Visible = str33.Icon ~= "", Image = str33.Icon, StrokeColor = str33.RarityColor })
				end

				if str33.Row and type(str33.Row.Set) == "function" then
					pcall(str33.Row.Set, str33.Row, str33.Status .. "  -  " .. str33.Detail)
				end
			end

			local function func368(param210)
				if type(param210) ~= "table" then
					str33.Detail = "No egg matches the filters"
					str33.RarityColor = "#C7CBD6"
					str33.Icon = ""
					return
				end

				local flag414, value340 = func365(param210)
				local n23 = tonumber(param210.AssetScale) or 0
				str33.Detail = string.format("%s   %.2f kg", func366(param210), n23)

				if flag414 ~= "" then
					str33.Detail = str33.Detail .. "   " .. string.upper(flag414)
				end

				str33.RarityColor = value340
				str33.Icon = func364(param210)
			end

			str33.Apply = function(obj, param211)
				if not str33.Grip(param211) then
					str33.State = "work"
					str33.Status = "Could not hold Scrambled"
					str33.Cooldown = os.clock() + 2
					return false
				end

				local packages = ReplicatedStorage:FindFirstChild("Packages")
				packages = packages and packages:FindFirstChild("Networking")
				local rfBossMasteryAskUseMutationConsu = packages and packages:FindFirstChild("RF/BossMastery/AskUseMutationConsumable")

				if not rfBossMasteryAskUseMutationConsu or not rfBossMasteryAskUseMutationConsu:IsA("RemoteFunction") then
					str33.State = "stop"
					str33.Status = "Mutation remote is missing"
					str33.Cooldown = os.clock() + 10
					return false
				end

				str33.State = "work"
				str33.Status = "Applying Scrambled"
				str33.Tries = str33.Tries + 1

				local ok, result = pcall(function()
					return rfBossMasteryAskUseMutationConsu:InvokeServer(obj.Uid)
				end)

				if not ok or type(result) ~= "table" then
					str33.Cooldown = os.clock() + 10
					return false
				end

				if result.Success == true then
					str33.Status = "Scrambled applied"
					str33.Locked = nil
					str33.State = "good"
					str33.Hits = str33.Hits + 1
					return true
				end

				local str34 = tostring(result.Message or "")
				local lowered4 = string.lower(str34)
				str33.Status = str34 ~= "" and str34 or "Try failed"
				str33.State = "work"

				if string.find(lowered4, "not found") or string.find(lowered4, "invalid") then
					str33.Locked = nil
					str33.Cooldown = os.clock() + 3
					return false
				end

				return true
			end

			str33.Settle = function()
				local n23 = os.clock() + 3

				while os.clock() < n23 do
					if str1.Grounded() then
						return
					end
					RunService.Heartbeat:Wait()
				end
			end

			str33.Over = function(flag415)
				if flag415 ~= str33.Loop or not str1.Toggle(str33.Handle, false) then
					return true
				end

				if str1.Movement.PlaceWanted == true then
					return true
				end
				return str1.Movement.ScrambleWanted == true or str1.Steal.Wanted == true
			end

			str33.Idle = function(status, detail, flag416)
				str33.State = "idle"
				str33.Status = status
				str33.Left = 0
				str33.Detail = detail
				str33.RarityColor = "#C7CBD6"
				str33.Icon = ""
				str33.Cooldown = os.clock() + (flag416 or 5)
			end

			local function func369(param212)
				if str1.Movement.ScrambleWanted == true or str1.Steal.Wanted == true then
					str33.State = "work"
					str33.Status = str1.Movement.ScrambleWanted == true and "Drone hunt goes first" or "Auto Steal goes first"
					str33.Cooldown = os.clock() + 2
					return
				end

				local cooldown = str33.Cooldown
				if os.clock() < cooldown then
					return
				end
				local flag417, value341 = func359()

				if not flag417 then
					pcall(func361)
					if func360() then
						str33.Cooldown = os.clock() + 0.5
						return
					end

					if str33.Short then
						str33.Idle("Out of Samples, waiting for more", "Hunt drones to earn Samples", 10)
						return
					end

					if not string.find(str33.Status, "Samples", 1, true) then
						str33.Status = "Need a Scrambled consumable"
					end

					str33.Idle(str33.Status, "Buy Scrambled from the event shop", 5)
					return
				end

				str33.Left = value341
				local result73 = func361()

				if not result73 or not result73.Uid then
					str33.State = "stop"
					str33.Status = "Waiting"
					func368(nil)
					return
				end

				if str1.Movement.PlaceWanted == true then
					str33.State = "work"
					str33.Status = "Auto Place goes first"
					str33.Cooldown = os.clock() + 2
					return
				end

				if not str1.ClaimMovement("mutation") then
					str33.State = "work"
					str33.Status = "Waiting for " .. tostring(str1.Movement.Owner or "movement")
					str33.Cooldown = os.clock() + 2
					return
				end

				str1.Movement.MutationWanted = true

				local ok, result = pcall(function()
					while not str33.Over(param212) do
						local value342, value343 = func359()

						if value342 then
							str33.Left = value343
							local result74 = func361()

							if not result74 or not result74.Uid then
								str33.State = "stop"
								str33.Status = "Waiting"
								func368(nil)
								break
							else
								if result74.Uid ~= str33.Locked then
									str33.Locked = result74.Uid
									str33.Status = "New target picked"
								end

								func368(result74)

								if not func355(result74, param212) then
									str33.State = "work"
									str33.Status = "Could not reach the egg"
									str33.Cooldown = os.clock() + 3
									break
								elseif not str33.Over(param212) then
									if str33.Apply(result74, value342) then
										pcall(func367)
										task.wait(0.35)
										continue
									end
								end
							end
						end

						break
					end
				end)


				if not ok then
					str33.Status = "Stopped: " .. tostring(result)
					str33.State = "work"
					str33.Cooldown = os.clock() + 3
				end

				str33.Settle()
				str1.Movement.MutationWanted = false
				str1.ReleaseMovement("mutation")
			end

			str33.Handle = obj3:CreateToggle({
				Name = "Auto Use Scrambled Mutation",
				Default = false,
				Callback = function(value)
					str33.Loop = str33.Loop + 1
					str1.Movement.MutationWanted = false
					str1.ReleaseMovement("mutation")
					if value ~= true then
						return
					end
					local loop = str33.Loop

					task.spawn(function()
						while loop == str33.Loop and str1.Toggle(str33.Handle, false) do
							pcall(func369, loop)
							pcall(func367)
							task.wait(str33.State == "idle" and 3 or 1)
						end
					end)
				end,
			})

			if type(obj3.CreateCanvas) == "function" then
				local obj49 = obj3:CreateCanvas({
					Name = "Scrambled Status",
					ShowTitle = false,
					Layout = "free",
					SubOf = str33.Handle,
					Style = {
						TextScale = 1,
						LineHeight = 1.1,
						MinLines = 4,
						MaxLines = 4,
						AutoHeight = true,
						BackgroundTransparency = 0.35,
						TextColor = Color3.fromRGB(255, 255, 255),
						TextStrokeTransparency = 0.7,
					},
					Build = function(obj50)
						str33.Ui.Card = obj50:Frame({
							X = 0,
							Y = 0,
							Width = 1,
							Height = 3.6,
							Corner = 0.3,
							Background = "#151821",
							BackgroundTransparency = 0.25,
						})

						str33.Ui.Accent = obj50:Frame({
							Parent = str33.Ui.Card,
							X = 0.08,
							Y = 0.18,
							Width = 0.16,
							Height = 3.24,
							Corner = 0.2,
							Background = tbl218.idle,
						})

						str33.Ui.Icon = obj50:Image({
							Parent = str33.Ui.Card,
							X = 0.42,
							Y = 0.3,
							Width = 3,
							Height = 3,
							Corner = 0.3,
							Background = "#242938",
							BackgroundTransparency = 0.1,
							StrokeThickness = 0.06,
							StrokeTransparency = 0,
							Visible = false,
						})

						str33.Ui.Title = obj50:Text({
							Parent = str33.Ui.Card,
							X = 3.7,
							Y = 0.32,
							Width = 1,
							Height = 1.05,
							Scale = 1.16,
							Wrap = false,
							Text = str33.Status,
							Color = tbl218.idle,
							TextStrokeTransparency = 1,
						})

						str33.Ui.Egg = obj50:Text({
							Parent = str33.Ui.Card,
							X = 3.7,
							Y = 1.42,
							Width = 1,
							Height = 1,
							Scale = 1,
							Wrap = false,
							Text = str33.Detail,
							Color = "#FFFFFF",
							TextStrokeTransparency = 1,
						})

						str33.Ui.Meta = obj50:Text({
							Parent = str33.Ui.Card,
							X = 3.7,
							Y = 2.42,
							Width = 1,
							Height = 0.9,
							Scale = 0.86,
							Wrap = false,
							Text = "Charges 0  Eggs 0/0  Tries 0  Applied 0",
							Color = "#AEB4C6",
							TextStrokeTransparency = 1,
						})

						func367()
					end,
				})

				func4(function()
					pcall(function()
						obj49:Destroy()
					end)
				end)
			else
				str33.Row = obj3:CreateText({ Name = "Scrambled Status", Text = "Idle", SubOf = str33.Handle })
			end
		end

		obj3:CreateDropdown({
			Name = "Mutation Min Rarity",
			Note = "Only eggs of this rarity and above are used",
			Options = list3,
			Default = list3[1],
			SubOf = str33.Handle,
			Callback = function(value)
				str33.MinRarity = tbl8[value] or 0
			end,
		})

		do
			local tbl220 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}

			local tbl221 = { Slider = nil, Value = 0, Unit = "M/s" }

			local function func370(flag418, flag419)
				if flag418 ~= nil then
					tbl221.Value = math.max(0, math.floor(tonumber(flag418) or tbl221.Value))
				end

				if flag419 ~= nil then
					tbl221.Unit = tostring(flag419)
				end

				str33.MinIncome = tbl221.Value * (tbl220[tbl221.Unit] or tbl220["M/s"]).Mult
			end

			tbl221.Slider = func5(obj3, {
				Name = "Min Mutation Value",
				Note = "Skip eggs worth less than this (0 = off)",
				SubOf = str33.Handle,
				Legacy = "Mutation Min Value",
				SectionName = "Dr Scramble Event",
				OnRaw = function(num93)
					func370(math.floor(num93 / 1000), "K/s")
				end,
			})
		end

		obj3:CreateDropdown({
			Name = "Mutation Priority",
			Note = "Which egg gets the consumable first",
			Options = tbl217,
			Default = tbl217[1],
			SubOf = str33.Handle,
			Callback = function(value)
				str33.Priority = tostring(value)
			end,
		})

		func6(obj3:CreateMultiDropdown({
			Name = "Mutation Target Eggs",
			Note = "Only use the consumable on these eggs (empty = all)",
			Options = str33.EggOptions,
			Default = {},
			SubOf = str33.Handle,
			Callback = function(value)
				local targets = {}

				if type(value) == "table" then
					for k, value344 in pairs(value) do
						k = value344 == true and type(k) == "string" and k

						if k then
							value344 = k
						else
							value344 = type(value344) == "string" and value344
						end

						value344 = value344 or nil

						if value344 and str33.EggCategory[value344] then
							targets[str33.EggCategory[value344]] = true
						end
					end
				end

				str33.Targets = targets
			end,
		}))

		str33.BuyHandle = obj3:CreateToggle({
			Name = "Auto Buy Scrambled",
			Note = "Buy another Scrambled from the event shop when you run out",
			Default = false,
			SubOf = str33.Handle,
			Callback = function()
				str33.Cooldown = 0
			end,
		})

		func4(function()
			str33.Loop = str33.Loop + 1
			str1.Movement.MutationWanted = false
			str1.ReleaseMovement("mutation")
		end)

		do
			local n22 = nil
			local flag420 = false
			local flag421 = false

			tbl2.Add(function()
				if not flag421 and os.clock() - n10 >= n7 then
					flag421 = true

					task.spawn(function()
						pcall(func271, true)
						flag421 = false
					end)
				end

				local value345 = nil

				if value252 then
					value345 = type(value252.Set) == "function"
				end

				if value345 then
					pcall(value252.Set, nil, func277())
				end

				local value346 = nil

				if value268 then
					value346 = type(value268.Set) == "function"
				end

				if value346 then
					pcall(value268.Set, nil, func310())
				end

				local result75 = func274()
				local flag422 = str1.IsNight()

				if result75 and not flag420 then
					flag338.Latch = flag422
					flag338.Ended = false
				end

				if not flag422 then
					flag338.Latch = false
				elseif result75 and not flag338.Latch and not flag338.Ended then
					flag338.Ended = true
					str27 = "Night arrived, this outbreak is over"
					table.clear(tbl205)
					table.clear(tbl206)
				end

				if not result75 then
					flag338.Ended = false
				end

				if flag420 and not result75 then
					task.delay(15, function()
						if not func274() then
							table.clear(tbl205)
							table.clear(tbl209)
						end
					end)
				end

				flag420 = result75

				if str1.Toggle(tbl207.Handle, false) and not flag339 and os.clock() >= n14 and func273() then
					flag339 = true
					n14 = os.clock() + 8

					task.spawn(function()
						pcall(func304, function()
							return not str1.Toggle(tbl207.Handle, false)
						end)

						flag339 = false
					end)
				end

				local result76 = func311()
				local result77 = func312()
				str1.Movement.ScrambleWanted = result76 or result77
				local invisibilityHandle = str1.InvisibilityHandle
				local flag423 = invisibilityHandle ~= nil and str1.Toggle(invisibilityHandle, false)

				if result76 then
					n22 = nil

					if not str1.InvisSuspended then
						str1.InvisSuspended = true
						flag423 = flag423 and type(obj1.Notify) == "function"

						if flag423 then
							pcall(obj1.Notify, "Invisibility", "Invisibility is paused for the drone hunt and comes back after it.", 5)
						end
					end
				elseif str1.InvisSuspended and not flag335 then
					n22 = n22 or os.clock() + 5

					if n22 <= os.clock() then
						n22 = nil
						str1.InvisSuspended = false

						if flag423 and type(obj1.Notify) == "function" then
							pcall(obj1.Notify, "Invisibility", "The drone hunt is over, Invisibility is back on.", 5)
						end
					end
				end

				local character = localPlayer.Character
				if result76 and not flag335 and character and character:GetAttribute("InvisApplied") == true then
					str27 = "Leaving Invisibility for the hunt"
					return true
				end

				if flag335 then
					return result76
				end

				if not (result76 or result77) or os.clock() < n12 then
					if not result76 and not result77 then
						str27 = ""
					end

					return false
				end

				local steal = str1.Steal
				if steal.Active or steal.Carrying or steal.Wanted then
					str27 = "Auto Steal goes first"
					return result76
				end

				if not str1.ClaimMovement("scramble") then
					str27 = "Waiting for " .. tostring(str1.Movement.Owner or "movement") .. " to finish"
					return result76
				end
				flag335 = true
				n12 = os.clock() + n8
				local flag424 = n11

				task.spawn(function()
					pcall(func348, function()
						return flag424 ~= n11
					end)

					str1.HoldBelt()
					pcall(func313, flag424)
					func309()
					str1.ReleaseBelt()
					str1.ReleaseMovement("scramble")
					flag335 = false
					tbl2.Wake()
				end)

				return result76
			end)
		end

		func4(function()
			n11 += 1
			func309()
			str1.InvisSuspended = false
			str1.Movement.ScrambleWanted = false
			str1.ReleaseMovement("scramble")
		end)

		do
			str1.EspSection = obj2._bhLayout.EggEsp
			local obj52 = obj2._bhLayout.Movement
			obj36 = obj2._bhLayout.Character
			obj37 = obj2._bhLayout.Combat
			local createToggle = nil
			local n22 = 350
			local connection2 = nil
			local flag425 = false

			local function func371()
				local character = localPlayer.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				character = character and character:FindFirstChildOfClass("Humanoid")
				if humanoidRootPart and character and character.Health > 0 then
					return humanoidRootPart, character
				end
				return nil, nil
			end

			local function func372()
				if not flag425 then
					return
				end
				flag425 = false
				local flag426, num94 = func371()
				if not flag426 then
					return
				end
				local assemblyLinearVelocity = flag426.AssemblyLinearVelocity
				local moveDirection = num94.MoveDirection
				local vector2 = Vector3.new(moveDirection.X, 0, moveDirection.Z)
				local vector3 = vector2.Magnitude > 0.001 and vector2.Unit * num94.WalkSpeed or Vector3.zero

				pcall(function()
					flag426.AssemblyLinearVelocity = Vector3.new(vector3.X, assemblyLinearVelocity.Y, vector3.Z)
				end)
			end

			local function func373()
				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end

				func372()
				str1.Shield("speed", false)
			end

			local function func374()
				if connection2 then
					return
				end
				str1.Shield("speed", true)

				connection2 = RunService.Heartbeat:Connect(function()
					if str1.Steal.Active or str1.Flying or str1.Driving > 0 or str1.Treadmill.Riding then
						flag425 = false
						return
					end
					local flag427, value347 = func371()
					if not flag427 or value347.Sit or value347.PlatformStand then
						flag425 = false
						return
					end
					local num95 = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
					if num95 and num95 > workspace:GetServerTimeNow() then
						flag425 = false
						return
					end
					local moveDirection = value347.MoveDirection
					local vector2 = Vector3.new(moveDirection.X, 0, moveDirection.Z)
					if vector2.Magnitude <= 0.001 then
						func372()
						return
					end
					local n23 = vector2.Unit * n22
					local assemblyLinearVelocity = flag427.AssemblyLinearVelocity

					pcall(function()
						flag427.AssemblyLinearVelocity = Vector3.new(n23.X, assemblyLinearVelocity.Y, n23.Z)
					end)

					flag425 = true
				end)
			end

			str1.SpeedForced = false

			local function func375()
				if str1.Toggle(createToggle, false) or str1.SpeedForced then
					func374()
				else
					func373()
				end
			end

			local flag428 = false
			local flag429 = false
			local flag430 = false

			str1.SetSpeedForced = function(flag431)
				str1.SpeedForced = flag431 == true
				flag428 = true
				func375()
			end

			local tbl222 = {
				Name = "Speed Boost",
				Default = false,
				Callback = function()
					if str1.SpeedForced and not str1.Toggle(createToggle, false) then
						flag428 = true
						flag430 = true
					end

					func375()
				end,
			}

			createToggle = obj52.CreateToggle
			createToggle = createToggle(obj52, tbl222)

			local connection3 = RunService.Heartbeat:Connect(function()
				if flag430 then
					flag430 = false

					if type(obj1.Notify) == "function" then
						pcall(obj1.Notify, "Speed Boost", "Speed Boost must stay on while Invisibility is on.", 5)
					end
				end

				if not flag428 then
					return
				end
				flag428 = false
				local flag432

				if str1.SpeedForced and not str1.Toggle(createToggle, false) then
					flag429 = true
					flag432 = true
				else
					local flag433 = not str1.SpeedForced and flag429
					flag432 = nil

					if flag433 then
						flag429 = false
						local value348 = nil

						if str1.Toggle(createToggle, false) then
							flag432 = false
						else
							flag432 = value348
						end
					end
				end

				if flag432 ~= nil then
					for _, item102 in ipairs({ "Set", "SetValue" }) do
						local ok, result = pcall(function()
							return createToggle[item102]
						end)

						if not (ok and type(result) == "function" and pcall(result, createToggle, flag432)) then
							continue
						end
						break
					end
				end
			end)

			func4(function()
				connection3:Disconnect()
			end)

			obj52:CreateSlider({
				Name = "Boost Speed",
				Min = 20,
				Max = 1000,
				Default = 350,
				Increment = 5,
				Unit = "studs/s",
				Callback = function(value)
					n22 = math.clamp(tonumber(value) or 350, 20, 1000)
				end,
			})

			func4(func373)
			local value349 = nil
			local connection4 = nil

			local function func376()
				if connection4 then
					connection4:Disconnect()
					connection4 = nil
				end

				str1.Shield("jump", false)
			end

			value349 = obj52:CreateToggle({
				Name = "Infinite Jump",
				Default = false,
				Callback = function()
					if not str1.Toggle(value349, false) then
						func376()
						return
					end

					if connection4 then
						return
					end
					str1.Shield("jump", true)

					connection4 = UserInputService.JumpRequest:Connect(function()
						local character = localPlayer.Character
						local humanoid = character and character:FindFirstChildOfClass("Humanoid")

						if humanoid then
							pcall(function()
								humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
							end)
						end
					end)
				end,
			})

			func4(func376)
		end
	end

	do
		local value350 = nil
		local flag434 = false
		local flag435 = true
		local flag436 = false
		local flag437 = false
		local flag438 = false
		local value351 = nil
		local value352 = nil

		local function func377()
			return flag434 and not str1.InvisSuspended and not str1.InvisMech
		end

		local function func378(obj53)
			return obj53 and obj53:FindFirstChildOfClass("Humanoid") or nil
		end

		local function func379(childName14)
			return networking:FindFirstChild(childName14)
		end

		local function func380(obj54)
			return obj54 ~= nil and obj54:GetAttribute("InvisApplied") == true
		end

		local function func381()
			local AskDoff = func379("RF/Treadmill/AskDoff")

			if AskDoff and AskDoff:IsA("RemoteFunction") then
				for i = 1, 2 do
					pcall(AskDoff.InvokeServer, AskDoff)
				end
			end
		end

		local function func382(param213)
			local AskRigWipe = func379("RE/RigSync/AskRigWipe")

			if AskRigWipe and AskRigWipe:IsA("RemoteEvent") then
				pcall(AskRigWipe.FireServer, AskRigWipe, param213)
			end
		end

		local function func383(instance18)
			local backpack = localPlayer:FindFirstChildOfClass("Backpack")

			for _, child in ipairs(instance18:GetChildren()) do
				if child:IsA("Humanoid") then
					pcall(child.UnequipTools, child)
				end
			end

			if backpack then
				for _, child in ipairs(instance18:GetChildren()) do
					if child:IsA("Tool") then
						pcall(function()
							child.Parent = backpack
						end)
					end
				end
			end

			for i = 1, 3 do
				RunService.Heartbeat:Wait()
			end
		end

		local function func384(obj55)
			local obj56 = func378(obj55)
			if not obj55 or not obj56 then
				return false
			end
			func383(obj55)
			func381()

			pcall(function()
				obj56:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
				obj56.BreakJointsOnDeath = true
				obj56.RequiresNeck = true
				obj56.Health = 0
			end)

			pcall(function()
				obj56:ChangeState(Enum.HumanoidStateType.Dead)
			end)

			pcall(function()
				obj55:BreakJoints()
			end)

			func382(obj55)
			return true
		end

		local function func385(parent)
			local flag439 = func378(parent)
			local n7 = os.clock() + 10

			while true do
				if os.clock() < n7 and flag435 and parent.Parent then
					flag439 = flag439 or func378(parent)
					if not (flag439 and parent:FindFirstChild("HumanoidRootPart") and parent:FindFirstChild("Head")) then
						task.wait()
						continue
					end
				end

				break
			end

			local humanoidRootPart = parent:FindFirstChild("HumanoidRootPart")
			if not func377() or not flag439 or not humanoidRootPart or not parent:FindFirstChild("Head") then
				return false
			end
			task.wait(0.05)
			if not func377() or parent.Parent == nil then
				return false
			end

			for i = 1, 2 do
				pcall(flag439.UnequipTools, flag439)
			end

			if type(replicatesignal) == "function" then
				for i = 1, 2 do
					pcall(replicatesignal, flag439.ServerBreakJoints)
				end
			end

			local hipHeight2 = flag439.HipHeight

			pcall(function()
				flag439.HipHeight = 999
			end)

			for _, child in ipairs(parent:GetChildren()) do
				if child:IsA("Accessory") or child:IsA("BasePart") and child ~= humanoidRootPart then
					pcall(function()
						child.Parent = nil
					end)
				end
			end

			task.wait(0.12)

			local function func386()
				pcall(function()
					flag439.HipHeight = hipHeight2
				end)

				for _, child in ipairs(parent:GetChildren()) do
					if child:IsA("Humanoid") and child.HipHeight ~= hipHeight2 then
						pcall(function()
							child.HipHeight = hipHeight2
						end)
					end
				end
			end

			if parent.Parent == nil then
				func386()
				return false
			end
			local motor6D = Instance.new("Motor6D")
			motor6D.Name = "RightWrist"
			motor6D.C0 = CFrame.new(1.2, 0, 0)
			motor6D.C1 = CFrame.new()
			motor6D.Part0 = humanoidRootPart
			motor6D.Parent = humanoidRootPart
			local part = Instance.new("Part")
			part.Name = "RightHand"
			part.Size = Vector3.new(0.2, 0.2, 0.2)
			part.Transparency = 1
			part.CanCollide = false
			part.CanTouch = false
			part.CanQuery = false
			part.Massless = true
			part.CFrame = humanoidRootPart.CFrame * motor6D.C0
			motor6D.Part1 = part
			part.Parent = parent

			pcall(function()
				humanoidRootPart.CanCollide = false
			end)

			func386()
			parent:SetAttribute("InvisApplied", true)

			task.delay(1, function()
				local chilliToolKeeper = (typeof(getgenv) == "function" and getgenv() or _G).ChilliToolKeeper

				if parent.Parent and type(chilliToolKeeper) == "function" then
					pcall(chilliToolKeeper)
				end
			end)

			task.delay(0.2, function()
				if humanoidRootPart.Parent then
					pcall(function()
						humanoidRootPart.CanCollide = true
					end)
				end
			end)

			local connection = parent.ChildAdded:Connect(function(child)
				if child:IsA("Humanoid") then
					task.defer(function()
						if child.HipHeight ~= hipHeight2 then
							pcall(function()
								child.HipHeight = hipHeight2
							end)
						end
					end)
				end
			end)

			local connection2 = nil

			connection2 = parent.AncestryChanged:Connect(function(child, parent2)
				if parent2 == nil then
					connection:Disconnect()
					connection2:Disconnect()
				end
			end)

			return true
		end

		local function func387()
			local active = str1.Steal.Active or str1.Steal.Carrying or str1.Flying

			if not active then
				active = (str1.Driving or 0) > 0
			end

			return active
		end

		str1.RequestRespawn = function()
			flag438 = true
		end

		local function func388()
			flag436 = true
			local flag440 = flag438

			while flag435 and (func387() or not str1.ClaimMovement("invisibility")) do
				task.wait(0.2)
			end

			local character = localPlayer.Character

			if flag435 and character and (flag440 or func380(character) ~= func377()) and func378(character) then
				flag438 = false
				flag3.Paused = true
				str1.ShieldPaused = true
				pcall(str1.UndoSwap)
				task.wait()
				func384(localPlayer.Character)
				local n7 = os.clock() + 60
				local n8 = os.clock() + 8

				while flag435 and os.clock() < n7 and localPlayer.Character == character do
					if n8 <= os.clock() then
						n8 = os.clock() + 8
						func382(character)
					end

					task.wait(0.05)
				end

				task.wait(0.1)

				while flag435 and flag437 do
					task.wait(0.05)
				end
			end

			flag3.Paused = false
			str1.ShieldPaused = false
			str1.ReleaseMovement("invisibility")
			flag436 = false
		end

		local connection = localPlayer.CharacterAdded:Connect(function(character)
			if not func377() then
				return
			end
			flag437 = true
			str1.ShieldPaused = true

			task.spawn(function()
				pcall(func385, character)
				flag437 = false

				if not flag436 then
					str1.ShieldPaused = false
				end
			end)
		end)

		local thread = task.spawn(function()
			while flag435 do
				local character = localPlayer.Character
				local flag441 = func378(character)

				if not flag436 and not flag437 and character and flag441 and flag441.Health > 0 and (flag438 or func380(character) ~= func377()) then
					func388()
				end

				local character3 = func380(localPlayer.Character)

				if character3 ~= value351 then
					value351 = character3
					str1.SetSpeedForced(character3)
				end

				task.wait(0.25)
			end
		end)

		local connection2 = RunService.Heartbeat:Connect(function()
			local character = localPlayer.Character
			if not character or not func380(character) then
				return
			end
			local rightHand = character:FindFirstChild("RightHand")
			local tool = character:FindFirstChildWhichIsA("Tool")
			local handle = tool and tool:FindFirstChild("Handle")
			if not rightHand or not handle or not handle:IsA("BasePart") then
				return
			end
			local cframe = CFrame.new()

			for _, child in ipairs(rightHand:GetChildren()) do
				if child:IsA("JointInstance") and child.Name == "RightGrip" and child.Part1 == handle then
					cframe = child.C0 * child.C1:Inverse()

					if child.Enabled then
						child.Enabled = false
					end
				end
			end

			pcall(function()
				handle.CFrame = rightHand.CFrame * cframe
				handle.AssemblyLinearVelocity = Vector3.zero
				handle.AssemblyAngularVelocity = Vector3.zero
			end)
		end)

		func4(function()
			connection2:Disconnect()
		end)

		local connection3 = RunService.Heartbeat:Connect(function()
			local character = localPlayer.Character
			local flag442 = func378(character)
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			if not flag442 or not humanoidRootPart or flag442.Health <= 0 then
				return
			end
			local flag443 = func380(character) and not str1.Steal.Active and not str1.Flying

			if flag443 then
				flag443 = (str1.Driving or 0) == 0
			end

			if flag443 then
				flag443 = not (str1.Treadmill and str1.Treadmill.Riding)
			end

			if not (flag443 and not flag442.Sit and not flag442.PlatformStand) then
				if value352 == flag442 then
					value352 = nil

					pcall(function()
						flag442.AutoRotate = true
					end)
				end

				return
			end

			if flag442.AutoRotate then
				pcall(function()
					flag442.AutoRotate = false
				end)
			end

			value352 = flag442
			local moveDirection = flag442.MoveDirection
			local vector = Vector3.new(moveDirection.X, 0, moveDirection.Z)

			if vector.Magnitude > 0.01 then
				pcall(function()
					humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, humanoidRootPart.Position + vector.Unit)
				end)
			end
		end)

		str1.InvisibilityHandle = obj36:CreateToggle({
			Name = "Invisibility",
			Note = "Makes you invisible to other players",
			Default = false,
			Callback = function()
				local value353 = nil

				if type(str1.CombatActive) == "function" and str1.CombatActive() then
					value353 = "Auto Hit"
				end

				if str1.Toggle(value350, false) and value353 then
					flag434 = false
					local value354 = value350

					str1.UiDefer(function()
						pcall(value354.Set, value354, false, false)
						str1.Notify("Invisibility", "Turn off " .. value353 .. " first, both cannot be on at the same time")
					end)

					return
				end

				flag434 = str1.Toggle(value350, false) == true

				if func377() and not func380(localPlayer.Character) and str1.Movement.Owner == nil then
					str1.Movement.Owner = "invisibility"
				end
			end,
		})

		func4(function()
			flag435 = false
			connection:Disconnect()
			connection3:Disconnect()
			pcall(task.cancel, thread)
			flag3.Paused = false
			str1.ShieldPaused = false
			str1.ReleaseMovement("invisibility")
		end)
	end

	local tbl223
	tbl223 = { BallSocketConstraint = true, NoCollisionConstraint = true, HingeConstraint = true }
	local tbl224

	tbl224 = {
		[Enum.HumanoidStateType.Physics] = true,
		[Enum.HumanoidStateType.Ragdoll] = true,
		[Enum.HumanoidStateType.FallingDown] = true,
	}

	local n7
	n7 = 0.5
	local value355

	do
		local n8 = 5
		local n9 = 0

		value355 = func2(function()
			return ReplicatedStorage.Shared.Modules.Ragdoll
		end)

		local value356 = nil

		local function func389()
			if value356 then
				return value356
			end

			local ok, result = pcall(function()
				return require(localPlayer:WaitForChild("PlayerScripts", 5):WaitForChild("PlayerModule", 5)):GetControls()
			end)

			if ok then
				value356 = result
			end

			return value356
		end

		local value357 = nil
		local flag444 = false
		local connection = nil
		local n10 = 0
		local value358 = nil
		local list45 = {}
		local list46 = {}
		local n11 = 0
		local value359 = nil
		local humanoid = nil

		local function func390(list47)
			for _, item103 in ipairs(list47) do
				if item103.Connected then
					item103:Disconnect()
				end
			end

			table.clear(list47)
		end

		local function func391(param214)
			list45[#list45 + 1] = param214
		end

		local function func392(param215)
			list46[#list46 + 1] = param215
		end

		local function func393()
			if not value359 or not humanoid then
				return
			end
			local humanoidRootPart = value359:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				return
			end
			local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
			local vector = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)
			local n12 = humanoid.WalkSpeed + n8
			local y = assemblyLinearVelocity.Y
			local flag445 = false

			if n12 < vector.Magnitude then
				vector = vector.Unit * n12
				flag445 = true
			end

			if n9 < y then
				y = n9
				flag445 = true
			end

			if flag445 then
				pcall(function()
					humanoidRootPart.AssemblyLinearVelocity = Vector3.new(vector.X, y, vector.Z)
				end)
			end
		end

		local function func394()
			if type(value355) ~= "table" then
				return
			end

			if type(value355.ClearClientRagdoll) == "function" then
				pcall(value355.ClearClientRagdoll)
			end

			if type(value355.Unragdoll) == "function" then
				pcall(value355.Unragdoll, value359)
			end
		end

		local function func395()
			if not value359 or not value359.Parent then
				return
			end

			for _, descendant in ipairs(value359:GetDescendants()) do
				if tbl223[descendant.ClassName] then
					pcall(function()
						descendant:Destroy()
					end)
				end
			end
		end

		local function func396()
			if not value359 or not value359.Parent then
				return
			end

			for _, descendant in ipairs(value359:GetDescendants()) do
				if descendant:IsA("Motor6D") and not descendant.Enabled then
					pcall(function()
						descendant.Enabled = true
					end)
				elseif descendant:IsA("AnimationConstraint") and not descendant.Enabled then
					pcall(function()
						descendant.Enabled = true
					end)
				end
			end
		end

		local function func397()
			local result78 = func389()

			if result78 and result78.controlsEnabled == false then
				pcall(function()
					result78:Enable()
				end)
			end
		end

		local function func398()
			local currentCamera = workspace.CurrentCamera

			if currentCamera and humanoid and currentCamera.CameraSubject ~= humanoid then
				pcall(function()
					currentCamera.CameraSubject = humanoid
				end)
			end
		end

		local function func399()
			if not humanoid or not humanoid.Parent or humanoid.Health <= 0 then
				return
			end

			if tbl224[humanoid:GetState()] then
				pcall(function()
					humanoid:ChangeState(Enum.HumanoidStateType.Running)
				end)
			end

			if humanoid.PlatformStand then
				humanoid.PlatformStand = false
			end
		end

		local function func400()
			if type(value355) == "table" and type(value355.IsRagdolled) == "function" then
				local ok, result = pcall(value355.IsRagdolled, value359)
				if ok and result == true then
					return true
				end
			end

			local num96 = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
			return num96 ~= nil and num96 > workspace:GetServerTimeNow()
		end

		local n12 = 21

		local function func401()
			if str1.AntiGuard.Busy == true then
				return true
			end

			if (tonumber(str1.AntiGuard.HitArms) or 0) <= 0 then
				return false
			end
			return os.clock() - (tonumber(str1.AntiGuard.HitArmedAt) or 0) <= n12
		end

		local function func402()
			if not humanoid or not humanoid.Parent then
				return false
			end

			if humanoid.PlatformStand then
				return true
			end
			return tbl224[humanoid:GetState()] == true
		end

		local function func403()
			if not value359 or not value359.Parent then
				return false
			end

			for _, child in ipairs(value359:GetChildren()) do
				if tbl223[child.ClassName] then
					return true
				end

				if child:IsA("BasePart") then
					for _, child2 in ipairs(child:GetChildren()) do
						if tbl223[child2.ClassName] then
							return true
						end
					end
				end
			end

			return false
		end

		local function func404()
			func393()
			func394()
			func395()
			func396()
			func399()
			func397()
			func398()
		end

		local function func405()
			if not flag444 or func401() then
				return
			end
			n10 = os.clock() + n7
		end

		local function func406()
			local character = localPlayer.Character

			if character ~= value359 then
				if character then
					value358(character)
				else
					n11 += 1
					func390(list46)
					value359 = nil
					humanoid = nil
				end

				return
			end

			if not value359 then
				return
			end

			if value359:FindFirstChildOfClass("Humanoid") ~= humanoid then
				value358(value359)
			end
		end

		local function func407()
			if not flag444 then
				return
			end
			func406()
			if not value359 or not humanoid or humanoid.Health <= 0 then
				return
			end

			if func401() then
				n10 = 0
				return
			end
			local now = os.clock()

			if func402() or func400() or func403() then
				n10 = now + n7
			end

			if now <= n10 then
				func404()
			end
		end

		value358 = function(obj57)
			n11 += 1
			local flag446 = n11
			func390(list46)
			value359 = obj57
			humanoid = nil
			if not flag444 or not obj57 then
				return
			end
			humanoid = obj57:FindFirstChildOfClass("Humanoid")
			if not flag444 or n11 ~= flag446 or obj57 ~= localPlayer.Character or not humanoid or not humanoid:IsA("Humanoid") then
				return
			end

			func392(humanoid.StateChanged:Connect(function(old, new)
				if flag444 and tbl224[new] then
					func405()
				end
			end))

			func392(humanoid:GetPropertyChangedSignal("PlatformStand"):Connect(function()
				if flag444 and humanoid and humanoid.PlatformStand then
					func405()
				end
			end))

			func392(obj57.DescendantAdded:Connect(function(descendant)
				if flag444 and tbl223[descendant.ClassName] then
					func405()
				end
			end))

			func392(obj57.ChildAdded:Connect(function(child)
				if flag444 and child:IsA("Humanoid") and child ~= humanoid then
					task.defer(func406)
				end
			end))

			func398()

			if func400() then
				func405()
			end
		end

		local function func408()
			flag444 = false
			n11 += 1
			n10 = 0

			if connection then
				pcall(function()
					connection:Disconnect()
				end)

				connection = nil
			end

			func390(list46)
			func390(list45)
			value359 = nil
			humanoid = nil
		end

		local function func409()
			func408()
			flag444 = true
			func389()
			connection = RunService.Heartbeat:Connect(func407)

			func391(localPlayer.CharacterAdded:Connect(function(character)
				if flag444 then
					task.defer(function()
						if flag444 and character == localPlayer.Character then
							value358(character)
						end
					end)
				end
			end))

			func391(localPlayer.CharacterRemoving:Connect(function(character)
				if flag444 and character == value359 then
					n11 += 1
					n10 = 0
					func390(list46)
					value359 = nil
					humanoid = nil
				end
			end))

			func391(localPlayer:GetAttributeChangedSignal("RagdollEndTime"):Connect(function()
				if flag444 then
					func405()
				end
			end))

			local clientRagdollRemote = type(value355) == "table" and value355.ClientRagdollRemote or nil

			if typeof(clientRagdollRemote) == "Instance" and clientRagdollRemote:IsA("RemoteEvent") then
				func391(clientRagdollRemote.OnClientEvent:Connect(function()
					if flag444 and not func401() then
						func393()
						func405()
					end
				end))
			end

			func391(str1.OnHumanoidChanged(function()
				if flag444 and localPlayer.Character then
					value358(localPlayer.Character)
				end
			end))

			if localPlayer.Character then
				value358(localPlayer.Character)
			end
		end

		func4(func408)

		value357 = obj36:CreateToggle({
			Name = "Anti Ragdoll",
			Default = true,
			Callback = function()
				if str1.Toggle(value357, false) then
					func409()
				else
					func408()
				end
			end,
		})
	end

	do
		local flag447 = false
		local tbl225 = {}

		local function func410()
			for _, item104 in ipairs(tbl225) do
				pcall(function()
					item104:Disconnect()
				end)
			end

			table.clear(tbl225)
		end

		local function func411(humanoid4)
			if flag447 and humanoid4.Parent and humanoid4.Health > 0 and humanoid4.Health < humanoid4.MaxHealth then
				pcall(function()
					humanoid4.Health = humanoid4.MaxHealth
				end)
			end
		end

		local function func412(obj58)
			func410()
			if not flag447 or not obj58 then
				return
			end
			local humanoid = obj58:FindFirstChildOfClass("Humanoid") or obj58:WaitForChild("Humanoid", 5)
			if not flag447 or not humanoid or not humanoid:IsA("Humanoid") or obj58 ~= localPlayer.Character then
				return
			end

			table.insert(tbl225, humanoid.HealthChanged:Connect(function()
				func411(humanoid)
			end))

			table.insert(tbl225, RunService.Heartbeat:Connect(function()
				func411(humanoid)
			end))

			func411(humanoid)
		end

		local connection = localPlayer.CharacterAdded:Connect(function(character)
			if flag447 then
				task.defer(func412, character)
			end
		end)

		local obj59 = str1.OnHumanoidChanged(function()
			if flag447 and localPlayer.Character then
				func412(localPlayer.Character)
			end
		end)

		func4(function()
			flag447 = false
			connection:Disconnect()
			obj59:Disconnect()
			func410()
		end)

		flag447 = true

		if localPlayer.Character then
			task.spawn(func412, localPlayer.Character)
		end
	end

	do
		local value360 = nil
		local flag448 = true
		local tbl226 = {}
		local tbl227 = {}

		local function func413(instance19)
			if instance19:IsA("BasePart") and tbl226[instance19] == nil then
				tbl226[instance19] = instance19.CanTouch

				pcall(function()
					instance19.CanTouch = false
				end)
			end
		end

		local function func414(instance20)
			if not flag448 or not instance20.Parent then
				return
			end
			local name = localPlayer.Name
			if instance20:GetAttribute("Owner") == name then
				return
			end
			func413(instance20)

			for _, descendant in ipairs(instance20:GetDescendants()) do
				func413(descendant)
			end

			table.insert(tbl227, instance20.DescendantAdded:Connect(function(descendant)
				if flag448 then
					func413(descendant)
				end
			end))
		end

		local function func415()
			for _, item105 in ipairs(CollectionService:GetTagged("PlacedTrap")) do
				func414(item105)
			end
		end

		local function func416()
			for k, value361 in pairs(tbl226) do
				if k.Parent then
					pcall(function()
						k.CanTouch = value361
					end)
				end
			end

			table.clear(tbl226)
		end

		table.insert(tbl227, CollectionService:GetInstanceAddedSignal("PlacedTrap"):Connect(function(param216)
			task.defer(func414, param216)
		end))

		value360 = obj36:CreateToggle({
			Name = "Anti Trap",
			Note = "Traps from other players cannot catch you",
			Default = true,
			Callback = function()
				flag448 = str1.Toggle(value360, true) == true

				if flag448 then
					func415()
				else
					func416()
				end
			end,
		})

		func415()

		func4(function()
			flag448 = false

			for _, item106 in ipairs(tbl227) do
				pcall(function()
					item106:Disconnect()
				end)
			end

			table.clear(tbl227)
			func416()
		end)
	end

	do
		local value362 = nil
		local str35 = "CarryAreaEgg"
		local byName4 = { ClaimLostPart = true }
		local tbl228 = {}
		local connection = nil
		local connection2 = nil

		local function func417(instance21)
			if not instance21:IsA("ProximityPrompt") or byName4[instance21.Name] then
				return
			end

			if tbl228[instance21] == nil then
				if instance21.HoldDuration <= 0 and instance21.Name ~= str35 then
					return
				end
				tbl228[instance21] = instance21.HoldDuration
			end

			if instance21.HoldDuration ~= 0 then
				pcall(function()
					instance21.HoldDuration = 0
				end)
			end
		end

		local function func418(instance22)
			if instance22.Name ~= "SmartPromptPart" then
				return nil
			end
			local carryAreaEgg = instance22:FindFirstChild("CarryAreaEgg")
			return carryAreaEgg and carryAreaEgg:IsA("ProximityPrompt") and carryAreaEgg or nil
		end

		str1.PromptHold = function(obj)
			local entry20 = tbl228[obj]
			if type(entry20) == "number" then
				return entry20
			end
			return obj.HoldDuration
		end

		local function func419()
			if connection then
				return
			end

			connection2 = ProximityPromptService.PromptShown:Connect(function(param217)
				if str1.Toggle(value362, true) then
					func417(param217)
				end
			end)

			for _, child in ipairs(workspace:GetChildren()) do
				local value363 = func418(child)

				if value363 then
					func417(value363)
				end
			end

			connection = workspace.ChildAdded:Connect(function(child)
				if child.Name ~= "SmartPromptPart" then
					return
				end

				task.defer(function()
					local carryAreaEgg = child:FindFirstChild("CarryAreaEgg") or child:WaitForChild("CarryAreaEgg", 2)

					if carryAreaEgg and carryAreaEgg:IsA("ProximityPrompt") and str1.Toggle(value362, true) then
						func417(carryAreaEgg)
					end
				end)
			end)
		end

		local function func420()
			for k, value364 in pairs(tbl228) do
				if k and k.Parent then
					pcall(function()
						k.HoldDuration = value364
					end)
				end
			end

			table.clear(tbl228)

			if connection then
				connection:Disconnect()
				connection = nil
			end

			if connection2 then
				connection2:Disconnect()
				connection2 = nil
			end
		end

		str1.PressStealPrompt = function(num97)
			if typeof(fireproximityprompt) ~= "function" or not num97 then
				return false
			end
			local value365 = nil
			local huge = math.huge

			for _, child in ipairs(workspace:GetChildren()) do
				local flag449 = func418(child)

				if flag449 and child:IsA("BasePart") then
					local magnitude = (child.Position - num97).Magnitude

					if magnitude < huge then
						value365 = flag449
						huge = magnitude
					end
				end
			end

			if not value365 or huge > 14 then
				return false
			end

			if str1.Toggle(value362, true) then
				pcall(function()
					value365.HoldDuration = 0
				end)
			end

			local ok = pcall(fireproximityprompt, value365)

			if ok and value365.HoldDuration > 0 then
				task.wait(value365.HoldDuration + 0.1)
			end

			return ok
		end

		tbl2.Add(function()
			if str1.Toggle(value362, true) then
				func419()

				for k in pairs(tbl228) do
					if not k.Parent then
						tbl228[k] = nil
					elseif k.HoldDuration ~= 0 then
						pcall(function()
							k.HoldDuration = 0
						end)
					end
				end
			elseif next(tbl228) ~= nil or connection then
				func420()
			end

			return false
		end)

		value362 = obj36:CreateToggle({
			Name = "Instant Prompts",
			Default = true,
			Callback = function()
				tbl2.Wake()
			end,
		})

		pcall(function()
			local orderMap = {
				["Anti Ragdoll"] = 1,
				["Anti Trap"] = 2,
				["Instant Prompts"] = 3,
				["Invisibility"] = 4,
			}
			if obj36 and obj36.Options then
				for _, opt in ipairs(obj36.Options) do
					local ord = orderMap[opt.Name]
					if ord then
						if opt.Instance then opt.Instance.LayoutOrder = ord end
						if opt._visibilityHost then opt._visibilityHost.LayoutOrder = ord end
					end
				end
			end
		end)

		func4(func420)
	end

	str1.Combat = {}
	local combat
	combat = str1.Combat
	local n8, n9, n10, n11, n12, n13, n14, n15, n16, n17
	local list48

	do
		local n18 = 15
		local n19 = 2
		n8 = 0.05
		n9 = 1
		n10 = 0.18
		n11 = -0.275
		n12 = 0.6
		n13 = 6
		n14 = 1.1
		n15 = 0.8
		n16 = 2.5
		n17 = 35
		local n20 = 0.12
		local n21 = 6
		local n22 = 6
		local n23 = 3
		local tbl229 = { 0.12, 0.2, 0.28, 0.36, 0.46, 0.6 }
		local byName5 = { ["WALL LEFT"] = true, ["WALL RIGHT"] = true }

		list48 = {
			Trigger = nil,
			LastFire = 0,
			Trace = 0,
			EquipAt = 0,
			Walls = {},
			WallsAt = 0,
			WallSide = setmetatable({}, { __mode = "k" }),
			Tracks = setmetatable({}, { __mode = "k" }),
			Stats = {},
			Option = 3,
			Pending = {},
			Holders = {},
			SpawnRagdoll = nil,
		}

		for i = 1, #tbl229 do
			list48.Stats[i] = { Hits = 0, Shots = 0 }
		end

		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude

		pcall(function()
			raycastParams.RespectCanCollide = true
		end)

		local function func421()
			return workspace:GetServerTimeNow()
		end

		local function func422()
			local trigger = list48.Trigger
			if trigger and trigger.Parent then
				return trigger
			end
			local reBatSwingTrigger = networking:FindFirstChild("RE/BatSwing/Trigger")
			list48.Trigger = reBatSwingTrigger
			return reBatSwingTrigger
		end

		local function func423(obj60)
			return tonumber(obj60:GetAttribute("RagdollEndTime")) or 0
		end

		combat.SetLead = function(param218)
			n11 = math.clamp((tonumber(param218) or -275) / 1000, -0.4, 0.1)
		end

		combat.SetSweep = function(param219)
			n12 = math.clamp((tonumber(param219) or 60) / 100, 0, 2.5)
		end

		combat.Ragdolled = function(param220)
			return func423(param220) > func421()
		end

		combat.SelfRagdolled = function()
			local flag450 = func423(localPlayer)
			if flag450 <= func421() then
				return false
			end
			return flag450 ~= list48.SpawnRagdoll
		end

		combat.Humanoid = function(instance23)
			if not instance23 then
				return nil
			end
			local value366 = nil

			for _, child in ipairs(instance23:GetChildren()) do
				if child:IsA("Humanoid") then
					if child.Health > 0 then
						return child
					end
					value366 = value366 or child
				end
			end

			return value366
		end

		local function func424(obj61)
			local gears = tbl1.Gears
			local directory = type(gears) == "table" and gears.Directory or nil
			local flag451 = type(directory) == "table"

			if flag451 then
				flag451 = directory[tostring(obj61:GetAttribute("GearName") or obj61.Name)]
			end

			flag451 = flag451 or nil
			local batControllerData = type(flag451) == "table" and flag451.BatControllerData or nil
			return type(batControllerData) == "table" and tonumber(batControllerData.RangeBonus) or 0
		end

		combat.Range = function(flag452)
			local n24 = workspace:GetAttribute("DragonEggEventActive") == true and 2.5 or 1
			return (n18 + n19 + (flag452 and func424(flag452) or 0)) * n24
		end

		combat.PickBat = function(obj62)
			local tool = obj62:FindFirstChildWhichIsA("Tool")
			if tool and str1.IsBatTool(tool) then
				return tool
			end
			local value367, value368, value369 = ipairs({ obj62, localPlayer:FindFirstChildOfClass("Backpack") })
			local n24 = -1
			local value370 = nil

			for _, value371 in value367, value368, value369 do
				if value371 then
					for _, child in ipairs(value371:GetChildren()) do
						if str1.IsBatTool(child) then
							local flag453 = func424(child)

							if flag453 > n24 then
								n24 = flag453
								value370 = child
							end
						end
					end
				end
			end

			return value370
		end

		local function func425(parent, obj63, instance24)
			if instance24.Parent == parent then
				return true
			end
			local equipAt = list48.EquipAt
			if os.clock() - equipAt < 0.2 then
				return false
			end
			list48.EquipAt = os.clock()

			pcall(function()
				obj63:EquipTool(instance24)
			end)

			if instance24.Parent ~= parent then
				pcall(function()
					instance24.Parent = parent
				end)
			end

			return instance24.Parent == parent
		end

		combat.Parts = function(obj)
			obj = obj and obj.Character
			local humanoidRootPart = obj and obj:FindFirstChild("HumanoidRootPart")
			local humanoid = obj and obj:FindFirstChildOfClass("Humanoid")
			if not humanoidRootPart or not humanoid or humanoid.Health <= 0 then
				return nil, nil
			end
			return obj, humanoidRootPart
		end

		combat.Hittable = function(obj)
			if not obj or obj == localPlayer or obj.Parent ~= Players then
				return false
			end
			local obj64, value372 = combat.Parts(obj)
			if not obj64 then
				return false
			end

			if obj64:GetAttribute("IsTrapped") == true or obj:GetAttribute("InBossArena") then
				return false
			end
			return not str1.InsideBase(value372.Position)
		end

		local function func426()
			local wallsAt = list48.WallsAt
			if os.clock() < wallsAt then
				return list48.Walls
			end
			list48.WallsAt = os.clock() + 5
			local walls = {}
			local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
			world = world and world:FindFirstChild("Build")

			if world then
				for _, child in ipairs(world:GetChildren()) do
					local collisions = child:FindFirstChild("COLLISIONS")
					collisions = collisions and collisions:FindFirstChild("GUARD NO COLLIDE")

					if collisions then
						for _, child2 in ipairs(collisions:GetChildren()) do
							if byName5[child2.Name] then
								if child2:IsA("BasePart") then
									table.insert(walls, child2)
								end

								for _, descendant in ipairs(child2:GetDescendants()) do
									if descendant:IsA("BasePart") then
										table.insert(walls, descendant)
									end
								end
							end
						end
					end
				end
			end

			list48.Walls = walls
			return walls
		end

		local function func427(param221)
			if param221.X <= param221.Y and param221.X <= param221.Z then
				return "X", "Y", "Z"
			end

			if param221.Y <= param221.Z then
				return "Y", "X", "Z"
			end
			return "Z", "X", "Y"
		end

		local function func428(param222)
			local n24 = math.abs(param222.RightVector.Y)
			local n25 = math.abs(param222.UpVector.Y)
			local n26 = math.abs(param222.LookVector.Y)
			if n24 >= n25 and n24 >= n26 then
				return "X"
			end

			if n26 <= n25 then
				return "Y"
			end
			return "Z"
		end

		local function func429(tbl230, tbl231, flag454, param223)
			if flag454 == param223 then
				return true
			end
			local n24 = tbl231[flag454] + n21
			return math.abs(tbl230[flag454]) <= n24
		end

		local function func430(param224, param225)
			for _, item107 in ipairs(func426()) do
				if item107.Parent then
					local cFrame = item107.CFrame
					local size = item107.Size
					local value373, value374, value375 = func427(size)
					local value376 = func428(cFrame)
					local n24 = size / 2
					local tbl232 = cFrame:PointToObjectSpace(param225)

					if func429(tbl232, n24, value374, value376) and func429(tbl232, n24, value375, value376) then
						local tbl233 = cFrame:PointToObjectSpace(param224)
						local n25 = math.abs(tbl233[value373])
						local n26 = list48.WallSide[item107]

						if n25 >= n24[value373] + n21 * 0.5 or n26 == nil and n25 >= n24[value373] then
							n26 = tbl233[value373] >= 0 and 1 or -1
							list48.WallSide[item107] = n26
						elseif n26 == nil then
							n26 = tbl233[value373] >= 0 and 1 or -1
						end

						local n27 = n24[value373] + n21

						if tbl232[value373] * n26 < n27 then
							local tbl234 = { X = tbl232.X, Y = tbl232.Y, Z = tbl232.Z, [value373] = n26 * n27 }
							param225 = cFrame:PointToWorldSpace(Vector3.new(tbl234.X, tbl234.Y, tbl234.Z))
						end
					end
				end
			end

			return param225
		end

		combat.KeepOffWalls = function(num98, param226)
			local num99 = func430(num98, param226)
			local n24 = num99 - num98

			if n21 < n24.Magnitude then
				local value377 = num98

				for i = 1, 6 do
					local n25 = num98 + n24 * i / n22
					local num100 = func430(value377, n25)
					if (num100 - n25).Magnitude > 0.01 then
						return func430(num98, num100)
					end
					value377 = num100
				end
			end

			return num99
		end

		combat.ResetWalls = function()
			table.clear(list48.WallSide)
		end

		local n24 = 0
		local value378 = nil

		local function func431(num101)
			local character = localPlayer.Character


			if os.clock() - n24 > 0.5 or character ~= value378 then
				n24 = os.clock()
				value378 = character
				local filterDescendantsInstances = {}

				for _, player in ipairs(Players:GetPlayers()) do
					if player.Character then
						table.insert(filterDescendantsInstances, player.Character)
					end
				end

				raycastParams.FilterDescendantsInstances = filterDescendantsInstances
			end

			local hit = workspace:Raycast(num101 + Vector3.new(0, 60, 0), Vector3.new(0, -400, 0), raycastParams)
			if hit and num101.Y < hit.Position.Y + n23 then
				return Vector3.new(num101.X, hit.Position.Y + n23, num101.Z)
			end
			return num101
		end

		local function func432(param227, part19)
			local flag455 = list48.Tracks[param227]

			if not flag455 then
				flag455 = { Samples = {}, Smooth = nil, Heading = nil }
				list48.Tracks[param227] = flag455
			end

			local now = os.clock()
			local samples = flag455.Samples
			table.insert(samples, { Time = now, Position = part19.Position })

			while #samples > 2 and now - samples[1].Time > n20 do
				table.remove(samples, 1)
			end

			local assemblyLinearVelocity = part19.AssemblyLinearVelocity
			local first9 = samples[1]
			local n25 = now - first9.Time

			if n25 >= 0.03 then
				local n26 = (part19.Position - first9.Position) / n25

				if n26.Magnitude <= 1500 and assemblyLinearVelocity.Magnitude <= n26.Magnitude * 1.4 then
					assemblyLinearVelocity = n26
				end
			end

			local vector = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)
			flag455.Smooth = flag455.Smooth and flag455.Smooth:Lerp(vector, 0.25) or vector
			local smooth = flag455.Smooth

			if smooth.Magnitude > 1 then
				local heading = flag455.Heading and flag455.Heading:Lerp(smooth.Unit, 0.25) or smooth.Unit
				flag455.Heading = heading.Magnitude > 0.01 and heading.Unit or smooth.Unit
			end

			return assemblyLinearVelocity, vector, smooth, flag455
		end

		local function func433()
			local n25 = 0

			for _, stat in ipairs(list48.Stats) do
				n25 += stat.Shots
			end

			local option = list48.Option
			local n26 = -math.huge

			for i, stat in ipairs(list48.Stats) do
				local n27 = stat.Shots + 1
				local n28 = (stat.Hits + 1) / (stat.Shots + 2) + math.sqrt(2 * math.log(n25 + 2) / n27) * 0.35

				if n28 > n26 then
					n26 = n28
					option = i
				end
			end

			list48.Option = option
			return option
		end

		local function func434()
			local now = os.clock()

			for i = #list48.Pending, 1, -1 do
				local num102 = list48.Pending[i]
				local value379 = list48.Stats[num102.Option]
				local n25 = num102.RagdollBefore + 0.01

				if func423(num102.Target) > n25 then
					value379.Hits = value379.Hits + 1
					value379.Shots = value379.Shots + 1
					table.remove(list48.Pending, i)
				elseif num102.Wait < now - num102.At then
					if num102.CooldownBefore + 0.01 < (num102.Tool and tonumber(num102.Tool:GetAttribute("CooldownEndTime")) or 0) then
						value379.Shots = value379.Shots + 1
					end

					table.remove(list48.Pending, i)
				end
			end
		end

		combat.Plan = function(flag456, part20, part21, flag457)
			if not part21 then
				local value380
				value380, part21 = combat.Parts(flag456)
			end

			if not part21 or not part21.Parent then
				return nil
			end
			local n25 = math.clamp(localPlayer:GetNetworkPing(), 0, 1)
			local n26 = math.clamp(n25 + n8, 0.05, 0.35)
			local num103, value381, num104, value382 = func432(flag456 or part21, part21)
			local result79 = func433()
			local entry21 = tbl229[result79]
			local position = part21.Position
			local n27 = position + num103 * math.max(0, entry21 + n25 - n26)
			local n28 = position + num103 * (entry21 + n25)
			local magnitude = num104.Magnitude
			local heading = value382.Heading

			if not heading then
				local vector = Vector3.new(part20.Position.X - position.X, 0, part20.Position.Z - position.Z)
				heading = vector.Magnitude > 0.1 and vector.Unit or Vector3.new(0, 0, 1)
			end

			local character = localPlayer.Character
			local num105 = combat.Range(character and combat.PickBat(character) or nil)
			local n29 = position + num104 * (n25 + entry21 + n10 + n11) + (magnitude > 1 and num104.Unit * n13 * n12 or Vector3.zero)
			local n30 = math.max(5, math.min(num105 * 0.7, 6 + magnitude * 0.07)) * n12
			local now = os.clock()
			local n31 = (math.sin(now * 2 * 3.1415926535897931 / n14) * 0.5 + 0.5) * n30
			local n32 = math.sin(now * 2 * 3.1415926535897931 / n15) * n16
			local vector = Vector3.new(-heading.Z, 0, heading.X)

			if vector:Dot(part20.Position - n29) < 0 then
				vector = -vector
			end

			local n33 = n29 + heading * n31 + vector * (value381.Magnitude < n17 and 3 or 1.5) + Vector3.new(0, n32, 0)
			local position2 = part20.Position

			if not flag457 then
				position2 = combat.KeepOffWalls(part20.Position, func431(Vector3.new(n33.X, n33.Y, position.Z)))
			end

			return {
				Goal = position2,
				Velocity = Vector3.new(num104.X, 0, num104.Z),
				Face = n28,
				Current = n28,
				Historical = n27,
				Option = result79,
				Distance = (position - part20.Position).Magnitude,
			}
		end

		combat.Steer = function(obj, param228, num106, param229, param230)
			local n25 = math.max(param230, 0.0041666666666666666)
			local velocity = param228.Velocity
			local n26 = velocity + (param228.Goal - obj.Position) / math.max(0.12, n25)
			local n27 = math.min(num106 + velocity.Magnitude, param229)

			if n26.Magnitude > n27 then
				n26 = n26.Unit * n27
			end

			local position = obj.Position
			local n28 = position + n26 * n25
			local num107 = combat.KeepOffWalls(position, n28)

			if (num107 - n28).Magnitude > 0.01 then
				n26 = (num107 - position) / n25
			end

			local num108 = combat.KeepOffWalls(position, position)

			if (num108 - position).Magnitude > 0.01 then
				n26 = (num108 - position) / math.max(0.12, n25)
			end

			local assemblyLinearVelocity = n26 + Vector3.new(0, workspace.Gravity * n25 * 0.5, 0)

			pcall(function()
				local vector = Vector3.new(param228.Face.X - position.X, 0, param228.Face.Z - position.Z)

				if vector.Magnitude > 0.05 then
					obj.CFrame = CFrame.lookAt(position, position + vector.Unit)
				end

				obj.AssemblyLinearVelocity = assemblyLinearVelocity
				obj.AssemblyAngularVelocity = Vector3.zero
			end)
		end

		combat.TryHit = function(obj, flag458)
			func434()
			if workspace:GetAttribute("PvPDisabled") == true then
				return "Player hits are off right now"
			end
			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local flag459 = combat.Humanoid(character)
			if not humanoidRootPart or not flag459 or flag459.Health <= 0 then
				return "Waiting for your character"
			end
			local obj65 = combat.PickBat(character)
			if not obj65 then
				return "No bat found"
			end

			if not func425(character, flag459, obj65) then
				return "Equipping " .. tostring(obj65:GetAttribute("GearName") or obj65.Name)
			end

			if not combat.Hittable(obj) or combat.Ragdolled(obj) then
				return nil
			end
			flag458 = flag458 or combat.Plan(obj, humanoidRootPart)
			if not flag458 then
				return nil
			end
			local n25 = combat.Range(obj65) - n9
			local n26 = humanoidRootPart.Position - humanoidRootPart.AssemblyLinearVelocity * n10
			if (flag458.Historical - n26).Magnitude > n25 and (flag458.Current - n26).Magnitude > n25 then
				return nil
			end
			local result80 = func422()
			if not result80 then
				return nil
			end
			local n27 = math.clamp(localPlayer:GetNetworkPing(), 0, 1)
			local n28 = tonumber(obj65:GetAttribute("CooldownEndTime")) or 0
			if func421() < n28 - n27 * 0.5 then
				return nil
			end
			local lastFire = list48.LastFire
			if os.clock() - lastFire < math.max(0.12, n27 * 1.5) then
				return nil
			end
			list48.LastFire = os.clock()
			list48.Trace = list48.Trace + 1

			table.insert(list48.Pending, {
				Target = obj,
				Option = flag458.Option,
				At = os.clock(),
				Wait = math.max(0.5, n27 * 2 + 0.3),
				RagdollBefore = func423(obj),
				CooldownBefore = n28,
				Tool = obj65,
			})

			local formatted16 = string.format("%d:%d:%d", localPlayer.UserId, list48.Trace, math.floor(func421() * 1000))

			pcall(function()
				result80:FireServer(obj, formatted16)
			end)

			return "Hitting " .. obj.DisplayName
		end

		combat.ReadyBat = function()
			local character = localPlayer.Character
			local flag460 = combat.Humanoid(character)
			if not character or not flag460 or flag460.Health <= 0 then
				return false
			end
			local flag461 = combat.PickBat(character)
			return flag461 ~= nil and func425(character, flag460, flag461)
		end

		combat.Swing = function()
			if str1.Steal.Active or str1.Steal.Carrying then
				return false
			end
			local lastFire = list48.LastFire
			local startTime = os.clock() - lastFire < 0.3

			if not startTime then
				startTime = os.clock() - (list48.LastSwing or 0) < 0.15
			end

			if startTime then
				return false
			end
			local character = localPlayer.Character
			local flag462 = combat.Humanoid(character)
			if not character or not flag462 or flag462.Health <= 0 then
				return false
			end
			local obj66 = combat.PickBat(character)
			if not obj66 or not func425(character, flag462, obj66) then
				return false
			end
			list48.LastSwing = os.clock()

			pcall(function()
				obj66:Activate()
			end)

			return true
		end

		combat.HolderOf = function(childName15)
			local obj67 = workspace:FindFirstChild(childName15)
			if not obj67 then
				return nil
			end

			for _, descendant in ipairs(obj67:GetDescendants()) do
				if descendant:IsA("JointInstance") or descendant:IsA("WeldConstraint") or descendant:IsA("RigidConstraint") then
					local ok, result, result2 = pcall(function()
						return descendant.Part0, descendant.Part1
					end)

					if ok then
						for _, item108 in ipairs({ result, result2 }) do
							if typeof(item108) == "Instance" and not item108:IsDescendantOf(obj67) then
								local model = item108:FindFirstAncestorOfClass("Model")

								if model then
									model = Players:GetPlayerFromCharacter(model) or Players:FindFirstChild(model.Name)
								end

								local obj68 = model or nil
								if obj68 and obj68 ~= localPlayer and obj68:IsA("Player") then
									return obj68
								end
							end
						end
					end
				end
			end

			return nil
		end

		task.spawn(function()
			while not str1.CombatDisposed do
				local holders = {}

				if str1.CombatWantsHolders then
					local eggState = tbl1.EggState

					if type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function" then
						local ok, result = pcall(eggState.ReadFieldEggs)
						local records = ok and type(result) == "table" and result.Records or nil

						if type(records) == "table" then
							for _, record in pairs(records) do
								if type(record) == "table" and record.State == "Carried" and type(record.Uid) == "string" then
									local value383 = combat.HolderOf(record.Uid)

									if value383 then
										holders[value383] = true
									end
								end
							end
						end
					end
				end

				list48.Holders = holders
				task.wait(0.3)
			end
		end)

		combat.IsHolder = function(param231)
			return list48.Holders[param231] == true
		end

		local tbl235 = {}

		combat.OnNewLife = function(param232)
			table.insert(tbl235, param232)
		end

		local function func435()
			table.clear(list48.Pending)
			list48.LastFire = 0
			list48.LastSwing = 0
			list48.EquipAt = 0
			table.clear(list48.Tracks)
			table.clear(list48.WallSide)
			list48.SpawnRagdoll = func423(localPlayer)

			for _, item109 in ipairs(tbl235) do
				pcall(item109)
			end
		end

		local characterAdded = localPlayer.CharacterAdded
		local connect = characterAdded.Connect
		local tbl236 = { localPlayer.CharacterRemoving:Connect(func435), connect(characterAdded, func435) }

		func4(function()
			str1.CombatDisposed = true

			for _, item110 in ipairs(tbl236) do
				pcall(function()
					item110:Disconnect()
				end)
			end
		end)
	end

	local flag463

	do
		local combat2 = str1.Combat
		local tbl237 = { "Nearest", "Egg Holders", "Specific Player" }
		local n18 = 0.7
		local str36 = "No other players"

		flag463 = {
			Handles = {},
			AuraHandle = nil,
			Row = nil,
			Picker = nil,
			TargetMode = tbl237[1],
			Picked = nil,
			LabelToName = {},
			Speed = 400,
			MaxSpeed = 750,
			Target = nil,
			Plan = nil,
			Moving = false,
			Status = "Idle",
			Shown = nil,
			NamesDirty = true,
		}

		local function func436()
			for i, item111 in ipairs(tbl237) do
				if str1.Toggle(flag463.Handles[i], false) then
					return item111
				end
			end

			return nil
		end

		local function func437()
			return str1.Toggle(flag463.AuraHandle, false) == true
		end

		str1.CombatActive = function()
			return func436() ~= nil or func437()
		end

		local function func438(param233)
			if not combat2.Hittable(param233) then
				return false
			end

			if flag463.TargetMode == tbl237[2] then
				return combat2.IsHolder(param233)
			end

			if flag463.TargetMode == tbl237[3] then
				return flag463.Picked ~= nil and param233.Name == flag463.Picked
			end
			return true
		end

		local function func439(num109)
			local target = flag463.Target
			local magnitude

			if target and func438(target) then
				local value384, value385 = combat2.Parts(target)
				magnitude = (value385.Position - num109).Magnitude
			else
				target = nil
				magnitude = math.huge
			end

			local huge = math.huge
			local value386 = nil

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= target and func438(player) and not combat2.Ragdolled(player) then
					local value387, value388 = combat2.Parts(player)
					local magnitude2 = (value388.Position - num109).Magnitude

					if magnitude2 < huge then
						huge = magnitude2
						value386 = player
					end
				end
			end

			if target then
				if value386 and not combat2.Ragdolled(target) and huge < magnitude * n18 then
					return value386
				end
				return target
			end

			return value386
		end

		local function func440(num110, flag464)
			local value389 = nil

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= localPlayer then
					local character = player.Character
					character = character and character:FindFirstChild("HumanoidRootPart")

					if character then
						local magnitude = (character.Position - num110).Magnitude

						if magnitude < flag464 and combat2.Hittable(player) and not combat2.Ragdolled(player) then
							flag464 = magnitude
							value389 = player
						end
					end
				end
			end

			return value389, flag464
		end

		local function func441()
			flag463.Plan = nil

			if flag463.Moving then
				flag463.Moving = false
				str1.EndFlight()
				str1.GodMode(false)
				str1.Shield("combat", false)
				combat2.ResetWalls()
			end

			str1.ReleaseMovement("combat")
		end

		combat2.OnNewLife(function()
			flag463.AuraVictim = nil
			flag463.Target = nil
			flag463.Plan = nil
			pcall(func441)
		end)

		local function func442()
			local movement = str1.Movement
			return str1.Steal.Active or str1.Steal.Carrying or str1.Steal.Wanted and str1.Toggle(value2, false) or movement.Owner ~= nil and movement.Owner ~= "combat" and movement.Owner ~= "treadmill"
		end

		local function func443(part22)
			local character = localPlayer.Character
			local n19 = combat2.Range(character and combat2.PickBat(character) or nil) + 6
			local str37, flag465 = func440(part22.Position, n19 + 24)

			if not str37 or flag465 > n19 then
				flag463.AuraVictim = nil

				if str37 then
					combat2.ReadyBat()
				end

				flag463.Status = "Aura ready, nobody in reach"
				return
			end

			flag463.AuraVictim = str37
			flag463.Status = combat2.TryHit(str37, combat2.Plan(str37, part22, nil, true)) or "Aura on " .. str37.DisplayName
		end

		local function func444()
			local result81 = func436()

			if result81 and result81 ~= flag463.TargetMode then
				flag463.TargetMode = result81
				flag463.Target = nil
			end

			str1.CombatWantsHolders = result81 == tbl237[2]
			local result82 = func437()
			local flag466 = not result81

			if flag466 then
				if flag463.Target or flag463.Moving then
					flag463.Target = nil
					func441()
				end
			end

			if flag466 and not result82 then
				flag463.Status = "Idle"
				return
			end
			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local flag467 = combat2.Humanoid(character)

			if not humanoidRootPart or not flag467 or flag467.Health <= 0 then
				flag463.Target = nil
				func441()
				flag463.Status = "Waiting for your character"
				return
			end

			if flag466 then
				func443(humanoidRootPart)
				return
			end
			local position6 = func439(humanoidRootPart.Position)
			flag463.Target = position6

			if not position6 then
				func441()
				if result82 then
					func443(humanoidRootPart)
					return
				end
				flag463.Status = result81 == tbl237[2] and "Waiting for someone to hold an egg" or result81 == tbl237[3] and "Picked player is not reachable" or "No player to hit"
				return
			end

			local flag468 = combat2.Plan(position6, humanoidRootPart)
			local flag469 = result81 ~= tbl237[2]

			if not func442() and (flag469 or not combat2.SelfRagdolled()) and str1.ClaimMovement("combat") and not str1.AntiGuard.Busy then
				if not flag463.Moving then
					flag463.Moving = true
					str1.Shield("combat", true)
					str1.GodMode(true)
					str1.BeginFlight()
				end

				str1.GodTick()
				flag463.Plan = flag468
			else
				if flag463.Moving then
					func441()
				end

				flag463.Plan = nil
			end

			local str38 = combat2.TryHit(position6, flag468, flag469)
			local n19 = flag468 and math.floor(flag468.Distance + 0.5) or 0

			if str38 then
				flag463.Status = str38 .. string.format("  %d studs", n19)
			elseif func442() then
				flag463.Status = string.format("Waiting for Auto Steal, near %s", position6.DisplayName)
			else
				flag463.Status = string.format("Chasing %s  %d studs", position6.DisplayName, n19)
			end
		end

		local function func445()
			local tbl238 = {}

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= localPlayer then
					table.insert(tbl238, player)
				end
			end

			table.sort(tbl238, function(player2, player3)
				return string.lower(player2.DisplayName) < string.lower(player3.DisplayName)
			end)

			local tbl239 = {}

			for _, item112 in ipairs(tbl238) do
				tbl239[item112.DisplayName] = (tbl239[item112.DisplayName] or 0) + 1
			end

			local tbl240 = {}
			local tbl241 = {}

			for _, item113 in ipairs(tbl238) do
				local displayName = item113.DisplayName

				if tbl239[displayName] > 1 then
					displayName = string.format("%s (@%s)", item113.DisplayName, item113.Name)
				end

				table.insert(tbl240, displayName)
				tbl241[displayName] = item113.Name
			end

			if #tbl240 == 0 then
				tbl240[1] = str36
			end

			return tbl240, tbl241
		end

		local function func446(param234)
			for k, value390 in pairs(flag463.LabelToName) do
				if value390 == param234 then
					return k
				end
			end

			return nil
		end

		local connection = RunService.PreSimulation:Connect(function(deltaTime)
			local plan = flag463.Plan
			if not plan or not flag463.Moving then
				return
			end
			local value391 = str1.Root()

			if value391 then
				combat2.Steer(value391, plan, flag463.Speed, math.max(flag463.Speed, flag463.MaxSpeed), deltaTime)
			end
		end)

		local n19 = 0.05
		local n20 = 0

		local connection2 = RunService.Heartbeat:Connect(function()
			local flag470 = func436() ~= nil
			local result83 = func437()

			if not result83 then
				flag463.AuraVictim = nil
			end

			local now = os.clock()

			if flag470 or not result83 or now >= n20 then
				if result83 and not flag470 then
					n20 = now + n19
				end

				if not pcall(func444) then
					flag463.Status = "Retrying"
				end
			end

			if flag470 or result83 and flag463.AuraVictim ~= nil then
				pcall(combat2.Swing)
			end

			local row = flag463.Row

			if row and flag463.Shown ~= flag463.Status and type(row.Set) == "function" then
				flag463.Shown = flag463.Status
				pcall(row.Set, row, flag463.Status)
			end

			local picker = flag463.Picker

			if flag463.NamesDirty and picker and type(picker.SetOptions) == "function" then
				flag463.NamesDirty = false
				local tbl242, value392 = func445()
				flag463.LabelToName = value392
				pcall(picker.SetOptions, picker, tbl242, flag463.Picked and func446(flag463.Picked) or tbl242[1], false)
			end
		end)

		local connection3 = Players.PlayerAdded:Connect(function()
			flag463.NamesDirty = true
		end)

		local connection4 = Players.PlayerRemoving:Connect(function(player)
			flag463.NamesDirty = true

			if flag463.Target == player then
				flag463.Target = nil
			end
		end)

		func4(function()
			for _, item114 in ipairs({ connection, connection2, connection3, connection4 }) do
				pcall(function()
					item114:Disconnect()
				end)
			end

			flag463.Target = nil
			func441()
		end)

		local function func447(param235, message2)
			if str1.Toggle(param235, false) and str1.Toggle(str1.InvisibilityHandle, false) then
				str1.UiDefer(function()
					pcall(param235.Set, param235, false, false)
					str1.Notify(message2, "Turn off Invisibility first, both cannot be on at the same time")
				end)

				return true
			end

			return false
		end

		flag463.Row = obj37:CreateText({ Name = "Hit Status", Text = "Idle" })
		local value393 = obj2:CreateExclusiveGroup({ Name = "Chilli Combat Targets", MaxActive = 1 })

		for i, item115 in ipairs({ "Auto Hit Nearest Player", "Auto Hit Egg Holders", "Auto Hit Specific Player" }) do
			local value394 = nil

			value394 = obj37:CreateToggle({
				Name = item115,
				Default = false,
				Callback = function()
					func447(value394, item115)
				end,
			})

			pcall(value394.JoinExclusiveGroup, value394, value393)
			flag463.Handles[i] = value394
		end

		local tbl243, value395 = func445()
		flag463.LabelToName = value395

		flag463.Picker = obj37:CreateDropdown({
			Name = "Hit Player",
			Options = tbl243,
			Default = tbl243[1],
			SubOf = flag463.Handles[3],
			Callback = function(value)
				flag463.Picked = flag463.LabelToName[tostring(value)]
				flag463.Target = nil
			end,
		})

		flag463.AuraHandle = obj37:CreateToggle({
			Name = "Hit Aura",
			Default = false,
			Callback = function()
				func447(flag463.AuraHandle, "Hit Aura")
			end,
		})

		pcall(flag463.AuraHandle.JoinExclusiveGroup, flag463.AuraHandle, value393)
		local value396 = obj37:CreateLabel({ Name = "Chase Settings", Text = "Chase Settings" })

		obj37:CreateSlider({
			Name = "Hit Tween Speed",
			SubOf = value396,
			Min = 100,
			Max = 1000,
			Default = 400,
			Increment = 10,
			Unit = "studs/s",
			Callback = function(value)
				flag463.Speed = math.clamp(tonumber(value) or 400, 100, 1000)
			end,
		})

		obj37:CreateSlider({
			Name = "Hit Max Speed",
			SubOf = value396,
			Min = 100,
			Max = 1000,
			Default = 750,
			Increment = 10,
			Unit = "studs/s",
			Callback = function(value)
				flag463.MaxSpeed = math.clamp(tonumber(value) or 750, 100, 1000)
			end,
		})

		obj37:CreateSlider({
			Name = "Hit Lead",
			SubOf = value396,
			Note = "Stand further ahead of the target (+) or closer to them (-)",
			Min = -400,
			Max = 100,
			Default = -275,
			Increment = 1,
			Callback = function(value)
				combat2.SetLead(value)
			end,
		})

		obj37:CreateSlider({
			Name = "Hit Sweep",
			SubOf = value396,
			Note = "How far you move back and forth in front of the target",
			Min = 0,
			Max = 250,
			Default = 60,
			Increment = 1,
			Unit = "%",
			Callback = function(value)
				combat2.SetSweep(value)
			end,
		})
	end

	do
		local n18 = 2
		local value397 = nil

		local function func448()
			local getState = obj2.GetState
			return obj2:GetState("Quick Pinned Features"), getState(obj2, "Quick Pin Groups")
		end

		local function func449()
			local tbl244 = {}

			for _, item116 in ipairs({ flag463.Handles[1], flag463.Handles[2], flag463.AuraHandle }) do
				local ok, result = pcall(function()
					return item116:GetQuickPath()
				end)

				if ok and type(result) == "string" then
					table.insert(tbl244, result)
				end
			end

			return tbl244
		end

		local function func450()
			local obj69, obj70 = func448()
			if not obj69 or not obj70 then
				return false
			end
			local value398 = obj69:Get()
			local tbl245 = obj70:Get()
			if type(value398) ~= "table" or type(tbl245) ~= "table" then
				return false
			end
			local result84 = func449()
			if #result84 == 0 then
				return false
			end

			for _, item117 in ipairs(result84) do
				if not table.find(value398, item117) or tonumber(tbl245[item117]) ~= n18 then
					return false
				end
			end

			return true
		end

		local function func451()
			if value397 and type(value397.SetActionText) == "function" then
				pcall(value397.SetActionText, value397, func450() and "Remove" or "Add")
			end
		end

		local function func452()
			local obj71, obj72 = func448()
			if not obj71 or not obj72 then
				str1.Notify("Quick Bar", "The Quick Bar is not ready yet, try again in a moment")
				return
			end
			local result85 = func450()
			local tbl246 = {}
			local tbl247 = {}
			local value399 = obj71:Get()

			if type(value399) == "table" then
				for i, item118 in ipairs(value399) do
					tbl246[i] = item118
				end
			end

			local value400 = obj72:Get()

			if type(value400) == "table" then
				for k, value401 in pairs(value400) do
					tbl247[k] = value401
				end
			end

			for _, item119 in ipairs(func449()) do
				local foundAt3 = table.find(tbl246, item119)

				if result85 then
					if foundAt3 then
						table.remove(tbl246, foundAt3)
					end

					tbl247[item119] = nil
				else
					tbl247[item119] = n18

					if not foundAt3 then
						table.insert(tbl246, item119)
					end
				end
			end

			obj72:Set(tbl247)
			obj71:Set(tbl246)
			func451()
			str1.Notify("Quick Bar", result85 and "Removed the hit toggles from Quick Bar 2" or "Added the hit toggles to Quick Bar 2")
		end

		value397 = obj37:CreateButton({
			Name = "Add/Remove Hits On Quick Bar 2",
			Note = "Pin or unpin the hit toggles on Quick Bar 2",
			ButtonText = "Add",
			ConfirmText = "Done!",
			Callback = function()
				str1.UiDefer(func452)
			end,
		})

		task.delay(3, function()
			str1.UiDefer(func451)
		end)
	end

	espSection = str1.EspSection

	local function func453(param236, param237)
		local ok, result = pcall(Font.new, param236, param237, Enum.FontStyle.Normal)
		return ok and result or nil
	end

	flag2 = {
		MainFont = func453("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold),
		StatusFont = func453("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular),
		Sequence = function(list49)
			local arr3 = table.create(#list49)

			for i, item120 in ipairs(list49) do
				arr3[i] = ColorSequenceKeypoint.new(item120[1], item120[2])
			end

			return ColorSequence.new(arr3)
		end,
	}

	local color
	color = Color3.fromRGB
	local sequence2
	sequence2 = flag2.Sequence
	local palettes
	palettes = {}

	do
		local gold = {}
		local tbl248 = { 0, color(255, 231, 158) }
		local tbl249 = { 0.4, color(255, 196, 66) }
		local tbl250 = { 1, color(214, 142, 12) }
		local tbl251 = { tbl248, tbl249, tbl250 }
		gold.Text = sequence2(tbl251)
		local tbl252 = { 0, color(122, 76, 0) }
		local tbl253 = { 0.55, color(62, 38, 0) }
		local tbl254 = { 1, color(20, 12, 0) }
		local tbl255 = { tbl252, tbl253, tbl254 }
		gold.Stroke = sequence2(tbl255)
		gold.Outline = color(255, 232, 152)
		palettes.Gold = gold
	end

	do
		local orange = {}
		local tbl256 = { 0, color(255, 198, 132) }
		local tbl257 = { 0.4, color(255, 146, 40) }
		local tbl258 = { 1, color(206, 92, 0) }
		local tbl259 = { tbl256, tbl257, tbl258 }
		orange.Text = sequence2(tbl259)
		local tbl260 = { 0, color(112, 54, 0) }
		local tbl261 = { 0.55, color(56, 27, 0) }
		local tbl262 = { 1, color(18, 8, 0) }
		local tbl263 = { tbl260, tbl261, tbl262 }
		orange.Stroke = sequence2(tbl263)
		orange.Outline = color(255, 194, 112)
		palettes.Orange = orange
	end

	do
		local red = {}
		local tbl264 = { 0, color(255, 105, 105) }
		local tbl265 = { 0.4, color(255, 28, 40) }
		local tbl266 = { 1, color(184, 0, 18) }
		local tbl267 = { tbl264, tbl265, tbl266 }
		red.Text = sequence2(tbl267)
		local tbl268 = { 0, color(124, 0, 15) }
		local tbl269 = { 0.55, color(61, 0, 9) }
		local tbl270 = { 1, color(18, 0, 3) }
		local tbl271 = { tbl268, tbl269, tbl270 }
		red.Stroke = sequence2(tbl271)
		red.Outline = color(255, 128, 138)
		palettes.Red = red
	end

	do
		local accent = {}
		local tbl272 = { 0, color(170, 255, 160) }
		local tbl273 = { 0.45, color(58, 255, 55) }
		local tbl274 = { 1, color(20, 109, 0) }
		local tbl275 = { tbl272, tbl273, tbl274 }
		accent.Text = sequence2(tbl275)
		local tbl276 = { 0, color(10, 52, 6) }
		local tbl277 = { 1, color(3, 16, 0) }
		local tbl278 = { tbl276, tbl277 }
		accent.Stroke = sequence2(tbl278)
		accent.Outline = color(58, 255, 55)
		palettes.Accent = accent
	end

	do
		local sheen = {}
		local tbl279 = { 0, color(255, 255, 255) }
		local tbl280 = { 0.5, color(222, 222, 222) }
		local tbl281 = { 1, color(255, 255, 255) }
		local tbl282 = { tbl279, tbl280, tbl281 }
		sheen.Text = sequence2(tbl282)
		local tbl283 = { 0, color(8, 8, 8) }
		local tbl284 = { 1, color(8, 8, 8) }
		local tbl285 = { tbl283, tbl284 }
		sheen.Stroke = sequence2(tbl285)
		sheen.Outline = color(255, 255, 255)
		palettes.Sheen = sheen
	end

	flag2.Palettes = palettes

	flag2.PaletteFromColor = function(obj73)
		local color2 = Color3.new(1, 1, 1)
		local color3 = Color3.new(0, 0, 0)
		local tbl286 = {}
		local sequence3 = flag2.Sequence
		local tbl287 = { 0, obj73:Lerp(color2, 0.5) }
		local tbl288 = { 0.4, obj73:Lerp(color2, 0.1) }
		local tbl289 = { 1, obj73:Lerp(color3, 0.25) }
		local tbl290 = { tbl287, tbl288, tbl289 }
		tbl286.Text = sequence3(tbl290)
		local sequence4 = flag2.Sequence
		local tbl291 = { 0, obj73:Lerp(color3, 0.55) }
		local tbl292 = { 0.55, obj73:Lerp(color3, 0.75) }
		local tbl293 = { 1, obj73:Lerp(color3, 0.92) }
		local tbl294 = { tbl291, tbl292, tbl293 }
		tbl286.Stroke = sequence4(tbl294)
		tbl286.Outline = obj73:Lerp(color2, 0.25)
		return tbl286
	end

	flag2.SizeScale = 1
	local tbl295 = {}

	flag2.OnSizeChanged = function(param238)
		table.insert(tbl295, param238)
	end

	flag2.SetSizeScale = function(sizeScale)
		if flag2.SizeScale == sizeScale then
			return
		end
		flag2.SizeScale = sizeScale

		for _, item121 in ipairs(tbl295) do
			pcall(item121)
		end
	end

	flag2.RowHeight = function(flag471)
		local currentCamera = workspace.CurrentCamera
		return math.max(6, math.floor(math.clamp((currentCamera and currentCamera.ViewportSize.Y or 1080) * 0.014, 13, 19) * (flag471 or flag2.SizeScale)))
	end

	flag2.ScaledWidth = function(num111, flag472)
		return math.max(30, math.floor(num111 * (flag472 or flag2.SizeScale)))
	end

	flag2.CreateRuntime = function()
		local screenGui = Instance.new("ScreenGui")
		screenGui.Name = func3()
		screenGui.Archivable = false
		screenGui.ResetOnSpawn = false
		screenGui.IgnoreGuiInset = true
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui.DisplayOrder = 48
		screenGui.Parent = value1
		return screenGui
	end

	flag2.CreateTag = function(parent, maxDistance)
		local billboardGui = Instance.new("BillboardGui")
		billboardGui.Name = func3()
		billboardGui.AlwaysOnTop = true
		billboardGui.LightInfluence = 0
		billboardGui.MaxDistance = maxDistance
		local frame = Instance.new("Frame")
		frame.Name = func3()
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.Size = UDim2.fromScale(1, 1)
		frame.Parent = billboardGui
		local uiListLayout = Instance.new("UIListLayout")
		uiListLayout.Name = func3()
		uiListLayout.FillDirection = Enum.FillDirection.Vertical
		uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout.Parent = frame
		billboardGui.Parent = parent
		return billboardGui, frame
	end

	flag2.CreateTextRow = function(parent, fontFace, layoutOrder, param239)
		local frame = Instance.new("Frame")
		frame.Name = func3()
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.Size = UDim2.fromScale(1, param239)
		frame.LayoutOrder = layoutOrder
		frame.Parent = parent

		local function createTextLabel(zIndex)
			local textLabel = Instance.new("TextLabel")
			textLabel.Name = func3()
			textLabel.BackgroundTransparency = 1
			textLabel.Size = UDim2.fromScale(1, 1)
			textLabel.Text = ""
			textLabel.TextScaled = true
			textLabel.TextStrokeTransparency = 1
			textLabel.TextXAlignment = Enum.TextXAlignment.Center
			textLabel.TextYAlignment = Enum.TextYAlignment.Center
			textLabel.ZIndex = zIndex

			if fontFace then
				textLabel.FontFace = fontFace
			else
				textLabel.Font = Enum.Font.GothamBold
			end

			textLabel.Parent = frame
			return textLabel
		end

		local textLabel6 = createTextLabel(2)
		textLabel6.Position = UDim2.fromOffset(1, 1)
		textLabel6.TextColor3 = Color3.new(0, 0, 0)
		textLabel6.TextTransparency = 0.1
		local textLabel7 = createTextLabel(3)
		textLabel7.TextColor3 = Color3.new(1, 1, 1)
		local uiStroke = Instance.new("UIStroke")
		uiStroke.Name = func3()
		uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		uiStroke.LineJoinMode = Enum.LineJoinMode.Round
		uiStroke.Color = Color3.new(1, 1, 1)
		uiStroke.Transparency = 0.05

		uiStroke.Thickness = pcall(function()
			uiStroke.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
		end) and 0.05 or 1.2

		uiStroke.Parent = textLabel7
		local uiGradient = Instance.new("UIGradient")
		uiGradient.Name = func3()
		uiGradient.Rotation = 90
		uiGradient.Parent = uiStroke
		local uiGradient2 = Instance.new("UIGradient")
		uiGradient2.Name = func3()
		uiGradient2.Rotation = 90
		uiGradient2.Parent = textLabel7
		return { Holder = frame, Shadow = textLabel6, Label = textLabel7, StrokeGradient = uiGradient, TextGradient = uiGradient2, Palette = nil }
	end

	flag2.SetRow = function(obj, text, palette)
		if obj.Label.Text ~= text then
			obj.Label.Text = text
			obj.Shadow.Text = text
		end

		if obj.Palette ~= palette then
			obj.Palette = palette
			obj.TextGradient.Color = palette.Text
			obj.TextGradient.Rotation = palette.Rotation or 90
			obj.StrokeGradient.Color = palette.Stroke
		end
	end

	flag2.ReadToggle = function(obj, flag473)
		if type(obj) ~= "table" then
			return flag473 == true
		end

		local ok, result = pcall(function()
			local controller = obj._controller
			return type(controller) == "table" and type(controller.GetValue) == "function" and controller.GetValue()
		end)

		if ok and type(result) == "boolean" then
			return result
		end

		for _, item122 in ipairs({ "Get", "GetValue" }) do
			local ok2, result2 = pcall(function()
				return obj[item122]
			end)

			if ok2 and type(result2) == "function" then
				local ok3, result3 = pcall(result2, obj)
				if ok3 and type(result3) == "boolean" then
					return result3
				end
			end
		end

		return flag473 == true
	end

	flag2.SyncSoon = function(callback24)
		callback24()
		task.delay(0.35, callback24)
	end

	flag2.GetGuardAreas = function()
		local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
		world = world and world:FindFirstChild("Areas")
		return world and world:FindFirstChild("GuardAreas")
	end

	flag2.FindGuardRoot = function(obj)
		local humanoidRootPart = obj:FindFirstChild("HumanoidRootPart")
		if humanoidRootPart and humanoidRootPart:IsA("BasePart") then
			return humanoidRootPart
		end

		if obj.PrimaryPart then
			return obj.PrimaryPart
		end
		return obj:FindFirstChildWhichIsA("BasePart", true)
	end

	flag2.WatchGuards = function(callback25)
		local tbl296 = {}
		local obj74 = flag2.GetGuardAreas()
		if not obj74 then
			return tbl296
		end

		local function func454(child)
			local guard = child:FindFirstChild("Guard")

			if guard and guard:IsA("Model") then
				callback25(child.Name, guard)
			end

			table.insert(tbl296, child.ChildAdded:Connect(function(child2)
				if child2.Name == "Guard" and child2:IsA("Model") then
					callback25(child.Name, child2)
				end
			end))
		end

		for _, child in ipairs(obj74:GetChildren()) do
			func454(child)
		end

		table.insert(tbl296, obj74.ChildAdded:Connect(func454))
		return tbl296
	end

	flag2.DisconnectAll = function(list50)
		for _, item123 in ipairs(list50) do
			pcall(function()
				item123:Disconnect()
			end)
		end

		table.clear(list50)
	end

	n = 18

	tbl3 = {
		"Icon",
		"Name",
		"Rarity",
		"Mutation",
		"Value",
		"Weight",
		"Size",
		"Sell Price",
		"Distance",
		"Area",
		"State",
	}

	tbl4 = { "Icon", "Name", "Value" }
	tbl5 = { "Off", "Rare Only", "All Shown" }
	tbl6 = { Icon = 3.2, Name = 1.35, Rarity = 1.2, Mutation = 1, Value = 1.1, Info = 1 }

	local function func455()
		local ok, result = pcall(Font.new, "rbxassetid://12187365977", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
		return ok and result or flag2.StatusFont
	end

	value3 = func455()
	sequence = flag2.Sequence
	tbl7 = {}

	do
		local tbl297 = { 0, Color3.fromRGB(255, 255, 255) }
		local tbl298 = { 0.2, Color3.fromRGB(206, 212, 224) }
		local tbl299 = { 0.42, Color3.fromRGB(74, 80, 94) }
		local tbl300 = { 0.58, Color3.fromRGB(42, 46, 56) }
		local tbl301 = { 0.78, Color3.fromRGB(158, 166, 182) }
		local tbl302 = { 1, Color3.fromRGB(250, 252, 255) }
		tbl7[1] = tbl297
		tbl7[2] = tbl298
		tbl7[3] = tbl299
		tbl7[4] = tbl300
		tbl7[5] = tbl301
		tbl7[6] = tbl302
	end
end

local obj75, obj76, obj77, str39, paint, bold, color, n2, obj78, tbl303
local list51, list52, list53, flag474, n3, func456, func457, func458, func459, func460
local func461, func462

do
	local n4, n5, n6, n7, n8, n9, n10, n11, n12, tweenInfo
	local tweenInfo2, tweenInfo3, tweenInfo4, tweenInfo5, TweenService, color2, func463, tbl304, tbl305

	do
		local value402
		value402 = sequence(tbl7)
		local value403
		value403 = flag2.PaletteFromColor(Color3.fromRGB(77, 255, 122))
		local tbl306
		tbl306 = {}

		do
			local sequence2 = flag2.Sequence
			local tbl307 = { 0, Color3.fromRGB(255, 255, 255) }
			local tbl308 = { 0.5, Color3.fromRGB(222, 238, 255) }
			local tbl309 = { 1, Color3.fromRGB(255, 255, 255) }
			local tbl310 = { tbl307, tbl308, tbl309 }
			tbl306.Text = sequence2(tbl310)
		end

		do
			local sequence2 = flag2.Sequence
			local tbl311 = { 0, Color3.fromRGB(8, 8, 8) }
			local tbl312 = { 1, Color3.fromRGB(8, 8, 8) }
			local tbl313 = { tbl311, tbl312 }
			tbl306.Stroke = sequence2(tbl313)
		end

		tbl306.Outline = Color3.fromRGB(255, 255, 255)
		local n13
		n13 = 0.8
		local n14
		n14 = 4.5
		local n15
		n15 = 20
		local n16
		n16 = 0.002
		local tbl314
		tbl314 = { Golden = flag2.Palettes.Gold }

		do
			local silver = {}
			local sequence2 = flag2.Sequence
			local tbl315 = { 0, Color3.fromRGB(255, 255, 255) }
			local tbl316 = { 0.45, Color3.fromRGB(214, 222, 232) }
			local tbl317 = { 1, Color3.fromRGB(150, 160, 175) }
			local tbl318 = { tbl315, tbl316, tbl317 }
			silver.Text = sequence2(tbl318)
			local sequence3 = flag2.Sequence
			local tbl319 = { 0, Color3.fromRGB(60, 66, 78) }
			local tbl320 = { 0.55, Color3.fromRGB(30, 33, 40) }
			local tbl321 = { 1, Color3.fromRGB(10, 11, 14) }
			local tbl322 = { tbl319, tbl320, tbl321 }
			silver.Stroke = sequence3(tbl322)
			silver.Outline = Color3.fromRGB(214, 222, 232)
			tbl314.Silver = silver
		end

		tbl314.Sakura = flag2.PaletteFromColor(Color3.fromRGB(255, 158, 216))
		tbl314.GreatBloom = flag2.PaletteFromColor(Color3.fromRGB(124, 255, 196))
		tbl314.Boss = flag2.PaletteFromColor(Color3.fromRGB(255, 122, 122))
		tbl314.Monstrous = flag2.PaletteFromColor(Color3.fromRGB(192, 139, 255))

		do
			local rainbow = {}
			local sequence2 = flag2.Sequence
			local tbl323 = { 0, Color3.fromRGB(255, 107, 107) }
			local tbl324 = { 0.2, Color3.fromRGB(255, 179, 107) }
			local tbl325 = { 0.4, Color3.fromRGB(255, 240, 107) }
			local tbl326 = { 0.6, Color3.fromRGB(107, 255, 138) }
			local tbl327 = { 0.8, Color3.fromRGB(107, 200, 255) }
			local tbl328 = { 1, Color3.fromRGB(185, 107, 255) }
			local tbl329 = { tbl323, tbl324, tbl325, tbl326, tbl327, tbl328 }
			rainbow.Text = sequence2(tbl329)
			local sequence3 = flag2.Sequence
			local tbl330 = { 0, Color3.fromRGB(20, 20, 30) }
			local tbl331 = { 1, Color3.fromRGB(8, 8, 12) }
			local tbl332 = { tbl330, tbl331 }
			rainbow.Stroke = sequence3(tbl332)
			rainbow.Outline = Color3.fromRGB(255, 255, 255)
			rainbow.Rotation = 0
			tbl314.Rainbow = rainbow
		end

		local value404
		value404 = flag2.PaletteFromColor(Color3.fromRGB(143, 227, 255))
		local rfEggWorldAskFieldEggSnapshot
		rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
		local n17
		n17 = 0
		local num112

		num112 = {
			Eggs = false,
			MinRarity = 5,
			Specific = {},
			MutationSet = {},
			AnyMutation = false,
			NoMutation = false,
			Info = {},
			Highlight = tbl5[1],
			MinValue = 0,
			HighlightMin = 6,
			MaxDistance = math.huge,
			SizeScale = 0.75,
			FixedSize = false,
			OwnBase = true,
		}

		for _, item124 in ipairs(tbl4) do
			num112.Info[item124] = true
		end

		local tbl333
		tbl333 = {}
		local tbl334, flag475, flag476, n18, n19, flag477, flag478, n20, func464
		local tbl335 = {}
		tbl334 = {}
		flag475 = nil
		flag476 = false
		n18 = 0
		n19 = 0
		flag477 = false
		flag478 = nil
		n20 = 0

		func464 = function(param240)
			local entry22 = tbl335[param240]
			if entry22 then
				return entry22
			end
			local directory = tbl1.Assets and tbl1.Assets.Directory
			local flag479 = type(directory) == "table" and directory[param240]
			local rarity = type(flag479) == "table" and type(flag479.Rarity) == "table" and flag479.Rarity or nil
			local color3 = rarity and typeof(rarity.Color) == "Color3" and rarity.Color or Color3.new(1, 1, 1)
			local paletteFromCol = flag2.PaletteFromColor(color3)
			local rarityGradient = rarity and rarity.RarityGradient

			if rarity and typeof(rarityGradient) ~= "Instance" then
				rarityGradient = ReplicatedStorage:FindFirstChild("Assets")
				rarityGradient = rarityGradient and rarityGradient:FindFirstChild("UI")
				rarityGradient = rarityGradient and rarityGradient:FindFirstChild("RarityGradients")

				if rarityGradient then
					rarityGradient = rarityGradient:FindFirstChild(tostring(rarity._id or rarity.DisplayName or ""))
				end

				rarityGradient = rarityGradient and rarityGradient:FindFirstChild("RarityGradient") or nil
			end

			if typeof(rarityGradient) == "Instance" and rarityGradient:IsA("UIGradient") then
				paletteFromCol.Text = rarityGradient.Color
				paletteFromCol.Rotation = rarityGradient.Rotation
			end

			local name

			if rarity then
				name = tostring(rarity.DisplayName or rarity._id or "")
			else
				name = rarity
			end

			name = name or ""
			local rarityPalette

			if string.upper(name) ~= "SECRET" then
				rarityPalette = paletteFromCol
			else
				rarityPalette = { Text = value402, Stroke = paletteFromCol.Stroke, Outline = paletteFromCol.Outline, Rotation = 90 }
			end

			local tbl336 = {}

			if rarity then
				rarity = tonumber(rarity.RarityNumber or rarity.Rank)
			end

			tbl336.Number = rarity or 0
			tbl336.Name = name
			tbl336.Color = color3
			tbl336.Palette = paletteFromCol
			tbl336.RarityPalette = rarityPalette
			local displayName = type(flag479) == "table"

			if displayName then
				displayName = tostring(flag479.DisplayName or param240)
			end

			tbl336.DisplayName = displayName or tostring(param240)
			tbl336.Icon = type(flag479) == "table" and flag479.Icon or nil
			tbl336.EarningRate = type(flag479) == "table" and tonumber(flag479.EarningRate) or 0
			tbl335[param240] = tbl336
			return tbl336
		end

		local func465, func466, func467, tbl337, func468

		do
			local function func469(childName16)
				local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
				areaEggSlotsClient = areaEggSlotsClient and areaEggSlotsClient:FindFirstChild(childName16)
				if areaEggSlotsClient and areaEggSlotsClient:IsA("Model") then
					local hitbox = areaEggSlotsClient:FindFirstChild("Hitbox")
					return areaEggSlotsClient, hitbox and hitbox:IsA("BasePart") and hitbox or nil
				end
				return nil, nil
			end

			local function func470()
				if not flag478 or not flag478.Parent then
					flag478 = flag2.CreateRuntime()
				end
			end

			local function func471(param241)
				local n21 = tonumber(param241) or 0
				local tbl338 = { "", "K", "M", "B", "T", "Qa", "Qi" }
				local n22 = 1

				while math.abs(n21) >= 1000 and n22 < #tbl338 do
					n21 /= 1000
					n22 += 1
				end

				return string.format(n22 == 1 and "%.0f%s" or "%.2f%s", n21, tbl338[n22])
			end

			local function func472(num113)
				local currentCamera = workspace.CurrentCamera
				if not currentCamera then
					return num112.MaxDistance
				end
				return math.min(num112.MaxDistance, num113 * currentCamera.ViewportSize.Y / 2 * n15 * math.tan(math.rad(currentCamera.FieldOfView) * 0.5))
			end

			local function func473(param242)
				local tbl339 = {
					{ param242.IconHolder, tbl6.Icon, param242.ShowIcon },
					{ param242.NameRow.Holder, tbl6.Name, param242.ShowName },
					{ param242.RarityRow.Holder, tbl6.Rarity, param242.ShowRarity },
					{ param242.MutationRow.Holder, tbl6.Mutation, param242.ShowMutation },
					{ param242.ValueRow.Holder, tbl6.Value, param242.ShowValue },
					{ param242.ExtraRow.Holder, tbl6.Info, param242.ShowExtra },
				}

				local n21 = 0

				for _, item125 in ipairs(tbl339) do
					if item125[3] then
						n21 += item125[2]
					end
				end

				local n22 = math.max(n21, 1)

				for _, item126 in ipairs(tbl339) do
					item126[1].Visible = item126[3]
					item126[1].Size = UDim2.fromScale(1, item126[3] and item126[2] / n22 or 0)
				end

				local num114 = flag2.ScaledWidth(120, num112.SizeScale)
				local height = math.max(1, math.floor(flag2.RowHeight(num112.SizeScale) * n22))

				if param242.Width ~= num114 or param242.Height ~= height or param242.Fixed ~= num112.FixedSize then
					param242.Width = num114
					param242.Height = height
					param242.Fixed = num112.FixedSize

					if num112.FixedSize then
						local n23 = n14 * num112.SizeScale
						param242.Billboard.Size = UDim2.fromScale(n23, n23 * height / num114)
						param242.Billboard.MaxDistance = func472(n23)
					else
						param242.Billboard.Size = UDim2.fromOffset(num114, height)
						param242.Billboard.MaxDistance = num112.MaxDistance
					end
				end
			end

			func465 = function(param243)
				param243.Width = nil
				func473(param243)
			end

			local function func474()
				local value405, value406 = flag2.CreateTag(flag478, num112.MaxDistance)
				local frame = Instance.new("Frame")
				frame.Name = func3()
				frame.BackgroundTransparency = 1
				frame.BorderSizePixel = 0
				frame.LayoutOrder = 0
				frame.Parent = value406
				local imageLabel = Instance.new("ImageLabel")
				imageLabel.Name = func3()
				imageLabel.AnchorPoint = Vector2.new(0.5, 1)
				imageLabel.BackgroundTransparency = 1
				imageLabel.Position = UDim2.fromScale(0.5, 1)
				imageLabel.Size = UDim2.fromScale(1, 1)
				imageLabel.ScaleType = Enum.ScaleType.Fit
				imageLabel.Parent = frame
				local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				uiAspectRatioConstraint.Name = func3()
				uiAspectRatioConstraint.AspectRatio = 1
				uiAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height
				uiAspectRatioConstraint.Parent = imageLabel

				local tbl340 = {
					Billboard = value405,
					IconHolder = frame,
					Icon = imageLabel,
					NameRow = flag2.CreateTextRow(value406, flag2.MainFont, 1, 0.4),
					RarityRow = flag2.CreateTextRow(value406, value3, 2, 0.2),
					MutationRow = flag2.CreateTextRow(value406, flag2.MainFont, 3, 0.2),
					ValueRow = flag2.CreateTextRow(value406, flag2.MainFont, 4, 0.2),
					ExtraRow = flag2.CreateTextRow(value406, flag2.MainFont, 5, 0.2),
					Highlight = nil,
					Anchor = nil,
					CFrame = nil,
					Width = nil,
					Height = nil,
					ShowIcon = false,
					ShowName = true,
					ShowRarity = false,
					ShowMutation = false,
					ShowValue = false,
					ShowExtra = false,
				}

				func473(tbl340)
				return tbl340
			end

			local function func475(param244)
				if param244.Highlight then
					param244.Highlight:Destroy()
					param244.Highlight = nil
					n20 -= 1
				end
			end

			local function func476(param245, param246)
				local n21 = tonumber(param245.AssetScale) or 1
				local n22 = n21 > 5 and (n21 / 5) ^ 1.2 * 19.637875755794113 or n21 ^ 1.85
				local mutations = tbl1.Mutations
				local flag480 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n23 = 1

				if flag480 then
					local ok
					ok, n23 = pcall(mutations.EarningsFor, type(param245.Mutations) == "table" and param245.Mutations or {})
					local flag481 = ok and type(n23) == "number"
					local n24 = 1

					if not flag481 then
						n23 = n24
					end
				end

				return param246.EarningRate * n22 * n23
			end

			local function func477()
				local list54 = {}
				local eggState = tbl1.EggState
				local placedEggRenders = workspace:FindFirstChild("PlacedEggRenders")
				if not placedEggRenders or type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return list54
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return list54
				end
				local userId4 = tostring(localPlayer.UserId)
				local list55 = {}

				for _, child in ipairs(placedEggRenders:GetChildren()) do
					if string.find(child.Name, userId4, 1, true) then
						list55[#list55 + 1] = child
					end
				end

				for k, value407 in pairs(result) do
					if type(value407) == "table" and value407.Placement ~= nil and type(value407.AssetCategory) == "string" then
						local base = tostring(k)
						local value408 = nil

						for _, item127 in ipairs(list55) do
							if item127.Name == base or string.find(item127.Name, base, 1, true) or item127:GetAttribute("Uid") == base then
								value408 = item127
								break
							end
						end

						if value408 then
							local ok2, result2 = pcall(function()
								return value408:IsA("Model") and value408:GetPivot() or value408.CFrame
							end)

							local mutations = type(value407.Mutations) == "table" and value407.Mutations or {}

							list54[#list54 + 1] = {
								Uid = "base:" .. base,
								AssetCategory = value407.AssetCategory,
								AssetScale = value407.AssetScale,
								Mutations = mutations,
								BaseMutation = value407.BaseMutation or mutations[1],
								State = "Base",
								AreaId = "Your Base",
								BottomCFrame = ok2 and result2 or nil,
								Model = value408,
							}
						end
					end
				end

				return list54
			end

			local function func478(param247, param248)
				if param247.State == "Claimed" then
					return false
				end

				if num112.MinRarity > 0 and param248.Number < num112.MinRarity then
					return false
				end
				local flag482 = num112.MinValue > 0

				if flag482 then
					local minValue = num112.MinValue
					flag482 = func476(param247, param248) < minValue
				end

				if flag482 then
					return false
				end
				return true
			end

			local function func479(part23, param249, player4)
				local model, hitbox

				if typeof(param249.Model) == "Instance" then
					model = param249.Model
					hitbox = model:FindFirstChild("Hitbox", true) or model:FindFirstChildWhichIsA("BasePart", true)
					hitbox = hitbox and hitbox:IsA("BasePart") and hitbox or nil
				else
					model, hitbox = func469(param249.Uid)
				end

				local bottomCFrame = param249.BottomCFrame

				if typeof(bottomCFrame) == "CFrame" then
					local terrain = hitbox or workspace.Terrain

					if part23.Anchor ~= terrain or part23.CFrame ~= bottomCFrame then
						part23.Anchor = terrain
						part23.CFrame = bottomCFrame
						part23.Billboard.Adornee = terrain
						part23.Billboard.StudsOffsetWorldSpace = bottomCFrame.Position - terrain.Position + Vector3.new(0, (hitbox and hitbox.Position.Y - bottomCFrame.Position.Y or 1) + n13, 0)
					end
				end

				local info = num112.Info
				local baseMutation = param249.BaseMutation
				local showMutation = type(baseMutation) == "string" and baseMutation ~= ""
				local n21 = tonumber(param249.AssetScale) or 1
				local showIcon = info.Icon == true and player4.Icon ~= nil

				if showIcon and part23.Icon.Image ~= tostring(player4.Icon) then
					part23.Icon.Image = tostring(player4.Icon)
				end

				local showName = info.Name == true

				if showName then
					flag2.SetRow(part23.NameRow, player4.DisplayName, tbl306)
				end

				local showRarity = info.Rarity == true and player4.Name ~= ""

				if showRarity then
					local rarityPalette = player4.RarityPalette
					flag2.SetRow(part23.RarityRow, string.upper(player4.Name), rarityPalette)
				end

				showMutation = info.Mutation == true and showMutation

				if showMutation then
					flag2.SetRow(part23.MutationRow, string.upper(func7(baseMutation)), tbl314[baseMutation] or value404)
				end

				local showValue = info.Value == true

				if showValue then
					flag2.SetRow(part23.ValueRow, "$" .. func471(func476(param249, player4)) .. "/s", value403)
				end

				local tbl341 = {}
				local eggRecords = tbl1.EggRecords

				if info.Weight and type(eggRecords) == "table" and type(eggRecords.WeightKgForScale) == "function" then
					local ok, result = pcall(eggRecords.WeightKgForScale, param249.AssetCategory, n21)

					if ok and tonumber(result) then
						table.insert(tbl341, func471(result) .. " kg")
					end
				end

				if info.Size then
					table.insert(tbl341, string.format("x%.2f", n21))
				end

				if info["Sell Price"] and type(eggRecords) == "table" and type(eggRecords.SellPrice) == "function" then
					local ok, result = pcall(eggRecords.SellPrice, param249)

					if ok and tonumber(result) then
						table.insert(tbl341, "$" .. func471(result))
					end
				end

				if info.Distance and typeof(bottomCFrame) == "CFrame" then
					local character = localPlayer.Character
					character = character and character:FindFirstChild("HumanoidRootPart")

					if character then
						table.insert(tbl341, string.format("%dm", math.floor((character.Position - bottomCFrame.Position).Magnitude + 0.5)))
					end
				end

				if info.Area and param249.AreaId ~= nil then
					table.insert(tbl341, tostring(param249.AreaId))
				end

				if info.State and param249.State ~= nil and param249.State ~= "Slot" then
					table.insert(tbl341, tostring(param249.State))
				end

				local showExtra = #tbl341 > 0

				if showExtra then
					flag2.SetRow(part23.ExtraRow, table.concat(tbl341, "  |  "), flag2.Palettes.Sheen)
				end

				if part23.ShowIcon ~= showIcon or part23.ShowName ~= showName or part23.ShowRarity ~= showRarity or part23.ShowMutation ~= showMutation or part23.ShowValue ~= showValue or part23.ShowExtra ~= showExtra then
					part23.ShowIcon = showIcon
					part23.ShowName = showName
					part23.ShowRarity = showRarity
					part23.ShowMutation = showMutation
					part23.ShowValue = showValue
					part23.ShowExtra = showExtra
					func473(part23)
				end

				if (num112.Highlight == tbl5[3] or num112.Highlight == tbl5[2] and player4.Number >= num112.HighlightMin) and model then
					if not part23.Highlight and n20 < n then
						local highlight = Instance.new("Highlight")
						highlight.Name = func3()
						highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						highlight.FillTransparency = 0.82
						highlight.OutlineTransparency = 0.05
						highlight.FillColor = player4.Color
						highlight.OutlineColor = player4.Palette.Outline
						highlight.Parent = flag478
						part23.Highlight = highlight
						n20 += 1
					end

					if part23.Highlight and part23.Highlight.Adornee ~= model then
						part23.Highlight.Adornee = model
					end
				else
					func475(part23)
				end
			end

			local function func480(param250)
				func475(param250)
				param250.Billboard:Destroy()
			end

			local function func481()
				local value409 = tbl333
				local obj79 = flag478
				tbl333 = {}
				flag478 = nil
				n20 = 0

				task.spawn(function()
					local now = os.clock()

					for _, value410 in pairs(value409) do
						if value410.Highlight then
							value410.Highlight:Destroy()
						end

						value410.Billboard:Destroy()

						if n16 < os.clock() - now then
							RunService.Heartbeat:Wait()
							now = os.clock()
						end
					end

					if obj79 then
						obj79:Destroy()
					end
				end)
			end

			local function func482(list56, flag483, flag484)
				local function func483()
					return flag483 == n19 and flag484 == n18 and flag476
				end

				func470()
				local tbl342 = {}
				local now = os.clock()

				for _, value411 in pairs(list56) do
					local uid = type(value411) == "table" and value411.Uid

					if type(uid) == "string" and type(value411.AssetCategory) == "string" then
						local assetCategory14 = func464(value411.AssetCategory)

						if num112.Eggs and func478(value411, assetCategory14) then
							tbl342[uid] = true
							local entry23 = tbl333[uid]

							if not entry23 then
								entry23 = func474()
								tbl333[uid] = entry23
							end

							func479(entry23, value411, assetCategory14)
						end
					end

					if os.clock() - now > n16 then
						RunService.Heartbeat:Wait()
						now = os.clock()
						if not func483() then
							return
						end
					end
				end

				if num112.Eggs and num112.OwnBase then
					for _, item128 in ipairs(func477()) do
						local assetCategory15 = func464(item128.AssetCategory)

						if func478(item128, assetCategory15) then
							tbl342[item128.Uid] = true
							local entry24 = tbl333[item128.Uid]

							if not entry24 then
								entry24 = func474()
								tbl333[item128.Uid] = entry24
							end

							func479(entry24, item128, assetCategory15)
						end
					end
				end

				for k, value412 in pairs(tbl333) do
					if not tbl342[k] then
						tbl333[k] = nil
						func480(value412)
					end
				end

				return true
			end

			local flag485 = false
			local flag486 = false

			func466 = function()
				if not flag476 or not flag475 then
					return
				end
				flag485 = true
				if flag486 then
					return
				end
				flag486 = true

				task.defer(function()
					while flag476 and flag475 and flag485 do
						flag485 = false
						n19 += 1
						local ok, result = pcall(func482, flag475, n19, n18)

						if ok and result ~= true then
							flag485 = true
						end

						RunService.Heartbeat:Wait()
					end

					flag486 = false
				end)
			end

			local function func484()
				local flag487 = n18

				if flag475 and next(tbl333) == nil then
					func466()
				end

				local eggState = tbl1.EggState
				local flag488 = type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function"
				local records = nil

				if flag488 then
					local ok, result = pcall(eggState.ReadFieldEggs)
					ok = ok and type(result) == "table" and type(result.Records) == "table"
					records = nil

					if ok then
						records = result.Records
					end
				end

				if records == nil and rfEggWorldAskFieldEggSnapshot and os.clock() >= n17 then
					n17 = os.clock() + 30
					local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)

					if ok and type(result) == "table" and type(result.Records) == "table" then
						records = result.Records
					end
				end

				if flag487 ~= n18 or not flag476 then
					return
				end

				if records ~= nil then
					local tbl343 = {}

					for k, record in pairs(records) do
						tbl343[k] = record
					end

					flag475 = tbl343
				end

				if flag475 then
					func466()
				end
			end

			local function func485()
				task.spawn(pcall, func484)
			end

			local function func486()
				if flag477 then
					return
				end
				flag477 = true

				task.delay(0.5, function()
					flag477 = false

					if flag476 then
						func485()
					end
				end)
			end

			func467 = function()
				for _, value413 in pairs(tbl333) do
					func465(value413)
				end
			end

			local function func487()
				flag476 = false
				n18 += 1
				n19 += 1
				flag2.DisconnectAll(tbl334)
				func481()
			end

			local function func488()
				if flag476 then
					func485()
					return
				end
				flag476 = true
				local flag489 = n18
				local eggState = tbl1.EggState

				if type(eggState) == "table" then
					for _, item129 in ipairs({ "FieldRefreshed", "FieldShifted", "FieldGone", "FieldClaimed", "SnapshotRefreshed" }) do
						local entry25 = eggState[item129]

						if type(entry25) == "table" and type(entry25.Connect) == "function" then
							local ok, result = pcall(entry25.Connect, entry25, func486)

							if ok and result then
								table.insert(tbl334, result)
							end
						end
					end
				end

				for _, item130 in ipairs({ "AreaEggSlotsClient", "PlacedEggRenders" }) do
					local value414 = workspace:FindFirstChild(item130)

					if value414 then
						table.insert(tbl334, value414.ChildAdded:Connect(func486))
						table.insert(tbl334, value414.ChildRemoved:Connect(func486))
					end
				end

				task.spawn(function()
					while flag489 == n18 do
						task.wait(10)
						if flag489 == n18 then
							func486()
							continue
						end
						break
					end
				end)

				task.spawn(function()
					while flag489 == n18 do
						task.wait(1)

						if flag489 == n18 then
							if num112.Info.Distance then
								func466()
							end

							continue
						end

						break
					end
				end)

				func485()
			end

			local function func489()
				if num112.Eggs then
					func488()
				else
					func487()
				end
			end

			tbl337 = { Eggs = nil }
			local tbl344 = { Eggs = false }
			local flag490 = false

			local function func490()
				if flag490 then
					return
				end
				local flag491 = flag2.ReadToggle(tbl337.Eggs, tbl344.Eggs)
				if flag491 == num112.Eggs and flag476 == flag491 then
					return
				end
				num112.Eggs = flag491
				func489()
			end

			func4(function()
				flag490 = true
				num112.Eggs = false
				func487()
			end)

			func468 = function(list57)
				local tbl345 = {}

				if type(list57) == "table" then
					for k, value415 in pairs(list57) do
						k = value415 == true and type(k) == "string" and k or type(value415) == "string" and value415 or nil

						if k then
							tbl345[k] = true
						end
					end
				end

				return tbl345
			end

			tbl337.Eggs = espSection:CreateToggle({
				Name = "ESP Eggs",
				Default = false,
				Callback = function(value)
					tbl344.Eggs = value == true
					flag2.SyncSoon(func490)
				end,
			})
		end

		espSection:CreateToggle({
			Name = "ESP Fixed Size",
			Default = false,
			SubOf = tbl337.Eggs,
			Callback = function(value)
				local fixedSize = value == true

				if num112.FixedSize ~= fixedSize then
					num112.FixedSize = fixedSize
					func467()
				end
			end,
		})

		espSection:CreateToggle({
			Name = "ESP Own Base Eggs",
			Note = "Also show the eggs placed in your own base",
			Default = true,
			SubOf = tbl337.Eggs,
			Callback = function(value)
				num112.OwnBase = value ~= false
				func466()
			end,
		})

		do
			local tbl346 = { "Any" }
			local tbl347 = { Any = 0 }
			local tbl348 = {}
			local tbl349 = {}
			local tbl350 = { "Any Mutation", "No Mutation" }
			local directory = tbl1.Assets and tbl1.Assets.Directory
			local tbl351 = {}
			local tbl352 = {}

			if type(directory) == "table" then
				for k, value416 in pairs(directory) do
					local rarity = type(value416) == "table" and value416.Rarity or nil
					local flag492 = type(rarity) == "table"

					if flag492 then
						flag492 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					flag492 = flag492 or nil

					if flag492 then
						local str40 = tostring(rarity.DisplayName or rarity._id or flag492)
						tbl351[flag492] = tbl351[flag492] or str40

						table.insert(tbl352, {
							Category = tostring(k),
							Name = tostring(value416.DisplayName or k),
							Rarity = flag492,
							RarityName = str40,
						})
					end
				end
			end

			local tbl353 = {}

			for k in pairs(tbl351) do
				table.insert(tbl353, k)
			end

			table.sort(tbl353)

			for _, item131 in ipairs(tbl353) do
				local formatted17 = string.format("%d - %s", item131, tbl351[item131])
				table.insert(tbl346, formatted17)
				tbl347[formatted17] = item131
			end

			table.sort(tbl352, function(param251, param252)
				if param251.Rarity ~= param252.Rarity then
					return param251.Rarity > param252.Rarity
				end
				return param251.Name < param252.Name
			end)

			for _, item132 in ipairs(tbl352) do
				local formatted18 = string.format("%s [%s]", item132.Name, item132.RarityName)

				if tbl349[formatted18] then
					formatted18 = string.format("%s [%s] (%s)", item132.Name, item132.RarityName, item132.Category)
				end

				table.insert(tbl348, formatted18)
				tbl349[formatted18] = item132.Category
			end

			local tbl354 = {}
			local mutations = tbl1.Mutations

			if type(mutations) == "table" and type(mutations.IdSet) == "table" then
				for k in pairs(mutations.IdSet) do
					table.insert(tbl354, tostring(k))
				end
			end

			table.sort(tbl354)

			for _, item133 in ipairs(tbl354) do
				table.insert(tbl350, item133)
			end

			local function func491(param253)
				for _, item134 in ipairs(tbl346) do
					if tbl347[item134] == param253 then
						return item134
					end
				end

				return tbl346[1]
			end


			espSection:CreateDropdown({
				Name = "ESP Min Rarity",
				Note = "Show eggs of the chosen rarity and every rarity above it",
				Options = tbl346,
				Default = func491(5),
				SubOf = tbl337.Eggs,
				Callback = function(value)
					num112.MinRarity = tbl347[type(value) == "table" and value[1] or value] or 0
					func466()
				end,
			})
		end

		func6(espSection:CreateMultiDropdown({
			Name = "ESP Show Info",
			Options = tbl3,
			Default = tbl4,
			SubOf = tbl337.Eggs,
			Callback = function(value)
				num112.Info = func468(value)
				func466()
			end,
		}))

		do
			local tbl355 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}

			local n21 = 0
			local str41 = "M/s"

			local function func492(flag493, flag494)
				if flag493 ~= nil then
					n21 = math.max(0, math.floor(tonumber(flag493) or n21))
				end

				if flag494 ~= nil then
					str41 = tostring(flag494)
				end

				num112.MinValue = n21 * (tbl355[str41] or tbl355["M/s"]).Mult
				func466()
			end

			func5(espSection, {
				Name = "Min ESP Value",
				SubOf = tbl337.Eggs,
				Legacy = "ESP Min Value",
				SectionName = "ESP",
				OnRaw = function(num115)
					func492(math.floor(num115 / 1000), "K/s")
				end,
			})
		end

		espSection:CreateSlider({
			Name = "ESP Egg Size",
			Min = 50,
			Max = 200,
			Default = 75,
			Increment = 5,
			Unit = "%",
			SubOf = tbl337.Eggs,
			Callback = function(value)
				local num116 = tonumber(value)

				if num116 and num112.SizeScale ~= num116 / 100 then
					num112.SizeScale = num116 / 100
					func467()
				end
			end,
		})

		do
			local n21 = 1
			local n22 = 0.75

			local tbl356 = {
				Sleeping = flag2.Palettes.Accent,
				Waking = flag2.Palettes.Gold,
				Chasing = flag2.Palettes.Red,
			}

			local orange = flag2.Palettes.Orange
			local tbl357 = {}
			local tbl358 = {}
			local flag495 = false
			local value417 = nil

			local function func493(obj80)
				local attribute = obj80:GetAttribute("GuardState")
				if attribute == "Sleeping" then
					return "Sleeping"
				end

				if attribute == "Waking" then
					return "Waking Up"
				end

				if attribute == "Chasing" then
					local attribute2 = obj80:GetAttribute("TargetPlayer")
					if attribute2 == tostring(localPlayer.UserId) then
						return "Chasing You"
					end
					local playerByUserId = tonumber(attribute2) and Players:GetPlayerByUserId(tonumber(attribute2))
					return playerByUserId and "Chasing " .. playerByUserId.DisplayName or "Chasing"
				end

				return attribute and tostring(attribute) or "Awake"
			end

			local function func494(param254, obj81)
				local value418 = tbl356[obj81:GetAttribute("GuardState")] or orange
				param254.Highlight.FillColor = value418.Outline
				param254.Highlight.OutlineColor = value418.Outline
				flag2.SetRow(param254.StateRow, func493(obj81), value418)
			end

			local function func495(param255)
				local floor = math.floor
				param255.Tag.Size = UDim2.fromOffset(flag2.ScaledWidth(115, n22), floor(flag2.RowHeight(n22) * 1.6))
			end

			local function func496(param256)
				local entry26 = tbl357[param256]
				if not entry26 then
					return
				end
				tbl357[param256] = nil
				flag2.DisconnectAll(entry26.Connections)
				entry26.Highlight:Destroy()
				entry26.Tag:Destroy()
			end

			local function func497(param257, adornee)
				if tbl357[adornee] then
					return
				end
				local num117 = flag2.FindGuardRoot(adornee)
				if not num117 then
					return
				end

				if not value417 or not value417.Parent then
					value417 = flag2.CreateRuntime()
				end

				local highlight = Instance.new("Highlight")
				highlight.Name = func3()
				highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				highlight.FillTransparency = 0.76
				highlight.OutlineTransparency = 0.02
				highlight.Adornee = adornee
				highlight.Parent = value417
				local ok, result, result2 = pcall(adornee.GetBoundingBox, adornee)
				ok = ok and typeof(result) == "CFrame"
				local n23 = 6

				if ok then
					n23 = result.Position.Y + result2.Y * 0.5 - num117.Position.Y + n21
				end

				local value419, value420 = flag2.CreateTag(value417, math.huge)
				value419.Adornee = num117
				value419.StudsOffsetWorldSpace = Vector3.new(0, n23, 0)
				local value421 = flag2.CreateTextRow(value420, flag2.StatusFont, 1, 0.45)
				local value422 = flag2.CreateTextRow(value420, flag2.StatusFont, 2, 0.55)
				local sheen = flag2.Palettes.Sheen
				flag2.SetRow(value421, tostring(param257) .. " Guard", sheen)
				local tbl359 = { Highlight = highlight, Tag = value419, StateRow = value422, Connections = {} }
				tbl357[adornee] = tbl359
				func495(tbl359)
				func494(tbl359, adornee)

				local function func498()
					func494(tbl359, adornee)
				end

				table.insert(tbl359.Connections, adornee:GetAttributeChangedSignal("GuardState"):Connect(func498))
				table.insert(tbl359.Connections, adornee:GetAttributeChangedSignal("TargetPlayer"):Connect(func498))

				table.insert(tbl359.Connections, adornee.AncestryChanged:Connect(function()
					if not adornee:IsDescendantOf(workspace) then
						func496(adornee)
					end
				end))
			end

			local function func499()
				flag495 = false
				flag2.DisconnectAll(tbl358)

				for k in pairs(tbl357) do
					func496(k)
				end

				if value417 then
					value417:Destroy()
					value417 = nil
				end
			end

			local function func500()
				if flag495 then
					return
				end
				flag495 = true
				tbl358 = flag2.WatchGuards(func497)
			end

			local value423 = nil
			local flag496 = false
			local flag497 = false

			local function func501()
				if flag497 then
					return
				end

				if flag2.ReadToggle(value423, flag496) then
					func500()
				elseif flag495 then
					func499()
				end
			end

			func4(function()
				flag497 = true
				func499()
			end)

			espSection = (obj2._bhLayout and obj2._bhLayout.EntityEsp) or espSection
			value423 = espSection:CreateToggle({
				Name = "ESP Guards",
				Default = false,
				Callback = function(value)
					flag496 = value == true
					flag2.SyncSoon(func501)
				end,
			})

			espSection:CreateSlider({
				Name = "ESP Guard Size",
				Min = 50,
				Max = 200,
				Default = 75,
				Increment = 5,
				Unit = "%",
				SubOf = value423,
				Callback = function(value)
					local num118 = tonumber(value)

					if num118 and n22 ~= num118 / 100 then
						n22 = num118 / 100

						for _, value424 in pairs(tbl357) do
							func495(value424)
						end
					end
				end,
			})
		end

		do
			local tbl360 = {
				{ Id = "LostPart1", Label = "Mechanical Gear" },
				{ Id = "LostPart2", Label = "Wiring Harness" },
			}

			local paletteFromCol2 = flag2.PaletteFromColor(Color3.fromRGB(255, 216, 61))
			local accent = flag2.Palettes.Accent
			local value425 = nil
			local tbl361 = {}
			local flag498 = false
			local connection = nil
			local value426 = nil
			local flag499 = false
			local flag500 = false

			local function func502(param258)
				local entry27 = tbl361[param258]
				if not entry27 then
					return
				end
				tbl361[param258] = nil

				pcall(function()
					entry27.Highlight:Destroy()
					entry27.Tag:Destroy()
				end)
			end

			local function func503()
				local drScrambleEvent = workspace:FindFirstChild("DrScrambleEvent")

				for _, item135 in ipairs(tbl360) do
					local obj82 = drScrambleEvent and drScrambleEvent:FindFirstChild(item135.Id)
					local hitbox = obj82 and (obj82:FindFirstChild("Hitbox", true) or obj82.PrimaryPart or obj82:FindFirstChildWhichIsA("BasePart", true))
					local entry28 = tbl361[item135.Id]

					if entry28 and (entry28.Model ~= obj82 or not hitbox) then
						func502(item135.Id)
						entry28 = nil
					end

					if hitbox and not entry28 then
						if not value425 or not value425.Parent then
							value425 = flag2.CreateRuntime()
						end

						local highlight = Instance.new("Highlight")
						highlight.Name = func3()
						highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						highlight.FillTransparency = 0.7
						highlight.OutlineTransparency = 0.02
						highlight.Adornee = obj82
						highlight.Parent = value425
						local value427, value428 = flag2.CreateTag(value425, 25000)
						value427.Adornee = hitbox
						value427.StudsOffsetWorldSpace = Vector3.new(0, 4, 0)
						local floor = math.floor
						value427.Size = UDim2.fromOffset(flag2.ScaledWidth(160), floor(flag2.RowHeight() * 1.6))
						local value429 = flag2.CreateTextRow(value428, flag2.StatusFont, 1, 0.5)
						local value430 = flag2.CreateTextRow(value428, flag2.StatusFont, 2, 0.5)
						flag2.SetRow(value429, item135.Label, flag2.Palettes.Sheen)
						entry28 = { Model = obj82, Hitbox = hitbox, Highlight = highlight, Tag = value427, InfoRow = value430 }
						tbl361[item135.Id] = entry28
					end

					if entry28 then
						local scrambleLostPart = type(str1.ScrambleLostPart) == "function" and str1.ScrambleLostPart(item135.Id) == true
						local value431 = scrambleLostPart and accent or paletteFromCol2
						flag2.SetRow(entry28.InfoRow, scrambleLostPart and "Collected" or string.format("%d studs", math.floor(str1.DistanceTo(entry28.Hitbox.Position))), value431)
						entry28.Highlight.FillColor = value431.Outline
						entry28.Highlight.OutlineColor = value431.Outline
					end
				end
			end

			local function func504()
				flag498 = false

				if connection then
					connection:Disconnect()
					connection = nil
				end

				for k in pairs(tbl361) do
					func502(k)
				end

				if value425 then
					value425:Destroy()
					value425 = nil
				end
			end

			local function func505()
				if flag498 then
					return
				end
				flag498 = true
				local n21 = 1

				connection = RunService.Heartbeat:Connect(function(deltaTime)
					n21 += deltaTime

					if n21 >= 0.3 then
						n21 = 0
						pcall(func503)
					end
				end)
			end

			local function func506()
				if flag500 then
					return
				end

				if flag2.ReadToggle(value426, flag499) then
					func505()
				elseif flag498 then
					func504()
				end
			end

			func4(function()
				flag500 = true
				func504()
			end)

			value426 = espSection:CreateToggle({
				Name = "ESP Lost Parts",
				Default = false,
				Callback = function(value)
					flag499 = value == true
					flag2.SyncSoon(func506)
				end,
			})
		end

		local font, value432, flag501, n21, obj83, tbl362, tbl363, tbl364, n22, tbl365
		local value433, flag502, flag503

		do
			local TextService = game:GetService("TextService")
			font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
			local colorSequence = ColorSequence.new
			local value434 = ColorSequenceKeypoint.new(0, Color3.fromRGB(138, 255, 205))
			local value435 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(125, 225, 255))
			local tbl366 = { value434, value435 }

			do
				local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(210, 135, 255)))
				table.move(values, 1, values.n, 3, tbl366)
			end

			value432 = colorSequence(tbl366)

			local colorSequence2 = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(7, 73, 66)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 17, 79)),
			})

			flag501 = false
			n21 = 0
			obj83 = nil
			tbl362 = {}
			tbl363 = {}
			tbl364 = {}
			local tbl367 = {}
			n22 = 0.75
			tbl365 = { Name = true, Username = false, Avatar = false, Tool = true }
			value433 = nil
			flag502 = false
			flag503 = false

			local function func507(flag504)
				local str42 = tostring(flag504 or "")
				if str42:match("^%d+$") then
					return "rbxassetid://" .. str42
				end
				return str42
			end

			local function func508(instance25)
				if not instance25 or not instance25:IsA("Tool") then
					return ""
				end
				local textureId = func507(instance25.TextureId)
				if textureId ~= "" then
					return textureId
				end

				for _, item136 in ipairs({ "Icon", "Image", "Thumbnail", "TextureId" }) do
					local attribute = instance25:GetAttribute(item136)
					if type(attribute) == "string" and func507(attribute) ~= "" then
						return func507(attribute)
					end
				end

				for _, descendant in ipairs(instance25:GetDescendants()) do
					if descendant:IsA("Decal") or descendant:IsA("Texture") then
						textureId = func507(descendant.Texture)
					elseif descendant:IsA("ImageLabel") or descendant:IsA("ImageButton") then
						textureId = func507(descendant.Image)
					end

					if textureId ~= "" then
						return textureId
					end
				end

				return ""
			end

			local function func509()
				local currentCamera = workspace.CurrentCamera
				return math.max(1, math.floor(math.clamp((currentCamera and currentCamera.ViewportSize.Y or 1080) * 0.024, 26, 35) * n22))
			end

			local function func510(text, size)
				local str43 = text .. "@" .. size
				local entry29 = tbl367[str43]
				if entry29 then
					return entry29
				end
				local getTextBoundsParams = Instance.new("GetTextBoundsParams")
				getTextBoundsParams.Text = text
				getTextBoundsParams.Font = font
				getTextBoundsParams.Size = size
				getTextBoundsParams.Width = 1000

				local ok, result = pcall(function()
					return TextService:GetTextBoundsAsync(getTextBoundsParams)
				end)

				getTextBoundsParams:Destroy()
				ok = ok and result.X
				local n23

				if ok then
					n23 = ok
				else
					n23 = (utf8.len(text) or #text) * size * 0.56
				end

				tbl367[str43] = n23
				return n23
			end

			local function func511(param259, color3, flag505, param260)
				param259.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
				param259.Color = color3
				param259.LineJoinMode = Enum.LineJoinMode.Round
				param259.Transparency = 0

				param259.Thickness = pcall(function()
					param259.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
				end) and flag505 or param260
			end

			local function createTextLabel(parent, zIndex)
				local textLabel = Instance.new("TextLabel")
				textLabel.Name = func3()
				textLabel.AnchorPoint = Vector2.new(0, 0.5)
				textLabel.BackgroundTransparency = 1
				textLabel.FontFace = font
				textLabel.Text = ""
				textLabel.TextScaled = true
				textLabel.TextStrokeTransparency = 1
				textLabel.TextXAlignment = Enum.TextXAlignment.Center
				textLabel.TextYAlignment = Enum.TextYAlignment.Center
				textLabel.ZIndex = zIndex
				textLabel.Parent = parent
				return textLabel
			end

			local function createImageLabel(parent, zIndex)
				local imageLabel = Instance.new("ImageLabel")
				imageLabel.Name = func3()
				imageLabel.AnchorPoint = Vector2.new(0, 0.5)
				imageLabel.BackgroundTransparency = 1
				imageLabel.ScaleType = Enum.ScaleType.Fit
				imageLabel.ZIndex = zIndex
				imageLabel.Parent = parent
				local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				uiAspectRatioConstraint.Name = func3()
				uiAspectRatioConstraint.AspectRatio = 1
				uiAspectRatioConstraint.Parent = imageLabel
				return imageLabel
			end

			local function func512(param261)
				local result86 = func509()
				local visible = tbl365.Name == true or tbl365.Username == true
				local visible2 = tbl365.Avatar == true
				local visible3 = tbl365.Tool == true and param261.ToolIcon.Image ~= ""
				local n23 = visible2 and math.floor(result86 * 0.72) or 0
				local n24 = visible3 and math.floor(result86 * 0.82) or 0
				local n25 = math.floor(result86 * 0.7)
				local n26 = math.max(1, math.floor(result86 * 0.04))
				local name = tbl365.Username == true and param261.Player.Name or param261.Player.DisplayName
				param261.Name.Text = name
				param261.Shadow.Text = name
				local n27 = visible and math.floor(math.clamp(func510(name, n25) + 4, n25, 230)) or 0
				local n28 = 0
				local n29 = 0

				if visible2 then
					n29 = 0 + n23
				end

				local n30 = 0

				if visible then
					if not (n29 > 0) then
						n30 = n29
					else
						n30 = n29 + n26
					end

					n29 = n30 + n27
				end

				local n31 = 0
				local n32

				if visible3 then
					if n29 > 0 then
						n29 += n26
					end

					n31 = n29
					n32 = n29 + n24
				else
					n32 = n29
				end

				local n33 = math.max(n32, 1)
				local n34 = 1 / n33
				local n35 = 1 / result86
				param261.Billboard.Size = UDim2.fromOffset(n33, result86)
				param261.Avatar.Visible = visible2
				param261.Name.Visible = visible
				param261.Shadow.Visible = visible
				param261.ToolIcon.Visible = visible3
				param261.ToolShadow.Visible = visible3
				param261.Avatar.Position = UDim2.fromScale(n28 / n33, 0.5)
				param261.Avatar.Size = UDim2.fromScale(n23 / n33, n23 / result86)
				param261.Name.Position = UDim2.fromScale(n30 / n33, 0.5)
				param261.Name.Size = UDim2.fromScale(n27 / n33, n25 / result86)
				param261.Shadow.Position = UDim2.fromScale(n30 / n33 + n34, 0.5 + n35)
				param261.Shadow.Size = param261.Name.Size
				param261.ToolIcon.Position = UDim2.fromScale(n31 / n33, 0.5)
				param261.ToolIcon.Size = UDim2.fromScale(n24 / n33, n24 / result86)
				param261.ToolShadow.Position = UDim2.fromScale(n31 / n33 + n34, 0.5 + n35)
				param261.ToolShadow.Size = param261.ToolIcon.Size
			end

			local function func513(param262, adornee, part24, flag506)
				local highlight = Instance.new("Highlight")
				highlight.Name = func3()
				highlight.Adornee = adornee
				highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				highlight.FillColor = Color3.fromRGB(0, 67, 148)
				highlight.FillTransparency = 0.76
				highlight.OutlineColor = Color3.fromRGB(72, 207, 255)
				highlight.OutlineTransparency = 0.02
				highlight.Parent = obj83
				local num119 = flag506 or part24
				local n23 = 3.1

				if num119 ~= part24 then
					n23 = math.clamp(part24.Position.Y - num119.Position.Y + 3.1, 3.8, 6)
				end

				local billboardGui = Instance.new("BillboardGui")
				billboardGui.Name = func3()
				billboardGui.Adornee = num119
				billboardGui.AlwaysOnTop = true
				billboardGui.LightInfluence = 0
				billboardGui.MaxDistance = math.huge
				billboardGui.Size = UDim2.fromOffset(1, 1)
				billboardGui.StudsOffsetWorldSpace = Vector3.new(0, n23, 0)
				billboardGui.Parent = obj83
				local frame = Instance.new("Frame")
				frame.Name = func3()
				frame.Size = UDim2.fromScale(1, 1)
				frame.BackgroundTransparency = 1
				frame.Parent = billboardGui
				local imageLabel2 = createImageLabel(frame, 2)
				imageLabel2.ScaleType = Enum.ScaleType.Crop
				local uiCorner = Instance.new("UICorner")
				uiCorner.Name = func3()
				uiCorner.CornerRadius = UDim.new(1, 0)
				uiCorner.Parent = imageLabel2
				local textLabel8 = createTextLabel(frame, 1)
				textLabel8.TextColor3 = Color3.fromRGB(7, 19, 34)
				textLabel8.TextTransparency = 0.05
				local textLabel9 = createTextLabel(frame, 2)
				textLabel9.TextColor3 = Color3.fromRGB(255, 255, 255)
				local uiStroke = Instance.new("UIStroke")
				uiStroke.Name = func3()
				func511(uiStroke, Color3.fromRGB(255, 255, 255), 0.044, 1.4)
				uiStroke.Parent = textLabel9
				local uiGradient = Instance.new("UIGradient")
				uiGradient.Name = func3()
				uiGradient.Color = colorSequence2
				uiGradient.Rotation = 90
				uiGradient.Parent = uiStroke
				local uiGradient2 = Instance.new("UIGradient")
				uiGradient2.Name = func3()
				uiGradient2.Color = value432
				uiGradient2.Rotation = 90
				uiGradient2.Parent = textLabel9
				local imageLabel3 = createImageLabel(frame, 1)
				imageLabel3.ImageColor3 = Color3.fromRGB(0, 0, 0)
				imageLabel3.ImageTransparency = 0.35

				local tbl368 = {
					Player = param262,
					Highlight = highlight,
					Billboard = billboardGui,
					Avatar = imageLabel2,
					Shadow = textLabel8,
					Name = textLabel9,
					ToolShadow = imageLabel3,
					ToolIcon = createImageLabel(frame, 2),
				}

				func512(tbl368)
				return tbl368
			end

			local function func514(param263)
				if param263.NameHumanoid and param263.NameHumanoid.Parent and param263.NameDistance ~= nil then
					pcall(function()
						param263.NameHumanoid.NameDisplayDistance = param263.NameDistance
					end)
				end

				param263.NameHumanoid = nil
				param263.NameDistance = nil
			end

			local function func515(param264, nameHumanoid)
				nameHumanoid = nameHumanoid and nameHumanoid:FindFirstChildOfClass("Humanoid")
				if not nameHumanoid then
					return
				end

				if param264.NameHumanoid ~= nameHumanoid then
					func514(param264)
					param264.NameHumanoid = nameHumanoid
					param264.NameDistance = nameHumanoid.NameDisplayDistance
				end

				pcall(function()
					nameHumanoid.NameDisplayDistance = 0
				end)
			end

			local function func516(player5)
				flag2.DisconnectAll(player5.CharacterConnections)

				if player5.Tag then
					pcall(function()
						player5.Tag.Highlight:Destroy()
					end)

					pcall(function()
						player5.Tag.Billboard:Destroy()
					end)

					player5.Tag = nil
				end

				func514(player5)
				player5.Character = nil
			end

			local function func517(player6)
				if not player6.Tag or not player6.Character then
					return
				end
				local value436 = func508(player6.Character:FindFirstChildOfClass("Tool"))
				player6.Tag.ToolIcon.Image = value436
				player6.Tag.ToolShadow.Image = value436
				func512(player6.Tag)
			end

			local function func518(param265, player7, flag507)
				local image = tbl364[player7.UserId]

				if image == nil then
					local ok, result = pcall(function()
						return Players:GetUserThumbnailAsync(player7.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
					end)

					image = ok and result or ""
					tbl364[player7.UserId] = image
				end

				if flag501 and param265.Version == flag507 and param265.Tag then
					param265.Tag.Avatar.Image = image
				end
			end

			local function func519(player8, param266, character)
				func516(player8)
				player8.Version = player8.Version + 1
				local version = player8.Version
				if not flag501 or not character then
					return
				end
				player8.Character = character

				task.spawn(function()
					local head = character:FindFirstChild("Head") or character:WaitForChild("Head", 5)
					if not flag501 or player8.Version ~= version or not head or not head:IsA("BasePart") or not character:IsDescendantOf(workspace) then
						return
					end

					if not obj83 or not obj83.Parent then
						obj83 = flag2.CreateRuntime()
					end

					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					player8.Tag = func513(param266, character, head, humanoidRootPart and humanoidRootPart:IsA("BasePart") and humanoidRootPart or nil)
					func515(player8, character)

					local function func520()
						task.defer(function()
							if flag501 and player8.Version == version then
								func517(player8)
							end
						end)
					end

					table.insert(player8.CharacterConnections, character.ChildAdded:Connect(function(child)
						if child:IsA("Tool") then
							func520()
						elseif child:IsA("Humanoid") then
							func515(player8, character)
						end
					end))

					table.insert(player8.CharacterConnections, character.ChildRemoved:Connect(function(child)
						if child:IsA("Tool") then
							func520()
						end
					end))

					table.insert(player8.CharacterConnections, character.AncestryChanged:Connect(function()
						if player8.Version == version and not character:IsDescendantOf(workspace) then
							player8.Version = player8.Version + 1
							func516(player8)
						end
					end))

					func517(player8)
					func518(player8, param266, version)
				end)
			end

			local function func521(player)
				local entry30 = tbl362[player]
				if not entry30 then
					return
				end
				entry30.Version = entry30.Version + 1
				func516(entry30)
				flag2.DisconnectAll(entry30.PlayerConnections)
				tbl362[player] = nil
			end

			local function func522(player)
				if player == localPlayer or tbl362[player] then
					return
				end

				local tbl369 = {
					Version = 0,
					Character = nil,
					Tag = nil,
					NameHumanoid = nil,
					NameDistance = nil,
					CharacterConnections = {},
					PlayerConnections = {},
				}

				tbl362[player] = tbl369

				table.insert(tbl369.PlayerConnections, player.CharacterAdded:Connect(function(character)
					func519(tbl369, player, character)
				end))

				table.insert(tbl369.PlayerConnections, player.CharacterRemoving:Connect(function(character)
					if tbl369.Character == character then
						tbl369.Version = tbl369.Version + 1
						func516(tbl369)
					end
				end))

				func519(tbl369, player, player.Character)
			end

			local function func523()
				for _, value437 in pairs(tbl362) do
					if value437.Tag then
						func512(value437.Tag)
					end
				end
			end

			local function func524()
				flag501 = false
				n21 += 1
				flag2.DisconnectAll(tbl363)
				local tbl370 = {}

				for k in pairs(tbl362) do
					table.insert(tbl370, k)
				end

				for _, item137 in ipairs(tbl370) do
					func521(item137)
				end

				if obj83 then
					obj83:Destroy()
					obj83 = nil
				end
			end

			local function func525()
				if flag501 then
					return
				end
				flag501 = true
				n21 += 1
				local flag508 = n21
				obj83 = flag2.CreateRuntime()

				for _, player in ipairs(Players:GetPlayers()) do
					func522(player)
				end

				table.insert(tbl363, Players.PlayerAdded:Connect(func522))
				table.insert(tbl363, Players.PlayerRemoving:Connect(func521))
				local currentCamera = workspace.CurrentCamera

				if currentCamera then
					table.insert(tbl363, currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(func523))
				end

				task.spawn(function()
					while true do
						if flag501 and flag508 == n21 then
							task.wait(1)

							if not (not flag501 or flag508 ~= n21) then
								for k, value438 in pairs(tbl362) do
									local character = k.Character
									local adornee = value438.Tag and value438.Tag.Billboard.Parent and value438.Tag.Billboard.Adornee and value438.Tag.Billboard.Adornee:IsDescendantOf(workspace)

									if character and character:IsDescendantOf(workspace) and (value438.Character ~= character or not adornee) then
										func519(value438, k, character)
									end
								end

								continue
							end
						end

						break
					end
				end)
			end

			local function func526()
				if flag503 then
					return
				end

				if flag2.ReadToggle(value433, flag502) then
					func525()
				elseif flag501 then
					func524()
				end
			end

			func4(function()
				flag503 = true
				func524()
			end)

			value433 = espSection:CreateToggle({
				Name = "ESP Players",
				Default = false,
				Callback = function(value)
					flag502 = value == true
					flag2.SyncSoon(func526)
				end,
			})

			func6(espSection:CreateMultiDropdown({
				Name = "ESP Player Info",
				Options = { "Name", "Username", "Avatar", "Tool" },
				Default = { "Name", "Tool" },
				SubOf = value433,
				Callback = function(value)
					local tbl371 = { Name = false, Username = false, Avatar = false, Tool = false }

					if type(value) == "table" then
						for k, value439 in pairs(value) do
							if type(value439) == "string" and tbl371[value439] ~= nil then
								tbl371[value439] = true
							elseif type(k) == "string" and value439 == true and tbl371[k] ~= nil then
								tbl371[k] = true
							end
						end
					end

					tbl365 = tbl371
					func523()
				end,
			}))

			espSection:CreateSlider({
				Name = "ESP Player Size",
				Min = 50,
				Max = 200,
				Default = 75,
				Increment = 5,
				Unit = "%",
				SubOf = value433,
				Callback = function(value)
					local num120 = tonumber(value)

					if num120 and n22 ~= num120 / 100 then
						n22 = math.clamp(num120 / 100, 0.5, 2)
						func523()
					end
				end,
			})
		end

		n4 = 3
		n5 = 0.002
		n6 = 4
		n7 = 0.3
		n8 = 0.62
		n9 = 0.86
		n10 = 4.4262295081967213
		n11 = 1.392
		n12 = 1.03
		tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		tweenInfo2 = TweenInfo.new(0.24, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		tweenInfo3 = TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		tweenInfo4 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		tweenInfo5 = TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		TweenService = game:GetService("TweenService")
		color2 = Color3.fromRGB

		func463 = function(list58)
			local tbl372 = {}

			for i, item138 in ipairs(list58) do
				tbl372[i] = ColorSequenceKeypoint.new(item138[1], item138[2])
			end

			return ColorSequence.new(tbl372)
		end

		tbl304 = {}

		do
			local hud = {}
			local tbl373 = { 0, color2(0, 118, 255) }
			local tbl374 = { 1, color2(72, 204, 255) }
			local tbl375 = { tbl373, tbl374 }
			hud.Color = func463(tbl375)
			hud.Rotation = -90
			hud.Stroke = color2(0, 28, 76)
			hud.Light = color2(172, 226, 255)
			tbl304.Hud = hud
		end

		do
			local steal = {}
			local tbl376 = { 0, color2(60, 255, 0) }
			local tbl377 = { 1, color2(136, 255, 0) }
			local tbl378 = { tbl376, tbl377 }
			steal.Color = func463(tbl378)
			steal.Rotation = -90
			steal.Stroke = color2(11, 72, 0)
			steal.Light = color2(190, 255, 180)
			tbl304.Steal = steal
		end

		do
			local queued = {}
			local tbl379 = { 0, color2(118, 118, 132) }
			local tbl380 = { 1, color2(172, 172, 186) }
			local tbl381 = { tbl379, tbl380 }
			queued.Color = func463(tbl381)
			queued.Rotation = -90
			queued.Stroke = color2(28, 28, 34)
			queued.Light = color2(214, 214, 226)
			tbl304.Queued = queued
		end

		do
			local priorityOn = {}
			local tbl382 = { 0, color2(255, 247, 0) }
			local tbl383 = { 1, color2(255, 136, 0) }
			local tbl384 = { tbl382, tbl383 }
			priorityOn.Color = func463(tbl384)
			priorityOn.Rotation = 90
			priorityOn.Stroke = color2(0, 0, 0)
			priorityOn.Light = color2(132, 112, 0)
			tbl304.PriorityOn = priorityOn
		end

		do
			local cancel = {}
			local tbl385 = { 0, color2(214, 17, 17) }
			local tbl386 = { 1, color2(253, 20, 20) }
			local tbl387 = { tbl385, tbl386 }
			cancel.Color = func463(tbl387)
			cancel.Rotation = -90
			cancel.Stroke = color2(72, 0, 0)
			cancel.Light = color2(255, 103, 103)
			tbl304.Cancel = cancel
		end

		do
			local chilli = {}
			local tbl388 = { 0, color2(132, 74, 255) }
			local tbl389 = { 0.34, color2(178, 74, 255) }
			local tbl390 = { 0.6, color2(255, 104, 206) }
			local tbl391 = { 0.78, color2(255, 168, 232) }
			local tbl392 = { 1, color2(146, 66, 255) }
			local tbl393 = { tbl388, tbl389, tbl390, tbl391, tbl392 }
			chilli.Color = func463(tbl393)
			chilli.Rotation = -115
			chilli.Stroke = color2(44, 10, 80)
			chilli.Light = color2(226, 178, 255)
			tbl304.Chilli = chilli
		end

		tbl305 = {}

		do
			local tbl394 = { 0, color2(255, 255, 255) }
			local tbl395 = { 0.2, color2(206, 212, 224) }
			local tbl396 = { 0.42, color2(74, 80, 94) }
			local tbl397 = { 0.58, color2(42, 46, 56) }
			local tbl398 = { 0.78, color2(158, 166, 182) }
			local tbl399 = { 1, color2(250, 252, 255) }
			tbl305[1] = tbl394
			tbl305[2] = tbl395
			tbl305[3] = tbl396
			tbl305[4] = tbl397
			tbl305[5] = tbl398
			tbl305[6] = tbl399
		end
	end

	local obj84, obj85

	do
		local value440 = func463(tbl305)
		local tbl400 = {}
		local rarityGradients = nil

		local function func527(param267)
			local entry31 = tbl400[param267]
			if entry31 then
				return entry31
			end
			local directory = tbl1.Assets and tbl1.Assets.Directory
			local flag509 = type(directory) == "table" and directory[param267] or nil
			local rarity = type(flag509) == "table" and type(flag509.Rarity) == "table" and flag509.Rarity or nil
			local rarityGradient = rarity and rarity.RarityGradient or nil

			if rarity and typeof(rarityGradient) ~= "Instance" then
				if rarityGradients == nil then
					local assets = ReplicatedStorage:FindFirstChild("Assets")
					assets = assets and assets:FindFirstChild("UI")
					rarityGradients = assets and assets:FindFirstChild("RarityGradients") or false
				end

				rarityGradient = rarityGradients

				if rarityGradients then
					rarityGradient = rarityGradients:FindFirstChild(tostring(rarity._id or rarity.DisplayName or ""))
				end

				rarityGradient = rarityGradient and rarityGradient:FindFirstChild("RarityGradient") or nil
			end

			local flag510

			if rarity then
				flag510 = tostring(rarity.DisplayName or rarity._id or "")
			else
				flag510 = rarity
			end

			flag510 = flag510 or ""
			local color3 = rarity and typeof(rarity.Color) == "Color3" and rarity.Color or color2(255, 255, 255)
			local color4 = func463({ { 0, color3 }, { 1, color3 } })
			local gradientRotation

			if string.upper(flag510) == "SECRET" then
				gradientRotation = 90
				color4 = value440
			else
				local isUIGradient = typeof(rarityGradient) == "Instance" and rarityGradient:IsA("UIGradient")
				gradientRotation = 90

				if isUIGradient then
					color4 = rarityGradient.Color
					gradientRotation = rarityGradient.Rotation
				end
			end

			local icon = type(flag509) == "table" and flag509.Icon or nil

			if tonumber(icon) then
				icon = "rbxassetid://" .. tostring(icon)
			end

			local tbl401 = {}
			local flag511 = type(flag509) == "table"
			local name

			if flag511 then
				name = tostring(flag509.DisplayName or param267)
			else
				name = flag511
			end

			tbl401.Name = name or tostring(param267)
			tbl401.Icon = icon and tostring(icon) or ""

			if rarity then
				rarity = tonumber(rarity.RarityNumber or rarity.Rank)
			end

			tbl401.RarityNumber = rarity or 0
			tbl401.GradientColor = color4
			tbl401.GradientRotation = gradientRotation
			tbl401.EarningRate = type(flag509) == "table" and tonumber(flag509.EarningRate) or 0
			tbl400[param267] = tbl401
			return tbl401
		end

		local function func528(param268, param269)
			local n13 = tonumber(param268.AssetScale) or 1
			local n14 = n13 > 5 and (n13 / 5) ^ 1.2 * 19.637875755794113 or n13 ^ 1.85
			local mutations = type(param268.Mutations) == "table" and param268.Mutations or {}

			if #mutations == 0 and type(param268.BaseMutation) == "string" and param268.BaseMutation ~= "" then
				mutations = { param268.BaseMutation }
			end

			local mutations2 = tbl1.Mutations
			local flag512 = type(mutations2) == "table" and type(mutations2.EarningsFor) == "function"
			local n15 = 1

			if flag512 then
				local ok
				ok, n15 = pcall(mutations2.EarningsFor, mutations)
				ok = ok and type(n15) == "number"
				local n16 = 1

				if not ok then
					n15 = n16
				end
			end

			return param269.EarningRate * n14 * n15
		end

		local tbl402 = { "", "K", "M", "B", "T", "Qa", "Qi", "Sx" }

		local function func529(param270)
			local n13 = tonumber(param270) or 0
			local n14 = 1

			while n13 >= 1000 and n14 < #tbl402 do
				n13 /= 1000
				n14 += 1
			end

			local str44 = n14 == 1 and tostring(math.floor(n13)) or string.format("%.1f", math.floor(n13 * 10) / 10)
			local str45 = tbl402[n14] .. "/s"
			return "$" .. string.gsub(str44, "%.0$", "") .. str45
		end

		local function func530(flag513, text)
			if flag513 and flag513.Text ~= text then
				flag513.Text = text
			end
		end

		local flag514 = false
		local n13 = 0
		local flag515 = false
		local value441 = nil
		local value442 = nil
		local value443 = nil
		local imageLabel = nil
		local value444 = nil
		local value445 = nil
		local position = nil
		local title = nil
		local value446 = nil
		local value447 = nil
		local value448 = nil
		local flag516 = false
		local obj86 = obj2:CreateState({ Name = "Steal Panel Open", Default = true })
		local flag517 = false
		local tween = nil
		local tween2 = nil
		local n14 = 0
		local value449 = nil
		local value450 = nil
		local n15 = 1
		local tbl403 = {}
		local tbl404 = {}
		local tbl405 = {}
		local obj = setmetatable({}, { __mode = "k" })
		local uiStroke = nil
		local thickness = nil
		local flag518 = false
		local flag519 = false
		local flag520 = false
		local value451 = nil

		local function func531()
			local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
			local hud = playerGui and playerGui:FindFirstChild("HUD")
			local gameHUD = hud and hud:FindFirstChild("GameHUD")
			local rightButtons = gameHUD and gameHUD:FindFirstChild("RightButtons")
			local activePets = playerGui and playerGui:FindFirstChild("ActivePets")

			local tbl406 = {
				Hud = hud,
				GameHud = gameHUD,
				Column = rightButtons,
				Eggs = rightButtons and rightButtons:FindFirstChild("EggsButton"),
				Pets = rightButtons and rightButtons:FindFirstChild("PetsButton"),
				ActivePets = activePets,
				GrowingEggs = playerGui and playerGui:FindFirstChild("GrowingEggs"),
			}

			if not (hud and gameHUD and rightButtons and tbl406.Eggs and tbl406.Pets and activePets and activePets:FindFirstChild("Frame")) then
				return nil
			end
			return tbl406
		end

		local function func532(obj87)
			local ok, result = pcall(function()
				return obj87:Clone()
			end)

			if not ok or typeof(result) ~= "Instance" then
				return nil
			end

			for _, descendant in ipairs(result:GetDescendants()) do
				if descendant:IsA("LuaSourceContainer") then
					descendant:Destroy()
				end
			end

			return result
		end

		local function func533(list59)
			list59.Name = func3()

			for _, descendant in ipairs(list59:GetDescendants()) do
				descendant.Name = func3()
			end
		end

		local n16 = 2.3120369911193848
		local n17 = 556
		local n18 = 86.24
		local tbl407 = { Panel = n16, Hud = n16 }

		local function func534(param271)
			if param271 then
				local x = value445 and value445.AbsoluteSize.X or 0
				return x > 0 and n16 * x / n17 or nil
			end
			local button = value443 and value443.Button
			button = button and button.Size.X.Offset or 0
			return button > 0 and n16 * button / n18 or nil
		end

		local function func535(instance26, param272)
			local panel2 = func534(param272.Panel)

			if panel2 and instance26.Parent then
				instance26.Thickness = param272.Ratio * panel2
			end
		end

		local function func536(list60, flag521)
			local panel = flag521 and tbl407.Panel or tbl407.Hud

			if not panel or panel <= 0 then
				panel = 2.3120369911193848
			end

			for _, descendant in ipairs(list60:GetDescendants()) do
				if descendant:IsA("UIStroke") then
					local ok, result = pcall(function()
						return descendant.StrokeSizingMode
					end)

					if not ok or result ~= Enum.StrokeSizingMode.ScaledSize then
						local tbl408 = { Ratio = descendant.Thickness / panel, Panel = flag521 == true }
						obj[descendant] = tbl408
						func535(descendant, tbl408)
					end
				end
			end
		end

		local function func537()
			for k, value452 in pairs(obj) do
				func535(k, value452)
			end
		end

		local function func538()
			func537()
		end

		local function func539(instance27)
			if not instance27 then
				return nil
			end

			return {
				Button = instance27,
				Gradient = instance27:FindFirstChildOfClass("UIGradient"),
				Stroke = instance27:FindFirstChild("UIStroke"),
				Light = instance27:FindFirstChild("UIStrokeClr"),
				Label = instance27:FindFirstChild("Label") or instance27:FindFirstChild("TextLabel"),
				Scale = instance27:FindFirstChild("BtnScale"),
			}
		end

		local function func540(flag522, style)
			if not flag522 or flag522.Style == style then
				return
			end
			flag522.Style = style

			if flag522.Gradient then
				flag522.Gradient.Color = style.Color
				flag522.Gradient.Rotation = style.Rotation
			end

			if flag522.Stroke then
				flag522.Stroke.Color = style.Stroke
			end

			if flag522.Light then
				flag522.Light.Color = style.Light
			end
		end

		local function func541(flag523)
			if not flag523 then
				return
			end
			local scale = flag523.Scale

			if not scale then
				scale = Instance.new("UIScale")
				scale.Parent = flag523.Button
				flag523.Scale = scale
			end

			local function func542(param273)
				TweenService:Create(scale, tweenInfo5, { Scale = param273 }):Play()
			end

			flag523.Button.MouseEnter:Connect(function()
				func542(1.08)
			end)

			flag523.Button.MouseLeave:Connect(function()
				func542(1)
			end)

			flag523.Button.MouseButton1Down:Connect(function()
				func542(0.94)
			end)

			flag523.Button.MouseButton1Up:Connect(function()
				func542(1.08)
			end)
		end

		local tweenInfo6 = TweenInfo.new(2.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
		local tweenInfo7 = TweenInfo.new(6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
		local tweenInfo8 = TweenInfo.new(1.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
		local list61 = {}

		local function func543(flag524)
			for _, item139 in ipairs(list61) do
				pcall(function()
					item139:Cancel()
				end)
			end

			table.clear(list61)
			if not flag524 then
				return
			end

			local function func544(obj88)
				list61[#list61 + 1] = obj88
				obj88:Play()
			end

			local gradient = flag524.Gradient

			if gradient then
				gradient.Rotation = -115
				gradient.Offset = Vector2.new(-0.30000001192092896, 0)
				func544(TweenService:Create(gradient, tweenInfo6, { Offset = Vector2.new(0.30000001192092896, 0) }))
				func544(TweenService:Create(gradient, tweenInfo7, { Rotation = -65 }))
			end

			local light = flag524.Light

			if light then
				light.Color = color2(226, 178, 255)
				func544(TweenService:Create(light, tweenInfo8, { Color = color2(255, 245, 255) }))
			end
		end

		local value453 = setthreadidentity or set_thread_identity

		local function func545()
			local eggState = tbl1.EggState

			if type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function" then
				local records = nil

				task.spawn(function()
					local ok, result = pcall(eggState.ReadFieldEggs)

					if ok and type(result) == "table" and type(result.Records) == "table" and next(result.Records) ~= nil then
						records = result.Records
					end
				end)

				if type(value453) == "function" then
					pcall(value453, 8)
				end

				if records then
					return records
				end
			end

			local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
			if not rfEggWorldAskFieldEggSnapshot or not rfEggWorldAskFieldEggSnapshot:IsA("RemoteFunction") then
				return nil
			end
			local flag525 = false
			local records = nil

			task.spawn(function()
				local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)

				if ok and type(result) == "table" and type(result.Records) == "table" then
					records = result.Records
				end

				flag525 = true
			end)

			local now = os.clock()

			while not flag525 and os.clock() - now < n6 do
				RunService.Heartbeat:Wait()
			end

			return records
		end

		local function func546()
			local flag526 = value441 ~= nil
			local enabled

			if flag526 then
				local enabled2 = value441.ActivePets and value441.ActivePets.Enabled

				if enabled2 then
					enabled = enabled2
				else
					enabled = value441.GrowingEggs and value441.GrowingEggs.Enabled
				end
			else
				enabled = flag526
			end

			return enabled or false
		end

		local function func547()
			local flag527 = false

			for _, item140 in ipairs({ value441.ActivePets, value441.GrowingEggs }) do
				if item140 and item140.Enabled then
					local frame = item140:FindFirstChild("Frame")
					frame = frame and frame:FindFirstChild("Close")
					local flag528 = frame and typeof(getconnections) == "function"
					local flag529 = false

					if flag528 then
						local ok, result = pcall(getconnections, frame.Activated)

						if ok and type(result) == "table" then
							for _, item141 in ipairs(result) do
								if pcall(function()
									item141:Fire()
								end) then
									flag529 = true
								end
							end
						end
					end

					if not flag529 then
						item140.Enabled = false
					end

					flag527 = true
				end
			end

			return flag527
		end

		local function func548(flag530, param274)
			local column = value441 and value441.Column
			if not column or not column.Parent then
				return
			end

			if tween2 then
				tween2:Cancel()
				tween2 = nil
			end

			local position2 = column.Position
			local udim2 = UDim2.new(position2.X.Scale, flag530 and math.ceil(column.AbsoluteSize.X * n12) or 0, position2.Y.Scale, position2.Y.Offset)
			if param274 then
				column.Position = udim2
				return
			end
			tween2 = TweenService:Create(column, flag530 and tweenInfo3 or tweenInfo4, { Position = udim2 })
			tween2:Play()
		end

		local n19 = 0.106
		local udim2 = UDim2.new(0.955, 0, 0.6, 0)
		local udim22 = UDim2.new(0.955 - n19, 0, 0.6, 0)
		local udim23 = UDim2.new(0.2, 0, 0.56, 0)
		local n20 = 0.955 - n19

		local function func549(flag531, visible)
			if flag531 and flag531.Button.Visible ~= visible then
				flag531.Button.Visible = visible
			end
		end

		local function func550(param275, rank, badgeStyle, flag532)
			local visible = rank ~= nil
			param275.Rank = rank
			func549(param275.Steal, not visible)
			func549(param275.Up, visible)
			func549(param275.Down, visible)
			func549(param275.Cancel, visible)

			if visible then
				func540(param275.Up, rank > 1 and tbl304.Hud or tbl304.Queued)
				func540(param275.Down, rank < (flag532 or rank) and tbl304.Hud or tbl304.Queued)
			end

			func540(param275.Star, rank == 1 and tbl304.PriorityOn or tbl304.Queued)

			if param275.Badge then
				if param275.Badge.Visible ~= visible then
					param275.Badge.Visible = visible
				end

				if visible then
					func530(param275.Badge, "#" .. rank)
					badgeStyle = badgeStyle and tbl304.Steal or tbl304.PriorityOn

					if param275.BadgeStyle ~= badgeStyle and param275.BadgeGradient then
						param275.BadgeStyle = badgeStyle
						param275.BadgeGradient.Color = badgeStyle.Color
						param275.BadgeGradient.Rotation = 90
					end
				end
			end
		end

		local function func551()
			if not value449 then
				return
			end
			local flag533 = str1.Toggle(value2, false)

			if value449.On ~= flag533 then
				value449.On = flag533
				func540(value449.Toggle, flag533 and tbl304.Steal or tbl304.Cancel)
				func530(value449.Toggle.Label, flag533 and "Auto Steal: ON" or "Auto Steal: OFF")
			end

			local guardOn = str1.SafeCarry.LineDrop == true

			if value449.Guard and value449.GuardOn ~= guardOn then
				value449.GuardOn = guardOn
				func540(value449.Guard, guardOn and tbl304.Steal or tbl304.Cancel)
				func530(value449.Guard.Label, guardOn and "Instant Steal: ON" or "Instant Steal: OFF")
			end

			if value446 and value449.SortShown ~= flag1 then
				value449.SortShown = flag1
				func530(value446.Label, "Sort: " .. tostring(flag1))
			end
		end

		local n21 = 4
		local tbl409 = {}
		local tbl410 = {}

		local function func552()
			if not value447 then
				return
			end
			func551()
			local tbl411 = {}

			for _, value454 in pairs(tbl404) do
				table.insert(tbl411, value454)
			end

			local tbl412 = {}
			local value455 = nil

			if type(str1.StealPlan) == "function" then
				task.spawn(function()
					local ok, result, result2 = pcall(str1.StealPlan)

					if ok and type(result) == "table" then
						tbl412 = result
						value455 = result2
					end
				end)
			end

			local tbl413 = {}

			for i, item142 in ipairs(tbl412) do
				if tbl413[item142] == nil then
					tbl413[item142] = i
				end
			end

			local flag534 = flag1

			table.sort(tbl411, function(param276, param277)
				local entry32 = tbl413[param276.Uid]
				local entry33 = tbl413[param277.Uid]
				if entry32 ~= nil ~= entry33 ~= nil then
					return entry32 ~= nil
				end

				if entry32 and entry33 then
					return entry32 < entry33
				end

				if flag534 == list2[1] and param276.Style.RarityNumber ~= param277.Style.RarityNumber then
					return param276.Style.RarityNumber > param277.Style.RarityNumber
				end
				local flag535 = flag534 == list2[2]

				if flag535 then
					flag535 = (param276.Weight or 0) ~= (param277.Weight or 0)
				end

				if flag535 then
					return (param276.Weight or 0) > (param277.Weight or 0)
				end

				if flag534 == list2[5] and param276.Value ~= param277.Value then
					return param276.Value < param277.Value
				end

				if param276.Value ~= param277.Value then
					return param276.Value > param277.Value
				end
				return param276.Uid < param277.Uid
			end)

			local now = os.clock()
			local tbl414 = {}
			local tbl415 = {}

			for _, item143 in ipairs(tbl411) do
				local entry34 = tbl409[item143.Uid]

				if entry34 and entry34 > now and tbl410[item143.Uid] then
					table.insert(tbl415, item143)
				else
					tbl409[item143.Uid] = nil
					table.insert(tbl414, item143)
				end
			end

			table.sort(tbl415, function(param278, param279)
				return tbl410[param278.Uid] < tbl410[param279.Uid]
			end)

			for _, item144 in ipairs(tbl415) do
				table.insert(tbl414, math.clamp(tbl410[item144.Uid], 1, #tbl414 + 1), item144)
			end

			table.clear(tbl410)

			for i, item145 in ipairs(tbl414) do
				tbl410[item145.Uid] = i
				local entry35 = tbl403[item145.Uid]

				if entry35 then
					if entry35.Frame.LayoutOrder ~= i then
						entry35.Frame.LayoutOrder = i
					end

					func550(entry35, tbl413[item145.Uid], item145.Uid == value455, #tbl412)
				end
			end
		end

		local function func553()
			if not value447 then
				return
			end
			local n22 = math.max(1, math.floor(value447.AbsoluteSize.X / n10 + 0.5))
			if n22 == n14 then
				return
			end
			n14 = n22

			for _, value456 in pairs(tbl403) do
				value456.Frame.Size = UDim2.new(1, 0, 0, n22)
			end
		end

		local function func554(param280)
			local clone = value448:Clone()
			local spacer = clone:FindFirstChild("Spacer")
			local textLabel = spacer:FindFirstChild("TextLabel")

			local tbl416 = {
				Uid = param280,
				Frame = clone,
				Icon = spacer:FindFirstChild("Icon"),
				Label = textLabel,
				ValueLabel = spacer:FindFirstChild("Value"),
				DetailLabel = spacer:FindFirstChild("Detail"),
			}

			tbl416.Gradient = textLabel and textLabel:FindFirstChildOfClass("UIGradient")
			tbl416.Steal = func539(spacer:FindFirstChild("Unequip"))
			tbl416.Cancel = func539(spacer:FindFirstChild("Cancel"))
			tbl416.Star = func539(spacer:FindFirstChild("Star"))
			tbl416.Up = func539(spacer:FindFirstChild("Up"))
			tbl416.Down = func539(spacer:FindFirstChild("Down"))
			tbl416.Badge = spacer:FindFirstChild("Rank")
			tbl416.BadgeGradient = tbl416.Badge and tbl416.Badge:FindFirstChildOfClass("UIGradient") or nil

			if textLabel and not tbl416.Gradient then
				tbl416.Gradient = Instance.new("UIGradient")
				tbl416.Gradient.Parent = textLabel
			end

			func541(tbl416.Steal)
			func541(tbl416.Cancel)
			func541(tbl416.Star)
			func541(tbl416.Up)
			func541(tbl416.Down)

			for _, item146 in ipairs({ { tbl416.Up, -1 }, { tbl416.Down, 1 } }) do
				if item146[1] then
					item146[1].Button.Activated:Connect(function()
						if type(str1.MoveInPlan) == "function" then
							str1.MoveInPlan(tbl416.Uid, item146[2])
						end

						str1.UiDefer(func552)
					end)
				end
			end

			if tbl416.Steal then
				tbl416.Steal.Button.Activated:Connect(function()
					if tbl416.Rank == nil and type(str1.StealNow) == "function" then
						str1.StealNow(tbl416.Uid, false)
					end

					str1.UiDefer(func552)
				end)
			end

			if tbl416.Cancel then
				tbl416.Cancel.Button.Activated:Connect(function()
					tbl409[tbl416.Uid] = os.clock() + n21

					if type(str1.CancelSteal) == "function" then
						str1.CancelSteal(tbl416.Uid)
					end

					str1.UiDefer(func552)
				end)
			end

			if tbl416.Star then
				tbl416.Star.Button.Activated:Connect(function()
					if type(str1.PrioritizeSteal) == "function" then
						str1.PrioritizeSteal(tbl416.Uid)
					end

					str1.UiDefer(func552)
				end)
			end

			func536(clone, true)
			func533(clone)
			clone.Size = UDim2.new(1, 0, 0, math.max(n14, 1))
			clone.Visible = true
			clone.Parent = value447
			return tbl416
		end

		local function func555(param281, param282)
			local style = param282.Style

			if param281.Category ~= param282.Category then
				param281.Category = param282.Category

				if param281.Icon then
					param281.Icon.Image = style.Icon
				end

				if param281.Gradient then
					param281.Gradient.Color = style.GradientColor
					param281.Gradient.Rotation = style.GradientRotation
				end
			end

			func530(param281.Label, style.Name)
			func530(param281.ValueLabel, func529(param282.Value))
			func530(param281.DetailLabel, param282.Detail or "")
		end

		local function func556(param283)
			local n22 = tonumber(param283) or 0
			local str46 = n22 >= 1000 and string.format("%.0f", n22) or string.format("%.2f", n22)
			local flag536, flag537 = string.match(str46, "^(%-?%d+)(%.%d+)$")
			flag536 = flag536 or str46
			local str47

			while true do
				local flag538
				str47, flag538 = string.gsub(flag536, "^(%-?%d+)(%d%d%d)", "%1,%2")

				if flag538 == 0 then
					break
				else
					flag536 = str47
				end
			end

			return str47 .. (flag537 or "") .. " Kg"
		end

		local function func557(param284, param285)
			local formatted19 = string.format("x%.2f", param285)
			local eggRecords = tbl1.EggRecords
			local flag539 = type(eggRecords) == "table" and type(eggRecords.WeightKgForScale) == "function"
			local n22 = 0

			if flag539 then
				local ok, result = pcall(eggRecords.WeightKgForScale, param284, param285)

				if ok and tonumber(result) then
					n22 = tonumber(result)
					formatted19 ..= "  " .. utf8.char(183) .. "  " .. func556(result)
				end
			end

			return formatted19, n22
		end

		local value457 = nil

		local function func558(flag540)
			local result87 = func545()

			if result87 and flag540 == n13 and flag514 then
				local tbl417 = {}
				local now = os.clock()
				local n22 = -1
				local value458 = nil

				for _, value459 in pairs(result87) do
					local uid = type(value459) == "table" and value459.Uid or nil
					local state2 = value459.State == "Slot" or value459.State == "Dropped" or value459.State == "Carried"

					if type(uid) == "string" and state2 and type(value459.AssetCategory) == "string" then
						tbl417[uid] = true
						local assetCategory16 = func527(value459.AssetCategory)
						local entry36 = tbl404[uid]

						if not entry36 then
							entry36 = { Uid = uid }
							tbl404[uid] = entry36
						end

						local scale = tonumber(value459.AssetScale) or 1

						if entry36.Detail == nil or entry36.Scale ~= scale or entry36.Category ~= value459.AssetCategory then
							entry36.Scale = scale
							local value460, value461 = func557(value459.AssetCategory, scale)
							entry36.Detail = value460
							entry36.Weight = value461
						end

						entry36.Category = value459.AssetCategory
						entry36.Style = assetCategory16
						entry36.Value = func528(value459, assetCategory16)
						entry36.Position = typeof(value459.BottomCFrame) == "CFrame" and value459.BottomCFrame.Position or nil

						if (value459.State == "Slot" or value459.State == "Dropped") and assetCategory16.Icon ~= "" and entry36.Value > n22 then
							n22 = entry36.Value
							value458 = entry36
						end

						if flag516 and value447 then
							local entry37 = tbl403[uid]

							if not entry37 then
								entry37 = func554(uid)
								tbl403[uid] = entry37
							end

							func555(entry37, entry36)
						end
					end

					if not (n5 < os.clock() - now) then
						continue
					end
					RunService.Heartbeat:Wait()
					now = os.clock()
					if flag540 ~= n13 or not flag514 then
						return
					end
				end

				for k in pairs(tbl404) do
					if not tbl417[k] then
						tbl404[k] = nil
						local entry38 = tbl403[k]

						if entry38 then
							tbl403[k] = nil
							entry38.Frame:Destroy()
						end
					end
				end

				if imageLabel and value458 and imageLabel.Image ~= value458.Style.Icon then
					imageLabel.Image = value458.Style.Icon
				end

				func552()
			end
		end

		local n22 = 0

		local function func559(param286)
			if flag519 and os.clock() - n22 < 10 then
				flag520 = true
				return
			end
			flag519 = true
			n22 = os.clock()
			pcall(func558, param286)

			if n22 == n22 then
				flag519 = false
			end

			if flag520 then
				flag520 = false
				value457()
			end
		end

		value457 = function()
			if flag518 or not flag514 then
				return
			end
			flag518 = true
			local flag541 = n13

			task.delay(flag516 and 0.15 or 1, function()
				flag518 = false

				if flag514 and flag541 == n13 then
					task.spawn(pcall, func559, flag541)
				end
			end)
		end

		local function func560(param287)
			if flag516 or not value445 then
				return
			end
			flag516 = true

			if param287 then
				obj86:Set(true)
			end

			if func547() then
				RunService.Heartbeat:Wait()
				if not flag516 or not value445 then
					return
				end
			end

			func548(true)
			value444.Enabled = true

			if tween then
				tween:Cancel()
			end

			local scale = position.Y.Scale
			local offset = position.Y.Offset
			value445.Position = UDim2.new(position.X.Scale, math.ceil(value445.AbsoluteSize.X * n11), scale, offset)
			tween = TweenService:Create(value445, tweenInfo, { Position = position })
			tween:Play()
			func538()
			func553()
			task.spawn(pcall, func559, n13)
		end

		local function func561(param288, param289)
			if not flag516 or not value445 then
				return
			end
			flag516 = false

			if param289 then
				obj86:Set(false)
			end

			if tween then
				tween:Cancel()
			end

			local scale = position.Y.Scale
			local offset = position.Y.Offset
			local tween3 = TweenService:Create(value445, tweenInfo2, { Position = UDim2.new(position.X.Scale, math.ceil(value445.AbsoluteSize.X * n11), scale, offset) })
			tween = tween3

			tween3.Completed:Connect(function(playbackState)
				if playbackState == Enum.PlaybackState.Completed and tween == tween3 and not flag516 and value444 then
					value444.Enabled = false
					value445.Position = position
				end
			end)

			tween3:Play()

			if param288 then
				func548(false)
			end
		end

		local function createScreenGui(param290)
			local screenGui = Instance.new("ScreenGui")
			screenGui.Name = func3()
			screenGui.Archivable = false
			screenGui.ResetOnSpawn = false
			screenGui.IgnoreGuiInset = param290.IgnoreGuiInset
			screenGui.ZIndexBehavior = param290.ZIndexBehavior
			screenGui.DisplayOrder = param290.DisplayOrder

			pcall(function()
				screenGui.ScreenInsets = param290.ScreenInsets
			end)

			return screenGui
		end

		local function func562()
			if value442 and value442.Parent and value443 and value443.Button then
				return true
			end
			local pets2 = func532(value441.Pets)
			if not pets2 then
				return false
			end

			for _, item147 in ipairs({ "Notification", "ReadyNotification", "NightImage", "NightText", "ConsoleButton", "Badge" }) do
				local obj89 = pets2:FindFirstChild(item147)

				if obj89 then
					obj89:Destroy()
				end
			end

			value443 = func539(pets2)
			imageLabel = pets2:FindFirstChild("ImageLabel")

			if value443.Scale then
				value443.Scale.Scale = 1
			end

			func540(value443, tbl304.Chilli)
			func541(value443)
			func543(value443)
			pets2.AnchorPoint = Vector2.new(0.5, 0.5)
			pets2.LayoutOrder = 0

			pets2.Activated:Connect(function()
				str1.UiDefer(function()
					if not value444 or not value444.Parent then
						pcall(value451)

						str1.UiDefer(function()
							if value444 and not flag516 then
								pcall(func560, true)
							end
						end)

						return
					end

					if flag516 then
						func561(true, true)
					else
						func560(true)
					end
				end)
			end)

			func536(pets2)
			func533(pets2)
			value442 = createScreenGui(value441.Hud)
			pets2.Parent = value442
			value442.Parent = value1
			return true
		end

		local value462 = nil
		local value463 = nil

		local function func563()
			local button = value443 and value443.Button
			local eggs = value441.Eggs
			local pets = value441.Pets
			if not button or not eggs.Parent or not pets.Parent then
				return
			end

			if value441.Hud.Enabled and value441.GameHud.Visible and value441.Column.Visible and eggs.Visible and pets.Visible and eggs.AbsoluteSize.X > 0 then
				local uiScale = eggs:FindFirstChildOfClass("UIScale")
				local scale = uiScale and uiScale.Scale or 1

				if scale <= 0 then
					scale = 1
				end

				local n23 = eggs.AbsolutePosition + eggs.AbsoluteSize / 2
				local n24 = pets.AbsolutePosition + pets.AbsoluteSize / 2
				local n25 = eggs.AbsoluteSize / scale
				local absolutePosition = value442.AbsolutePosition
				local udim24 = UDim2.fromOffset(n23.X - absolutePosition.X, n23.Y - n24.Y - n23.Y - absolutePosition.Y)
				local udim25 = UDim2.fromOffset(n25.X, n25.Y)

				if not flag516 then
					value462 = udim24
					value463 = udim25
				end

				if button.Position ~= udim24 then
					button.Position = udim24
				end

				if button.Size ~= udim25 then
					button.Size = udim25
					func537()
				end
			elseif not flag516 and value462 then
				if button.Position ~= value462 then
					button.Position = value462
				end

				if value463 and button.Size ~= value463 then
					button.Size = value463
					func537()
				end
			end

			if button.Visible ~= true then
				button.Visible = true
			end
		end

		local function func564()
			local frame = value441.ActivePets.Frame
			local obj90 = func532(frame)
			if not obj90 then
				return false
			end
			local header = obj90:FindFirstChild("Header")
			local scrollingFrame = obj90:FindFirstChild("ScrollingFrame")
			local close = obj90:FindFirstChild("Close")
			local template = scrollingFrame and scrollingFrame:FindFirstChild("Template")
			local spacer = template and template:FindFirstChild("Spacer")
			local unequip = spacer and spacer:FindFirstChild("Unequip")
			local textLabel = spacer and spacer:FindFirstChild("TextLabel")
			if not (header and scrollingFrame and close and spacer and unequip and textLabel) then
				obj90:Destroy()
				return false
			end

			for _, child in ipairs(scrollingFrame:GetChildren()) do
				if child ~= template and child:IsA("GuiObject") and child.Name ~= "EmptyLast" then
					child:Destroy()
				end
			end

			local equipBest = obj90:FindFirstChild("EquipBest")

			if equipBest then
				equipBest:Destroy()
			end

			local uiAspectRatioConstraint = obj90:FindFirstChildOfClass("UIAspectRatioConstraint")
			local aspectRatio = uiAspectRatioConstraint and uiAspectRatioConstraint.AspectRatio or 1.25
			local num121 = not UserInputService.MouseEnabled
			local n23 = num121 and 1.2 or 1
			num121 = num121 and 1.15 or 1
			local aspectRatio2 = n9 / num121
			local n24 = aspectRatio2 / aspectRatio
			value450 = { Width = frame.Size.X.Scale, Height = frame.Size.Y.Scale, Aspect = aspectRatio }
			obj90.Size = UDim2.new(n7 * n23, 0, n8 * n23 * num121, 0)

			if not uiAspectRatioConstraint then
				uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				uiAspectRatioConstraint.Parent = obj90
			end

			uiAspectRatioConstraint.AspectRatio = aspectRatio2
			uiAspectRatioConstraint.AspectType = Enum.AspectType.FitWithinMaxSize
			header.Size = UDim2.new(header.Size.X.Scale, header.Size.X.Offset, header.Size.Y.Scale * n24, header.Size.Y.Offset)
			header.Position = UDim2.new(header.Position.X.Scale, header.Position.X.Offset, header.Position.Y.Scale * n24, header.Position.Y.Offset)
			close.Size = UDim2.new(close.Size.X.Scale * 1, close.Size.X.Offset, close.Size.Y.Scale * n24, close.Size.Y.Offset)
			close.Position = UDim2.new(close.Position.X.Scale * 1, close.Position.X.Offset, close.Position.Y.Scale, close.Position.Y.Offset)
			local scale = scrollingFrame.Size.Y.Scale
			local scale2 = scrollingFrame.Position.Y.Scale
			local y = scrollingFrame.AnchorPoint.Y
			local n25 = (scale2 - scale * y) * n24
			local n26 = 1 - (1 - scale2 + scale * (1 - y)) * n24
			scrollingFrame.Size = UDim2.new(scrollingFrame.Size.X.Scale, scrollingFrame.Size.X.Offset, n26 - n25, 0)
			scrollingFrame.Position = UDim2.new(scrollingFrame.Position.X.Scale, scrollingFrame.Position.X.Offset, n25 + (n26 - n25) * y, 0)
			local scale3 = scrollingFrame.Size.Y.Scale
			local y2 = scrollingFrame.AnchorPoint.Y
			local n27 = scrollingFrame.Position.Y.Scale - scale3 * y2
			local n28 = n27 + scale3
			local n29 = 0.1 * n24
			local n30 = 0.02 * n24
			local frame2 = Instance.new("Frame")
			frame2.BackgroundTransparency = 1
			frame2.BorderSizePixel = 0
			frame2.AnchorPoint = Vector2.new(0.5, 0)
			frame2.Position = UDim2.new(0.5, 0, n27 + n30, 0)
			frame2.Size = UDim2.new(0.9, 0, n29, 0)
			frame2.Parent = obj90
			local n31 = n27 + n30 * 1.5 + n29
			scrollingFrame.Size = UDim2.new(scrollingFrame.Size.X.Scale, scrollingFrame.Size.X.Offset, n28 - n31, 0)
			scrollingFrame.Position = UDim2.new(scrollingFrame.Position.X.Scale, scrollingFrame.Position.X.Offset, n31 + (n28 - n31) * y2, 0)
			local clone = unequip:Clone()
			clone.AnchorPoint = Vector2.new(0, 0.5)
			clone.Position = UDim2.new(0, 0, 0.5, 0)
			clone.Size = UDim2.new(0.37, 0, 1, 0)
			clone.Parent = frame2
			local value464 = func539(clone)
			func541(value464)

			clone.Activated:Connect(function()
				local value465 = value2
				local flag542 = value2

				if value465 then
					flag542 = type(value465.Set) == "function"
				end

				if flag542 then
					pcall(value465.Set, value465, not str1.Toggle(value465, false))
				end

				str1.UiDefer(func551)
			end)

			local clone2 = unequip:Clone()
			clone2.Parent = frame2
			local value466 = func539(clone2)
			func541(value466)

			clone2.Activated:Connect(function()
				local safeCarry = str1.SafeCarry
				local lineDrop = not safeCarry.LineDrop
				local instantHandle = safeCarry.InstantHandle

				if instantHandle and type(instantHandle.Set) == "function" then
					pcall(instantHandle.Set, instantHandle, lineDrop)
				end

				safeCarry.LineDrop = lineDrop
				str1.UiDefer(func551)
			end)

			local uiListLayout = Instance.new("UIListLayout")
			uiListLayout.FillDirection = Enum.FillDirection.Horizontal
			uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
			uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout.Padding = UDim.new(0.06, 0)
			uiListLayout.Parent = frame2
			clone.Size = UDim2.new(0.46, 0, 1, 0)
			clone.LayoutOrder = 1
			clone2.Size = UDim2.new(0.46, 0, 1, 0)
			clone2.LayoutOrder = 2
			value449 = { Toggle = value464, Guard = value466 }

			str1.StealPanelSync = function()
				str1.UiDefer(func551)
			end

			local uiGradient = header:FindFirstChildOfClass("UIGradient")

			if uiGradient then
				local func565 = func463
				local tbl418 = { 0, color2(200, 18, 24) }
				local tbl419 = { 0.53, color2(255, 88, 90) }
				local tbl420 = { 1, color2(214, 28, 34) }
				local tbl421 = { tbl418, tbl419, tbl420 }
				uiGradient.Color = func565(tbl421)
			end

			title = header:FindFirstChild("Title")
			func530(title, "Steal Panel")
			local plusEquip = header:FindFirstChild("PlusEquip")
			value446 = func539(plusEquip)

			if value446 then
				func540(value446, tbl304.Steal)
				func530(value446.Label, "Sort: " .. tostring(flag1))
				func541(value446)
				local n32 = 0

				local function func566()
					if os.clock() - n32 < 0.25 then
						return
					end
					n32 = os.clock()
					local entry39 = list2[(table.find(list2, flag1) or 4) % #list2 + 1]
					local priorityHandle = str1.Steal.PriorityHandle

					if priorityHandle and type(priorityHandle.Set) == "function" then
						pcall(priorityHandle.Set, priorityHandle, entry39)
					end

					if flag1 ~= entry39 then
						flag1 = entry39

						if type(str1.ResortSteal) == "function" then
							str1.ResortSteal()
						end
					end

					str1.UiDefer(function()
						func530(value446.Label, "Sort: " .. tostring(flag1))
						func552()
					end)
				end

				pcall(function()
					plusEquip.Active = true
					plusEquip.Interactable = true
					plusEquip.AutoButtonColor = true
				end)

				for _, descendant in ipairs(plusEquip:GetDescendants()) do
					if descendant:IsA("GuiObject") then
						pcall(function()
							descendant.Active = false
						end)
					end
				end

				plusEquip.Activated:Connect(func566)

				plusEquip.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						func566()
					end
				end)
			end

			local value467 = func539(close)
			func541(value467)

			close.Activated:Connect(function()
				str1.UiDefer(function()
					func561(true, true)
				end)
			end)

			local clone3 = unequip:Clone()
			clone3.Name = "Cancel"
			clone3.Parent = spacer
			local uiAspectRatioConstraint2 = Instance.new("UIAspectRatioConstraint")
			uiAspectRatioConstraint2.AspectRatio = 1
			uiAspectRatioConstraint2.DominantAxis = Enum.DominantAxis.Height
			uiAspectRatioConstraint2.Parent = clone3
			unequip.Size = UDim2.new(0.24, 0, unequip.Size.Y.Scale, 0)
			unequip.Position = UDim2.new(0.852, 0, 0.5, 0)
			clone3.Size = UDim2.new(0.105, 0, unequip.Size.Y.Scale, 0)
			clone3.Position = UDim2.new(0.965, 0, 0.5, 0)
			local icon = spacer:FindFirstChild("Icon")

			if icon then
				icon.AnchorPoint = Vector2.new(0.5, 0.5)
				icon.Size = UDim2.new(0.2, 0, 1.3, 0)
				icon.Position = UDim2.new(0.1, 0, 0.5, 0)
			end

			textLabel.AnchorPoint = Vector2.new(textLabel.AnchorPoint.X, 0.5)
			textLabel.Size = UDim2.new(0.38, 0, 0.3, 0)
			textLabel.Position = UDim2.new(0.415, 0, 0.2, 0)
			func530(textLabel, "")
			local clone4 = textLabel:Clone()
			clone4.Name = "Value"
			clone4.Size = UDim2.new(0.38, 0, 0.23, 0)
			clone4.Position = UDim2.new(0.415, 0, 0.48, 0)
			local uiGradient2 = clone4:FindFirstChildOfClass("UIGradient")

			if not uiGradient2 then
				uiGradient2 = Instance.new("UIGradient")
				uiGradient2.Parent = clone4
			end

			uiGradient2.Color = tbl304.Steal.Color
			uiGradient2.Rotation = tbl304.Steal.Rotation
			clone4.Parent = spacer
			local clone5 = clone4:Clone()
			clone5.Name = "Detail"
			clone5.Size = UDim2.new(0.4, 0, 0.3, 0)
			clone5.Position = UDim2.new(0.415, 0, 0.78, 0)
			local uiGradient3 = clone5:FindFirstChildOfClass("UIGradient")

			if uiGradient3 then
				uiGradient3.Color = tbl304.Hud.Color
				uiGradient3.Rotation = tbl304.Hud.Rotation
			end

			clone5.Parent = spacer
			local value468 = func539(unequip)
			func530(value468.Label, "Steal")
			func540(value468, tbl304.Steal)
			local value469 = func539(clone3)
			func530(value469.Label, "X")
			func540(value469, tbl304.Cancel)
			clone3.Position = udim2
			clone3.Visible = false
			unequip.Position = udim22
			unequip.Size = udim23
			local clone6 = clone3:Clone()
			clone6.Name = "Star"
			clone6.AnchorPoint = Vector2.new(1, 0.5)
			clone6.Size = UDim2.new(0.1, 0, 0.56, 0)
			clone6.Position = udim2
			clone6.Visible = true
			clone6.Parent = spacer
			local value470 = func539(clone6)
			func530(value470.Label, utf8.char(9733))
			func540(value470, tbl304.Queued)
			local func567 = ipairs
			local tbl422 = {}
			local char2 = utf8.char(9650)
			local n32 = n20 - n19
			local tbl423 = { "Up", char2, n32 }
			local char3 = utf8.char(9660)
			local tbl424 = { "Down", char3, n20 }
			tbl422[1] = tbl423
			tbl422[2] = tbl424

			for _, value471 in func567(tbl422) do
				local clone7 = clone3:Clone()
				clone7.Name = value471[1]
				clone7.AnchorPoint = Vector2.new(1, 0.5)
				clone7.Size = UDim2.new(0.1, 0, 0.56, 0)
				clone7.Position = UDim2.new(value471[3], 0, 0.6, 0)
				clone7.Visible = false
				clone7.Parent = spacer
				local value472 = func539(clone7)
				func530(value472.Label, value471[2])
				func540(value472, tbl304.Hud)
			end

			clone3.AnchorPoint = Vector2.new(1, 0)
			clone3.Position = UDim2.new(0.99, 0, 0.04, 0)
			clone3.Size = UDim2.new(0.06, 0, 0.28, 0)
			clone3.ZIndex = 8

			for _, descendant in ipairs(clone3:GetDescendants()) do
				if descendant:IsA("GuiObject") then
					descendant.ZIndex = descendant.ZIndex + 8
				end
			end

			local clone7 = clone4:Clone()
			clone7.Name = "Rank"
			clone7.AnchorPoint = Vector2.new(0, 0)
			clone7.Position = UDim2.new(0.012, 0, 0.03, 0)
			clone7.Size = UDim2.new(0.1, 0, 0.36, 0)
			clone7.TextXAlignment = Enum.TextXAlignment.Left
			clone7.ZIndex = 6
			clone7.Visible = false
			func530(clone7, "#1")
			local uiGradient4 = clone7:FindFirstChildOfClass("UIGradient")

			if uiGradient4 then
				uiGradient4.Color = tbl304.PriorityOn.Color
				uiGradient4.Rotation = 90
			end

			clone7.Parent = spacer
			template.Visible = false
			template.Parent = nil
			value448 = template
			value447 = scrollingFrame
			value445 = obj90
			position = frame.Position
			obj90.Position = position
			func536(obj90, true)
			func533(obj90)
			value444 = createScreenGui(value441.ActivePets)
			value444.Enabled = false
			obj90.Parent = value444
			value444.Parent = value1
			table.insert(tbl405, scrollingFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(func553))
			table.insert(tbl405, obj90:GetPropertyChangedSignal("AbsoluteSize"):Connect(func538))
			return true
		end

		local function func568()
			if not flag514 then
				return
			end
			flag514 = false
			n13 += 1
			flag518 = false
			flag520 = false

			if flag516 then
				flag516 = false

				if not func546() then
					func548(false, true)
				end
			end

			if tween then
				tween:Cancel()
				tween = nil
			end

			flag2.DisconnectAll(tbl405)
			table.clear(tbl403)
			table.clear(tbl404)

			if value444 then
				value444:Destroy()
			end

			if value448 then
				value448:Destroy()
			end

			value444 = nil
			value445 = nil
			position = nil
			title = nil
			value446 = nil
			value447 = nil
			value448 = nil
			n14 = 0
			value449 = nil
			value450 = nil
			n15 = 1
			value441 = nil
		end

		value451 = function()
			if flag514 then
				return
			end
			local result88 = func531()

			if not result88 then
				if not flag515 then
					flag515 = true

					task.delay(2, function()
						flag515 = false

						if not flag514 and str1.Toggle(nil, true) then
							value451()
						end
					end)
				end

				return
			end

			value441 = result88
			flag514 = true
			n13 += 1
			local flag543 = n13
			uiStroke = value441.ActivePets.Frame:FindFirstChildOfClass("UIStroke")
			thickness = uiStroke and uiStroke.Thickness or nil
			tbl407.Panel = thickness or 2.3120369911193848
			local uiStrokeClr = value441.Pets:FindFirstChild("UIStrokeClr")
			tbl407.Hud = uiStrokeClr and uiStrokeClr:IsA("UIStroke") and uiStrokeClr.Thickness or 2.3120369911193848
			if not func562() or not func564() then
				func568()
				return
			end

			if flag517 then
				flag517 = false
				task.spawn(func560)
			end

			table.insert(tbl405, RunService.RenderStepped:Connect(func563))

			if uiStroke then
				table.insert(tbl405, uiStroke:GetPropertyChangedSignal("Thickness"):Connect(func537))
			end

			for _, item148 in ipairs({ value441.ActivePets, value441.GrowingEggs }) do
				if item148 then
					table.insert(tbl405, item148:GetPropertyChangedSignal("Enabled"):Connect(function()
						if item148.Enabled and flag516 then
							func561(false)
						end
					end))
				end
			end

			local eggState = tbl1.EggState

			if type(eggState) == "table" then
				for _, item149 in ipairs({ "FieldRefreshed", "FieldShifted", "FieldGone", "FieldClaimed", "SnapshotRefreshed" }) do
					local entry40 = eggState[item149]

					if type(entry40) == "table" and type(entry40.Connect) == "function" then
						local ok, result = pcall(entry40.Connect, entry40, value457)

						if ok and result then
							table.insert(tbl405, result)
						end
					end
				end
			end

			local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")

			if areaEggSlotsClient then
				table.insert(tbl405, areaEggSlotsClient.ChildAdded:Connect(value457))
				table.insert(tbl405, areaEggSlotsClient.ChildRemoved:Connect(value457))
			end

			task.spawn(function()
				local n23 = 0

				while true do
					if flag514 and flag543 == n13 then
						n23 += task.wait(0.5)

						if not (not flag514 or flag543 ~= n13) then
							if not (value441.Eggs:IsDescendantOf(game) and value441.ActivePets:IsDescendantOf(game)) then
								task.defer(function()
									func568()

									if str1.Toggle(nil, true) then
										value451()
									end
								end)

								break
							else
								if n23 >= n4 then
									value457()
									n23 = 0
								elseif flag516 then
									func552()
								end

								continue
							end
						end
					end

					break
				end
			end)

			task.spawn(pcall, func559, flag543)
		end

		func4(function()
			func568()

			if value442 then
				value442:Destroy()
			end

			func543(nil)
			value442 = nil
			value443 = nil
			imageLabel = nil
		end)

		str1.RestoreStealPanel = function()
			if obj86:Get() ~= true then
				return
			end

			if flag514 and value444 and not flag516 then
				task.spawn(func560)
			else
				flag517 = true
			end
		end

		task.defer(value451)
		obj84 = obj2._bhLayout.PredictorTab
		obj75 = obj2._bhLayout.Webhook
		obj85 = obj2._bhLayout.EggPred
		obj76 = obj2._bhLayout.LabPred
		obj77 = obj2._bhLayout.FusePred

		local function func569(param291, param292)
			local ok, result = pcall(Font.new, param291, param292, Enum.FontStyle.Normal)
			return ok and result or nil
		end

		str39 = {
			Ready = type(obj85.CreateCanvas) == "function",
			Bullet = utf8.char(8226),
			Color = {
				Text = "#FFFFFF",
				Income = "#4DFF7A",
				Clock = "#FFC24D",
				Ready = "#4DFF7A",
				Growing = "#FFC24D",
				Inventory = "#7FD8FF",
				Weight = "#CDE7FF",
				Scale = "#FFDF8A",
				Separator = "#7A8CC0",
				Hint = "#9FB8FF",
			},
			NameFont = func569("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold),
		}

		str39.RarityFont = func569("rbxassetid://12187365977", Enum.FontWeight.Bold) or func569("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular)
		local sequence2 = flag2.Sequence
		local tbl425 = { 0, Color3.fromRGB(255, 255, 255) }
		local tbl426 = { 0.5, Color3.fromRGB(222, 238, 255) }
		local tbl427 = { 1, Color3.fromRGB(255, 255, 255) }
		local tbl428 = { tbl425, tbl426, tbl427 }
		str39.NameGradient = sequence2(tbl428)
	end

	local sequence2 = flag2.Sequence
	local tbl429 = { 0, Color3.fromRGB(255, 255, 255) }
	local tbl430 = { 0.2, Color3.fromRGB(206, 212, 224) }
	local tbl431 = { 0.42, Color3.fromRGB(74, 80, 94) }
	local tbl432 = { 0.58, Color3.fromRGB(42, 46, 56) }
	local tbl433 = { 0.78, Color3.fromRGB(158, 166, 182) }
	local tbl434 = { 1, Color3.fromRGB(250, 252, 255) }
	local tbl435 = { tbl429, tbl430, tbl431, tbl432, tbl433, tbl434 }
	str39.SecretGradient = sequence2(tbl435)
	str39.SecretRotation = 90

	str39.Paint = function(param293, param294)
		return string.format("<font color=\"%s\">%s</font>", param293, param294)
	end

	str39.Bold = function(param295)
		return "<b>" .. tostring(param295) .. "</b>"
	end

	str39.Escape = function(param296)
		return (string.gsub(tostring(param296), "[<>&]", { ["<"] = "&lt;", [">"] = "&gt;", ["&"] = "&amp;" }))
	end

	str39.Separator = function()
		return str39.Paint(str39.Color.Separator, "  " .. str39.Bullet .. "  ")
	end

	str39.FormatRate = function(param297)
		local n13 = tonumber(param297) or 0
		if n13 >= 1e12 then
			return string.format("%.2fT/s", n13 / 1e12)
		end

		if n13 >= 1e9 then
			return string.format("%.2fB/s", n13 / 1e9)
		end

		if n13 >= 1000000 then
			return string.format("%.2fM/s", n13 / 1000000)
		end

		if n13 >= 1000 then
			return string.format("%.1fK/s", n13 / 1000)
		end
		return string.format("%d/s", math.floor(n13))
	end

	str39.FormatWeight = function(param298)
		local n13 = tonumber(param298) or 0
		local str48 = n13 >= 1000 and string.format("%.0f", n13) or string.format("%.2f", n13)
		local flag544, flag545 = string.match(str48, "^(%-?%d+)(%.%d+)$")
		str48 = flag544 or str48
		local str49

		while true do
			local flag546
			str49, flag546 = string.gsub(str48, "^(%-?%d+)(%d%d%d)", "%1,%2")

			if flag546 ~= 0 then
				str48 = str49
			else
				break
			end
		end

		return str49 .. (flag545 or "") .. " Kg"
	end

	str39.FormatClock = function(param299)
		local n13 = math.max(0, math.floor(tonumber(param299) or 0))
		return string.format("%02dh %02dm %02ds", math.floor(n13 / 3600), math.floor(n13 % 3600 / 60), n13 % 60)
	end

	str39.ScaleFactor = function(num122)
		if num122 > 5 then
			return (num122 / 5) ^ 1.2 * 19.637875755794113
		end
		return num122 ^ 1.85
	end

	str39.MutationMultiplier = function(flag547)
		flag547 = type(flag547) == "table" and flag547 or {}
		local mutations = tbl1.Mutations

		if type(mutations) == "table" and type(mutations.EarningsFor) == "function" then
			local ok, result = pcall(mutations.EarningsFor, flag547)
			if ok and type(result) == "number" then
				return result
			end
		end

		return 1
	end

	local tbl436 = {
		Golden = "#FFD34D",
		Silver = "#E6EEF7",
		Sakura = "#FF9ED8",
		GreatBloom = "#7CFFC4",
		Boss = "#FF7A7A",
		Monstrous = "#C08BFF",
	}

	local tbl437 = { "#FF6B6B", "#FFB36B", "#FFF06B", "#6BFF8A", "#6BC8FF", "#B96BFF" }

	str39.MutationText = function(list62)
		local tbl438 = {}

		if type(list62) == "table" then
			for _, item150 in ipairs(list62) do
				local uppered = string.upper(func7(item150))

				if item150 == "Rainbow" or item150 == "Prismatic" then
					local tbl439 = {}

					for i = 1, #uppered do
						table.insert(tbl439, str39.Paint(tbl437[(i - 1) % #tbl437 + 1], string.sub(uppered, i, i)))
					end

					local insert = table.insert
					local packed2 = table.pack(str39.Bold(table.concat(tbl439)))
					insert(tbl438, table.unpack(packed2, 1, packed2.n))
				else
					table.insert(tbl438, str39.Bold(str39.Paint(tbl436[item150] or "#8FE3FF", str39.Escape(uppered))))
				end
			end
		end

		return table.concat(tbl438, " ")
	end

	local rarityGradients = nil

	local function func570(player9)
		if type(player9) == "table" and typeof(player9.RarityGradient) == "Instance" then
			return player9.RarityGradient
		end

		if rarityGradients == nil then
			local assets = ReplicatedStorage:FindFirstChild("Assets")
			assets = assets and assets:FindFirstChild("UI")
			rarityGradients = assets and assets:FindFirstChild("RarityGradients") or false
		end

		if not rarityGradients or type(player9) ~= "table" then
			return nil
		end
		local obj91 = rarityGradients:FindFirstChild(tostring(player9._id or player9.DisplayName or ""))
		return obj91 and obj91:FindFirstChild("RarityGradient") or nil
	end

	local tbl440 = {}

	str39.AssetInfo = function(param300)
		local category = tostring(param300)
		local entry41 = tbl440[category]
		if entry41 then
			return entry41
		end
		local directory = tbl1.Assets and tbl1.Assets.Directory
		local flag548 = type(directory) == "table" and directory[category] or nil

		if flag548 == nil and type(directory) == "table" then
			local cleaned2 = string.gsub(string.lower(category), "[^%a%d]", "")

			for k, value473 in pairs(directory) do
				if type(value473) == "table" then
					local str50 = tostring(k)
					local str51 = tostring(value473._id or "")
					local func571 = tostring
					local displayName = value473.DisplayName or ""
					local packed3 = table.pack(func571(displayName))
					local list63 = { str50, str51 }

					do
						local values = table.pack(table.unpack(packed3, 1, packed3.n))
						table.move(values, 1, values.n, 3, list63)
					end

					local egg = type(value473.Egg) == "table" and value473.Egg or nil

					if egg ~= nil then
						list63[#list63 + 1] = tostring(egg.ModelName or "")
					end

					for _, item151 in ipairs(list63) do
						if item151 ~= "" and string.gsub(string.lower(item151), "[^%a%d]", "") == cleaned2 then
							flag548 = value473
							break
						end
					end
				end

				if flag548 == nil then
					continue
				end
				break
			end
		end

		local rarity = type(flag548) == "table" and type(flag548.Rarity) == "table" and flag548.Rarity or nil
		local icon = type(flag548) == "table" and flag548.Icon or nil
		local rarity2

		if rarity then
			rarity2 = tostring(rarity.DisplayName or rarity._id or "Common")
		else
			rarity2 = rarity
		end

		rarity2 = rarity2 or "Common"
		local color3 = rarity and typeof(rarity.Color) == "Color3" and rarity.Color or Color3.fromRGB(255, 255, 255)
		local tbl441 = {}
		local name = type(flag548) == "table"

		if name then
			name = tostring(flag548.DisplayName or category)
		end

		tbl441.Name = name or category
		tbl441.Category = category
		tbl441.Rarity = rarity2
		local rarityNumber

		if rarity then
			rarityNumber = tonumber(rarity.RarityNumber or rarity.Rank)
		else
			rarityNumber = rarity
		end

		tbl441.RarityNumber = rarityNumber or 0
		tbl441.Color = color3
		tbl441.Hex = "#" .. string.upper(color3:ToHex())
		tbl441.Gradient = func570(rarity)
		tbl441.EarningRate = type(flag548) == "table" and tonumber(flag548.EarningRate) or 0
		tbl441.Icon = type(icon) == "string" and icon ~= "" and icon or nil
		tbl440[category] = tbl441
		return tbl441
	end

	str39.Income = function(obj, param301, param302)
		if type(param301) ~= "number" or param301 <= 0 then
			return 0
		end
		return math.max(math.round(obj.EarningRate * str39.ScaleFactor(param301) * str39.MutationMultiplier(param302)), 1)
	end

	local function isShown(instance28)
		if typeof(instance28) ~= "Instance" or not instance28:IsDescendantOf(game) then
			return false
		end

		while instance28 do
			if instance28:IsA("GuiObject") and not instance28.Visible then
				return false
			end

			if instance28:IsA("LayerCollector") then
				return instance28.Enabled
			end
			instance28 = instance28.Parent
		end

		return false
	end

	str39.PageVisible = function()
		local ok, result = pcall(function()
			return obj84.Page
		end)

		if not ok or typeof(result) ~= "Instance" then
			return true
		end
		return isShown(result) and result.AbsoluteSize.X > 0
	end

	str39.IsShown = isShown
	local tbl442 = { "Value", "Rarity", "Time Left" }

	local tbl443 = {
		{ Key = "Ready", Title = "READY TO HATCH", Color = str39.Color.Ready },
		{ Key = "Growing", Title = "GROWING", Color = str39.Color.Growing },
		{ Key = "Inventory", Title = "IN INVENTORY", Color = str39.Color.Inventory },
	}

	local n13 = 1
	local paint2 = str39.Paint
	local bold2 = str39.Bold
	local color3 = str39.Color
	local tbl444 = { Sort = tbl442[1], Spotlight = true }
	local id = nil
	local n14 = 0.0909
	local value474 = nil
	local tbl445 = {}
	local tbl446 = {}
	local tbl447 = {}
	local tbl448 = {}
	local n15 = 0
	local n16 = 0
	local n17 = 0.06
	local n18 = -1
	local n19 = -1
	local n20 = -1
	local n21 = 4
	local n22 = 3
	local flag549 = false
	local n23 = 0
	local flag550 = true
	local n24 = 0
	local flag551 = false
	local value475 = nil

	local function requestEggRefresh()
		flag550 = true
	end

	local function func572(flag552)
		if not flag552 or flag552.DiffWrapped then
			return flag552
		end
		local set = flag552.Set
		flag552.DiffWrapped = true

		flag552.Set = function(list64)
			if type(list64) ~= "table" then
				return set(list64)
			end
			local spec = flag552.Spec
			local value476 = nil

			for k, value477 in pairs(list64) do
				if spec[k] ~= value477 then
					value476 = value476 or {}
					value476[k] = value477
				end
			end

			if value476 then
				set(value476)
			end

			return flag552
		end

		return flag552
	end

	local function func573(param303, param304)
		local cleaned3 = string.gsub(tostring(param303.Spec.Text or ""), "%d", "0")
		return tostring(n16) .. "|" .. tostring(param304) .. "|" .. cleaned3
	end

	local function func574(param305, param306)
		local eggRecords = tbl1.EggRecords
		if type(eggRecords) ~= "table" or type(eggRecords.GrowthSecondsRemaining) ~= "function" then
			return 0, 0
		end
		local n25 = 1

		if type(eggRecords.GrowthSpeedMultiplier) == "function" then
			local ok, result = pcall(eggRecords.GrowthSpeedMultiplier, param305)
			ok = ok and type(result) == "number"
			local n26 = 1

			if ok then
				n25 = result
			else
				n25 = n26
			end
		end

		local ok, result = pcall(eggRecords.GrowthSecondsRemaining, param305, param306, n25)
		local flag553 = ok and type(result) == "number"
		local n26 = 0

		if not flag553 then
			result = n26
		end

		local n27 = 0

		if type(eggRecords.GrowthDuration) == "function" then
			local ok2
			ok2, n27 = pcall(eggRecords.GrowthDuration, param305)
			local flag554 = ok2 and type(n27) == "number"
			local n28 = 0

			if not flag554 then
				n27 = n28
			end
		end

		return result, n27
	end

	local function func575(param307)
		local eggRecords = tbl1.EggRecords

		if type(eggRecords) == "table" and type(eggRecords.WeightKg) == "function" then
			local ok, result = pcall(eggRecords.WeightKg, param307)
			if ok and type(result) == "number" then
				return result
			end
		end

		return 0
	end

	local function func576()
		local eggState = tbl1.EggState
		if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
			return nil
		end
		local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
		if not ok or type(result) ~= "table" then
			return nil
		end
		local serverTimeNow = workspace:GetServerTimeNow()
		local tbl449 = {}

		for k, value478 in pairs(result) do
			if type(value478) == "table" then
				local value479 = str39.AssetInfo(value478.AssetCategory)
				local n25 = tonumber(value478.AssetScale) or 0
				local mutations = type(value478.Mutations) == "table" and value478.Mutations or {}

				local tbl450 = {
					Id = k,
					Info = value479,
					Scale = n25,
					Weight = func575(value478),
					Mutations = mutations,
					Income = str39.Income(value479, n25, mutations),
					Status = "Inventory",
					Remaining = math.huge,
					Percent = 0,
				}

				if value478.Placement ~= nil then
					local ok2, result2 = pcall(eggState.IsReadyToHatch, k)

					if ok2 and result2 then
						tbl450.Status = "Ready"
						tbl450.Remaining = 0
						tbl450.Percent = 100
					else
						local num123, num124 = func574(value478, serverTimeNow)
						tbl450.Status = "Growing"
						tbl450.Remaining = num123

						if num124 > 0 then
							tbl450.Percent = math.clamp(math.floor((1 - num123 / num124) * 100), 0, 100)
						end
					end
				end

				table.insert(tbl449, tbl450)
			end
		end

		return tbl449
	end

	local function func577(param308)
		local sort = tbl444.Sort

		table.sort(param308, function(param309, param310)
			if sort == tbl442[2] and param309.Info.RarityNumber ~= param310.Info.RarityNumber then
				return param309.Info.RarityNumber > param310.Info.RarityNumber
			end

			if sort == tbl442[3] and param309.Remaining ~= param310.Remaining then
				return param309.Remaining < param310.Remaining
			end
			return param309.Income > param310.Income
		end)
	end

	local function func578(param311)
		if param311.Status == "Ready" then
			return bold2(paint2(color3.Ready, "Ready to hatch"))
		end

		if param311.Status == "Growing" then
			return bold2(paint2(color3.Clock, str39.FormatClock(param311.Remaining))) .. str39.Separator() .. paint2(color3.Growing, param311.Percent .. "%")
		end
		return paint2(color3.Inventory, "In inventory")
	end

	local function func579(param312)
		local tbl451 = {}
		local flag555 = str39.MutationText(param312.Mutations)
		table.insert(tbl451, bold2(paint2(color3.Income, str39.FormatRate(param312.Income))))
		table.insert(tbl451, paint2(color3.Scale, string.format("%.2fx", param312.Scale)))
		table.insert(tbl451, paint2(color3.Weight, str39.FormatWeight(param312.Weight)))

		if flag555 ~= "" then
			table.insert(tbl451, flag555)
		end

		return table.concat(tbl451, str39.Separator())
	end

	local n25 = 5
	local n26 = n25 + 0.8
	local n27 = 1.2
	local n28 = 1.2
	local n29 = 0.936
	local n30 = 2.3
	local n31 = 0.25
	local n32 = 0.18
	local n33 = n30 + 0.6
	local n34 = 0.24
	local n35 = 0.22

	local function func580(param313)
		if string.upper(tostring(param313.Rarity)) == "SECRET" then
			return str39.SecretGradient
		end
		return param313.Gradient
	end

	local function func581(param314)
		return func580(param314) ~= nil and Color3.fromRGB(255, 255, 255) or param314.Color
	end

	local function func582(param315)
		if string.upper(tostring(param315.Rarity)) == "SECRET" then
			return str39.SecretRotation
		end
		return nil
	end

	local function func583(flag556)
		local flag557 = flag556 and flag556.Get()
		if not flag557 or n16 <= 0 then
			return nil
		end

		if flag557.Text ~= tostring(flag556.Spec.Text or "") then
			return nil
		end
		return flag557
	end

	local function func584(param316)
		local w = func573(param316, "w")
		if param316.WidthKey == w then
			return param316.WidthUnits
		end
		local flag558 = func583(param316)
		if not flag558 then
			return nil
		end
		local size = flag558.Size
		local textWrapped = flag558.TextWrapped
		flag558.TextWrapped = false
		flag558.Size = UDim2.fromOffset(100000, math.max(1, size.Y.Offset))
		local x = flag558.TextBounds.X
		flag558.Size = size
		flag558.TextWrapped = textWrapped
		if x <= 0 then
			return nil
		end
		local widthUnits = x / n16
		param316.WidthKey = w
		param316.WidthUnits = widthUnits
		return param316.WidthUnits
	end

	local function func585(param317, num125)
		local num126 = func573(param317, math.floor(num125 * 100 + 0.5))
		if param317.HeightKey == num126 then
			return param317.HeightUnits
		end
		local flag559 = func583(param317)
		if not flag559 then
			return nil
		end
		local size = flag559.Size
		flag559.Size = UDim2.fromOffset(math.max(1, math.floor(num125 * n16 + 0.5)), 100000)
		local y = flag559.TextBounds.Y
		flag559.Size = size
		if y <= 0 then
			return nil
		end
		local heightUnits = y / n16
		param317.HeightKey = num126
		param317.HeightUnits = heightUnits
		return param317.HeightUnits
	end

	local function func586(param318)
		local rfEggWorldAskHatch = networking:FindFirstChild("RF/EggWorld/AskHatch")
		if not rfEggWorldAskHatch or not rfEggWorldAskHatch:IsA("RemoteFunction") then
			return false
		end
		local ok, result = pcall(rfEggWorldAskHatch.InvokeServer, rfEggWorldAskHatch, param318)
		if not ok or result == false then
			return false
		end
		task.wait(0.35)
		local rfEggWorldAskFinishHatch = networking:FindFirstChild("RF/EggWorld/AskFinishHatch")

		if rfEggWorldAskFinishHatch and rfEggWorldAskFinishHatch:IsA("RemoteFunction") then
			pcall(rfEggWorldAskFinishHatch.InvokeServer, rfEggWorldAskFinishHatch, param318)
		end

		return true
	end

	tbl445.RunAction = function()
		local focus = tbl445.Focus
		if type(focus) ~= "table" or focus.Id == nil then
			return
		end
		local id4 = tostring(focus.Id)

		if focus.Status == "Inventory" then
			local eggState = tbl1.EggState
			if type(eggState) == "table" and type(eggState.WearEggTool) == "function" and pcall(eggState.WearEggTool, id4) then
				return
			end
			local rfEggWorldAskWearTool = networking:FindFirstChild("RF/EggWorld/AskWearTool")

			if rfEggWorldAskWearTool and rfEggWorldAskWearTool:IsA("RemoteFunction") then
				pcall(rfEggWorldAskWearTool.InvokeServer, rfEggWorldAskWearTool, id4)
			end

			return
		end

		if focus.Status == "Ready" then
			if not tbl445.Hatching then
				tbl445.Hatching = true
				pcall(func586, id4)
				tbl445.Hatching = false
			end

			return
		end

		if tbl445.Flying or type(str1.FlyTo) ~= "function" then
			return
		end
		local placedEggRenders = workspace:FindFirstChild("PlacedEggRenders")
		local value480 = nil

		if placedEggRenders then
			for _, child in ipairs(placedEggRenders:GetChildren()) do
				if string.find(child.Name, id4, 1, true) or child:GetAttribute("Uid") == id4 then
					value480 = child
					break
				end
			end
		end

		if not value480 then
			return
		end

		local ok, result = pcall(function()
			return value480:IsA("Model") and value480:GetPivot() or value480.CFrame
		end)

		if not ok then
			return
		end
		local movement = str1.Movement
		if movement.Owner ~= nil and movement.Owner ~= "treadmill" or movement.PlaceWanted or str1.Steal.Active or str1.Steal.Wanted or str1.Steal.Carrying then
			return
		end
		tbl445.Flying = true

		if str1.ClaimMovement("predictor") then
			if str1.Treadmill.Riding or str1.OnBelt() then
				pcall(str1.ExitBelt)
			end

			pcall(str1.FlyTo, result.Position + Vector3.new(0, 3, 0), function()
				return false
			end, "fly")

			str1.ReleaseMovement("predictor")
		end

		tbl445.Flying = false
	end

	local function func587(obj92)
		value474 = obj92
		obj92:SetDock(5, { Gap = n35, DividerColor = Color3.fromRGB(170, 174, 184) })
		local value481 = obj92:Dock()

		tbl445.Icon = obj92:Image({
			Parent = value481,
			X = 0,
			Y = 0,
			Width = n25,
			Height = n25,
			Corner = 0.35,
			Background = "#000000",
			BackgroundTransparency = 0.26,
			StrokeThickness = n14,
			StrokeTransparency = 0,
			ZIndex = 8,
		})

		tbl445.Name = obj92:Text({
			Parent = value481,
			X = n26,
			Y = 0,
			Height = n27,
			Scale = n28,
			Wrap = false,
			Gradient = str39.NameGradient,
			TextStrokeTransparency = 1,
			ZIndex = 9,
		})

		tbl445.Rarity = obj92:Text({
			Parent = value481,
			X = n26,
			Y = 0,
			Height = n27,
			Scale = n29,
			Wrap = false,
			Font = str39.RarityFont,
			TextStrokeTransparency = 1,
			StrokeTransparency = 0.08,
			ZIndex = 9,
		})

		tbl445.Info = obj92:Text({ Parent = value481, X = n26, Y = n27, Height = n25 - n27, Wrap = false, ZIndex = 9 })

		tbl445.Action = obj92:Button({
			Parent = value481,
			X = 0,
			Y = 0,
			Width = 5,
			Height = n27 - 0.1,
			Text = "",
			Scale = 1,
			Background = "#000000",
			BackgroundTransparency = 0.55,
			HoverTransparency = 0.3,
			PressTransparency = 0.15,
			Corner = 0.35,
			StrokeColor = Color3.fromRGB(255, 255, 255),
			StrokeThickness = n14,
			StrokeTransparency = 0.6,
			Visible = false,
			ZIndex = 10,
			Callback = function()
				if type(tbl445.RunAction) == "function" then
					task.spawn(tbl445.RunAction)
				end
			end,
		})

		obj92:OnResize(function(param319, num127, flag560)
			if num127 == n18 and flag560 == n19 then
				return
			end
			n18 = num127
			n19 = flag560
			n15 = num127 / math.max(flag560, 1)
			n16 = flag560
			n23 = 2
			n17 = 0.9 / math.max(obj92:TextSize(), 1)
			tbl445.Rarity.Set({ StrokeThickness = n17 })

			for _, item152 in ipairs(tbl446) do
				item152.Rarity.Set({ StrokeThickness = n17 })
			end
		end)

		for _, item153 in ipairs({ "Icon", "Name", "Rarity", "Info", "Action" }) do
			func572(tbl445[item153])
		end
	end

	local function func588(param320)
		local entry42 = tbl447[param320]

		if not entry42 then
			local value482 = value474:Text({ Name = "Line", X = 0, Y = 0, Width = 1, Height = 1, Wrap = true, Visible = false })
			tbl447[param320] = func572(value482)
			entry42 = value482
		end

		return entry42
	end

	local function func589(param321)
		local entry43 = tbl446[param321]
		if entry43 then
			return entry43
		end
		local tbl452 = {}

		tbl452.Frame = value474:Button({
			Name = "Entry",
			Text = "",
			Background = "#000000",
			BackgroundTransparency = 0.74,
			HoverTransparency = 0.46,
			PressTransparency = 0.3,
			Corner = 0.35,
			X = 0,
			Y = 0,
			Width = 1,
			Height = 1,
			Visible = false,
			Callback = function()
				if tbl452.Id ~= nil then
					id = tbl452.Id
					requestEggRefresh()
				end
			end,
		})

		tbl452.Icon = value474:Image({
			Parent = tbl452.Frame,
			X = n31,
			Y = 0,
			Width = n30,
			Height = n30,
			Corner = 0.35,
			Background = "#000000",
			BackgroundTransparency = 0.45,
			StrokeThickness = n14,
			StrokeTransparency = 0,
		})

		tbl452.Name = value474:Text({
			Parent = tbl452.Frame,
			X = n31 + n33,
			Y = 0,
			Width = 1,
			Height = n27,
			Scale = n28,
			Wrap = false,
			Gradient = str39.NameGradient,
			TextStrokeTransparency = 1,
		})

		tbl452.Rarity = value474:Text({
			Parent = tbl452.Frame,
			X = n31 + n33,
			Y = 0,
			Width = 1,
			Height = n27,
			Scale = n29,
			Wrap = false,
			Font = str39.RarityFont,
			TextStrokeTransparency = 1,
			StrokeTransparency = 0.08,
			StrokeThickness = n17,
		})

		tbl452.Detail = value474:Text({
			Parent = tbl452.Frame,
			X = n31 + n33,
			Y = n27,
			Width = math.max(1, n15 - n33 - n31 * 2),
			Height = 1,
			Wrap = true,
		})

		tbl452.Status = value474:Text({ Parent = tbl452.Frame, X = 0, Y = 0, Width = 1, Height = n27, Wrap = false, Align = "Right" })

		for _, item154 in ipairs({ "Frame", "Icon", "Name", "Rarity", "Detail", "Status" }) do
			func572(tbl452[item154])
		end

		tbl446[param321] = tbl452
		return tbl452
	end

	local function func590(list65)
		local tbl453 = { Ready = 0, Growing = 0, Inventory = 0 }
		local n36 = 0
		local value483 = nil

		for _, item155 in ipairs(list65) do
			local status = item155.Status
			tbl453[status] = tbl453[status] + 1
			n36 += item155.Income

			if not value483 or item155.Income > value483.Income then
				value483 = item155
			end
		end

		return bold2(paint2(color3.Text, tostring(#list65) .. " eggs")) .. str39.Separator() .. bold2(paint2(color3.Ready, tbl453.Ready .. " ready")) .. str39.Separator() .. bold2(paint2(color3.Growing, tbl453.Growing .. " growing")) .. str39.Separator() .. bold2(paint2(color3.Inventory, tbl453.Inventory .. " in bag")) .. str39.Separator() .. paint2(color3.Text, "Total") .. " " .. bold2(paint2(color3.Income, str39.FormatRate(n36))), value483
	end

	local function func591(list66, flag561)
		if flag561 == "" then
			return true
		end
		local str52 = " " .. list66.Status
		local lowered5 = string.lower(tostring(list66.Info.Name) .. " " .. tostring(list66.Info.Rarity) .. str52)


		for _, mutation in ipairs(list66.Mutations) do
			lowered5 ..= " " .. string.lower(tostring(mutation))
		end

		return string.find(lowered5, flag561, 1, true) ~= nil
	end

	local function func592(param322)
		local value484 = bold2(paint2(color3.Income, str39.FormatRate(param322.Income)))
		local scale4 = paint2(color3.Scale, string.format("%.2fx", param322.Scale)) .. str39.Separator() .. paint2(color3.Weight, str39.FormatWeight(param322.Weight))
		local tbl454 = { value484, scale4 }

		do
			local values = table.pack(func578(param322))
			table.move(values, 1, values.n, 3, tbl454)
		end

		local flag562 = str39.MutationText(param322.Mutations)
		table.insert(tbl454, flag562 ~= "" and flag562 or paint2(color3.Hint, "Tap an egg below to preview it"))
		return table.concat(tbl454, "\n")
	end

	local function func593(flag563)
		local spotlight = tbl444.Spotlight and flag563 ~= nil

		if value475 ~= spotlight then
			value475 = spotlight
			value474:SetDock(spotlight and 5 or 0, { Gap = n35 })
		end

		tbl445.Icon.Set({ Visible = spotlight })
		tbl445.Name.Set({ Visible = spotlight })
		tbl445.Rarity.Set({ Visible = spotlight })
		tbl445.Info.Set({ Visible = spotlight })
		tbl445.Action.Set({ Visible = spotlight })
		tbl445.Focus = spotlight and flag563 or nil
		if not spotlight then
			return
		end
		local info = flag563.Info

		tbl445.Action.Set({
			Text = flag563.Status == "Inventory" and bold2(paint2(color3.Inventory, "Hold egg")) or flag563.Status == "Ready" and bold2(paint2(color3.Ready, "Hatch egg")) or bold2(paint2(color3.Growing, "Fly to egg")),
		})

		tbl445.Icon.Set({ Visible = info.Icon ~= nil, Image = info.Icon or "", StrokeColor = info.Color })
		tbl445.Name.Set({ Text = str39.Escape(info.Name) })

		tbl445.Rarity.Set({
			Text = string.upper(tostring(info.Rarity)),
			Color = func581(info),
			Gradient = func580(info),
			GradientRotation = func582(info),
		})

		tbl445.Info.Set({ Text = func592(flag563) })
	end

	local function func594(param323, param324)
		local info = param324.Info
		param323.Id = param324.Id
		param323.Frame.Set({ Visible = true, BackgroundTransparency = param324.Id == id and 0.12 or 0.74 })
		param323.Icon.Set({ Visible = info.Icon ~= nil, Image = info.Icon or "", StrokeColor = info.Color })
		param323.Name.Set({ Text = str39.Escape(info.Name) })

		param323.Rarity.Set({
			Text = string.upper(tostring(info.Rarity)),
			Color = func581(info),
			Gradient = func580(info),
			GradientRotation = func582(info),
		})

		param323.Detail.Set({ Text = func579(param324) })
		param323.Status.Set({ Text = func578(param324) })
	end

	local function func595()
		if n15 <= 0 then
			return
		end
		flag549 = false
		local n36 = math.max(1, n15 - n26)
		local action = func584(tbl445.Action)

		if action then
			tbl445.ActionUnits = action + 1.4
		else
			flag549 = true
		end

		local n37 = math.min(tbl445.ActionUnits or 5, n36 * 0.45)
		local n38 = math.max(1, n36 - n37 - n34)
		tbl445.Action.Set({ X = n15 - n37, Y = 0.05, Width = n37, Height = n27 - 0.1 })
		local rarity3 = func584(tbl445.Rarity)

		if rarity3 then
			n22 = rarity3 + 0.1
		else
			flag549 = true
		end

		local name2 = func584(tbl445.Name)

		if name2 then
			n21 = math.min(name2 + 0.1, math.max(1, n38 - n22 - n34))
		else
			flag549 = true
		end

		tbl445.Name.Set({ X = n26, Y = 0, Width = n21, Height = n27 })

		tbl445.Rarity.Set({
			X = n26 + n21 + n34,
			Y = 0,
			Width = math.max(0.5, math.min(n22, n38 - n21 - n34)),
			Height = n27,
		})

		tbl445.Info.Set({ X = n26, Y = n27, Width = n36, Height = math.max(1, n25 - n27) })
		local n39 = math.max(1, n15 - n33 - n31 * 2)
		local n40 = 0

		for _, item156 in ipairs(tbl448) do
			if item156.Kind == "text" then
				local handle = item156.Handle
				local value485 = func585(handle, n15)

				if value485 then
					item156.Height = value485
				else
					flag549 = true
				end

				local n41 = math.max(1, item156.Height or 1)
				handle.Set({ X = 0, Y = n40 + (item156.Gap and 0.5 or 0), Width = n15, Height = n41 })
				n40 += n41 + n35 * 0.5 + (item156.Gap and 0.5 or 0)
			else
				local item = item156.Item
				local detail2 = func585(item.Detail, n39)

				if detail2 then
					item.DetailUnits = detail2
				else
					flag549 = true
				end

				local n41 = math.clamp(item.DetailUnits or 1, 1, 4)
				local status2 = func584(item.Status)

				if status2 then
					item.StatusUnits = status2 + 0.23
				else
					flag549 = true
				end

				local n42 = math.min(n39 * 0.42, math.max(2.73, item.StatusUnits or 2.73))
				local n43 = math.max(1, n39 - n42 - n34)
				local rarity4 = func584(item.Rarity)

				if rarity4 then
					item.RarityUnits = rarity4 + 0.1
				else
					flag549 = true
				end

				local n44 = math.min(item.RarityUnits or 3, n43 * 0.5)
				local name3 = func584(item.Name)

				if name3 then
					item.NameUnits = name3 + 0.1
				else
					flag549 = true
				end

				local min = math.min
				local max = math.max
				local nameUnits = item.NameUnits or 4
				local max2 = math.max
				local n45 = n43 - n44 - n34
				local num128 = min(max(1, nameUnits), max2(1, n45))
				local n46 = n32 * 2
				local n47 = math.max(n41 + n27, 2.3) + n46
				local n48 = (n47 - n41 - n27) / 2
				item.Frame.Set({ X = 0, Y = n40, Width = n15, Height = n47 })
				item.Icon.Set({ Y = (n47 - n30) / 2 })
				item.Name.Set({ X = n31 + n33, Y = n48, Width = num128 })
				item.Rarity.Set({ X = n31 + n33 + num128 + n34, Y = n48, Width = math.max(0.5, n44) })
				item.Detail.Set({ X = n31 + n33, Y = n48 + n27, Width = n39, Height = n41 })

				item.Status.Set({
					Visible = item156.HasStatus,
					X = n31 + n33 + n39 - n42,
					Y = n48,
					Width = math.max(0.5, n42),
				})

				n40 += n47 + n35
			end
		end

		local n41 = math.max(1, n40)

		if math.abs(n41 - n20) > 0.01 then
			n20 = n41
			value474:SetContentLines(n41)
		end
	end

	local function func596()
		if not value474 then
			return
		end
		n23 = 2
		local result89 = func576()
		table.clear(tbl448)
		local n36 = 0

		local function func597(param325, param326)
			n36 += 1
			local value486 = func588(n36)
			value486.Set({ Visible = true, Text = param325 })
			table.insert(tbl448, { Kind = "text", Handle = value486, Gap = param326 })
		end

		local n37

		if not result89 then
			func593(nil)
			func597(bold2(paint2(color3.Hint, "Egg data is not available yet")), false)
			n37 = 0
		else
			func577(result89)
			local value487, value488 = func590(result89)
			func597(value487, false)
			local value489 = nil

			if id ~= nil then
				value489 = nil

				for _, item157 in ipairs(result89) do
					if item157.Id == id then
						value489 = item157
						break
					else
						value489 = nil
					end
				end
			end

			func593(value489 or value488)
			local lowered6 = string.lower(value474:Query())
			local tbl455 = {}

			for _, item158 in ipairs(result89) do
				if func591(item158, lowered6) then
					table.insert(tbl455, item158)
				end
			end

			if #tbl455 == 0 then
				func597(paint2(color3.Hint, #result89 == 0 and "No eggs yet" or string.format("No results for \"%s\"", str39.Escape(lowered6))), false)
				n37 = 0
			else
				n37 = 0

				for _, item159 in ipairs(tbl443) do
					local tbl456 = {}

					for _, item160 in ipairs(tbl455) do
						if item160.Status == item159.Key then
							table.insert(tbl456, item160)
						end
					end

					if #tbl456 > 0 then
						local len3 = #tbl448 > 0
						func597(string.format("<b><font color=\"%s\">%s</font></b> <font color=\"#AAAAAA\">(%d)</font>", item159.Color, item159.Title, #tbl456), len3)

						for _, item161 in ipairs(tbl456) do
							n37 += 1
							local value490 = func589(n37)
							func594(value490, item161)
							table.insert(tbl448, { Kind = "item", Item = value490, HasStatus = true })
						end
					end
				end
			end
		end

		for i = n36 + 1, #tbl447 do
			tbl447[i].Set({ Visible = false })
		end

		for i = n37 + 1, #tbl446 do
			tbl446[i].Frame.Set({ Visible = false })
		end

		func595()
		n23 = 2
	end

	str39.RequestEggRefresh = requestEggRefresh

	if not str39.Ready then
		obj85:CreateText({ Name = "Egg Predictor", Text = "Update the Chilli Library to use the predictor canvas." })
	else
		obj85:CreateDropdown({
			Name = "Sort By",
			Options = tbl442,
			Default = tbl442[1],
			Callback = function(sort)
				if table.find(tbl442, sort) then
					tbl444.Sort = sort
					requestEggRefresh()
				end
			end,
		})

		obj85:CreateToggle({
			Name = "Preview Card",
			Default = true,
			Callback = function(value)
				tbl444.Spotlight = value == true
				requestEggRefresh()
			end,
		})

		local obj93 = obj85:CreateCanvas({
			Name = "Egg Predictor",
			Search = true,
			SearchPlaceholder = "Search eggs...",
			Layout = "free",
			Style = {
				TextScale = 0.84,
				LineHeight = 1.1,
				MinLines = 16,
				MaxLines = 32,
				BackgroundTransparency = 0.5,
				ScrollBarColor = Color3.fromRGB(170, 174, 184),
				TextColor = Color3.fromRGB(255, 255, 255),
				TextStrokeTransparency = 0.7,
			},
			Build = function(param327)
				func587(param327)
				requestEggRefresh()
			end,
		})

		func4(function()
			obj93:Destroy()
		end)

		local connection = RunService.Heartbeat:Connect(function(deltaTime)
			local flag564 = str39.PageVisible()
			local flag565

			if flag564 then
				flag565 = value474 == nil or str39.IsShown(value474:Root())
			else
				flag565 = flag564
			end

			if flag565 and not flag551 then
				flag550 = true
			end

			flag551 = flag565
			if not flag564 then
				return
			end
			n24 += deltaTime

			if flag565 and flag550 or n24 >= n13 then
				n24 = 0

				if flag565 then
					flag550 = false
					pcall(func596)
				end

				if str39.RefreshFuse then
					pcall(str39.RefreshFuse)
				end
			end

			if flag565 and (n23 > 0 or flag549) then
				if n23 > 0 then
					n23 -= 1
				end

				pcall(func595)
			end

			if str39.PlaceFuse then
				str39.PlaceFuse()
			end
		end)

		func4(function()
			connection:Disconnect()
		end)
	end

	paint = str39.Paint
	bold = str39.Bold
	color = str39.Color
	local n36 = 5
	local n37 = n36 + 0.8
	local n38 = 1.2
	local n39 = 1.2
	local n40 = 0.936
	local n41 = 2.3
	local n42 = 0.25
	local n43 = 0.18
	local n44 = n41 + 0.6
	local n45 = 0.24
	n2 = 0.22
	local n46 = 0.0909
	obj78 = nil
	tbl303 = {}
	list51 = {}
	list52 = {}
	list53 = {}
	local n47 = 0
	local n48 = 0
	local n49 = 0.06
	local n50 = -1
	local n51 = -1
	local n52 = -1
	local n53 = 4
	local n54 = 3
	flag474 = false
	n3 = 0

	func456 = function(param328)
		if string.upper(tostring(param328.Rarity)) == "SECRET" then
			return str39.SecretGradient
		end
		return param328.Gradient
	end

	func457 = function(param329)
		return func456(param329) ~= nil and Color3.fromRGB(255, 255, 255) or param329.Color
	end

	func458 = function(param330)
		if string.upper(tostring(param330.Rarity)) == "SECRET" then
			return str39.SecretRotation
		end
		return nil
	end

	func459 = function(obj94)
		obj78 = obj94
		obj94:SetDock(5, { Gap = n2, DividerColor = Color3.fromRGB(170, 174, 184) })
		local value491 = obj94:Dock()

		tbl303.Icon = obj94:Image({
			Parent = value491,
			X = 0,
			Y = 0,
			Width = n36,
			Height = n36,
			Corner = 0.35,
			Background = "#000000",
			BackgroundTransparency = 0.26,
			StrokeThickness = n46,
			StrokeTransparency = 0,
			ZIndex = 8,
		})

		tbl303.Name = obj94:Text({
			Parent = value491,
			X = n37,
			Y = 0,
			Height = n38,
			Scale = n39,
			Wrap = false,
			Gradient = str39.NameGradient,
			TextStrokeTransparency = 1,
			ZIndex = 9,
		})

		tbl303.Rarity = obj94:Text({
			Parent = value491,
			X = n37,
			Y = 0,
			Height = n38,
			Scale = n40,
			Wrap = false,
			Font = str39.RarityFont,
			TextStrokeTransparency = 1,
			StrokeTransparency = 0.08,
			ZIndex = 9,
		})

		tbl303.Info = obj94:Text({ Parent = value491, X = n37, Y = n38, Height = n36 - n38, Wrap = false, ZIndex = 9 })

		obj94:OnResize(function(param331, num129, flag566)
			if num129 == n50 and flag566 == n51 then
				return
			end
			n50 = num129
			n51 = flag566
			n47 = num129 / math.max(flag566, 1)
			n48 = flag566
			n3 = 2
			n49 = 0.9 / math.max(obj94:TextSize(), 1)
			tbl303.Rarity.Set({ StrokeThickness = n49 })

			for _, item162 in ipairs(list51) do
				item162.Rarity.Set({ StrokeThickness = n49 })
			end
		end)
	end

	local function func598(flag567)
		local flag568 = flag567 and flag567.Get()
		if not flag568 or n48 <= 0 then
			return nil
		end

		if flag568.Text ~= tostring(flag567.Spec.Text or "") then
			return nil
		end
		return flag568
	end

	local function func599(param332)
		local flag569 = func598(param332)
		if not flag569 then
			return nil
		end
		local size = flag569.Size
		local textWrapped = flag569.TextWrapped
		flag569.TextWrapped = false
		flag569.Size = UDim2.fromOffset(100000, math.max(1, size.Y.Offset))
		local x = flag569.TextBounds.X
		flag569.Size = size
		flag569.TextWrapped = textWrapped
		if x <= 0 then
			return nil
		end
		return x / n48
	end

	local function func600(param333, num130)
		local flag570 = func598(param333)
		if not flag570 then
			return nil
		end
		local size = flag570.Size
		flag570.Size = UDim2.fromOffset(math.max(1, math.floor(num130 * n48 + 0.5)), 100000)
		local y = flag570.TextBounds.Y
		flag570.Size = size
		if y <= 0 then
			return nil
		end
		return y / n48
	end

	func460 = function(param334)
		local entry44 = list52[param334]

		if not entry44 then
			entry44 = obj78:Text({ Name = "Line", X = 0, Y = 0, Width = 1, Height = 1, Wrap = true, Visible = false })
			list52[param334] = entry44
		end

		return entry44
	end

	func461 = function(param335)
		local entry45 = list51[param335]
		if entry45 then
			return entry45
		end

		local tbl457 = {
			Frame = obj78:Frame({
				Name = "Slot",
				Background = "#000000",
				BackgroundTransparency = 0.74,
				Corner = 0.35,
				X = 0,
				Y = 0,
				Width = 1,
				Height = 1,
				Visible = false,
			}),
		}

		tbl457.Icon = obj78:Image({
			Parent = tbl457.Frame,
			X = n42,
			Y = 0,
			Width = n41,
			Height = n41,
			Corner = 0.35,
			Background = "#000000",
			BackgroundTransparency = 0.45,
			StrokeThickness = n46,
			StrokeTransparency = 0,
		})

		tbl457.Name = obj78:Text({
			Parent = tbl457.Frame,
			X = n42 + n44,
			Y = 0,
			Width = 1,
			Height = n38,
			Scale = n39,
			Wrap = false,
			Gradient = str39.NameGradient,
			TextStrokeTransparency = 1,
		})

		tbl457.Rarity = obj78:Text({
			Parent = tbl457.Frame,
			X = n42 + n44,
			Y = 0,
			Width = 1,
			Height = n38,
			Scale = n40,
			Wrap = false,
			Font = str39.RarityFont,
			TextStrokeTransparency = 1,
			StrokeTransparency = 0.08,
			StrokeThickness = n49,
		})

		tbl457.Detail = obj78:Text({
			Parent = tbl457.Frame,
			X = n42 + n44,
			Y = n38,
			Width = math.max(1, n47 - n44 - n42 * 2),
			Height = 1,
			Wrap = true,
		})

		tbl457.Status = obj78:Text({
			Parent = tbl457.Frame,
			X = 0,
			Y = 0,
			Width = 1,
			Height = n38,
			Wrap = false,
			Align = "Right",
			Color = color.Hint,
		})

		list51[param335] = tbl457
		return tbl457
	end

	func462 = function()
		if n47 <= 0 then
			return
		end
		flag474 = false
		local n55 = math.max(1, n47 - n37)
		local rarity5 = func599(tbl303.Rarity)

		if rarity5 then
			n54 = rarity5 + 0.1
		else
			flag474 = true
		end

		local name4 = func599(tbl303.Name)

		if name4 then
			n53 = math.min(name4 + 0.1, math.max(1, n55 - n54 - n45))
		else
			flag474 = true
		end

		tbl303.Name.Set({ X = n37, Y = 0, Width = n53, Height = n38 })

		tbl303.Rarity.Set({
			X = n37 + n53 + n45,
			Y = 0,
			Width = math.max(0.5, math.min(n54, n55 - n53 - n45)),
			Height = n38,
		})

		tbl303.Info.Set({ X = n37, Y = n38, Width = n55, Height = math.max(1, n36 - n38) })
		local n56 = math.max(1, n47 - n44 - n42 * 2)
		local n57 = 0

		for _, item163 in ipairs(list53) do
			if item163.Kind == "text" then
				local handle = item163.Handle
				local value492 = func600(handle, n47)

				if value492 then
					item163.Height = value492
				else
					flag474 = true
				end

				local n58 = math.max(1, item163.Height or 1)
				handle.Set({ X = 0, Y = n57 + (item163.Gap and 0.5 or 0), Width = n47, Height = n58 })
				n57 += n58 + n2 * 0.5 + (item163.Gap and 0.5 or 0)
			else
				local slot = item163.Slot
				local detail3 = func600(slot.Detail, n56)

				if detail3 then
					slot.DetailUnits = detail3
				else
					flag474 = true
				end

				local n58 = math.clamp(slot.DetailUnits or 1, 1, 4)
				local status3 = func599(slot.Status)

				if status3 then
					slot.StatusUnits = status3 + 0.23
				else
					flag474 = true
				end

				local n59 = math.min(n56 * 0.42, math.max(2.73, slot.StatusUnits or 2.73))
				local n60 = math.max(1, n56 - n59 - n45)
				local rarity6 = func599(slot.Rarity)

				if rarity6 then
					slot.RarityUnits = rarity6 + 0.1
				else
					flag474 = true
				end

				local n61 = math.min(slot.RarityUnits or 3, n60 * 0.5)
				local name5 = func599(slot.Name)

				if name5 then
					slot.NameUnits = name5 + 0.1
				else
					flag474 = true
				end

				local min = math.min
				local max = math.max
				local nameUnits = slot.NameUnits or 4
				local max2 = math.max
				local n62 = n60 - n61 - n45
				local num131 = min(max(1, nameUnits), max2(1, n62))
				local n63 = n43 * 2
				local n64 = math.max(n58 + n38, 2.3) + n63
				local n65 = (n64 - n58 - n38) / 2
				slot.Frame.Set({ X = 0, Y = n57, Width = n47, Height = n64 })
				slot.Icon.Set({ Y = (n64 - n41) / 2 })
				slot.Name.Set({ X = n42 + n44, Y = n65, Width = num131 })
				slot.Rarity.Set({ X = n42 + n44 + num131 + n45, Y = n65, Width = math.max(0.5, n61) })
				slot.Detail.Set({ X = n42 + n44, Y = n65 + n38, Width = n56, Height = n58 })
				slot.Status.Set({ X = n42 + n44 + n56 - n59, Y = n65, Width = math.max(0.5, n59) })
				n57 += n64 + n2
			end
		end

		local n58 = math.max(1, n57)

		if math.abs(n58 - n52) > 0.01 then
			n52 = n58
			obj78:SetContentLines(n58)
		end
	end
end

do
	local tbl458 = func2(function()
		return ReplicatedStorage.Data.ScrambleTradeIn
	end)

	local n4 = 30
	local tbl459 = { Biohazard = "#9DFF4D", Experimental = "#5AD8FF", UnstableDNA = "#FF6BD5" }
	local value493 = nil
	local flag571 = false
	local n5 = 0
	local tbl460 = { Banner = {}, Odds = {}, Chance = {}, Clears = 0 }

	local function func601(param336)
		return tbl459[tostring(param336)] or color.Text
	end

	local function func602(param337, ...)
		if type(tbl458) ~= "table" or type(tbl458[param337]) ~= "function" then
			return nil
		end
		local ok, result = pcall(tbl458[param337], ...)
		if ok then
			return result
		end
		return nil
	end

	local function func603(param338)
		return tostring(func602("GetBannerDisplayName", param338) or param338)
	end

	local function func604(param339)
		local flag572 = tbl460.Banner[param339]

		if flag572 == nil then
			local BannerIdForPeriod = func602("BannerIdForPeriod", param339) or false
			tbl460.Banner[param339] = BannerIdForPeriod
			flag572 = BannerIdForPeriod
		end

		return flag572 or nil
	end

	local function func605(param340)
		local value494, value495, value496 = ipairs(type(tbl458) == "table" and tbl458.Banners or {})
		local n6 = 0
		local n7 = 0

		for _, value497 in value494, value495, value496 do
			local n8 = tonumber(func602("GetBannerWeight", value497.Id)) or 0
			n6 += n8

			if value497.Id == param340 then
				n7 = n8
			end
		end

		return n6 > 0 and n7 / n6 * 100 or 0
	end

	local function func606(param341)
		local flag573 = tbl460.Chance[param341]

		if flag573 == nil then
			flag573 = func605(param341)
			tbl460.Chance[param341] = flag573
		end

		return flag573
	end

	local function func607(param342)
		local GetBanner = func602("GetBanner", param342)
		local tbl461 = {}
		local func608 = ipairs
		local pets = type(GetBanner) == "table" and GetBanner.Pets or {}
		local n6 = 0

		for _, pet in func608(pets) do
			local n7 = tonumber(func602("GetPetWeight", param342, pet.AssetId)) or 0

			if n7 > 0 then
				n6 += n7
				table.insert(tbl461, { AssetId = pet.AssetId, Weight = n7 })
			end
		end

		for _, item164 in ipairs(tbl461) do
			item164.Chance = n6 > 0 and item164.Weight / n6 * 100 or 0
		end

		table.sort(tbl461, function(param343, param344)
			return param343.Chance > param344.Chance
		end)

		return tbl461
	end

	local function func609(param345)
		local flag574 = tbl460.Odds[param345]

		if flag574 == nil then
			flag574 = func607(param345)
			tbl460.Odds[param345] = flag574
		end

		return flag574
	end

	local function func610(param346)
		local ok, result = pcall(os.date, "%I:%M %p", math.floor(param346))
		if not ok then
			return ""
		end
		return (string.gsub(tostring(result), "^0", ""))
	end

	local function func611(param347)
		local n6 = math.max(0, math.floor(param347))
		local n7 = math.floor(n6 / 86400)
		local n8 = math.floor(n6 % 86400 / 3600)
		local n9 = math.floor(n6 % 3600 / 60)
		if n7 > 0 then
			return string.format("%dd %dh %02dm", n7, n8, n9)
		end
		return string.format("%dh %02dm", n8, n9)
	end

	local function func612(param348)
		local income = param348 >= 10 and color.Income or param348 >= 1 and color.Clock or "#FF7A7A"
		local formatted20 = string.format(param348 >= 1 and "%.1f%%" or "%.2f%%", param348)
		return bold(paint(income, formatted20))
	end

	local function func613(num132)
		if num132 <= 0 then
			return ""
		end
		local n6 = 100 / num132
		return paint(color.Hint, n6 < 10 and string.format("1 in %.1f", n6) or string.format("1 in %d", math.floor(n6 + 0.5)))
	end

	local function func614(param349)
		if next(str1.Lab.Banners) ~= nil and str1.Lab.Banners[tostring(param349)] then
			return str39.Separator() .. bold(paint(color.Ready, "Your pick"))
		end
		return ""
	end

	local function func615()
		if flag571 or os.clock() < n5 then
			return
		end
		flag571 = true
		n5 = os.clock() + n4

		task.spawn(function()
			local rfScrambleTradeInAskState = networking:FindFirstChild("RF/ScrambleTradeIn/AskState")

			if rfScrambleTradeInAskState and rfScrambleTradeInAskState:IsA("RemoteFunction") then
				local ok, result = pcall(rfScrambleTradeInAskState.InvokeServer, rfScrambleTradeInAskState)

				if ok and type(result) == "table" then
					value493 = result
				end
			end

			flag571 = false
		end)
	end

	local function func616(flag575, num133, num134)
		local flag576 = flag575 ~= nil
		obj78:SetDock(flag576 and 5 or 0, { Gap = n2 })
		tbl303.Icon.Set({ Visible = flag576 })
		tbl303.Name.Set({ Visible = flag576 })
		tbl303.Rarity.Set({ Visible = flag576 })
		tbl303.Info.Set({ Visible = flag576 })
		if not flag576 then
			return
		end
		local value498 = func601(flag575)
		local GetBannerEggIcon = func602("GetBannerEggIcon", flag575)

		tbl303.Icon.Set({
			Visible = type(GetBannerEggIcon) == "string" and GetBannerEggIcon ~= "",
			Image = type(GetBannerEggIcon) == "string" and GetBannerEggIcon or "",
			StrokeColor = Color3.fromHex(value498),
		})

		tbl303.Name.Set({ Text = str39.Escape(func603(flag575)) })
		tbl303.Rarity.Set({ Text = "ACTIVE", Color = Color3.fromHex(color.Ready), Gradient = nil })
		local n6 = num134 - num133 % num134
		local num135 = bold(paint(color.Clock, "Ends in " .. str39.FormatClock(n6))) .. str39.Separator() .. paint(color.Text, func610(num133 + n6))
		local hint = paint(color.Hint, "Banner chance ") .. func612(func606(flag575))
		local tbl462 = { num135, hint }
		local value499 = value493

		if type(value499) == "table" and value499.BannerId == flag575 then
			if value499.Unlocked == false then
				table.insert(tbl462, paint("#FF7A7A", "Locked on this account"))
			else
				table.insert(tbl462, paint(color.Hint, "Pity ") .. bold(paint(color.Text, string.format("%s/%s", tostring(value499.PityCount or 0), tostring(value499.PityThreshold or 0)))) .. str39.Separator() .. paint(color.Hint, "Free rerolls ") .. bold(paint(color.Text, tostring(value499.FreeRefreshesRemaining or 0))))
			end
		end

		tbl303.Info.Set({ Text = table.concat(tbl462, "\n") })
	end

	local function func617()
		if not obj78 then
			return
		end
		n3 = 2
		table.clear(list53)
		local n6 = 0
		local n7 = 0

		local function func618(param350, param351)
			n6 += 1
			local value500 = func460(n6)
			value500.Set({ Visible = true, Text = param350 })
			table.insert(list53, { Kind = "text", Handle = value500, Gap = param351 })
		end

		local function func619(param352, param353)
			local len4 = #list53 > 0
			func618(string.format("<b><font color=\"%s\">%s</font></b>", param353, param352), len4)
		end

		local function func620()
			n7 += 1
			local value501 = func461(n7)
			value501.Frame.Set({ Visible = true })
			table.insert(list53, { Kind = "slot", Slot = value501 })
			return value501
		end

		local serverTimeNow = workspace:GetServerTimeNow()
		local n8 = tonumber(func602("RotationSeconds")) or 3600
		local n9 = math.floor(serverTimeNow / n8)

		if tbl460.Clears <= os.clock() then
			tbl460.Clears = os.clock() + 60
			table.clear(tbl460.Banner)
			table.clear(tbl460.Odds)
			table.clear(tbl460.Chance)
		end

		local flag577 = func604(n9)

		if type(tbl458) ~= "table" or flag577 == nil then
			func616(nil)
			func618(bold(paint(color.Hint, "Lab data is not available yet")), false)
		else
			func616(flag577, serverTimeNow, n8)
			local list67 = value493

			if type(list67) == "table" and list67.BannerId == flag577 and type(list67.Requirements) == "table" and #list67.Requirements > 0 then
				func619("CURRENT RECIPE", color.Text)
				local tbl463 = {}

				for _, requirement in ipairs(list67.Requirements) do
					local value502 = str39.AssetInfo(requirement)
					local insert = table.insert
					local packed4 = table.pack(bold(paint(value502.Hex, str39.Escape(value502.Name))))
					insert(tbl463, table.unpack(packed4, 1, packed4.n))
				end

				func618(table.concat(tbl463, str39.Separator()), false)
			end

			func619("REWARD ODDS" .. str39.Separator() .. string.upper(func603(flag577)), func601(flag577))
			local list68 = func609(flag577)

			for i, item165 in ipairs(list68) do
				local value503 = str39.AssetInfo(item165.AssetId)
				local result90 = func620()
				result90.Icon.Set({ Visible = value503.Icon ~= nil, Image = value503.Icon or "", StrokeColor = value503.Color })
				result90.Name.Set({ Text = str39.Escape(value503.Name) })

				result90.Rarity.Set({
					Text = string.upper(tostring(value503.Rarity)),
					Color = func457(value503),
					Gradient = func456(value503),
					GradientRotation = func458(value503),
				})

				result90.Status.Set({ Text = func612(item165.Chance) })
				local chance = func613(item165.Chance)

				if i == #list68 then
					chance ..= str39.Separator() .. bold(paint(color.Clock, "Chase pet"))
				end

				result90.Detail.Set({ Text = chance })
			end

			func619("UPCOMING LAB BANNERS", color.Text)

			for i = 1, 8 do
				local num136 = func604(n9 + i)
				local n10 = (n9 + i) * n8
				local result91 = func620()
				local GetBannerEggIcon = func602("GetBannerEggIcon", num136)
				local value504 = func601(num136)

				result91.Icon.Set({
					Visible = type(GetBannerEggIcon) == "string" and GetBannerEggIcon ~= "",
					Image = type(GetBannerEggIcon) == "string" and GetBannerEggIcon or "",
					StrokeColor = Color3.fromHex(value504),
				})

				result91.Name.Set({ Text = str39.Escape(func603(num136)) })
				result91.Rarity.Set({ Text = i == 1 and "NEXT" or "#" .. i, Color = Color3.fromHex(value504), Gradient = nil })
				result91.Status.Set({ Text = bold(paint(color.Clock, "in " .. func611(n10 - serverTimeNow))) })
				local list69 = func609(num136)
				local entry46 = list69[#list69]
				local hint2 = paint(color.Hint, "Starts ") .. paint(color.Text, func610(n10)) .. func614(num136)

				if entry46 then
					local value505 = str39.AssetInfo(entry46.AssetId)
					hint2 ..= str39.Separator() .. paint(color.Hint, "Chase ") .. bold(paint(value505.Hex, str39.Escape(value505.Name))) .. " " .. func612(entry46.Chance)
				end

				result91.Detail.Set({ Text = hint2 })
			end

			func619("NEXT TIME EACH BANNER OPENS", color.Text)
			local func621 = ipairs
			local banners = tbl458.Banners or {}

			for _, banner in func621(banners) do
				local id5 = func601(banner.Id)
				local packed5 = table.pack(str39.Escape(func603(banner.Id)))
				local func622 = paint
				packed5.n = 2 + packed5.n - 1
				table.move(packed5, 1, packed5.n, 2, packed5)
				packed5[1] = id5
				local str53 = bold(func622(table.unpack(packed5, 1, packed5.n)))
				local str54

				if banner.Id == flag577 then
					str54 = str53 .. str39.Separator() .. bold(paint(color.Ready, "Open now"))
				else
					local value506 = nil

					for i = 1, 2000 do
						local id = banner.Id

						if func604(n9 + i) == id then
							value506 = i
							break
						else
							value506 = nil
						end
					end

					if value506 then
						local n10 = (n9 + value506) * n8
						str54 = str53 .. str39.Separator() .. bold(paint(color.Clock, "in " .. func611(n10 - serverTimeNow))) .. str39.Separator() .. paint(color.Text, func610(n10))
					else
						str54 = str53 .. str39.Separator() .. paint(color.Hint, "Not soon")
					end
				end

				func618(str54 .. str39.Separator() .. paint(color.Hint, "chance ") .. func612(func606(banner.Id)) .. func614(banner.Id), false)
			end
		end

		for i = n6 + 1, #list52 do
			list52[i].Set({ Visible = false })
		end

		for i = n7 + 1, #list51 do
			list51[i].Frame.Set({ Visible = false })
		end

		func462()
		n3 = 2
	end

	if not str39.Ready then
		obj76:CreateText({ Name = "Lab Predictor", Text = "Update the Chilli Library to use the predictor canvas." })
	else
		local obj95 = obj76:CreateCanvas({
			Name = "Lab Predictor",
			Layout = "free",
			Style = {
				TextScale = 0.84,
				LineHeight = 1.1,
				MinLines = 16,
				MaxLines = 34,
				BackgroundTransparency = 0.5,
				ScrollBarColor = Color3.fromRGB(170, 174, 184),
				TextColor = Color3.fromRGB(255, 255, 255),
				TextStrokeTransparency = 0.7,
			},
			Build = function(param354)
				func459(param354)
				pcall(func617)
			end,
		})

		func4(function()
			obj95:Destroy()
		end)

		local n6 = 1

		local connection = RunService.Heartbeat:Connect(function(deltaTime)
			if not obj78 or not str39.PageVisible() or not str39.IsShown(obj78:Root()) then
				return
			end
			func615()
			n6 += deltaTime

			if n6 >= 1 then
				n6 = 0
				pcall(func617)
			end

			if n3 > 0 or flag474 then
				if n3 > 0 then
					n3 -= 1
				end

				pcall(func462)
			end
		end)

		func4(function()
			connection:Disconnect()
		end)
	end
end

local paint2, bold2, color2, n4, n5, n6, n7, n8, n9, n10
local n11, n12

do
	local tbl464 = {
		{ min = 0.85, max = 1.05, weight = 2000 },
		{ min = 1.45, max = 1.55, weight = 250 },
		{ min = 1.9, max = 2.1, weight = 125 },
		{ min = 2.85, max = 3.15, weight = 62.5 },
		{ min = 3.8, max = 4.2, weight = 31.25 },
		{ min = 0.3, max = 0.45, weight = 18 },
		{ min = 0.1, max = 0.2, weight = 5 },
		{ min = 5.8, max = 6.2, weight = 15.625 },
		{ min = 9.5, max = 12.5, weight = 3 },
		{ min = 12, max = 17, weight = 0.05 },
		{ min = 20, max = 35, weight = 0.0001 },
	}

	paint2 = str39.Paint
	bold2 = str39.Bold
	color2 = str39.Color
	n4 = 5
	n5 = n4 + 0.8
	n6 = 1.2
	n7 = 1.2
	n8 = 0.936
	n9 = 2.3
	n10 = 0.25
	n11 = 0.18
	local n13 = n9 + 0.6
	local n14 = 0.24
	n12 = 0.22
	local n15 = 0.0909
	local value507 = nil
	local tbl465 = {}
	local tbl466 = {}
	local tbl467 = {}
	local tbl468 = {}
	local n16 = 0
	local n17 = 0
	local n18 = 0.06
	local n19 = -1
	local n20 = -1
	local n21 = -1
	local n22 = 4
	local n23 = 3
	local flag578 = false
	local n24 = 0
	local value508 = nil

	local tbl469 = {
		{ Min = 0, Color = "#8F98A8" },
		{ Min = 0.3, Color = "#C6CDDA" },
		{ Min = 0.85, Color = "#FFFFFF" },
		{ Min = 1.45, Color = "#7CFF9E" },
		{ Min = 1.9, Color = "#4FE0FF" },
		{ Min = 2.85, Color = "#6FA0FF" },
		{ Min = 3.8, Color = "#C08BFF" },
		{ Min = 5.8, Color = "#FF9A3D" },
		{ Min = 9.5, Color = "#FF5C5C" },
		{ Min = 12, Color = "#FFD34D" },
		{ Min = 20, Color = "#FF4DE8" },
	}

	local function func623(num137)
		local n25 = -math.huge
		local str55 = "#FFFFFF"

		for _, item166 in ipairs(tbl469) do
			if num137 + 0.001 >= item166.Min and item166.Min > n25 then
				str55 = item166.Color
				n25 = item166.Min
			end
		end

		return str55
	end

	local function func624(param355, param356)
		local eggRecords = tbl1.EggRecords
		if type(eggRecords) ~= "table" or type(eggRecords.WeightKgForScale) ~= "function" then
			return nil
		end
		local ok, result = pcall(eggRecords.WeightKgForScale, param355, param356)
		if ok and type(result) == "number" and result > 0 then
			return result
		end
		return nil
	end

	local function func625(list70)
		if type(list70) ~= "table" or #list70 == 0 then
			return nil
		end
		local n25 = -math.huge
		local value509 = nil

		for _, item167 in ipairs(list70) do
			local value510 = str39.MutationMultiplier({ item167 })

			if n25 < value510 then
				n25 = value510
				value509 = item167
			end
		end

		return value509
	end

	local function func626()
		if value508 then
			return value508
		end
		local eggRecords = tbl1.EggRecords
		local getupvalues_ = type(debug) == "table" and debug.getupvalues or getupvalues

		if type(eggRecords) == "table" and type(eggRecords.DrawAssetScale) == "function" and type(getupvalues_) == "function" then
			local ok, result = pcall(getupvalues_, eggRecords.DrawAssetScale)

			if ok and type(result) == "table" then
				for _, value511 in pairs(result) do
					if type(value511) == "table" and type(value511[1]) == "table" and value511[1].min and value511[1].weight then
						value508 = value511
						break
					end
				end
			end
		end

		value508 = value508 or tbl464
		return value508
	end

	local function func627(tbl470, num138, num139)
		local fuseKernel = tbl1.FuseKernel


		if type(fuseKernel) == "table" and type(fuseKernel.BandWeightBias) == "function" then
			local ok, result = pcall(fuseKernel.BandWeightBias, tbl470, num138, num139)
			if ok and type(result) == "number" then
				return result
			end
		end

		return math.exp(math.log((tbl470[1] + tbl470[2] + tbl470[3]) / 3) / 0.69314718055994529 * math.log((num138 + num139) / 2) / 0.69314718055994529 * 0.6)
	end

	local function func628()
		local save = tbl1.Save
		if type(save) ~= "table" or type(save.Get) ~= "function" then
			return nil
		end
		local ok, result = pcall(save.Get)
		if not ok or type(result) ~= "table" then
			return nil
		end
		local fusionSlots = type(result.FusionSlots) == "table" and result.FusionSlots or {}
		local inventory = type(result.Inventory) == "table" and result.Inventory or {}
		local tbl471 = {}

		for i = 1, 3 do
			local entry47 = fusionSlots[i]
			local flag579 = entry47 ~= nil and inventory[entry47] or nil

			if type(flag579) == "table" then
				table.insert(tbl471, {
					Category = flag579.Category,
					Scale = tonumber(flag579.Scale) or 1,
					Mutations = type(flag579.Mutations) == "table" and flag579.Mutations or {},
				})
			end
		end

		return {
			Items = tbl471,
			Locked = result.FusionLocked == true,
			Duration = tonumber(result.FusionDuration) or 0,
			Reward = result.FusionEggReward ~= nil and result.FusionEggReward ~= false,
		}
	end

	local function func629(param357)
		if string.upper(tostring(param357.Rarity)) == "SECRET" then
			return str39.SecretGradient
		end
		return param357.Gradient
	end

	local function func630(param358)
		return func629(param358) ~= nil and Color3.fromRGB(255, 255, 255) or param358.Color
	end

	local function func631(param359)
		if string.upper(tostring(param359.Rarity)) == "SECRET" then
			return str39.SecretRotation
		end
		return nil
	end

	local function func632(obj96)
		value507 = obj96
		obj96:SetDock(5, { Gap = n12, DividerColor = Color3.fromRGB(170, 174, 184) })
		local value512 = obj96:Dock()

		tbl465.Icon = obj96:Image({
			Parent = value512,
			X = 0,
			Y = 0,
			Width = n4,
			Height = n4,
			Corner = 0.35,
			Background = "#000000",
			BackgroundTransparency = 0.26,
			StrokeThickness = n15,
			StrokeTransparency = 0,
			ZIndex = 8,
		})

		tbl465.Name = obj96:Text({
			Parent = value512,
			X = n5,
			Y = 0,
			Height = n6,
			Scale = n7,
			Wrap = false,
			Gradient = str39.NameGradient,
			TextStrokeTransparency = 1,
			ZIndex = 9,
		})

		tbl465.Rarity = obj96:Text({
			Parent = value512,
			X = n5,
			Y = 0,
			Height = n6,
			Scale = n8,
			Wrap = false,
			Font = str39.RarityFont,
			TextStrokeTransparency = 1,
			StrokeTransparency = 0.08,
			ZIndex = 9,
		})

		tbl465.Info = obj96:Text({ Parent = value512, X = n5, Y = n6, Height = n4 - n6, Wrap = false, ZIndex = 9 })

		obj96:OnResize(function(param360, num140, flag580)
			if num140 == n19 and flag580 == n20 then
				return
			end
			n19 = num140
			n20 = flag580
			n16 = num140 / math.max(flag580, 1)
			n17 = flag580
			n24 = 2
			n18 = 0.9 / math.max(obj96:TextSize(), 1)
			tbl465.Rarity.Set({ StrokeThickness = n18 })

			for _, item168 in ipairs(tbl466) do
				item168.Rarity.Set({ StrokeThickness = n18 })
			end
		end)
	end

	local function func633(flag581)
		local flag582 = flag581 and flag581.Get()
		if not flag582 or n17 <= 0 then
			return nil
		end

		if flag582.Text ~= tostring(flag581.Spec.Text or "") then
			return nil
		end
		return flag582
	end

	local function func634(param361)
		local flag583 = func633(param361)
		if not flag583 then
			return nil
		end
		local size = flag583.Size
		local textWrapped = flag583.TextWrapped
		flag583.TextWrapped = false
		flag583.Size = UDim2.fromOffset(100000, math.max(1, size.Y.Offset))
		local x = flag583.TextBounds.X
		flag583.Size = size
		flag583.TextWrapped = textWrapped
		if x <= 0 then
			return nil
		end
		return x / n17
	end

	local function func635(param362, num141)
		local flag584 = func633(param362)
		if not flag584 then
			return nil
		end
		local size = flag584.Size
		flag584.Size = UDim2.fromOffset(math.max(1, math.floor(num141 * n17 + 0.5)), 100000)
		local y = flag584.TextBounds.Y
		flag584.Size = size
		if y <= 0 then
			return nil
		end
		return y / n17
	end

	local function func636(param363)
		local entry48 = tbl467[param363]

		if not entry48 then
			local value513 = value507:Text({ Name = "Line", X = 0, Y = 0, Width = 1, Height = 1, Wrap = true, Visible = false })
			tbl467[param363] = value513
			entry48 = value513
		end

		return entry48
	end

	local function func637(param364)
		local entry49 = tbl466[param364]
		if entry49 then
			return entry49
		end

		local tbl472 = {
			Frame = value507:Frame({
				Name = "Slot",
				Background = "#000000",
				BackgroundTransparency = 0.74,
				Corner = 0.35,
				X = 0,
				Y = 0,
				Width = 1,
				Height = 1,
				Visible = false,
			}),
		}

		tbl472.Icon = value507:Image({
			Parent = tbl472.Frame,
			X = n10,
			Y = 0,
			Width = n9,
			Height = n9,
			Corner = 0.35,
			Background = "#000000",
			BackgroundTransparency = 0.45,
			StrokeThickness = n15,
			StrokeTransparency = 0,
		})

		tbl472.Name = value507:Text({
			Parent = tbl472.Frame,
			X = n10 + n13,
			Y = 0,
			Width = 1,
			Height = n6,
			Scale = n7,
			Wrap = false,
			Gradient = str39.NameGradient,
			TextStrokeTransparency = 1,
		})

		tbl472.Rarity = value507:Text({
			Parent = tbl472.Frame,
			X = n10 + n13,
			Y = 0,
			Width = 1,
			Height = n6,
			Scale = n8,
			Wrap = false,
			Font = str39.RarityFont,
			TextStrokeTransparency = 1,
			StrokeTransparency = 0.08,
			StrokeThickness = n18,
		})

		tbl472.Detail = value507:Text({
			Parent = tbl472.Frame,
			X = n10 + n13,
			Y = n6,
			Width = math.max(1, n16 - n13 - n10 * 2),
			Height = 1,
			Wrap = true,
		})

		tbl472.Status = value507:Text({
			Parent = tbl472.Frame,
			X = 0,
			Y = 0,
			Width = 1,
			Height = n6,
			Wrap = false,
			Align = "Right",
			Color = color2.Hint,
		})

		tbl466[param364] = tbl472
		return tbl472
	end

	local function func638()
		if n16 <= 0 then
			return
		end
		flag578 = false
		local n25 = math.max(1, n16 - n5)
		local rarity7 = func634(tbl465.Rarity)

		if rarity7 then
			n23 = rarity7 + 0.1
		else
			flag578 = true
		end

		local name6 = func634(tbl465.Name)

		if name6 then
			n22 = math.min(name6 + 0.1, math.max(1, n25 - n23 - n14))
		else
			flag578 = true
		end

		tbl465.Name.Set({ X = n5, Y = 0, Width = n22, Height = n6 })

		tbl465.Rarity.Set({
			X = n5 + n22 + n14,
			Y = 0,
			Width = math.max(0.5, math.min(n23, n25 - n22 - n14)),
			Height = n6,
		})

		tbl465.Info.Set({ X = n5, Y = n6, Width = n25, Height = math.max(1, n4 - n6) })
		local n26 = math.max(1, n16 - n13 - n10 * 2)
		local n27 = 0

		for _, item169 in ipairs(tbl468) do
			if item169.Kind == "text" then
				local handle = item169.Handle
				local value514 = func635(handle, n16)

				if value514 then
					item169.Height = value514
				else
					flag578 = true
				end

				local n28 = math.max(1, item169.Height or 1)
				handle.Set({ X = 0, Y = n27 + (item169.Gap and 0.5 or 0), Width = n16, Height = n28 })
				n27 += n28 + n12 * 0.5 + (item169.Gap and 0.5 or 0)
			else
				local slot = item169.Slot
				local detail4 = func635(slot.Detail, n26)

				if detail4 then
					slot.DetailUnits = detail4
				else
					flag578 = true
				end

				local n28 = math.clamp(slot.DetailUnits or 1, 1, 4)
				local status4 = func634(slot.Status)

				if status4 then
					slot.StatusUnits = status4 + 0.23
				else
					flag578 = true
				end

				local n29 = math.min(n26 * 0.42, math.max(2.73, slot.StatusUnits or 2.73))
				local n30 = math.max(1, n26 - n29 - n14)
				local rarity8 = func634(slot.Rarity)

				if rarity8 then
					slot.RarityUnits = rarity8 + 0.1
				else
					flag578 = true
				end

				local n31 = math.min(slot.RarityUnits or 3, n30 * 0.5)
				local name7 = func634(slot.Name)

				if name7 then
					slot.NameUnits = name7 + 0.1
				else
					flag578 = true
				end

				local min = math.min
				local max = math.max
				local nameUnits = slot.NameUnits or 4
				local max2 = math.max
				local n32 = n30 - n31 - n14
				local num142 = min(max(1, nameUnits), max2(1, n32))
				local n33 = n11 * 2
				local n34 = math.max(n28 + n6, 2.3) + n33
				local n35 = (n34 - n28 - n6) / 2
				slot.Frame.Set({ X = 0, Y = n27, Width = n16, Height = n34 })
				slot.Icon.Set({ Y = (n34 - n9) / 2 })
				slot.Name.Set({ X = n10 + n13, Y = n35, Width = num142 })
				slot.Rarity.Set({ X = n10 + n13 + num142 + n14, Y = n35, Width = math.max(0.5, n31) })
				slot.Detail.Set({ X = n10 + n13, Y = n35 + n6, Width = n26, Height = n28 })
				slot.Status.Set({ X = n10 + n13 + n26 - n29, Y = n35, Width = math.max(0.5, n29) })
				n27 += n34 + n12
			end
		end

		local n28 = math.max(1, n27)

		if math.abs(n28 - n21) > 0.01 then
			n21 = n28
			value507:SetContentLines(n28)
		end
	end

	local function func639(flag585, list71)
		local flag586 = flag585 ~= nil
		value507:SetDock(flag586 and 5 or 0, { Gap = n12 })
		tbl465.Icon.Set({ Visible = flag586 })
		tbl465.Name.Set({ Visible = flag586 })
		tbl465.Rarity.Set({ Visible = flag586 })
		tbl465.Info.Set({ Visible = flag586 })
		if not flag586 then
			return
		end
		tbl465.Icon.Set({ Visible = flag585.Icon ~= nil, Image = flag585.Icon or "", StrokeColor = flag585.Color })
		tbl465.Name.Set({ Text = str39.Escape(flag585.Name) })

		tbl465.Rarity.Set({
			Text = string.upper(tostring(flag585.Rarity)),
			Color = func630(flag585),
			Gradient = func629(flag585),
			GradientRotation = func631(flag585),
		})

		local text3 = paint2(color2.Text, string.format("Fusing %d of 3 pets", #list71.Items))

		if list71.Reward then
			text3 = bold2(paint2(color2.Ready, "Fuse finished, claim your egg"))
		elseif list71.Locked then
			local n25 = list71.Duration > 1e9 and list71.Duration - workspace:GetServerTimeNow() or 0
			text3 = bold2(paint2(color2.Clock, n25 > 0 and "Fusing" .. str39.Separator() .. str39.FormatClock(n25) or "Fusing"))
		end

		local set = tbl465.Info.Set
		local tbl473 = {}
		local concat = table.concat
		local value515 = bold2(paint2(color2.Income, str39.FormatRate(str39.Income(flag585, list71.Items[1].Scale, list71.Items[1].Mutations))))
		local text4 = paint2(color2.Text, string.format("%d/3 loaded", #list71.Items))
		local tbl474 = { value515, text4, text3 }
		tbl473.Text = concat(tbl474, "\n")
		set(tbl473)
	end

	local function refreshFuse()
		if not value507 then
			return
		end
		n24 = 2
		table.clear(tbl468)
		local n25 = 0

		local function func640(param365, param366)
			n25 += 1
			local value516 = func636(n25)
			value516.Set({ Visible = true, Text = param365 })
			table.insert(tbl468, { Kind = "text", Handle = value516, Gap = param366 })
		end

		local function func641(param367, param368)
			local len5 = #tbl468 > 0
			func640(string.format("<b><font color=\"%s\">%s</font></b>", param368, param367), len5)
		end

		local result92 = func628()
		local n26

		if not result92 then
			func639(nil, nil)
			func640(bold2(paint2(color2.Hint, "Fuse machine data is not available yet")), false)
			n26 = 0
		elseif #result92.Items == 0 then
			func639(nil, nil)
			func640(bold2(paint2(color2.Text, "Machine is empty")), false)
			func640(paint2(color2.Hint, "Load 3 pets of the same species to see the result odds"), false)
			n26 = 0
		else
			local items = result92.Items
			local value517 = str39.AssetInfo(items[1].Category)
			func639(value517, result92)
			local text = color2.Text
			func641(string.format("FUSE MACHINE STATUS (%d/3 PETS)", #items), text)
			func640(paint2(color2.Hint, "Species") .. "  " .. bold2(paint2(value517.Hex, "[" .. string.upper(tostring(value517.Rarity)) .. "]")) .. " " .. bold2(paint2(color2.Text, str39.Escape(value517.Name))), false)
			n26 = 0

			for i = 1, 3 do
				local entry50 = items[i]
				n26 += 1
				local value518 = func637(n26)
				value518.Frame.Set({ Visible = true })
				value518.Status.Set({ Text = "SLOT " .. i })

				if entry50 then
					value518.Icon.Set({ Visible = value517.Icon ~= nil, Image = value517.Icon or "", StrokeColor = value517.Color })
					value518.Name.Set({ Text = str39.Escape(value517.Name) })

					value518.Rarity.Set({
						Text = string.upper(tostring(value517.Rarity)),
						Color = func630(value517),
						Gradient = func629(value517),
						GradientRotation = func631(value517),
					})

					local category7 = func624(entry50.Category, entry50.Scale)
					local str56 = bold2(paint2(color2.Scale, string.format("%.2fx", entry50.Scale)))

					if category7 then
						str56 ..= str39.Separator() .. paint2(color2.Weight, str39.FormatWeight(category7))
					end

					local separat = str56 .. str39.Separator() .. bold2(paint2(color2.Income, str39.FormatRate(str39.Income(value517, entry50.Scale, entry50.Mutations))))
					local flag587 = str39.MutationText(entry50.Mutations)

					value518.Detail.Set({
						Text = separat .. str39.Separator() .. (flag587 ~= "" and flag587 or paint2(color2.Hint, "Normal")),
					})
				else
					value518.Icon.Set({ Visible = false })
					value518.Name.Set({ Text = paint2(color2.Hint, "Empty") })
					value518.Rarity.Set({ Text = "", Gradient = nil })
					value518.Detail.Set({ Text = paint2(color2.Hint, "Add a pet to this slot") })
				end

				table.insert(tbl468, { Kind = "slot", Slot = value518 })
			end

			local n27 = 0

			for _, item in ipairs(items) do
				n27 += item.Scale
			end

			local n28 = n27 / #items
			local value519 = func624(items[1].Category, n28)
			local hint3 = paint2(color2.Hint, "Average Scale") .. "  " .. bold2(paint2(color2.Scale, string.format("%.2fx", n28)))

			if value519 then
				hint3 ..= str39.Separator() .. paint2(color2.Weight, str39.FormatWeight(value519))
			end

			func640(hint3, false)
			local value520 = nil

			for _, item in ipairs(items) do
				local mutations4 = func625(item.Mutations)

				if mutations4 then
					if (value520 and str39.MutationMultiplier({ value520 }) or 0) < str39.MutationMultiplier({ mutations4 }) then
						value520 = mutations4
					end
				end
			end

			local tbl475 = value520 and { value520 } or {}
			func641("PREDICTED SIZE PROBABILITIES", color2.Income)

			if #items == 3 then
				local tbl476 = { items[1].Scale, items[2].Scale, items[3].Scale }
				local tbl477 = {}
				local n29 = 0

				for _, item170 in ipairs(func626()) do
					local n30 = item170.weight * func627(tbl476, item170.min, item170.max)
					n29 += n30
					table.insert(tbl477, { Min = item170.min, Max = item170.max, Weight = n30, Color = func623(item170.min) })
				end

				table.sort(tbl477, function(param369, param370)
					return param369.Weight > param370.Weight
				end)

				local first10 = tbl477[1]

				for _, item171 in ipairs(tbl477) do
					local n30 = n29 > 0 and item171.Weight / n29 * 100 or 0
					local str57 = bold2(paint2(item171.Color, string.format("%.2fx - %.2fx", item171.Min, item171.Max)))
					local flag588 = func624(items[1].Category, item171.Min)
					local value521 = func624(items[1].Category, item171.Max)

					if flag588 and value521 then
						local weight = color2.Weight
						local format = string.format
						local formatWeight = str39.FormatWeight
						str57 ..= str39.Separator() .. paint2(weight, format("%s - %s", str39.FormatWeight(flag588), formatWeight(value521)))
					end

					func640(str57 .. str39.Separator() .. bold2(paint2(n30 >= 10 and color2.Income or n30 >= 1 and color2.Clock or color2.Hint, string.format(n30 >= 1 and "%.1f%%" or "%.3f%%", n30))), false)
				end

				func641("RESULT PREDICTION", color2.Text)
				func640(paint2(color2.Hint, "Predicted Mutation") .. "  " .. (value520 and str39.MutationText(tbl475) or paint2(color2.Text, "Normal")), false)

				if first10 then
					func640(paint2(color2.Hint, "Estimated Value") .. "  " .. bold2(paint2(color2.Income, str39.FormatRate(str39.Income(value517, first10.Min, tbl475)) .. " ~ " .. str39.FormatRate(str39.Income(value517, first10.Max, tbl475)))) .. str39.Separator() .. paint2(color2.Hint, "at ") .. bold2(paint2(first10.Color, string.format("%.2fx - %.2fx", first10.Min, first10.Max))), false)
				end

				local value522 = nil

				for _, item172 in ipairs(tbl477) do
					if not value522 or item172.Max > value522.Max then
						value522 = item172
					end
				end

				if value522 then
					func640(paint2(color2.Hint, "Best Case") .. "  " .. bold2(paint2(value522.Color, string.format("%.2fx - %.2fx", value522.Min, value522.Max))) .. "  " .. bold2(paint2(color2.Income, str39.FormatRate(str39.Income(value517, value522.Max, tbl475)))), false)
				end
			else
				func640(paint2(color2.Hint, string.format("Load %d more of the same species to see the odds", 3 - #result92.Items)), false)
			end
		end

		for i = n25 + 1, #tbl467 do
			tbl467[i].Set({ Visible = false })
		end

		for i = n26 + 1, #tbl466 do
			tbl466[i].Frame.Set({ Visible = false })
		end

		func638()
		n24 = 2
	end

	if not str39.Ready then
		obj77:CreateText({ Name = "Fuse Predictor", Text = "Update the Chilli Library to use the predictor canvas." })
	else
		local obj97 = obj77:CreateCanvas({
			Name = "Fuse Predictor",
			Layout = "free",
			Style = {
				TextScale = 0.84,
				LineHeight = 1.1,
				MinLines = 16,
				MaxLines = 34,
				BackgroundTransparency = 0.5,
				ScrollBarColor = Color3.fromRGB(170, 174, 184),
				TextColor = Color3.fromRGB(255, 255, 255),
				TextStrokeTransparency = 0.7,
			},
			Build = function(param371)
				func632(param371)

				if type(str39.RequestEggRefresh) == "function" then
					str39.RequestEggRefresh()
				end
			end,
		})

		str39.RefreshFuse = refreshFuse

		str39.PlaceFuse = function()
			if n24 > 0 or flag578 then
				if n24 > 0 then
					n24 -= 1
				end

				pcall(func638)
			end
		end

		func4(function()
			obj97:Destroy()
		end)
	end
end

local obj98 = obj2._bhLayout.Progress

do
	local tbl478 = {}
	local tbl479

	tbl479 = {
		Remote = function(childName17)
			local entry51 = tbl478[childName17]
			if entry51 ~= nil then
				return entry51 or nil
			end
			local flag589 = networking:FindFirstChild(childName17)
			tbl478[childName17] = flag589 or false
			return flag589
		end,
		Invoke = function(param372, ...)
			local obj99 = tbl479.Remote(param372)
			if not obj99 or not obj99:IsA("RemoteFunction") then
				return false, nil
			end
			local ok, result = pcall(obj99.InvokeServer, obj99, ...)
			return ok, result
		end,
		Fire = function(param373, ...)
			local obj100 = tbl479.Remote(param373)
			if not obj100 or not obj100:IsA("RemoteEvent") then
				return false
			end
			return pcall(obj100.FireServer, obj100, ...)
		end,
	}

	local function saveData()
		local save = tbl1.Save
		if type(save) ~= "table" or type(save.Get) ~= "function" then
			return nil
		end
		local ok, result = pcall(save.Get)
		return ok and type(result) == "table" and result or nil
	end

	tbl479.SaveData = saveData
	local tbl480 = { "Money", "Cash", "Coins", "Currency", "Balance" }

	tbl479.Money = function()
		local result93 = saveData()

		if result93 then
			for _, item173 in ipairs(tbl480) do
				local num143 = tonumber(result93[item173])
				if num143 then
					return num143
				end
			end
		end

		local leaderstats = localPlayer:FindFirstChild("leaderstats")

		if leaderstats then
			for _, item174 in ipairs(tbl480) do
				local flag590 = leaderstats:FindFirstChild(item174)
				if flag590 and tonumber(flag590.Value) then
					return tonumber(flag590.Value)
				end
			end
		end

		return nil
	end

	tbl479.AddWorker = tbl2.Add
	tbl479.Backoff = tbl2.Backoff

	local tbl481 = {
		"Money",
		"BaseUpgradeLevel",
		"TreadmillUpgradeLevel",
		"TrailInventory",
		"PendingOfflineMoney",
	}

	local save = tbl1.Save

	if type(save) == "table" and type(save.FieldSignal) == "function" then
		for _, item175 in ipairs(tbl481) do
			local ok, result = pcall(save.FieldSignal, item175)

			if ok and type(result) == "table" and type(result.Connect) == "function" then
				local ok2, result2 = pcall(result.Connect, result, function()
					tbl2.Wake()
				end)

				if ok2 and result2 then
					func4(function()
						pcall(function()
							result2:Disconnect()
						end)
					end)
				end
			end
		end
	end

	local value523 = nil
	local value524 = nil
	local tbl482 = {}

	local function func642()
		local value525 = func2(function()
			return ReplicatedStorage.Data.Trails
		end)

		local directory = type(value525) == "table" and value525.Directory or nil
		if type(directory) ~= "table" then
			return {}
		end
		local tbl483 = {}

		for k, value526 in pairs(directory) do
			if type(value526) == "table" then
				table.insert(tbl483, { Id = tostring(value526._id or k), Price = tonumber(value526.Price) or math.huge })
			end
		end

		table.sort(tbl483, function(param374, param375)
			return param374.Price < param375.Price
		end)

		return tbl483
	end

	local function func643(param376)
		if not flag2.ReadToggle(value523, false) then
			return false
		end
		value524 = value524 or func642()
		local flag591 = tbl479.SaveData()
		if not flag591 or #value524 == 0 then
			return false
		end
		local trailInventory = type(flag591.TrailInventory) == "table" and flag591.TrailInventory or {}
		local n13 = tonumber(flag591.Money) or 0

		for _, item176 in ipairs(value524) do
			if trailInventory[item176.Id] ~= true and not tbl482[item176.Id] and item176.Price <= n13 then
				local AskPurchase, flag592 = tbl479.Invoke("RF/Trailwear/AskPurchase", item176.Id)
				if AskPurchase and flag592 ~= false then
					return true
				end
				tbl482[item176.Id] = true
				tbl479.Backoff(param376)
				return false
			end
		end

		return false
	end

	value523 = obj98:CreateToggle({
		Name = "Auto Buy Trail",
		Note = "Automatically buy available trails when affordable",
		Default = false,
		Callback = function()
			table.clear(tbl482)
			value524 = nil
		end,
	})

	tbl479.AddWorker(func643)
	local value527 = nil

	local function func644()
		if not flag2.ReadToggle(value527, false) then
			return false
		end
		local flag593 = tbl479.SaveData()
		if not flag593 then
			return false
		end

		local value528 = func2(function()
			return ReplicatedStorage.Data.Bases
		end)

		local bases = type(value528) == "table" and value528.BASES or nil
		if type(bases) ~= "table" then
			return false
		end
		local n13 = tonumber(flag593.BaseUpgradeLevel) or 0
		local ok = nil

		if type(value528.GetMaxBaseLevel) == "function" then
			local result
			ok, result = pcall(value528.GetMaxBaseLevel)
			ok = ok and tonumber(result) or nil
		end

		if ok and n13 >= ok then
			return false
		end
		local entry52 = bases[n13 + 1]
		local num144 = type(entry52) == "table" and tonumber(entry52.Cost) or nil

		if num144 then
			num144 = (tonumber(flag593.Money) or 0) >= num144
		end

		if num144 then
			return tbl479.Fire("RE/Homestead/AskBaseTierRaise")
		end
		return false
	end

	value527 = obj98:CreateToggle({
		Name = "Auto Upgrade Base",
		Note = "Automatically upgrade base when money is available",
		Default = false,
	})

	tbl479.AddWorker(func644)
	local value529 = nil

	local function func645()
		if not flag2.ReadToggle(value529, false) then
			return false
		end
		local flag594 = tbl479.SaveData()
		if not flag594 then
			return false
		end

		local value530 = func2(function()
			return ReplicatedStorage.Data.Treadmills
		end)

		if type(value530) ~= "table" or type(value530.GetByUpgradeLevel) ~= "function" then
			return false
		end
		local ok, result = pcall(value530.GetByUpgradeLevel, (tonumber(flag594.TreadmillUpgradeLevel) or 0) + 1)
		if not ok or type(result) ~= "table" then
			return false
		end
		local id = result._id
		local huge = tonumber(result.Price) or math.huge
		local flag595 = type(id) == "string"

		if flag595 then
			flag595 = (tonumber(flag594.Money) or 0) >= huge
		end

		if flag595 then
			local AskTierRaise, flag596 = tbl479.Invoke("RF/Treadmill/AskTierRaise", id)
			return AskTierRaise and flag596 ~= false
		end
		return false
	end

	value529 = obj98:CreateToggle({
		Name = "Auto Upgrade Treadmill",
		Note = "Automatically upgrade treadmill when money is available",
		Default = false,
	})

	tbl479.AddWorker(func645)
	local n13 = 15
	local value531 = nil
	local n14 = 15
	local now = os.clock()

	local function func646()
		if not flag2.ReadToggle(value531, false) then
			return false
		end
		local now2 = os.clock()
		n14 += now2 - now
		now = now2
		local flag597 = tbl479.SaveData()
		flag597 = flag597 and tonumber(flag597.PendingOfflineMoney) or nil

		if flag597 == nil then
			local flag598
			flag597, flag598 = tbl479.Invoke("RF/AwayEarnings/PendingCheck")
			flag597 = flag597 and flag598 ~= false and flag598 ~= nil and 1 or 0
		end

		local flag599 = false

		if flag597 > 0 then
			local AskCollect, flag600 = tbl479.Invoke("RF/AwayEarnings/AskCollect")
			flag599 = AskCollect and flag600 ~= false
		end

		if n13 <= n14 then
			n14 = 0
			local AskRedeemAll, flag601 = tbl479.Invoke("RF/Codex/AskRedeemAll")
			flag599 = flag599 or AskRedeemAll and flag601 ~= false
			tbl479.Invoke("RF/Codex/AskRedeemLimitedEgg")
		end

		return flag599
	end

	value531 = obj98:CreateToggle({
		Name = "Auto Claim",
		Note = "Claim offline money & index rewards",
		Default = false,
		Callback = function()
			n14 = n13
		end,
	})

	tbl479.AddWorker(func646)
end

str1.IndexClaimHandle = obj98:CreateToggle({
	Name = "Auto Claim Index",
	Note = "Claim index rewards as soon as they unlock",
	Default = false,
	Callback = function()
		if type(str1.IndexClaimRestart) == "function" then
			str1.IndexClaimRestart()
		end
	end,
})

pcall(function()
	local orderMap = {
		["Auto Upgrade Base"] = 1,
		["Auto Upgrade Treadmill"] = 2,
		["Auto Claim"] = 3,
		["Auto Claim Index"] = 4,
		["Auto Buy Trail"] = 5,
	}
	if obj98 and obj98.Options then
		for _, opt in ipairs(obj98.Options) do
			local ord = orderMap[opt.Name]
			if ord then
				if opt.Instance then opt.Instance.LayoutOrder = ord end
				if opt._visibilityHost then opt._visibilityHost.LayoutOrder = ord end
			end
		end
	end
end)

local func647

func647 = function(param377, param378)
	if type(obj1.Notify) == "function" then
		pcall(obj1.Notify, param377, param378, 5)
	end
end

local obj101 = obj2._bhLayout.ServerHop

pcall(function()
	local finderSec = obj2._bhLayout and obj2._bhLayout.EggFinder
	if finderSec then
		local hopModes = { "Until An Egg Matches", "Steal Then Hop", "After A Rare Spawns" }
		local finderState = {
			Mode = hopModes[2],
			RareMin = tbl8[list3[math.min(#list3, 7)] or list3[1]] or 7,
			Sync = true,
			MinRarity = 0,
			Areas = {},
			MinIncome = 0,
			FirstDelay = 5,
			LoadedAt = os.clock(),
			LastHopAt = 0,
			LastStatus = nil,
		}
		for _, a in ipairs(tbl37) do finderState.Areas[a] = true end
		local finderStatus = finderSec:CreateText({ Name = "Finder Status", Text = "Idle" })
		local function setFinderStatus(txt)
			if txt ~= finderState.LastStatus then
				finderState.LastStatus = txt
				pcall(finderStatus.Set, finderStatus, txt)
			end
		end
		local autoHopHandle = finderSec:CreateToggle({
			Name = "Auto Hop",
			Note = "Automatically server hops to find matching eggs on the conveyor/field",
			Default = false,
			Callback = function(v)
				finderState.LoadedAt = os.clock()
				setFinderStatus(v and "Scanning field eggs..." or "Idle")
				tbl2.Wake()
			end,
		})
		finderSec:CreateDropdown({
			Name = "Hop Mode",
			Options = hopModes,
			Default = hopModes[2],
			SubOf = autoHopHandle,
			Callback = function(v) finderState.Mode = tostring(v or hopModes[2]); tbl2.Wake() end,
		})
		finderSec:CreateDropdown({
			Name = "Rarity To Wait For",
			Note = "Wait in the server when an egg of this rarity or higher is on the field",
			Options = list3,
			Default = list3[math.min(#list3, 7)] or list3[1],
			SubOf = autoHopHandle,
			Callback = function(v) finderState.RareMin = tbl8[v] or 7; tbl2.Wake() end,
		})
		finderSec:CreateToggle({
			Name = "Sync With Auto Steal Filters",
			Note = "Changing a filter here also changes it in Auto Steal, and back",
			Default = true,
			SubOf = autoHopHandle,
			Callback = function(v) finderState.Sync = v == true; tbl2.Wake() end,
		})
		finderSec:CreateDropdown({
			Name = "Min Rarity",
			Note = "Find eggs of the chosen rarity and every rarity above it",
			Options = list3,
			Default = list3[1],
			SubOf = autoHopHandle,
			Callback = function(v) finderState.MinRarity = tbl8[v] or 0; tbl2.Wake() end,
		})
		func6(finderSec:CreateMultiDropdown({
			Name = "Target Areas",
			Options = tbl37,
			Default = tbl37,
			SubOf = autoHopHandle,
			Callback = function(list)
				table.clear(finderState.Areas)
				for _, a in ipairs(type(list) == "table" and list or {}) do
					finderState.Areas[tostring(a)] = true
				end
				tbl2.Wake()
			end,
		}))
		func5(finderSec, {
			Name = "Min Value To Find",
			Note = "Skip eggs worth less than this. Drag or type 250k, 50m, 1.5b",
			SubOf = autoHopHandle,
			OnRaw = function(raw) finderState.MinIncome = math.max(0, tonumber(raw) or 0); tbl2.Wake() end,
		})
		finderSec:CreateSlider({
			Name = "First Hop Delay",
			Note = "Wait after the script loads before the first hop",
			Min = 3,
			Max = 10,
			Default = 5,
			AllowDecimals = true,
			Increment = 0.5,
			Unit = "s",
			SubOf = autoHopHandle,
			Callback = function(v) finderState.FirstDelay = math.clamp(tonumber(v) or 5, 3, 10) end,
		})
		tbl2.Add(function()
			if not str1.Toggle(autoHopHandle, false) then
				setFinderStatus("Idle")
				return false
			end
			local elapsed = os.clock() - finderState.LoadedAt
			if elapsed < finderState.FirstDelay then
				setFinderStatus(string.format("Waiting %.1fs before first scan...", finderState.FirstDelay - elapsed))
				return false
			end
			local eggState = tbl1.EggState
			local ok, res = false, nil
			if type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function" then
				ok, res = pcall(eggState.ReadFieldEggs)
			end
			local recs = ok and type(res) == "table" and res.Records or nil
			local matchCount = 0
			if type(recs) == "table" then
				for _, r in pairs(recs) do
					if type(r) == "table" and r.State ~= "Claimed" then
						local rar = str1.EggRarity(r)
						local inc = str1.EggIncome(r)
						local minR = finderState.Mode == "After A Rare Spawns" and finderState.RareMin or finderState.MinRarity
						if rar >= minR and inc >= finderState.MinIncome then
							matchCount += 1
						end
					end
				end
			end
			if matchCount > 0 or (str1.Steal and str1.Steal.Carrying) then
				setFinderStatus(string.format("Found %d matching egg(s) in server!", matchCount))
				return false
			end
			if os.clock() - finderState.LastHopAt >= 6 and type(str1.ServerHop) == "function" then
				finderState.LastHopAt = os.clock()
				setFinderStatus("No match found — hopping server...")
				task.spawn(function()
					pcall(str1.ServerHop, "Least Players")
				end)
			end
			return false
		end)
	end
end)
local TeleportService
TeleportService = game:GetService("TeleportService")
local HttpService
HttpService = game:GetService("HttpService")
local GuiService
GuiService = game:GetService("GuiService")

do
	local function func648()
		if type(queue_on_teleport) == "function" then
			return queue_on_teleport
		end

		if type(queueonteleport) == "function" then
			return queueonteleport
		end

		if type(syn) == "table" and type(syn.queue_on_teleport) == "function" then
			return syn.queue_on_teleport
		end

		if type(fluxus) == "table" and type(fluxus.queue_on_teleport) == "function" then
			return fluxus.queue_on_teleport
		end
		return nil
	end

	local function func649(flag602)
		pcall(function()
			TeleportService:SetTeleportSetting("__ChilliAutoLoadScriptEnabled", flag602)
		end)

		if not flag602 then
			return true
		end
		local result94 = func648()
		if not result94 then
			return false
		end

		if rawget(_G, "__ChilliAutoLoadQueued") ~= true then
			if not pcall(result94, [[local TeleportService = game:GetService("TeleportService")
local enabled = true
pcall(function()
    enabled = TeleportService:GetTeleportSetting("__ChilliAutoLoadScriptEnabled") == true
end)
if enabled then
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    pcall(function()
        local player = game:GetService("Players").LocalPlayer
        if player and not player.Character then
            player.CharacterAdded:Wait()
        end
    end)
    task.wait(1.5)
    local ok, source = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/FyarrAja/loader/main/test_ui.lua")
    end)
    if ok and type(source) == "string" then
        local chunk = loadstring(source)
        if chunk then
            chunk()
        end
    end
end
]]) then
				return false
			end

			_G.__ChilliAutoLoadQueued = true
		end

		return true
	end

	local value532 = nil

	local function func650()
		if value532 and str1.Toggle(value532, false) then
			func649(true)
		end
	end

	value532 = obj101:CreateToggle({
		Name = "Auto Load Script",
		Default = true,
		Callback = function(value)
			local flag603 = value == true

			if not func649(flag603) and flag603 then
				task.defer(function()
					func649(false)

					if value532 and type(value532.Set) == "function" then
						pcall(value532.Set, value532, false, false)
					end

					func647("Auto Load Unavailable", "This executor does not support queue on teleport.")
				end)
			end
		end,
	})

	local str58 = "Least Players"
	local n13 = 10
	local n14 = 0
	local value533 = nil
	local tbl484 = {}
	local flag604 = false
	local n15 = 0
	local flag605 = false
	local value534 = nil
	local str59 = ""
	local n16 = 0
	local n17 = 60

	local function func651(param379)
		n14 = 0
		value533 = nil

		if param379 then
			tbl484[param379] = true
		end
	end

	pcall(function()
		TeleportService.TeleportInitFailed:Connect(function(param380, param381, flag606)
			if not value533 then
				return
			end
			func651(value533)
			flag605 = true

			if not flag604 then
				func647("Server Hop Failed", tostring(flag606 ~= "" and flag606 or param381))
			end
		end)
	end)

	local function func652(flag607)
		local str60 = tostring(game.JobId or "")
		local list72 = {}
		local flag608 = flag607 == "Random"
		local str61 = flag607 == "Least Players" and "Asc" or "Desc"
		local n18 = flag608 and 3 or 6
		local nextPageCursor = nil

		for i = 1, n18 do
			local formatted21 = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=%s&excludeFullGames=true&limit=100", game.PlaceId, str61)

			if nextPageCursor and nextPageCursor ~= "" then
				formatted21 ..= "&cursor=" .. HttpService:UrlEncode(nextPageCursor)
			end

			local ok, result = pcall(function()
				return HttpService:JSONDecode(game:HttpGet(formatted21))
			end)

			if not ok or type(result) ~= "table" then
				return list72, false
			end
			local func653 = ipairs
			local data = result.data or {}

			for _, value535 in func653(data) do
				local str62 = tostring(value535.id or "")
				local huge = tonumber(value535.playing) or math.huge
				local n19 = tonumber(value535.maxPlayers) or 0

				if str62 ~= "" and str62 ~= str60 and huge < n19 then
					list72[#list72 + 1] = { Id = str62, Playing = huge, Room = n19 - huge }
				end
			end

			if #list72 > 0 and not flag608 then
				break
			end
			nextPageCursor = result.nextPageCursor
			if not nextPageCursor or nextPageCursor == "" then
				break
			end
		end

		return list72, true
	end

	local function serverHop(flag609)
		local value536

		if value534 and str59 == flag609 and os.clock() - n16 < n17 then
			value536 = value534
		else
			local flag610
			value536, flag610 = func652(flag609)
			if not flag610 then
				return "fetch"
			end
			value534 = value536
			str59 = flag609
			n16 = os.clock()
		end

		local function func654(param382)
			local list73 = {}

			for _, item177 in ipairs(value536) do
				if not tbl484[item177.Id] and item177.Room >= param382 then
					list73[#list73 + 1] = item177
				end
			end

			return list73
		end

		local list74 = func654(2)

		if #list74 == 0 then
			list74 = func654(1)
		end

		if #list74 == 0 and next(tbl484) ~= nil then
			table.clear(tbl484)
			list74 = func654(1)
		end

		if #list74 == 0 then
			func651(nil)
			value534 = nil
			return "empty"
		end

		local id

		if flag609 == "Random" then
			id = list74[math.random(1, #list74)].Id
		else
			table.sort(list74, function(param383, param384)
				if flag609 == "Least Players" then
					return param383.Playing < param384.Playing
				end
				return param383.Playing > param384.Playing
			end)

			id = list74[1].Id
		end

		flag605 = false
		value533 = id
		n14 = os.clock() + n13
		pcall(func650)

		if not pcall(function()
			TeleportService:TeleportToPlaceInstance(game.PlaceId, id, localPlayer)
		end) then
			func651(id)
			return "failed"
		end

		local n18 = os.clock() + n13

		while os.clock() < n18 do
			if flag605 then
				return "denied"
			end
			task.wait(0.25)
		end

		return "waiting"
	end

	str1.ServerHop = serverHop

	obj101:CreateDropdown({
		Name = "Server Hop Mode",
		Options = { "Most Players", "Random", "Least Players" },
		Default = "Least Players",
		Callback = function(value)
			str58 = tostring(value or "Least Players")
		end,
	})

	obj101:CreateButton({
		Name = "Server Hop",
		ButtonText = "Hop",
		Callback = function()
			n15 += 1
			local flag611 = n15

			task.spawn(function()
				flag604 = true
				local n18 = 0

				while flag611 == n15 do
					n18 += 1
					local flag612 = serverHop(str58)

					if not (flag612 == "waiting" or flag611 ~= n15) then
						if flag612 == "empty" then
							value534 = nil
							table.clear(tbl484)
						end

						if n18 % 10 == 0 then
							func647("Server Hop", string.format("Every server was full so far, %d tries.", n18))
						end

						task.wait(flag612 == "fetch" and 1 or 0.1)
						continue
					end

					break
				end

				if flag611 == n15 then
					flag604 = false
				end
			end)
		end,
	})
end

do
	local n13 = 8
	local n14 = 0
	local str63 = ""
	local value537 = nil

	local function func655()
		return os.clock() < n14
	end

	local function func656(flag613)
		n14 = flag613 and os.clock() + n13 or 0
	end

	local function func657(flag614)
		local match = tostring(flag614 or ""):match("^%s*(.-)%s*$")
		return match:match("%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x") or match
	end

	local function func658()
		local value538 = str63
		local result = str63

		if value537 then
			local ok

			ok, result = pcall(function()
				local controller = value537._controller
				return controller and controller.GetValue and controller.GetValue()
			end)

			if not (ok and type(result) == "string" and result ~= "") then
				local exitTo = nil

				for _, item178 in ipairs({ "Get", "GetValue", "GetText" }) do
					local ok2, result2 = pcall(function()
						return value537[item178]
					end)

					if ok2 and type(result2) == "function" then
						local ok3
						ok3, result = pcall(result2, value537)
						if ok3 and type(result) == "string" and result ~= "" then
							exitTo = 1
							break
						end
					end
				end

				if exitTo ~= 1 then
					result = value538
				end
			end
		end

		local flag615 = func657(result)

		if flag615 == "" then
			local ok, result2 = pcall(function()
				local func659 = getclipboard or readclipboard or getrbxclipboard
				return type(func659) == "function" and func659() or nil
			end)

			if ok and type(result2) == "string" then
				flag615 = func657(result2)
			end
		end

		return flag615
	end

	local function func660(param385)
		if not value537 then
			return
		end

		pcall(function()
			local controller = value537._controller

			if controller and controller.SetValue then
				controller.SetValue(param385, false)
			end
		end)

		str63 = func657(param385)
	end

	local function func661(param386)
		func656(true)
		pcall(AutoLoadBeforeTeleport)

		if not pcall(function()
			if game.JobId ~= "" then
				TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, localPlayer)
			else
				TeleportService:Teleport(game.PlaceId, localPlayer)
			end
		end) then
			func656(false)
			func647(param386, "Roblox could not rejoin the server.")
		end
	end

	pcall(function()
		TeleportService.TeleportInitFailed:Connect(function(param387, param388, flag616)
			if not func655() then
				return
			end
			func656(false)
			func647("Teleport Failed", tostring(flag616 ~= "" and flag616 or param388))
		end)
	end)

	obj101 = (obj2._bhLayout and obj2._bhLayout.JobId) or obj101
	value537 = obj101:CreateInput({
		Name = "Job ID",
		Placeholder = "Paste a server Job ID...",
		Default = "",
		MaxLength = 100,
		Callback = function(value)
			str63 = func657(value)
		end,
	})

	if value537 then
		value537._configIgnored = true

		if value537.State and not value537.State._registered then
			value537.State._configIgnored = true
		end
	end

	obj101:CreateButton({
		Name = "Join Job ID",
		ButtonText = "Join",
		Callback = function()
			if func655() then
				func647("Join Job ID Failed", "A teleport is already running, try again shortly.")
				return
			end
			local result95 = func658()
			if result95 == "" then
				func647("Join Job ID Failed", "Paste a valid Job ID first.")
				return
			end
			func656(true)
			pcall(AutoLoadBeforeTeleport)

			if not pcall(function()
				TeleportService:TeleportToPlaceInstance(game.PlaceId, result95, localPlayer)
			end) then
				func656(false)
				func647("Join Job ID Failed", "Roblox could not join that server.")
			end
		end,
	})

	obj101:CreateButton({
		Name = "Copy Current Job ID",
		ButtonText = "Copy",
		Callback = function()
			local str64 = tostring(game.JobId or "")
			func660(str64)
			local value539 = setclipboard or toclipboard
			func647((type(value539) == "function" and pcall(value539, str64) or false) and "Job ID Copied" or "Job ID Shown", str64)
		end,
	})

	obj101:CreateButton({
		Name = "Rejoin Server",
		ButtonText = "Rejoin",
		Callback = function()
			if func655() then
				func647("Rejoin Failed", "A teleport is already running, try again shortly.")
				return
			end
			func661("Rejoin Failed")
		end,
	})

	local tbl485 = { Option = nil, Fired = false, TeleportingAt = 0 }

	local function func662()
		local robloxPromptGui = CoreGui:FindFirstChild("RobloxPromptGui")
		robloxPromptGui = robloxPromptGui and robloxPromptGui:FindFirstChild("promptOverlay")
		return robloxPromptGui ~= nil and robloxPromptGui:FindFirstChild("ErrorPrompt") ~= nil
	end

	pcall(function()
		local connection = localPlayer.OnTeleport:Connect(function(flag617)
			if flag617 == Enum.TeleportState.Failed then
				tbl485.TeleportingAt = 0
			else
				tbl485.TeleportingAt = os.clock()
			end
		end)

		func4(function()
			pcall(function()
				connection:Disconnect()
			end)
		end)
	end)

	tbl485.Option = obj101:CreateToggle({ Name = "Auto Rejoin When Disconnect", Default = true })

	local function func663(flag618)
		if tbl485.Fired or tbl485.Option == nil or not str1.Toggle(tbl485.Option, false) or func655() then
			return
		end
		local flag619 = tbl485.TeleportingAt > 0

		if flag619 then
			local teleportingAt = tbl485.TeleportingAt
			flag619 = os.clock() - teleportingAt < 60
		end

		if flag619 then
			return
		end
		local lowered7 = string.lower(tostring(flag618 or ""))
		if lowered7 == "" or string.find(lowered7, "teleport", 1, true) then
			return
		end
		local errorCode = nil

		pcall(function()
			errorCode = GuiService:GetErrorCode()
		end)

		if errorCode == Enum.ConnectionError.DisconnectDuplicatePlayer or string.find(lowered7, "banned", 1, true) or string.find(lowered7, "same account", 1, true) then
			return
		end
		tbl485.Fired = true
		local placeId = game.PlaceId
		local str65 = tostring(game.JobId or "")
		local foundAt4 = string.find(lowered7, "shut", 1, true) ~= nil or string.find(lowered7, "no longer", 1, true) ~= nil or string.find(lowered7, "closed", 1, true) ~= nil
		pcall(AutoLoadBeforeTeleport)
		func647("Auto Rejoin", foundAt4 and "Server closed, joining another one." or "Disconnected, rejoining now.")

		task.spawn(function()
			local n15 = 0

			while true do
				n15 += 1
				local flag620 = not foundAt4 and str65 ~= "" and n15 <= 2

				pcall(function()
					if flag620 then
						TeleportService:TeleportToPlaceInstance(placeId, str65, localPlayer)
					else
						TeleportService:Teleport(placeId, localPlayer)
					end
				end)

				task.wait(flag620 and 4 or 5)
			end
		end)
	end

	pcall(function()
		local connection = GuiService.ErrorMessageChanged:Connect(function(param389)
			task.wait(0.3)

			if func662() then
				func663(param389)
			end
		end)

		func4(function()
			pcall(function()
				connection:Disconnect()
			end)
		end)
	end)

	task.spawn(function()
		local robloxPromptGui = CoreGui:WaitForChild("RobloxPromptGui", 30)
		robloxPromptGui = robloxPromptGui and robloxPromptGui:WaitForChild("promptOverlay", 30)
		if not robloxPromptGui then
			return
		end

		local connection = robloxPromptGui.ChildAdded:Connect(function(child)
			if child.Name ~= "ErrorPrompt" then
				return
			end
			task.wait(0.2)
			local str66 = ""

			for _, descendant in ipairs(child:GetDescendants()) do
				if descendant:IsA("TextLabel") and descendant.Name == "ErrorMessage" then
					str66 = descendant.Text
				end
			end

			if str66 == "" then
				pcall(function()
					str66 = GuiService:GetErrorMessage()
				end)
			end

			func663(str66 ~= "" and str66 or "disconnected")
		end)

		func4(function()
			pcall(function()
				connection:Disconnect()
			end)
		end)
	end)
end

do
	local AssetService = game:GetService("AssetService")
	local request_ = syn and syn.request or http and http.request or http_request or request

	local tbl486 = {
		Url = "",
		Stolen = false,
		PingEveryone = false,
		Queue = {},
		Sending = false,
		Notified = {},
		Icons = {},
		Pngs = {},
		Crc = {},
		Known = nil,
		Carry = nil,
		Avatar = nil,
		Disposed = false,
		Path = "ChilliLibrary/SAE_Webhook.txt",
		Saved = "",
		LoadedAt = os.clock(),
		Input = nil,
		Dot = "  " .. utf8.char(183) .. "  ",
		MaxSide = 200,
		Logo = "https://media.discordapp.net/attachments/1181785068637790221/1551685385665380432/chilli.png?ex=6ab2df20&is=6ab18da0&hm=5ca4b16854493c689912c068c29354752a0f2ea0490d5b22cbd9acf7d26ed7eb&=&format=webp&quality=lossless",
		Emoji = {
			Value = "<:sae_value:1551645680718581871>",
			Size = "<:sae_size:1551645444285800558>",
			Mutation = "<:sae_mutation:1551677914146275478>",
			Area = "<:sae_area:1551675973328441416>",
		},
	}

	pcall(function()
		if type(readfile) ~= "function" then
			return
		end

		if type(isfile) == "function" and not isfile(tbl486.Path) then
			return
		end
		local cleaned4 = string.gsub(tostring(readfile(tbl486.Path) or ""), "%s", "")
		tbl486.Saved = cleaned4
		tbl486.Url = cleaned4
	end)

	for i = 0, 255 do
		local value540 = i

		for i2 = 1, 8 do
			if bit32.band(value540, 1) == 1 then
				value540 = bit32.bxor(3988292384, bit32.rshift(value540, 1))
			else
				value540 = bit32.rshift(value540, 1)
			end
		end

		tbl486.Crc[i] = value540
	end

	local function func664(param390)
		if type(param390) ~= "string" then
			return false
		end

		for _, item179 in ipairs({ "discord%.com", "discordapp%.com", "ptb%.discord%.com", "canary%.discord%.com" }) do
			if string.match(param390, "^https://" .. item179 .. "/api/webhooks/%d+/[%w%-_]+$") then
				return true
			end
		end

		return false
	end

	local function func665(param391)
		if type(request_) ~= "function" then
			return nil
		end
		local ok, result = pcall(request_, { Url = param391, Method = "GET" })
		if not ok or type(result) ~= "table" or tonumber(result.StatusCode) ~= 200 then
			return nil
		end
		local ok2, result2 = pcall(HttpService.JSONDecode, HttpService, tostring(result.Body))
		return ok2 and result2 or nil
	end

	local function func666(param392, flag621)
		local flag622 = type(param392) == "table" and type(param392.data) == "table" and param392.data[1] or nil
		if type(flag622) ~= "table" or flag622.state ~= "Completed" or type(flag622.imageUrl) ~= "string" or flag622.imageUrl == "" then
			return nil
		end

		if flag621 and not string.find(flag622.imageUrl, "/Image/", 1, true) then
			return nil
		end
		return flag622.imageUrl
	end

	local function func667(str67)
		if tbl486.Icons[str67] == nil then
			tbl486.Icons[str67] = func666(func665("https://thumbnails.roblox.com/v1/assets?assetIds=" .. str67 .. "&returnPolicy=PlaceHolder&size=420x420&format=Png&isCircular=false"), true) or false
		end

		return tbl486.Icons[str67] or nil
	end

	local function func668()
		if tbl486.Avatar == nil then
			tbl486.Avatar = func666(func665("https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=" .. localPlayer.UserId .. "&size=150x150&format=Png&isCircular=false")) or false
		end

		return tbl486.Avatar or nil
	end

	local function func669(param393, param394, param395)
		local crc = tbl486.Crc
		local n13 = 4294967295

		for i = param394, param395 do
			local rshift = bit32.rshift
			n13 = bit32.bxor(crc[bit32.band(bit32.bxor(n13, buffer.readu8(param393, i)), 255)], rshift(n13, 8))
		end

		return bit32.bxor(n13, 4294967295)
	end

	local function func670(param396, num145, num146)
		local n13 = num145 * 4 + 1
		local n14 = n13 * num146
		local n15 = 2 + math.ceil(n14 / 65535) * 5 + n14 + 4
		local arr4 = buffer.create(45 + n15 + 12)
		local n16 = 0

		local function func671(param397)
			buffer.writeu8(arr4, n16, param397)
			n16 += 1
		end

		local function func672(param398)
			func671(bit32.band(bit32.rshift(param398, 24), 255))
			func671(bit32.band(bit32.rshift(param398, 16), 255))
			func671(bit32.band(bit32.rshift(param398, 8), 255))
			func671(bit32.band(param398, 255))
		end

		local function func673(param399, param400, param401, param402)
			func671(param399)
			func671(param400)
			func671(param401)
			func671(param402)
		end

		for _, item180 in ipairs({ 137, 80, 78, 71, 13, 10, 26, 10 }) do
			func671(item180)
		end

		func672(13)
		func673(73, 72, 68, 82)
		func672(num145)
		func672(num146)
		func671(8)
		func671(6)
		func671(0)
		func671(0)
		func671(0)
		func672(func669(arr4, n16, n16 - 1))
		local arr5 = buffer.create(n14)

		for i = 0, num146 - 1 do
			buffer.writeu8(arr5, i * n13, 0)
			buffer.copy(arr5, i * n13 + 1, param396, i * num145 * 4, num145 * 4)
		end

		func672(n15)
		local value541 = n16
		func673(73, 68, 65, 84)
		func671(120)
		func671(1)
		local n17 = 0

		while n17 < n14 do
			local n18 = math.min(65535, n14 - n17)
			func671(n17 + n18 >= n14 and 1 or 0)
			func671(bit32.band(n18, 255))
			func671(bit32.rshift(n18, 8))
			local b2 = bit32.band(bit32.bnot(n18), 65535)
			func671(bit32.band(b2, 255))
			func671(bit32.rshift(b2, 8))
			buffer.copy(arr4, n16, arr5, n17, n18)
			n16 += n18
			n17 += n18
		end

		local n18 = 1
		local n19 = 0

		for i = 0, n14 - 1 do
			n18 = (n18 + buffer.readu8(arr5, i)) % 65521
			n19 = (n19 + n18) % 65521
		end

		func672(n19 * 65536 + n18)
		func672(func669(arr4, value541, n16 - 1))
		func672(0)
		func673(73, 69, 78, 68)
		func672(func669(arr4, n16, n16 - 1))
		return buffer.tostring(arr4)
	end

	local function func674(str68)
		if tbl486.Pngs[str68] ~= nil then
			return tbl486.Pngs[str68] or nil
		end

		local ok, result = pcall(function()
			local obj102 = AssetService:CreateEditableImageAsync(Content.fromUri("rbxassetid://" .. str68))
			local size = obj102.Size
			local n13 = math.floor(size.X)
			local n14 = math.floor(size.Y)
			local value542 = obj102:ReadPixelsBuffer(Vector2.zero, size)

			pcall(function()
				obj102:Destroy()
			end)

			local n15 = math.min(1, tbl486.MaxSide / math.max(n13, n14))
			local n16 = math.max(1, math.floor(n13 * n15))
			local n17 = math.max(1, math.floor(n14 * n15))
			local arr6 = buffer.create(n16 * n17 * 4)

			for i = 0, n17 - 1 do
				local n18 = math.min(n14 - 1, math.floor(i / n15))

				for i2 = 0, n16 - 1 do
					buffer.copy(arr6, (i * n16 + i2) * 4, value542, (n18 * n13 + math.min(n13 - 1, math.floor(i2 / n15))) * 4, 4)
				end
			end

			return func670(arr6, n16, n17)
		end)

		tbl486.Pngs[str68] = ok and type(result) == "string" and result or false
		return tbl486.Pngs[str68] or nil
	end

	local function func675(param403, param404)
		if param404 then
			return 13686498
		end

		if typeof(param403) ~= "Color3" then
			return 5793266
		end
		return math.floor(param403.R * 255 + 0.5) * 65536 + math.floor(param403.G * 255 + 0.5) * 256 + math.floor(param403.B * 255 + 0.5)
	end

	local function func676(list75)
		local list76 = {}

		if type(list75) == "table" then
			for _, item181 in ipairs(list75) do
				list76[#list76 + 1] = func7(item181)
			end
		end

		return #list76 > 0 and table.concat(list76, ", ") or "None"
	end

	local function func677(flag623)
		local areas = tbl1.Areas
		local directory = type(areas) == "table" and (areas.Directory or areas) or nil
		local str69 = tostring(flag623 or "")
		local flag624 = type(directory) == "table" and str69 ~= "" and directory[str69] or nil
		if type(flag624) == "table" then
			return tostring(flag624.DisplayName or str69)
		end
		return str69 ~= "" and str69 or "Field"
	end

	local function func678(param405, param406, param407, flag625, param408, param409)
		local str70 = tostring(param406)
		local value543 = str39.AssetInfo(str70)
		local n13 = tonumber(param407) or 1
		flag625 = type(flag625) == "table" and flag625 or {}
		local value544 = str39.Income(value543, n13, flag625)
		local dot = tbl486.Dot
		local formatted22 = string.format("x%.2f", n13)
		local eggRecords = tbl1.EggRecords

		if type(eggRecords) == "table" and type(eggRecords.WeightKgForScale) == "function" then
			local ok, result = pcall(eggRecords.WeightKgForScale, str70, n13)

			if ok and tonumber(result) then
				formatted22 ..= dot .. str39.FormatWeight(result)
			end
		end

		local emoji = tbl486.Emoji
		local str71 = "**" .. tostring(value543.Name) .. "**" .. dot .. tostring(value543.Rarity)
		local str72 = emoji.Value .. " **Value:** $" .. str39.FormatRate(value544)
		local str73 = emoji.Size .. " **Size:** " .. formatted22
		local str74 = emoji.Mutation .. " **Mutation:** " .. func676(flag625)
		local str75 = emoji.Area .. " **Area:** " .. func677(param408)
		local tbl487 = { str71, str72, str73, str74, str75 }

		local tbl488 = {
			author = { name = localPlayer.DisplayName, icon_url = func668() },
			title = param405,
			description = table.concat(tbl487, "\n"),
			color = func675(value543.Color, string.upper(tostring(value543.Rarity)) == "SECRET"),
			footer = { text = "BlueHaven Hub" .. dot .. "Steal An Egg", icon_url = tbl486.Logo },
			timestamp = DateTime.now():ToIsoDate(),
		}

		local tbl489 = { username = "BlueHaven Hub", avatar_url = tbl486.Logo, embeds = { tbl488 } }
		local icon = value543.Icon
		local icon2

		if param409 then
			local directory = tbl1.Assets and tbl1.Assets.Directory
			local flag626 = type(directory) == "table" and directory[str70] or nil
			local egg = type(flag626) == "table" and type(flag626.Egg) == "table" and flag626.Egg or nil

			if egg and egg.Icon ~= nil then
				icon2 = egg.Icon
			else
				icon2 = icon
			end
		else
			icon2 = icon
		end

		local num147 = tonumber(string.match(tostring(icon2 or ""), "(%d+)"))
		local flag627 = num147 and func674(num147) or nil
		local flag628 = num147 and not flag627 and func667(num147) or nil

		if flag627 then
			tbl488.thumbnail = { url = "attachment://egg.png" }
			tbl489.attachments = { { id = 0, filename = "egg.png" } }
		elseif flag628 then
			tbl488.thumbnail = { url = flag628 }
		end

		return tbl489, flag627
	end

	local function func679()
		if tbl486.Sending then
			return
		end
		tbl486.Sending = true

		task.spawn(function()
			while #tbl486.Queue > 0 and not tbl486.Disposed do
				local value545 = table.remove(tbl486.Queue, 1)

				if func664(tbl486.Url) and type(request_) == "function" then
					local tbl490 = { Url = tbl486.Url, Method = "POST" }

					if value545.Png then
						local str76 = "ChilliHub" .. string.gsub(HttpService:GenerateGUID(false), "-", "")
						tbl490.Headers = { ["Content-Type"] = "multipart/form-data; boundary=" .. str76 }
						local concat = table.concat
						local png = value545.Png
						local json = HttpService:JSONEncode(value545.Payload)
						local tbl491 = {
							"--",
							str76,
							"\r\n",
							"Content-Disposition: form-data; name=\"payload_json\"\r\n",
							"Content-Type: application/json\r\n\r\n",
							json,
							"\r\n",
							"--",
							str76,
							"\r\n",
							"Content-Disposition: form-data; name=\"files[0]\"; filename=\"egg.png\"\r\n",
							"Content-Type: image/png\r\n\r\n",
							png,
							"\r\n",
							"--",
							str76,
							"--\r\n",
						}
						tbl490.Body = concat(tbl491)
					else
						tbl490.Headers = { ["Content-Type"] = "application/json" }
						tbl490.Body = HttpService:JSONEncode(value545.Payload)
					end

					local ok, result = pcall(request_, tbl490)
					ok = ok and type(result) == "table" and tonumber(result.StatusCode) or nil

					if ok == 429 and value545.Tries < 3 then
						value545.Tries = value545.Tries + 1
						table.insert(tbl486.Queue, 1, value545)
						task.wait(3)
					elseif ok ~= 200 and ok ~= 204 and value545.Png then
						value545.Png = nil
						value545.Payload.attachments = nil
						local flag629 = type(value545.Payload.embeds) == "table" and value545.Payload.embeds[1] or nil

						if flag629 then
							flag629.thumbnail = nil
						end

						table.insert(tbl486.Queue, 1, value545)
					end
				end

				task.wait(1.2)
			end

			tbl486.Sending = false
		end)
	end

	local function func680()
		return type(request_) == "function" and func664(tbl486.Url)
	end

	local function func681(param410, param411)
		if #tbl486.Queue >= 20 then
			table.remove(tbl486.Queue, 1)
		end

		if tbl486.PingEveryone and type(param410) == "table" then
			param410.content = "@everyone"
			param410.allowed_mentions = { parse = { "everyone" } }
		end

		table.insert(tbl486.Queue, { Payload = param410, Png = param411, Tries = 0 })
		func679()
	end

	local eggState = tbl1.EggState
	local carryChanged = type(eggState) == "table" and eggState.CarryChanged or nil

	if type(carryChanged) == "table" and type(carryChanged.Connect) == "function" then
		local ok, result = pcall(carryChanged.Connect, carryChanged, function(param412)
			if type(param412) ~= "table" then
				return
			end

			if param412.IsCarrying then
				tbl486.Carry = {
					Category = tostring(param412.AssetCategory),
					Uid = tostring(param412.Uid),
					Area = tostring(param412.AreaId or "Field"),
					EndedAt = nil,
				}
			elseif tbl486.Carry then
				tbl486.Carry.EndedAt = os.clock()
			end
		end)

		if ok and result then
			func4(function()
				pcall(function()
					result:Disconnect()
				end)
			end)
		end
	end

	func4(function()
		tbl486.Disposed = true
	end)

	task.spawn(function()
		while not tbl486.Disposed do
			local flag630 = type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function"
			local flag631 = false
			local result = nil

			if flag630 then
				flag631, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
			end

			if flag631 and type(result) == "table" then
				local known = tbl486.Known
				local list77 = {}
				local known2 = {}

				for k, value546 in pairs(result) do
					local str77 = tostring(k)
					known2[str77] = true

					if known and not known[str77] and type(value546) == "table" then
						list77[#list77 + 1] = { Uid = str77, Record = value546 }
					end
				end

				tbl486.Known = known2
				local carry = tbl486.Carry

				if tbl486.Stolen and carry and #list77 > 0 then
					for _, item182 in ipairs(list77) do
						local record = item182.Record
						local endedAt2 = carry.EndedAt == nil

						if not endedAt2 then
							local endedAt = carry.EndedAt
							endedAt2 = os.clock() - endedAt < 20
						end

						if endedAt2 then
							endedAt2 = item182.Uid == carry.Uid

							if not endedAt2 then
								local category = carry.Category
								endedAt2 = tostring(record.AssetCategory) == category
							end
						end

						if endedAt2 then
							tbl486.Carry = nil
							local mutations = type(record.Mutations) == "table" and record.Mutations or {}

							task.spawn(function()
								if func680() then
									func681(func678("Egg Stolen!", record.AssetCategory, record.AssetScale, mutations, carry.Area))
								end
							end)

							break
						end
					end
				end
			end

			task.wait(1.5)
		end
	end)

	local function func682(param413)
		local input = tbl486.Input
		if type(input) ~= "table" then
			return
		end

		for _, item183 in ipairs({ "Set", "SetValue" }) do
			local ok, result = pcall(function()
				return input[item183]
			end)

			if ok and type(result) == "function" and pcall(result, input, param413, false) then
				return
			end
		end
	end

	tbl486.Input = obj75:CreateInput({
		Name = "Webhook URL",
		Placeholder = "https://discord.com/api/webhooks/...",
		Default = tbl486.Saved,
		MaxLength = 256,
		Callback = function(value)
			local cleaned5 = string.gsub(tostring(value or ""), "%s", "")
			local flag632 = cleaned5 == "" and tbl486.Saved ~= ""

			if flag632 then
				local loadedAt = tbl486.LoadedAt
				flag632 = os.clock() - loadedAt < 5
			end

			if flag632 then
				tbl486.Url = tbl486.Saved
				task.defer(func682, tbl486.Saved)
				return
			end

			tbl486.Url = cleaned5

			if (cleaned5 == "" or func664(cleaned5)) and cleaned5 ~= tbl486.Saved and type(writefile) == "function" then
				if pcall(writefile, tbl486.Path, cleaned5) then
					tbl486.Saved = cleaned5
				end
			end
		end,
	})

	obj75:CreateToggle({
		Name = "Ping @everyone",
		Default = false,
		Callback = function(value)
			tbl486.PingEveryone = value == true
		end,
	})

	obj75:CreateToggle({
		Name = "Notify Stolen Eggs",
		Note = "Post every egg you bring home",
		Default = false,
		Callback = function(value)
			tbl486.Stolen = value == true
		end,
	})
end

local obj103 = obj2._bhLayout.MiscTab
local obj104 = obj2._bhLayout.Performance
local flag633 = false

obj104:CreateSlider({
	Name = "FPS Cap",
	Min = 30,
	Max = 1000,
	Default = 240,
	AllowDecimals = false,
	Increment = 1,
	Unit = " FPS",
	Callback = function(value)
		local n13 = math.clamp(math.floor(tonumber(value) or 240), 30, 1000)
		if type(setfpscap) == "function" and pcall(setfpscap, n13) then
			flag633 = false
			return
		end

		if not flag633 then
			flag633 = true
			func647("FPS Cap Unavailable", "This environment does not support setfpscap.")
		end
	end,
})

do
	local Lighting = game:GetService("Lighting")
	local n13 = 0.003
	local flag634 = false
	local n14 = 0
	local thread = nil
	local list78 = {}
	local list79 = {}
	local obj = setmetatable({}, { __mode = "k" })
	local list80 = {}
	local connection = nil

	local function func683(param414, param415, param416)
		local ok, result = pcall(param414)
		if not ok then
			return
		end
		list79[#list79 + 1] = { Setter = param415, Value = result }
		pcall(param415, param416)
	end

	local function func684(tbl492, param417, param418)
		local entry53 = obj[tbl492]

		if not entry53 then
			local tbl493 = {}
			obj[tbl492] = tbl493
			entry53 = tbl493
		end

		if entry53[param417] == nil then
			local ok, result = pcall(function()
				return tbl492[param417]
			end)

			if not ok then
				return
			end
			entry53[param417] = { Value = result }
		end

		pcall(function()
			tbl492[param417] = param418
		end)
	end

	local function func685(instance29)
		if not flag634 or not instance29.Parent then
			return
		end

		if instance29:IsA("ParticleEmitter") then
			func684(instance29, "Enabled", false)
			func684(instance29, "Rate", 0)
		elseif instance29:IsA("Trail") or instance29:IsA("Beam") then
			func684(instance29, "Enabled", false)
		elseif instance29:IsA("PointLight") or instance29:IsA("SpotLight") or instance29:IsA("SurfaceLight") then
			func684(instance29, "Enabled", false)
			func684(instance29, "Brightness", 0)
		elseif instance29:IsA("Fire") or instance29:IsA("Smoke") or instance29:IsA("Sparkles") then
			func684(instance29, "Enabled", false)
		elseif instance29:IsA("Explosion") then
			func684(instance29, "Visible", false)
		elseif instance29:IsA("SpecialMesh") then
			func684(instance29, "TextureId", "")
		elseif instance29:IsA("Decal") or instance29:IsA("Texture") then
			if not (instance29.Name == "face" and instance29.Parent and instance29.Parent.Name == "Head") then
				func684(instance29, "Transparency", 1)
			end
		elseif instance29:IsA("MeshPart") then
			func684(instance29, "RenderFidelity", Enum.RenderFidelity.Performance)
			func684(instance29, "TextureID", "")
			func684(instance29, "CastShadow", false)
			func684(instance29, "Reflectance", 0)
			func684(instance29, "Material", Enum.Material.SmoothPlastic)
		elseif instance29:IsA("BasePart") then
			func684(instance29, "CastShadow", false)
			func684(instance29, "Reflectance", 0)
			func684(instance29, "Material", Enum.Material.SmoothPlastic)
		elseif instance29:IsA("PostEffect") then
			func684(instance29, "Enabled", false)
		elseif instance29:IsA("Clouds") then
			func684(instance29, "Cover", 0)
			func684(instance29, "Density", 0)
		elseif instance29:IsA("Atmosphere") then
			func684(instance29, "Density", 0)
			func684(instance29, "Haze", 0)
			func684(instance29, "Glare", 0)
		end
	end

	local function func686()
		for _, item184 in ipairs(list78) do
			if item184.Connected then
				item184:Disconnect()
			end
		end

		table.clear(list78)

		if connection then
			pcall(function()
				connection:Disconnect()
			end)

			connection = nil
		end
	end

	local function func687()
		local rendering = settings().Rendering
		local terrain = workspace.Terrain

		local function func688(tbl494, param419, param420)
			local function func689()
				return tbl494[param419]
			end

			local function func690(param421)
				tbl494[param419] = param421
			end

			local value547 = param420
			func683(func689, func690, value547)
		end

		func688(rendering, "QualityLevel", Enum.QualityLevel.Level01)
		func688(rendering, "MeshPartDetailLevel", Enum.MeshPartDetailLevel.Level01)
		func688(rendering, "EditQualityLevel", Enum.QualityLevel.Level01)

		local ok, result = pcall(function()
			return UserSettings():GetService("UserGameSettings")
		end)

		if ok and result then
			func688(result, "SavedQualityLevel", Enum.SavedQualitySetting.QualityLevel1)
		end

		func688(Lighting, "GlobalShadows", false)
		func688(Lighting, "ShadowSoftness", 0)
		func688(Lighting, "FogEnd", 9e9)
		func688(Lighting, "Technology", Enum.Technology.Legacy)
		func688(Lighting, "EnvironmentDiffuseScale", 0)
		func688(Lighting, "EnvironmentSpecularScale", 0)
		func688(terrain, "Decoration", false)
		func688(terrain, "WaterWaveSize", 0)
		func688(terrain, "WaterWaveSpeed", 0)
		func688(terrain, "WaterReflectance", 0)
		func688(terrain, "WaterTransparency", 1)
	end

	local function func691(list81, param422)
		local now = os.clock()

		for _, descendant in ipairs(list81:GetDescendants()) do
			if not flag634 or n14 ~= param422 then
				return false
			end
			func685(descendant)

			if n13 < os.clock() - now then
				RunService.Heartbeat:Wait()
				now = os.clock()
			end
		end

		return true
	end

	local function func692()
		if not flag634 or #list80 == 0 then
			return
		end
		local now = os.clock()

		while #list80 > 0 do
			local value548 = table.remove(list80)
			func685(value548)
			if not (n13 < os.clock() - now) then
				continue
			end
			break
		end
	end

	local function func693()
		local now = os.clock()

		for k, value549 in pairs(obj) do
			if k.Parent then
				for k2, value550 in pairs(value549) do
					pcall(function()
						k[k2] = value550.Value
					end)
				end
			end

			obj[k] = nil

			if n13 < os.clock() - now then
				RunService.Heartbeat:Wait()
				now = os.clock()
			end
		end
	end

	local function func694()
		if not flag634 then
			return
		end
		flag634 = false
		n14 += 1
		func686()
		table.clear(list80)

		if thread then
			pcall(task.cancel, thread)
			thread = nil
		end

		func693()

		for i = #list79, 1, -1 do
			local entry54 = list79[i]
			pcall(entry54.Setter, entry54.Value)
		end

		table.clear(list79)
	end

	local function func695()
		if flag634 then
			return
		end
		flag634 = true
		n14 += 1
		local value551 = n14
		func687()

		local function func696(param423)
			list78[#list78 + 1] = param423.DescendantAdded:Connect(function(descendant)
				if flag634 and n14 == value551 then
					list80[#list80 + 1] = descendant
				end
			end)
		end

		func696(workspace)
		func696(Lighting)

		connection = RunService.Heartbeat:Connect(function()
			if flag634 and n14 == value551 then
				func692()
			end
		end)

		thread = task.spawn(function()
			if func691(workspace, value551) then
				func691(Lighting, value551)
			end
		end)
	end

	func4(func694)

	obj104:CreateToggle({
		Name = "Optimizer",
		Note = "Strip shadows, textures and effects for the highest FPS",
		Default = false,
		Callback = function(value)
			if value then
				func695()
			else
				task.spawn(func694)
			end
		end,
	})
end

do
	local Stats = game:GetService("Stats")
	local n13 = 132
	local n14 = 0.085
	local n15 = 0.2
	local n16 = 8
	local obj105 = obj2:CreateState({ Name = "FPS and Ping Position", Default = {} })

	local function func697()
		local value552 = obj105:Get()
		if type(value552) == "table" and type(value552.XOffset) == "number" and type(value552.YOffset) == "number" then
			return UDim2.new(tonumber(value552.XScale) or 0, value552.XOffset, tonumber(value552.YScale) or 0, value552.YOffset)
		end
		return UDim2.new(0, 16, 0, 16)
	end

	local function func698(param424)
		obj105:Set({ XScale = param424.X.Scale, XOffset = param424.X.Offset, YScale = param424.Y.Scale, YOffset = param424.Y.Offset })
	end

	local color3 = Color3.fromRGB(58, 255, 55)
	local color4 = Color3.fromRGB(255, 214, 84)
	local color5 = Color3.fromRGB(255, 96, 96)
	local color6 = Color3.fromRGB(150, 150, 158)
	local flag635 = false
	local list82 = {}
	local screenGui = nil
	local frame = nil
	local uiScale = nil
	local value553 = nil
	local value554 = nil
	local n17 = 1
	local n18 = 0
	local n19 = 0
	local value555 = nil
	local value556 = nil
	local font = nil

	pcall(function()
		font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
	end)

	local function func699(param425)
		if param425 >= 100 then
			return color3
		end

		if param425 >= 50 then
			return color4
		end
		return color5
	end

	local function func700(param426)
		if param426 <= 90 then
			return color3
		end

		if param426 <= 180 then
			return color4
		end
		return color5
	end

	local function func701()
		if not uiScale then
			return
		end
		local currentCamera = workspace.CurrentCamera
		local viewportSize = currentCamera and currentCamera.ViewportSize or Vector2.new(1280, 720)

		if viewportSize.X < 1 then
			viewportSize = Vector2.new(1280, 720)
		end

		uiScale.Scale = math.clamp(viewportSize.X * n14 / n13, 0.7, 1.4) * n17
	end

	local function func702()
		for _, item185 in ipairs(list82) do
			pcall(function()
				item185:Disconnect()
			end)
		end

		table.clear(list82)

		if screenGui then
			pcall(function()
				screenGui:Destroy()
			end)
		end

		screenGui = nil
		frame = nil
		uiScale = nil
		value553 = nil
		value554 = nil
		value555 = nil
		value556 = nil
		n18 = 0
	end

	local function createTextLabel(parent, param427, param428, textColor3)
		local textLabel = Instance.new("TextLabel")
		textLabel.Name = func3()
		textLabel.BackgroundTransparency = 1
		textLabel.Position = UDim2.fromOffset(param427, 9)
		textLabel.Size = UDim2.fromOffset(param428, 16)
		textLabel.Text = ""
		textLabel.TextColor3 = textColor3
		textLabel.TextScaled = true
		textLabel.TextXAlignment = Enum.TextXAlignment.Left

		if font then
			textLabel.FontFace = font
		else
			textLabel.Font = Enum.Font.GothamBold
		end

		textLabel.Parent = parent
		return textLabel
	end

	local function func703()
		func702()
		screenGui = Instance.new("ScreenGui")
		screenGui.Name = func3()
		screenGui.Archivable = false
		screenGui.DisplayOrder = 58
		screenGui.IgnoreGuiInset = true
		screenGui.ResetOnSpawn = false
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		frame = Instance.new("Frame")
		frame.Name = func3()
		frame.Active = true
		frame.BackgroundColor3 = Color3.fromRGB(6, 28, 68)
		frame.BackgroundTransparency = 0.18
		frame.BorderSizePixel = 0
		frame.Position = func697()
		frame.Size = UDim2.fromOffset(132, 34)
		frame.Parent = screenGui
		local uiStroke = Instance.new("UIStroke")
		uiStroke.Name = func3()
		uiStroke.Color = Color3.fromRGB(60, 215, 255)
		uiStroke.Thickness = 1.2
		uiStroke.Transparency = 0.25
		uiStroke.Parent = frame
		uiScale = Instance.new("UIScale")
		uiScale.Name = func3()
		uiScale.Parent = frame
		func701()
		value553 = createTextLabel(frame, 12, 34, color3)
		createTextLabel(frame, 48, 22, color6).Text = "FPS"
		local frame2 = Instance.new("Frame")
		frame2.Name = func3()
		frame2.AnchorPoint = Vector2.new(0.5, 0.5)
		frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		frame2.BackgroundTransparency = 0.85
		frame2.BorderSizePixel = 0
		frame2.Position = UDim2.new(0, 74, 0.5, 0)
		frame2.Size = UDim2.fromOffset(1, 14)
		frame2.Parent = frame
		value554 = createTextLabel(frame, 82, 30, color3)
		createTextLabel(frame, 113, 14, color6).Text = "ms"
		screenGui.Parent = value1
		local currentCamera = workspace.CurrentCamera

		if currentCamera then
			list82[#list82 + 1] = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(func701)
		end

		local flag636 = false
		local value557 = nil
		local vector2 = Vector2.zero
		local position = nil

		list82[#list82 + 1] = frame.InputBegan:Connect(function(input)
			if flag636 or input.UserInputState ~= Enum.UserInputState.Begin then
				return
			end
			local userInputType2 = input.UserInputType == Enum.UserInputType.Touch
			if not (input.UserInputType == Enum.UserInputType.MouseButton1) and not userInputType2 then
				return
			end
			flag636 = true
			value557 = userInputType2 and input or nil
			vector2 = Vector2.new(input.Position.X, input.Position.Y)
			position = frame.Position
		end)

		list82[#list82 + 1] = UserInputService.InputChanged:Connect(function(input)
			if not flag636 or not frame or not position then
				return
			end

			if not (value557 and input == value557 or not value557 and input.UserInputType == Enum.UserInputType.MouseMovement) then
				return
			end
			local n20 = Vector2.new(input.Position.X, input.Position.Y) - vector2
			frame.Position = UDim2.new(position.X.Scale, position.X.Offset + n20.X, position.Y.Scale, position.Y.Offset + n20.Y)
		end)

		list82[#list82 + 1] = UserInputService.InputEnded:Connect(function(input)
			if not flag636 then
				return
			end

			if value557 and input == value557 or not value557 and input.UserInputType == Enum.UserInputType.MouseButton1 then
				flag636 = false
				value557 = nil
				position = nil

				if frame then
					func698(frame.Position)
				end
			end
		end)

		list82[#list82 + 1] = RunService.RenderStepped:Connect(function(deltaTime)
			if not flag635 or not value553 then
				return
			end
			local n20 = math.clamp(deltaTime, 0.001, 1)
			local n21 = 1 / n20

			if n18 <= 0 then
				n18 = n21
			else
				n18 += (n21 - n18) * (1 - math.exp(-n20 * n16))
			end

			local now = os.clock()
			if now < n19 then
				return
			end
			n19 = now + n15
			local n22 = math.floor(n18 + 0.5)
			local text = tostring(n22)

			if text ~= value555 then
				value555 = text
				value553.Text = text
				value553.TextColor3 = func699(n22)
			end

			local n23 = 0

			pcall(function()
				n23 = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
			end)

			local n24 = math.floor(n23 + 0.5)
			local text2 = tostring(n24)

			if text2 ~= value556 then
				value556 = text2
				value554.Text = text2
				value554.TextColor3 = func700(n24)
			end
		end)
	end

	obj104:CreateSlider({
		Name = "FPS and Ping Size",
		Min = 60,
		Max = 160,
		Default = 100,
		AllowDecimals = false,
		Increment = 1,
		Unit = "%",
		SubOf = obj104:CreateToggle({
			Name = "FPS and Ping",
			Default = true,
			Callback = function(value)
				flag635 = value == true

				if flag635 then
					func703()
				else
					func702()
				end
			end,
		}),
		Callback = function(value)
			n17 = math.clamp((tonumber(value) or 100) / 100, 0.6, 1.6)
			func701()
		end,
	})

	func4(func702)
end

do
	local obj106 = obj2._bhLayout.Utility

	pcall(function()
		local renderDisabled = false
		local blackBg = false
		local backdropGui = nil

		local function updateBackdrop(show)
			if backdropGui then
				pcall(function() backdropGui:Destroy() end)
				backdropGui = nil
			end
			str1.RenderBackdrop = nil
			if not show or not blackBg then return end
			local pgui = localPlayer:FindFirstChildOfClass("PlayerGui")
			if not pgui then return end
			local sg = Instance.new("ScreenGui")
			sg.Name = func3()
			sg.DisplayOrder = -1000
			sg.IgnoreGuiInset = true
			sg.ResetOnSpawn = false
			local fr = Instance.new("Frame")
			fr.Name = func3()
			fr.BackgroundColor3 = Color3.new(0, 0, 0)
			fr.BorderSizePixel = 0
			fr.Size = UDim2.fromScale(1, 1)
			fr.Parent = sg
			str1.RenderBackdrop = sg
			sg.Parent = pgui
			backdropGui = sg
		end

		local function apply3D(enabled)
			pcall(function()
				RunService:Set3dRenderingEnabled(enabled)
			end)
			pcall(updateBackdrop, not enabled)
		end

		local disable3DToggle = obj104:CreateToggle({
			Name = "Disable 3D Render",
			Note = "Turns off 3D world rendering to save CPU and GPU while AFK farming",
			Default = false,
			Callback = function(v)
				renderDisabled = v == true
				apply3D(not renderDisabled)
			end,
		})

		obj104:CreateDropdown({
			Name = "Background Color",
			Options = { "White", "Black" },
			Default = "White",
			SubOf = disable3DToggle,
			ShowWhen = disable3DToggle,
			Callback = function(v)
				blackBg = (v == "Black")
				if renderDisabled then
					pcall(updateBackdrop, true)
				end
			end,
		})

		func4(function()
			if renderDisabled then
				apply3D(true)
			end
		end)
	end)

	pcall(function()
		local orderMap = {
			["Optimizer"] = 1,
			["Disable 3D Render"] = 2,
			["Background Color"] = 3,
			["FPS and Ping"] = 4,
			["FPS and Ping Size"] = 5,
			["FPS Cap"] = 6,
		}
		if obj104 and obj104.Options then
			for _, opt in ipairs(obj104.Options) do
				local ord = orderMap[opt.Name]
				if ord then
					if opt.Instance then opt.Instance.LayoutOrder = ord end
					if opt._visibilityHost then opt._visibilityHost.LayoutOrder = ord end
				end
			end
		end
	end)
	local tbl495 = { Enabled = true, Alive = true, Silenced = {} }

	local function func704()
		if type(getconnections) ~= "function" then
			return {}
		end
		local ok, result = pcall(getconnections, localPlayer.Idled)
		return ok and type(result) == "table" and result or {}
	end

	local function func705()
		for _, item186 in ipairs(func704()) do
			if pcall(function()
				item186:Disable()
			end) then
				tbl495.Silenced[#tbl495.Silenced + 1] = item186
			end
		end
	end

	local function func706()
		local silenced = tbl495.Silenced

		if #silenced == 0 then
			silenced = func704()
		end

		for _, item187 in ipairs(silenced) do
			pcall(function()
				item187:Enable()
			end)
		end

		table.clear(tbl495.Silenced)
	end

	local obj = setmetatable({}, { __index = function()
		return function()
		end
	end })

	local list83 = {}

	local function func707()
		local list84 = {}
		if type(getgc) ~= "function" or type(debug) ~= "table" or type(debug.getupvalues) ~= "function" then
			return list84
		end
		local ok, result = pcall(getgc, false)
		if not ok or type(result) ~= "table" then
			return list84
		end

		for _, item188 in ipairs(result) do
			if type(item188) == "function" and islclosure(item188) then
				local ok2, result2 = pcall(debug.info, item188, "s")

				if ok2 and type(result2) == "string" and string.find(result2, "AntiAFK", 1, true) then
					local ok3, result3 = pcall(debug.getupvalues, item188)

					if ok3 and type(result3) == "table" then
						for k, value558 in pairs(result3) do
							if typeof(value558) == "Instance" and value558.ClassName == "TeleportService" then
								list84[#list84 + 1] = { Fn = item188, Index = k, Original = value558 }
							end
						end
					end
				end
			end
		end

		return list84
	end

	local function func708()
		for _, item189 in ipairs(func707()) do
			local ok, result = pcall(debug.getupvalue, item189.Fn, item189.Index)

			if ok and typeof(result) == "Instance" then
				if pcall(debug.setupvalue, item189.Fn, item189.Index, obj) then
					list83[#list83 + 1] = item189
				end
			end
		end
	end

	local function func709()
		for _, item190 in ipairs(list83) do
			pcall(debug.setupvalue, item190.Fn, item190.Index, item190.Original)
		end

		table.clear(list83)
	end

	local function func710()
		func705()

		if #list83 == 0 then
			func708()
		end
	end

	local connection = localPlayer.CharacterAdded:Connect(function()
		task.delay(1, function()
			if tbl495.Alive and tbl495.Enabled then
				table.clear(tbl495.Silenced)
				pcall(func710)
			end
		end)
	end)

	func4(function()
		pcall(function()
			connection:Disconnect()
		end)
	end)

	func4(function()
		tbl495.Alive = false
		func706()
		func709()
	end)

	task.spawn(function()
		while tbl495.Alive do
			if tbl495.Enabled then
				func710()
			end

			task.wait(600)
		end
	end)

	obj106:CreateToggle({
		Name = "Anti AFK",
		Default = true,
		Callback = function(value)
			tbl495.Enabled = value ~= false

			if tbl495.Enabled then
				func710()
			else
				func706()
				func709()
			end
		end,
	})

	pcall(function()
		local StarterGui = game:GetService("StarterGui")
		local hiddenGuis = {}
		local savedCore = {}
		local hudOn = false
		local hideUiOn = true

		local function applyHideGameUi(active)
			local pgui = localPlayer:FindFirstChildOfClass("PlayerGui")
			if active then
				if pgui then
					for _, g in ipairs(pgui:GetChildren()) do
						if g:IsA("ScreenGui") and g ~= str1.RenderBackdrop and g.Enabled then
							hiddenGuis[g] = true
							pcall(function() g.Enabled = false end)
						end
					end
				end
				for _, cg in ipairs(Enum.CoreGuiType:GetEnumItems()) do
					if cg ~= Enum.CoreGuiType.All then
						local ok, cur = pcall(StarterGui.GetCoreGuiEnabled, StarterGui, cg)
						if ok then savedCore[cg] = cur end
					end
				end
				pcall(StarterGui.SetCoreGuiEnabled, StarterGui, Enum.CoreGuiType.All, false)
			else
				for g in pairs(hiddenGuis) do
					pcall(function() if g and g.Parent then g.Enabled = true end end)
				end
				table.clear(hiddenGuis)
				for cg, val in pairs(savedCore) do
					pcall(StarterGui.SetCoreGuiEnabled, StarterGui, cg, val)
				end
				table.clear(savedCore)
			end
		end

		local farmHudToggle = obj106:CreateToggle({
			Name = "Farm HUD",
			Note = "Drag any panel to place it where you like",
			Default = false,
			Callback = function(v)
				hudOn = v == true
				applyHideGameUi(hudOn and hideUiOn)
			end,
		})
		obj106:CreateToggle({
			Name = "Hide Game UI",
			Default = true,
			SubOf = farmHudToggle,
			ShowWhen = farmHudToggle,
			Callback = function(v)
				hideUiOn = v == true
				applyHideGameUi(hudOn and hideUiOn)
			end,
		})
		local hudItemOpts = { "Money", "Eggs", "Pets", "Treadmill", "Samples", "Top Eggs", "Steal History" }
		func6(obj106:CreateMultiDropdown({
			Name = "HUD Items",
			Options = hudItemOpts,
			Default = hudItemOpts,
			SubOf = farmHudToggle,
			ShowWhen = farmHudToggle,
		}))
		obj106:CreateSlider({
			Name = "Showcase Cards",
			Min = 1,
			Max = 6,
			Default = 4,
			AllowDecimals = false,
			Increment = 1,
			SubOf = farmHudToggle,
			ShowWhen = farmHudToggle,
		})
		obj106:CreateSlider({
			Name = "HUD Size",
			Min = 50,
			Max = 120,
			Default = 100,
			AllowDecimals = false,
			Increment = 1,
			Unit = "%",
			SubOf = farmHudToggle,
			ShowWhen = farmHudToggle,
		})
		obj106:CreateDropdown({
			Name = "Egg Card Image",
			Note = "Picture used for Top Eggs and Steal History",
			Options = { "Egg Image", "Pet Image" },
			Default = "Egg Image",
			SubOf = farmHudToggle,
			ShowWhen = farmHudToggle,
		})
		func4(function()
			if hudOn then applyHideGameUi(false) end
		end)
	end)
end

local GuiService2, StarterGui, antiGuard, tbl496, chilliAntiGuard, tbl497, tbl498, n13, flag637, list85
local flag638, func711, hui, func712, ScreenGui, Frame, UIScale, Frame2, UIScale2, UIGradient
local func713

do
	local TweenService = game:GetService("TweenService")
	GuiService2 = game:GetService("GuiService")
	StarterGui = game:GetService("StarterGui")
	antiGuard = str1.AntiGuard

	tbl496 = {
		Target = "line",
		LineOffset = 8,
		Height = 45,
		OffsetX = -90,
		OffsetZ = -35,
		Jitter = 0,
		Point = false,
		Disguise = true,
		Limp = true,
		Facing = "Zero",
		Freeze = false,
		StartAt = 0,
		Steps = {
			{ At = 0.1, To = "home" },
			{ At = 0.33, To = "home" },
			{ At = 0.56, To = "home" },
			{ At = 0.75, To = "start" },
		},
		ReleaseAt = 0.8,
		WeldScanGap = 0.03,
		BusyLimit = 2.5,
	}

	local function func714(param429, num148, num149, param430, param431, param432)
		local list86 = {}

		for i = 1, param429 do
			list86[#list86 + 1] = { At = num148 + num149 * (i - 1), To = "home" }
		end

		list86[#list86 + 1] = { At = param430, To = "start" }

		return {
			Target = "home",
			LineOffset = 8,
			Height = 0,
			OffsetX = 0,
			OffsetZ = 0,
			Jitter = 0,
			Point = false,
			Disguise = true,
			Limp = false,
			Facing = "Zero",
			Freeze = true,
			StartAt = 0,
			StartRandom = 0,
			HopRandom = 0.085,
			HoldRandom = 0.395,
			Steps = list86,
			ReleaseAt = param431,
			WeldScanGap = 0.03,
			BusyLimit = param432,
		}
	end

	chilliAntiGuard = { LightDark = tbl496, Default = func714(25, 0, 0.05, 1.27, 1.52, 2.5) }

	pcall(function()
		getgenv().ChilliAntiGuard = chilliAntiGuard
	end)

	tbl497 = {
		Card = Color3.fromRGB(4, 20, 52),
		CardTop = Color3.fromRGB(10, 42, 96),
		Stroke = Color3.fromRGB(45, 165, 235),
		Text = Color3.fromRGB(235, 248, 255),
		AccentA = Color3.fromRGB(0, 195, 255),
		AccentB = Color3.fromRGB(80, 235, 255),
		Good = Color3.fromRGB(80, 230, 155),
		Work = Color3.fromRGB(60, 215, 255),
		Bad = Color3.fromRGB(240, 90, 90),
		Off = Color3.fromRGB(16, 48, 92),
	}

	tbl498 = {
		{ Path = { "GearGiver_Slap", "Podium" }, Offset = Vector3.new(-16.415, 21.072, -6.106) },
		{
			Path = { "World", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003" },
			Offset = Vector3.new(-26.776, 1.75, 18.665),
		},
		{
			Path = { "__OBJECTS", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003" },
			Offset = Vector3.new(-26.776, 1.75, 18.665),
		},
	}

	n13 = 52
	flag637 = true
	list85 = {}

	flag638 = {
		AreaId = nil,
		SignalCarrying = false,
		WeldCarrying = false,
		Carrying = false,
		Active = false,
		Disguise = nil,
		FlashRequest = nil,
		FlashUntil = 0,
	}

	func711 = function()
		local tbl499 = {}

		for i = 1, math.random(10, 16) do
			tbl499[i] = string.char(math.random(97, 122))
		end

		return table.concat(tbl499)
	end

	hui = nil

	pcall(function()
		hui = gethui()
	end)

	hui = hui or CoreGui

	local function func715(param433, parent, flag639)
		local instance = Instance.new(param433)
		instance.Name = func711()
		local func716 = pairs
		local tbl500 = flag639 or {}

		for k, value559 in func716(tbl500) do
			instance[k] = value559
		end

		instance.Parent = parent
		return instance
	end

	func712 = function(param434, param435, param436, param437)
		local ok, result = pcall(function()
			local value560 = TweenService
			local create = value560.Create
			local tweenInfo = TweenInfo.new
			local value561 = param437
			local quint

			if param437 then
				quint = value561
			else
				quint = Enum.EasingStyle.Quint
			end

			return create(value560, param434, tweenInfo(param435, quint, Enum.EasingDirection.Out), param436)
		end)

		if ok and result then
			result:Play()
		end
	end

	ScreenGui = func715("ScreenGui", nil, {
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		DisplayOrder = -100,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	})

	Frame = func715("Frame", ScreenGui, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 1, -120),
		Size = UDim2.fromOffset(226, 52),
		BackgroundTransparency = 1,
	})

	UIScale = func715("UIScale", Frame, { Scale = 1 })

	Frame2 = func715("Frame", Frame, {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = tbl497.Card,
		BorderSizePixel = 0,
		Active = true,
	})

	UIScale2 = func715("UIScale", Frame2, { Scale = 0.86 })
	func715("UIGradient", Frame2, { Color = ColorSequence.new(tbl497.CardTop, tbl497.Card), Rotation = 90 })

	local UIStroke = func715("UIStroke", Frame2, {
		Thickness = 1.5,
		Color = Color3.fromRGB(255, 255, 255),
		Transparency = 0.2,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})

	UIGradient = func715("UIGradient", UIStroke, { Color = ColorSequence.new(tbl497.Stroke, tbl497.Stroke) })

	local Frame3 = func715("Frame", Frame2, {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 10, 0.5, 0),
		Size = UDim2.fromOffset(36, 36),
		BackgroundColor3 = Color3.fromRGB(8, 30, 68),
		BorderSizePixel = 0,
		ZIndex = 2,
	})

	local UIStroke2 = func715("UIStroke", Frame3, { Thickness = 1.5, Color = tbl497.Off, ApplyStrokeMode = Enum.ApplyStrokeMode.Border })

	local ImageLabel = func715("ImageLabel", Frame3, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(0.86, 0.86),
		BackgroundTransparency = 1,
		Image = "rbxassetid://139156226633560",
		ImageTransparency = 0.15,
		ScaleType = Enum.ScaleType.Fit,
		ZIndex = 3,
	})

	local UIScale3 = func715("UIScale", ImageLabel, { Scale = 1 })
	local color3 = Color3.fromRGB

	func715("UIGradient", func715("TextLabel", Frame2, {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 56, 0, 7),
		Size = UDim2.new(1, -112, 0, 15),
		Font = Enum.Font.BuilderSansExtraBold,
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		Text = "BlueHaven Hub",
		ZIndex = 2,
	}), { Color = ColorSequence.new(Color3.fromRGB(80, 225, 255), color3(185, 245, 255)) })

	func715("TextLabel", Frame2, {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 56, 0, 22),
		Size = UDim2.new(1, -112, 0, 20),
		Font = Enum.Font.GothamBlack,
		TextSize = 15,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextColor3 = tbl497.Text,
		Text = "Anti Guard",
		ZIndex = 2,
	})

	local TextButton = func715("TextButton", Frame2, {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -12, 0.5, 0),
		Size = UDim2.fromOffset(42, 22),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		AutoButtonColor = false,
		BorderSizePixel = 0,
		Text = "",
		ZIndex = 2,
	})

	local UIGradient2 = func715("UIGradient", TextButton, { Color = ColorSequence.new(tbl497.Off, tbl497.Off) })

	local Frame4 = func715("Frame", TextButton, {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 3, 0.5, 0),
		Size = UDim2.fromOffset(16, 16),
		BackgroundColor3 = Color3.fromRGB(235, 248, 255),
		BorderSizePixel = 0,
		ZIndex = 3,
	})

	local function func717()
		return antiGuard.Enabled and tbl497.AccentA or tbl497.Off
	end

	local function render(flag640)
		local n14 = flag640 and 0 or 0.28

		if antiGuard.Enabled then
			UIGradient2.Color = ColorSequence.new(tbl497.AccentA, tbl497.AccentB)
			local value562 = UIGradient
			local colorSequence = ColorSequence.new
			local value563 = ColorSequenceKeypoint.new(0, tbl497.Stroke)
			local value564 = ColorSequenceKeypoint.new(0.45, tbl497.AccentA)
			local value565 = ColorSequenceKeypoint.new(0.55, tbl497.AccentB)
			local new = ColorSequenceKeypoint.new
			local stroke = tbl497.Stroke
			local tbl501 = { value563, value564, value565 }

			do
				local values = table.pack(new(1, stroke))
				table.move(values, 1, values.n, 4, tbl501)
			end

			value562.Color = colorSequence(tbl501)
			func712(Frame4, n14, { Position = UDim2.new(1, -19, 0.5, 0) }, Enum.EasingStyle.Back)
			func712(ImageLabel, n14, { ImageTransparency = 0 })
			func712(UIStroke, 0.3, { Transparency = 0 })
		else
			UIGradient2.Color = ColorSequence.new(tbl497.Off, tbl497.Off)
			UIGradient.Color = ColorSequence.new(tbl497.Stroke, tbl497.Stroke)
			func712(Frame4, n14, { Position = UDim2.new(0, 3, 0.5, 0) }, Enum.EasingStyle.Back)
			func712(ImageLabel, n14, { ImageTransparency = 0.35 })
			func712(UIStroke, 0.3, { Transparency = 0.2 })
		end

		if flag638.FlashUntil <= os.clock() then
			func712(UIStroke2, n14, { Color = func717() })
		end
	end

	func713 = function(param438, param439)
		flag638.FlashRequest = { Color = param438, Hold = param439 }
	end

	local function func718()
		local flashRequest = flag638.FlashRequest
		if not flashRequest then
			return
		end
		flag638.FlashRequest = nil
		flag638.FlashUntil = os.clock() + (flashRequest.Hold or 0)
		func712(UIStroke2, 0.2, { Color = flashRequest.Color })

		if flashRequest.Hold then
			task.delay(flashRequest.Hold, function()
				local flag641 = flag637

				if flag637 then
					local flashUntil = flag638.FlashUntil
					flag641 = os.clock() >= flashUntil
				end

				if flag641 then
					func712(UIStroke2, 0.3, { Color = func717() })
				end
			end)
		end
	end

	local function func719(param440)
		local handle = antiGuard.Handle
		if type(handle) ~= "table" then
			return
		end

		for _, item191 in ipairs({ "Set", "SetValue" }) do
			local ok, result = pcall(function()
				return handle[item191]
			end)

			if ok and type(result) == "function" and pcall(result, handle, param440) then
				return
			end
		end
	end

	antiGuard.Render = render

	local TextButton2 = func715("TextButton", Frame2, {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Text = "",
		ZIndex = 10,
	})

	list85[#list85 + 1] = TextButton2.MouseButton1Click:Connect(function()
		antiGuard.Enabled = not antiGuard.Enabled
		render(false)
		func719(antiGuard.Enabled)
		func712(UIScale3, 0.12, { Scale = 1.15 })

		task.delay(0.12, function()
			if flag637 then
				func712(UIScale3, 0.3, { Scale = 1 }, Enum.EasingStyle.Back)
			end
		end)
	end)

	local size = TextButton.Size

	list85[#list85 + 1] = TextButton2.MouseEnter:Connect(function()
		func712(TextButton, 0.15, { Size = size + UDim2.fromOffset(2, 2) })
	end)

	list85[#list85 + 1] = TextButton2.MouseLeave:Connect(function()
		func712(TextButton, 0.15, { Size = size })
	end)

	local byName6 = {
		Hotbar = true,
		HotBar = true,
		Toolbar = true,
		ToolBar = true,
		Backpack = true,
		Inventory = true,
	}

	local list87 = {}
	local huge = math.huge
	local huge2 = math.huge
	local rotation = 0
	local n14 = nil

	local function func720(instance30)
		while instance30 do
			if instance30:IsA("GuiObject") and not instance30.Visible then
				return false
			end

			if instance30:IsA("LayerCollector") then
				return instance30.Enabled
			end
			instance30 = instance30.Parent
		end

		return false
	end

	local function func721()
		local ok, result = pcall(function()
			return GuiService2:GetGuiInset().Y
		end)

		return ok and result or 0
	end

	local function func722(list88)
		local value566 = nil

		for _, descendant in ipairs(list88:GetDescendants()) do
			if descendant:IsA("GuiButton") and descendant.Visible and descendant.AbsoluteSize.Y > 8 and descendant.AbsoluteSize.X > 8 then
				local y = descendant.AbsolutePosition.Y

				if not value566 or y < value566 then
					value566 = y
				end
			end
		end

		return value566 or list88.AbsolutePosition.Y
	end

	local function func723()
		table.clear(list87)
		local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
		if not playerGui then
			return
		end

		for _, descendant in ipairs(playerGui:GetDescendants()) do
			if descendant:IsA("GuiObject") and byName6[descendant.Name] then
				list87[#list87 + 1] = descendant
			end
		end
	end

	local function func724()
		local list89 = {}

		pcall(function()
			if not StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack) then
				return
			end

			for _, child in ipairs(CoreGui.RobloxGui.Backpack:GetChildren()) do
				if child:IsA("GuiObject") then
					list89[#list89 + 1] = child
				end
			end
		end)

		for _, item192 in ipairs(list87) do
			if item192.Parent then
				list89[#list89 + 1] = item192
			end
		end

		return list89
	end

	local function func725()
		local currentCamera = workspace.CurrentCamera
		if not currentCamera then
			return
		end
		local viewportSize = currentCamera.ViewportSize
		if viewportSize.X < 10 or viewportSize.Y < 10 then
			return
		end
		local touchEnabled = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
		local n15 = math.min(viewportSize.X / 1280, viewportSize.Y / 720)
		local scale = touchEnabled and math.clamp(n15 * 1.05, 0.6, 0.8) * 0.97 or math.clamp(n15, 0.8, 1.1)
		UIScale.Scale = scale
		local backgroundTransparency = touchEnabled and 0.3 or 0

		if Frame2.BackgroundTransparency ~= backgroundTransparency then
			Frame2.BackgroundTransparency = backgroundTransparency
			Frame3.BackgroundTransparency = backgroundTransparency
		end

		local n16 = viewportSize.Y - 8 * scale
		local flag642 = false

		for _, item193 in ipairs(func724()) do
			local ok, result = pcall(func720, item193)

			if ok and result then
				local absoluteSize = item193.AbsoluteSize
				local y = item193.AbsolutePosition.Y

				if absoluteSize.X > 20 and absoluteSize.Y > 20 and absoluteSize.Y < viewportSize.Y * 0.4 and y + absoluteSize.Y / 2 > viewportSize.Y * 0.5 then
					local ok2, result2 = pcall(func722, item193)
					result2 = ok2 and result2 or y
					flag642 = true
					n16 = math.min(n16, result2 + func721(item193))
				end
			end
		end

		if flag642 then
			n14 = viewportSize.Y - n16
		elseif n14 then
			n16 = viewportSize.Y - n14
		end

		local n17 = math.max(n16 - (touchEnabled and 4 or 6) * scale - n13 * scale / 2, n13 * scale / 2 + 8)
		Frame.Position = UDim2.new(0.5, 0, 0, n17)
	end

	list85[#list85 + 1] = RunService.RenderStepped:Connect(function(deltaTime)
		if not ScreenGui.Enabled then
			return
		end
		func718()
		huge += deltaTime
		huge2 += deltaTime

		if huge >= 5 then
			huge = 0
			pcall(func723)
		end

		if huge2 >= 0.5 then
			huge2 = 0
			pcall(func725)
		end

		if antiGuard.Enabled then
			rotation = (rotation + deltaTime * (flag638.Active and 360 or 90)) % 360
			UIGradient.Rotation = rotation
		end
	end)

	render(true)
end

antiGuard.ShowPanel = function(enabled4)
	ScreenGui.Enabled = enabled4 == true
end

ScreenGui.Enabled = antiGuard.PanelShown == true
ScreenGui.Parent = hui
func712(UIScale2, 0.45, { Scale = 1 }, Enum.EasingStyle.Back)

do
	local function func726()
		local flag643 = str1.Root()
		if not flag643 then
			return nil
		end

		for _, child in ipairs(workspace:GetChildren()) do
			if child:IsA("Model") and child:FindFirstChild("Hitbox") then
				for _, descendant in ipairs(child:GetDescendants()) do
					if descendant:IsA("JointInstance") or descendant:IsA("WeldConstraint") or descendant:IsA("RigidConstraint") then
						local ok, result, result2 = pcall(function()
							return descendant.Part0, descendant.Part1
						end)

						if ok and (result == flag643 or result2 == flag643) then
							return child
						end
					end
				end
			end
		end

		return nil
	end

	local function func727(list90, parent)
		local tbl502 = {}

		for _, descendant in ipairs(list90:GetDescendants()) do
			tbl502[descendant] = descendant.Archivable

			pcall(function()
				descendant.Archivable = true
			end)
		end

		local archivable = list90.Archivable
		list90.Archivable = true

		local ok, result = pcall(function()
			return list90:Clone()
		end)

		list90.Archivable = archivable

		for k, value567 in pairs(tbl502) do
			pcall(function()
				k.Archivable = value567
			end)
		end

		if not ok or not result then
			return nil
		end
		result.Name = func711()

		for _, descendant in ipairs(result:GetDescendants()) do
			if descendant:IsA("LuaSourceContainer") or descendant:IsA("Sound") or descendant:IsA("ForceField") or descendant:IsA("JointInstance") or descendant:IsA("Constraint") or descendant:IsA("WeldConstraint") or descendant:IsA("BodyMover") or descendant:IsA("ProximityPrompt") or descendant:IsA("BillboardGui") then
				pcall(function()
					descendant:Destroy()
				end)
			elseif descendant:IsA("BasePart") then
				descendant.Anchored = true
				descendant.CanCollide = false
				descendant.CanQuery = false
				descendant.CanTouch = false
			elseif descendant:IsA("Humanoid") then
				descendant.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
				descendant.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
			end
		end

		result.Parent = parent
		return result
	end

	local function func728(flag644, num150)
		local currentCamera = workspace.CurrentCamera
		if not flag644 or not currentCamera or flag638.Disguise then
			return
		end
		num150 = num150 or Vector3.zero
		local disguise = { Camera = currentCamera, CameraType = currentCamera.CameraType, CameraCFrame = currentCamera.CFrame, Copies = {}, Hidden = {} }
		flag638.Disguise = disguise
		local list91 = { flag644 }
		local ok, result = pcall(func726)

		if ok and result then
			list91[#list91 + 1] = result
		end

		for _, item194 in ipairs(list91) do
			for _, descendant in ipairs(item194:GetDescendants()) do
				if descendant:IsA("BasePart") or descendant:IsA("Decal") or descendant:IsA("Texture") then
					disguise.Hidden[#disguise.Hidden + 1] = descendant
				end
			end
		end

		local function func729()
			for _, item195 in ipairs(disguise.Hidden) do
				pcall(function()
					item195.LocalTransparencyModifier = 1
				end)
			end

			pcall(function()
				if currentCamera.CameraType ~= Enum.CameraType.Scriptable then
					currentCamera.CameraType = Enum.CameraType.Scriptable
				end

				currentCamera.CFrame = disguise.CameraCFrame
			end)
		end

		func729()
		disguise.BindName = func711()

		if not pcall(function()
			RunService:BindToRenderStep(disguise.BindName, Enum.RenderPriority.Last.Value + 1, func729)
		end) then
			disguise.BindName = nil
			disguise.Link = RunService.RenderStepped:Connect(func729)
		end

		disguise.Beat = RunService.Heartbeat:Connect(func729)

		for _, item196 in ipairs(list91) do
			local ok2, result2 = pcall(func727, item196, currentCamera)

			if ok2 and result2 then
				if num150.Magnitude > 0.01 then
					for _, descendant in ipairs(result2:GetDescendants()) do
						if descendant:IsA("BasePart") then
							pcall(function()
								descendant.CFrame = descendant.CFrame + num150
							end)
						end
					end
				end

				disguise.Copies[#disguise.Copies + 1] = result2
			end
		end
	end

	local function func730()
		local disguise = flag638.Disguise
		if not disguise then
			return
		end
		flag638.Disguise = nil

		if disguise.BindName then
			pcall(function()
				RunService:UnbindFromRenderStep(disguise.BindName)
			end)
		end

		if disguise.Link then
			pcall(function()
				disguise.Link:Disconnect()
			end)
		end

		if disguise.Beat then
			pcall(function()
				disguise.Beat:Disconnect()
			end)
		end

		for _, item197 in ipairs(disguise.Hidden) do
			pcall(function()
				item197.LocalTransparencyModifier = 0
			end)
		end

		pcall(function()
			disguise.Camera.CameraType = disguise.CameraType
		end)

		for _, copy in ipairs(disguise.Copies) do
			pcall(function()
				copy:Destroy()
			end)
		end
	end

	local function func731()
		for _, item198 in ipairs(tbl498) do
			local obj107 = workspace

			for _, item199 in ipairs(item198.Path) do
				obj107 = obj107 and obj107:FindFirstChild(item199) or nil
			end

			if obj107 and obj107:IsA("BasePart") then
				return obj107.CFrame:PointToWorldSpace(item198.Offset)
			end
		end

		return Vector3.new(528.7, 70.57, -364.11)
	end

	local function func732(list92, part25, num151, num152, flag645)
		local cFrame = CFrame.new(num151) * num152

		pcall(function()
			list92:PivotTo(cFrame)
		end)

		if (part25.Position - num151).Magnitude > 3 then
			pcall(function()
				part25.CFrame = cFrame
			end)
		end

		if flag645 == false then
			return
		end

		for _, descendant in ipairs(list92:GetDescendants()) do
			if descendant:IsA("BasePart") then
				pcall(function()
					descendant.AssemblyLinearVelocity = Vector3.zero
					descendant.AssemblyAngularVelocity = Vector3.zero
				end)
			end
		end
	end

	local function func733()
		local areaId = flag638.AreaId

		if type(areaId) ~= "string" or areaId == "" then
			areaId = type(str1.Steal) == "table" and str1.Steal.CarryAreaId or nil
		end

		if type(areaId) ~= "string" or areaId == "" then
			areaId = localPlayer:GetAttribute("AreaId")
			areaId = type(areaId) == "string" and areaId or nil
		end

		return areaId
	end

	local tbl503 = { lightdark = "LightDark" }

	local function func734(param441)
		if type(param441) ~= "string" then
			return "Default"
		end
		local lower = string.lower
		local cleaned6 = string.gsub(param441, "[^%a]", "")
		return tbl503[lower(cleaned6)] or "Default"
	end

	local function func735()
		local ok, result = pcall(function()
			return getgenv().ChilliAntiGuard
		end)

		if ok and type(result) == "table" then
			if type(result.Steps) == "table" then
				return result
			end
			local default = result[func734(func733())] or result.Default
			if type(default) == "table" then
				return default
			end
		end

		return chilliAntiGuard[func734(func733())] or tbl496
	end

	local function func736()
		local result96 = func735()
		local options = antiGuard.Options
		if type(options) ~= "table" or options.Destination == "Safe Zone" and not options.Stay then
			return result96
		end
		local tbl504 = {}

		for k, value568 in pairs(result96) do
			tbl504[k] = value568
		end

		if options.Destination == "Next To Line" then
			tbl504.Target = "edge"
			tbl504.LineOffset = 6
			tbl504.Height = 0
			tbl504.OffsetX = 0
			tbl504.OffsetZ = 0
		elseif options.Destination == "Saved Spot" and typeof(options.Spot) == "Vector3" then
			tbl504.Target = "point"
			tbl504.Point = options.Spot
			tbl504.Height = 0
			tbl504.OffsetX = 0
			tbl504.OffsetZ = 0
		end

		if options.Stay and type(result96.Steps) == "table" then
			local steps = {}

			for _, step in ipairs(result96.Steps) do
				if type(step) == "table" and step.To ~= "start" then
					steps[#steps + 1] = step
				end
			end

			tbl504.Steps = steps
		end

		return tbl504
	end

	local function func737(param442, num153)
		local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
		local areas = world and world:FindFirstChild("Areas")
		areas = areas and areas:FindFirstChild("SeparationLine")

		if areas and areas:IsA("BasePart") then
			local cFrame = areas.CFrame
			local value569 = (Vector3.new(0, 1, 0)):Cross(areas.Size.X >= areas.Size.Z and cFrame.RightVector or cFrame.LookVector)
			local vector = Vector3.new(value569.X, 0, value569.Z)

			if vector.Magnitude > 0.001 then
				local unit = vector.Unit
				local n14 = cFrame.Position + ((num153 - cFrame.Position):Dot(unit) >= 0 and -unit or unit) * (tonumber(param442.LineOffset) or 8)
				return Vector3.new(n14.X, num153.Y + 0.5, n14.Z)
			end
		end

		return nil
	end

	local function func738(param443, num154)
		local str78 = tostring(param443.Target or "home")
		if str78 == "sky" then
			return num154
		end

		if str78 == "point" then
			if typeof(param443.Point) == "Vector3" then
				return param443.Point
			end
			return num154
		end

		if str78 == "line" then
			local value570 = func737(param443, num154)
			if value570 then
				return value570
			end
		end

		if str78 == "edge" then
			local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
			world = world and world:FindFirstChild("Areas")
			local separationLine = world and world:FindFirstChild("SeparationLine")

			if separationLine and separationLine:IsA("BasePart") then
				local cFrame = separationLine.CFrame
				local rightVector = separationLine.Size.X >= separationLine.Size.Z and cFrame.RightVector or cFrame.LookVector
				local vector = Vector3.new(rightVector.X, 0, rightVector.Z)
				local value571 = (Vector3.new(0, 1, 0)):Cross(vector)
				local vector2 = Vector3.new(value571.X, 0, value571.Z)

				if vector2.Magnitude > 0.001 and vector.Magnitude > 0.001 then
					local unit = vector.Unit
					local unit2 = vector2.Unit
					local n14 = num154 - cFrame.Position
					local n15 = -separationLine.Size.Magnitude / 2
					local n16 = separationLine.Size.Magnitude / 2
					local n17 = cFrame.Position + unit * math.clamp(n14:Dot(unit), n15, n16) + (n14:Dot(unit2) >= 0 and unit2 or -unit2) * (tonumber(param443.LineOffset) or 6)
					local result97 = func731()
					return Vector3.new(n17.X, (result97 and result97.Y or num154.Y) + 3, n17.Z)
				end
			end
		end

		return func731()
	end

	local function func739(param444, param445)
		return func738(param444, param445) + Vector3.new(tonumber(param444.OffsetX) or 0, tonumber(param444.Height) or 0, tonumber(param444.OffsetZ) or 0)
	end

	local function func740()
		flag638.Active = false
		antiGuard.Busy = false
	end

	local function func741(param446)
		local n14 = math.max(tonumber(param446) or 0, 0)
		if n14 <= 0 then
			return 0
		end
		return (math.random() * 2 - 1) * n14
	end

	local function func742(param447)
		local steps = type(param447.Steps) == "table" and param447.Steps or {}
		local n14 = tonumber(param447.ReleaseAt) or 0
		local n15 = math.max(tonumber(param447.StartAt) or 0, 0)
		local n16 = math.max(tonumber(param447.StartRandom) or 0, 0)
		local n17 = math.max(tonumber(param447.HopRandom) or 0, 0)
		local n18 = math.max(tonumber(param447.HoldRandom) or 0, 0)
		if n16 <= 0 and n17 <= 0 and n18 <= 0 then
			return steps, n14, n15
		end
		local n19 = math.max(n15 + func741(n16), 0)
		local tbl505 = {}
		local value572, value573, value574 = ipairs(steps)
		local n20 = 0
		local n21 = 0

		for k, value575 in value572, value573, value574 do
			if type(value575) == "table" then
				local n22 = math.max(tonumber(value575.At) or 0, 0)
				n21 = math.max(n21 + math.max(n22 - n20, 0) + func741(value575.To == "start" and n18 or n17), n19)
				tbl505[k] = { At = n21, To = value575.To, Glide = value575.Glide }
				n20 = n22
				continue
			end

			break
		end

		return tbl505, n21 + math.max(n14 - n20, 0), n19
	end

	local function func743(num155)
		local character = localPlayer.Character
		local flag646 = str1.Root()
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if not flag646 or not humanoid or humanoid.Health <= 0 then
			func740()
			func713(tbl497.Bad, 1.6)
			return
		end

		local function func744()
			return flag637 and flag646.Parent ~= nil and humanoid.Parent ~= nil and humanoid.Health > 0
		end

		local platformStand = humanoid.PlatformStand
		local cFrame = flag646.CFrame
		local position = cFrame.Position
		local result98 = func736()
		local value576, value577, value578 = func742(result98)
		local freeze = result98.Freeze ~= false
		local str79 = tostring(result98.Facing or "Keep")
		local n14 = math.max(tonumber(result98.Jitter) or 0, 0)
		local cframe = str79 == "Zero" and CFrame.new() or cFrame.Rotation

		local function func745()
			if str79 == "Spin" then
				return CFrame.Angles(0, math.rad(math.random(0, 359)), 0)
			end
			return cframe
		end

		local function func746(num156)
			if n14 <= 0 then
				return num156
			end
			return num156 + Vector3.new((math.random() * 2 - 1) * n14, 0, (math.random() * 2 - 1) * n14)
		end

		local value579 = func739(result98, position)

		local function func747(param448)
			while func744() and os.clock() - num155 < param448 do
				RunService.Heartbeat:Wait()

				if freeze then
					pcall(function()
						flag646.AssemblyLinearVelocity = Vector3.zero
						flag646.AssemblyAngularVelocity = Vector3.zero
					end)
				end
			end

			return func744()
		end

		local function func748(num157, param449)
			func732(character, flag646, num157, param449, freeze)
			RunService.PreSimulation:Wait()

			if func744() and (flag646.Position - num157).Magnitude > 3 then
				func732(character, flag646, num157, param449, freeze)
			end
		end

		pcall(function()
			humanoid.BreakJointsOnDeath = false
		end)

		if result98.Disguise ~= false then
			pcall(func728, character, Vector3.zero)
		end

		func713(tbl497.Work)

		if func747(value578) and result98.Limp ~= false then
			humanoid.PlatformStand = true
		end

		local obj108 = position

		for _, item200 in ipairs(value576) do
			local flag647 = type(item200) ~= "table"

			if not flag647 then
				flag647 = not func747(tonumber(item200.At) or 0)
			end

			if not flag647 then
				local to = item200.To == "start" and position or func746(value579)
				local result99 = func745()

				if type(item200.Glide) == "table" and #item200.Glide > 0 then
					for _, item201 in ipairs(item200.Glide) do
						if func744() then
							local clamp = math.clamp
							local n15 = tonumber(item201) or 1
							local func749 = func732
							local value580 = clamp(n15, 0, 1)
							func749(character, flag646, obj108:Lerp(to, value580), result99, freeze)
							RunService.Heartbeat:Wait()
							continue
						end

						break
					end

					obj108 = to
				else
					func748(to, result99)
					obj108 = to
				end

				continue
			end

			break
		end

		func747(value577)

		pcall(function()
			humanoid.PlatformStand = platformStand
		end)

		func730()
		func740()

		if func744() and flag638.Carrying then
			func713(tbl497.Good, 1.6)
		else
			func713(tbl497.Bad, 1.6)
		end
	end

	local function func750(param450)
		if not pcall(func743, param450) then
			pcall(function()
				local character = localPlayer.Character
				character = character and character:FindFirstChildOfClass("Humanoid")

				if character then
					character.PlatformStand = false
				end
			end)

			func730()
			func740()
			func713(tbl497.Bad, 1.6)
		end
	end

	local n14 = 25

	local function func751()
		if antiGuard.HitArms <= 0 then
			return false
		end

		if os.clock() - (antiGuard.HitArmedAt or 0) > n14 then
			antiGuard.HitArms = 0
			return false
		end
		return true
	end

	local function func752()
		local carrying = flag638.Carrying
		flag638.Carrying = flag638.SignalCarrying or flag638.WeldCarrying
		local enabled = flag638.Carrying and not carrying and flag637 and antiGuard.Enabled

		if enabled then
			enabled = not (str1.SafeCarry.LineDrop and str1.Steal.Active)
		end

		if enabled then
			enabled = not (str1.Steal.Active and str1.BossPortalUp())
		end

		if enabled and not flag638.Active and not func751() then
			flag638.Active = true
			antiGuard.Busy = true
			antiGuard.BusySince = os.clock()
			task.spawn(func750, os.clock())
		end
	end

	local eggState = tbl1.EggState
	local carryChanged = type(eggState) == "table" and eggState.CarryChanged or nil

	if type(carryChanged) == "table" and type(carryChanged.Connect) == "function" then
		local ok, result = pcall(carryChanged.Connect, carryChanged, function(param451)
			local signalCarrying = type(param451) == "table" and param451.IsCarrying == true

			if signalCarrying and param451.GuardDisabled == true then
				signalCarrying = false
			end

			if signalCarrying and type(param451.AreaId) == "string" then
				flag638.AreaId = param451.AreaId
			end

			if not signalCarrying then
				flag638.AreaId = nil
			end

			flag638.SignalCarrying = signalCarrying
			func752()
		end)

		if ok and result then
			list85[#list85 + 1] = result
		end
	end

	local n15 = 0

	list85[#list85 + 1] = RunService.Heartbeat:Connect(function(deltaTime)
		local busy = antiGuard.Busy or flag638.Active

		if busy then
			local busySince = antiGuard.BusySince
			busy = os.clock() - busySince > math.max(tonumber(func736().BusyLimit) or tbl496.BusyLimit, (tonumber(func736().ReleaseAt) or 0) + 1)
		end

		if busy then
			func730()
			local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid")

			if humanoid and humanoid.PlatformStand then
				pcall(function()
					humanoid.PlatformStand = false
				end)
			end

			func740()
		end

		func751()
		if not antiGuard.Enabled and not flag638.WeldCarrying then
			return
		end
		n15 += deltaTime
		if n15 < 0.15 then
			return
		end
		n15 = 0
		local weldCarrying = func726() ~= nil

		if weldCarrying ~= flag638.WeldCarrying then
			flag638.WeldCarrying = weldCarrying
			func752()
		end
	end)

	func4(function()
		flag637 = false

		for _, item202 in ipairs(list85) do
			pcall(function()
				item202:Disconnect()
			end)
		end

		table.clear(list85)
		func730()
		func740()
		antiGuard.Render = nil
		antiGuard.ShowPanel = nil

		pcall(function()
			ScreenGui:Destroy()
		end)
	end)
end

do
	local obj109 = obj2._bhLayout.Community
	local discordUrl = "discord.gg/bluehaven"

	obj109:CreateText({
		Name = "Hub Edition",
		Text = "BlueHaven Hub — Steal An Egg Edition",
	})

	obj109:CreateText({
		Name = "Community Invite",
		Text = "https://" .. discordUrl,
	})

	obj109:CreateButton({
		Name = "Copy Discord Invite Link",
		ButtonText = "Copy",
		ClickedText = "Copied!",
		Callback = function()
			local clip = setclipboard or toclipboard
			local ok = type(clip) == "function" and pcall(clip, "https://" .. discordUrl) or false
			func647(ok and "Discord Link Copied" or "Discord Link", "https://" .. discordUrl)
		end,
	})
end

obj1:Finalize({ Window = obj2, MainTab = defaultTab, ShowMainTab = true })

task.defer(function()
	if #list1 == 0 or type(readfile) ~= "function" then
		return
	end
	local HttpService2 = game:GetService("HttpService")

	local function func761(param457)
		if type(isfile) == "function" then
			local ok, result = pcall(isfile, param457)
			if ok and not result then
				return nil
			end
		end

		local ok, result = pcall(readfile, param457)
		if not ok or type(result) ~= "string" or result == "" then
			return nil
		end
		local ok2, result2 = pcall(HttpService2.JSONDecode, HttpService2, result)
		return ok2 and type(result2) == "table" and result2 or nil
	end

	local json = func761("ChilliLibrary/config_state.json") or {}
	if json.AutoLoad == false then
		return
	end
	local value586 = func761("ChilliLibrary/configs/" .. (type(json.StartupConfig) == "string" and json.StartupConfig ~= "" and json.StartupConfig or type(json.SelectedConfig) == "string" and json.SelectedConfig ~= "" and json.SelectedConfig or "Default") .. ".json")
	if type(value586) ~= "table" or type(value586.Values) ~= "table" then
		return
	end
	local tbl510 = { ["K/s"] = 1000, ["M/s"] = 1000000, ["B/s"] = 1e9 }
	local tbl511 = {}

	for _, item206 in ipairs(list1) do
		local flag652 = false
		local value587 = nil

		for _, value588 in pairs(value586.Values) do
			local tbl512 = type(value588) == "table" and value588[item206.Section] or nil

			if type(tbl512) == "table" then
				if tbl512[item206.Name] ~= nil then
					flag652 = true
				end

				local entry55 = tbl512[item206.Legacy]

				if type(entry55) == "table" and tonumber(entry55.Value) then
					value587 = entry55
				end
			end
		end

		if value587 and not flag652 then
			local n14 = math.max(0, tonumber(value587.Value)) * (tbl510[tostring(value587.Unit)] or 1000000)

			if n14 > 0 then
				table.insert(tbl511, { Handle = item206.Handle, Step = item206.StepOf(n14) })
			end
		end
	end

	for _, item207 in ipairs({ 0.1, 1, 2 }) do
		if #tbl511 == 0 then
			return
		end
		task.wait(item207)

		for _, item208 in ipairs(tbl511) do
			local ok, result = pcall(item208.Handle.Get, item208.Handle)

			if ok then
				ok = (tonumber(result) or 0) <= 0
			end

			if ok then
				pcall(item208.Handle.Set, item208.Handle, item208.Step)
			end
		end
	end
end)

task.defer(function()
	for i = 1, 3 do
		RunService.Heartbeat:Wait()
	end

	if type(str1.RestoreStealPanel) == "function" then
		pcall(str1.RestoreStealPanel)
	end
end)
