-- Please DONT change the following 
--
--  RobBossMods  Author: Robert Hartmann
--  Pîc on Thrall
--  feel free to change the explanations but email me them because
--  i will distribute the addon on curse.com and wowinterface.com
--
--  please never remove this comment, many thanks!

local L 
local precombat = false
local incombat = false
local lastinstance = nil
local frame = CreateFrame("Frame")
local lastSpoken = {}
local lastboss = nil
local lastbossplot = 0
local aktiv = 1
local myname = ""
local mytime = 0
local sendbool = 0
local partymember = 0
local mynumber = math.random(50000)
local rbm_version = 0.40
local rbm_displayversion = tostring(rbm_version).." beta"
local update_told = 0
local lastping  = 0
local already_told = {}
local lang = ""
local ldb
local havetotell = false
local dataobj
rbm_elang = rbm_elang
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("CHAT_MSG_PARTY")
frame:RegisterEvent("CHAT_MSG_PARTY_LEADER")
frame:RegisterEvent("CHAT_MSG_WHISPER")
frame:RegisterEvent("CHAT_MSG_ADDON")
frame:RegisterEvent("PARTY_MEMBERS_CHANGED")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("INSTANCE_LOCK_START")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
SLASH_RBM1, SLASH_RBM2 = '/rbm', '/robbossmods';

--menu thing
local bzone = LibStub("LibBabble-Zone-3.0") 
local BL = bzone:GetLookupTable()
local bboss = LibStub("LibBabble-Boss-3.0") 
local BB = bboss:GetLookupTable()

local boss_dead = {}

local function resetCustomTactics()
	rbm_customTactics = {}
end

local raid_zones = {
	[BL["Blackwing Descent"]] = { 41570, 42180, 41378, 41442, 43296, 41376 },
	[BL["The Bastion of Twilight"]] = { 44600, 45992, 43735, 43324 },
	[BL["Baradin Hold"]] = { 47120 },
	[BL["Throne of the Four Winds"]] = { 45871, 46753 }
}

local zones = {
	["Zul'Aman"] = { 23574, 23576, 23578, 23577, 24239, 23863 },
	["Zul'Gurub"] = { 52155, 52151, 52271, 52059, 52053, 52148 },
	[BL["The Stonecore"]] = { 43438, 43214, 42188, 42333 },
	[BL["Throne of the Tides"]] = {40586, 40765, 40825, 40792 },
	[BL["Blackrock Caverns"]] = { 39665 , 39679, 39698, 39700, 39705 },
	[BL["Grim Batol"]] = { 39625, 40177, 40319, 40484 },
	[BL["Halls of Origination"]] = { 39425, 39428, 39788, 39587, 39731, 39732, 39378},
	[BL["Lost City of the Tol'vir"]] = { 44577, 43614, 43612, 44819},
	[BL["The Vortex Pinnacle"]] = { 43878, 43873, 43875 },
	[BL["The Deadmines"]] = { 47162, 47297, 43778, 47626, 47739, 49541},
	[BL["Shadowfang Keep"]] = { 46962, 3887, 4278, 46963, 46964 }
}

local boss_label = {
	[3887] = BB["Baron Silverlaine"],
	[39378] = BB["Rajh"],
	[39425] = BB["Temple Guardian Anhuur"],
	[39428] = BB["Earthrager Ptah"],
	[39587] = BB["Isiset"],
	[39625] = BB["General Umbriss"],
	[39665] = BB["Rom'ogg Bonecrusher"],
	[39679] = BB["Corla, Herald of Twilight"],
	[39698] = BB["Karsh Steelbender"],
	[39700] = BB["Beauty"],
	[39705] = BB["Ascendant Lord Obsidius"],
	[39731] = BB["Ammunae"],
	[39732] = BB["Setesh"],
	[39788] = BB["Anraphet"],
	[40177] = BB["Forgemaster Throngus"],
	[40319] = BB["Drahga Shodowburner"],
	[40484] = BB["Erudax"],
	[40586] = BB["Lady Naz'jar"],
	[40765] = BB["Commander Ulthok"],
	[40792] = "Neptulon",
	[40825] = BB["Erunak Stonespeaker"],
	[42188] = BB["Ozruk"],
	[42333] = BB["High Priestess Azil"],
	[4278] = BB["Commander Springvale"],
	[43214] = BB["Slabhide"],	
	[43438] = BB["Corborus"],
	[43612] = BB["High Prophet Barim"],
	[43614] = BB["Lockmaw"],
	[43778] = BB["Foe Reaper 5000"],
	[43873] = BB["Altarius"],
	[43875] = "Asaad",
	[43878] = BB["Grand Vizier Ertan"],
	[44577] = BB["General Husam"],
	[44819] = BB["Siamat, Lord of South Wind"],
	[46962] = BB["Baron Ashbury"],
	[46963] = BB["Lord Walden"],
	[46964] = BB["Lord Godfrey"],
	[47162] = BB["Glubtok"],
	[47297] = BB["Helix Gearbreaker"],
	[47626] = BB["Admiral Ripsnarl"],
	[47739] = BB["Cookie"],
	[49541] = BB["Vanessa VanCleef"],
	[41570] = BB["Magmaw"],
	[42180] = BB["Omnitron Defense System"],
	[41378] = BB["Maloriak"],
	[41442] = BB["Atramedes"],
	[43296] = BB["Chimaeron"],
	[41376] = BB["Nefarian"],
	[44600] = BB["Halfus Wyrmbreaker"],
	[45992] = BB["Valiona"],
	[43735] = BB["Ascendant Council"],
	[43324] = BB["Cho'gall"],
	[47120] = BB["Argaloth"],
	[45871] = BB["Conclave of Wind"],
	[46753] = BB["Al'Akir"],
	[52155] = "High Priest Venoxis",
	[52151] = "Bloodlord Mandokir",
	[52271] = "Edge of Madness",
	[52059] = "High Priestess Kilnara" ,
	[52053] = "Zanzil" ,
	[52148] =  "Jin'do the Godbreaker",
	[23574] = "Akil'zon" ,
	[23576] = "Nalorakk" ,
	[23578] = "Jan'alai" ,
	[23577] = "Halazzi" ,
	[24239] = "Hex Lord Malacrass",
	[23863] = "Daakara"
}

--local menuFrame = CreateFrame("Frame", "ExampleMenuFrame", UIParent, "UIDropDownMenuTemplate")


--minimap symbolbutton

function RBMMinimapButton_OnDragStart(self)
  MinimapButton_OnMouseUp(self);
  if IsShiftKeyDown()then
    self:SetScript("OnUpdate", RBMMinimapButton_OnUpdate);
    self.Dragging = true;
    RBMMinimapButton_OnLeave(self);
  end
end


function RBMMinimapButton_OnDragStop(self)
  if self.Dragging then
    self:SetScript("OnUpdate", nil);
    self:StopMovingOrSizing();
    self.Dragging = nil;
    self.Moving = nil;
  end
end

local function prepSpell(tmsg) 
	local repstring = ""
	local lastbegin = 1
	local inSpell = false
	for i=1,#tmsg,1 do
		if tmsg:byte(i) == 93 then
			inSpell = false
			lastbegin = i
		end
		if inSpell then
			if tmsg:byte(i) == 32 then
				repstring = repstring.."_"
			else
				repstring = repstring..string.char(tmsg:byte(i))
			end
		end
		if tmsg:byte(i) == 91 then
			inSpell= true
			repstring = repstring..tmsg:sub(lastbegin,i)
		end
	end
	if lastbegin < #tmsg then
		repstring = repstring..tmsg:sub(lastbegin);
	end
	return repstring
end

function RBMMinimapButton_OnUpdate(self)
  local MapScale = Minimap:GetEffectiveScale();
  local CX, CY = GetCursorPosition();
  local X, Y = (Minimap:GetRight() - 70) * MapScale, (Minimap:GetTop() - 70) * MapScale;
  local Dist = sqrt(math.pow(X - CX, 2) + math.pow(Y - CY, 2)) / MapScale;
  local Scale = self:GetEffectiveScale();
  if(Dist <= 90)and Minimap:IsVisible()then
    if self.Moving then
      self:StopMovingOrSizing();
      self.Moving = nil;
    end
    local Angle = atan2(CY - Y, X - CX) - 90;
    self:ClearAllPoints();
    self:SetPoint("CENTER", Minimap, "TOPRIGHT", (sin(Angle) * 80 - 70) * MapScale / Scale, (cos(Angle) * 77 - 73) * MapScale / Scale);
	rbm_minimapcords = { 2 , (sin(Angle) * 80 - 70) * MapScale / Scale, (cos(Angle) * 77 - 73) * MapScale / Scale  }

  elseif not self.Moving then
    self:ClearAllPoints();
	rbm_minimapcords = { 1 , CX / Scale, CY / Scale  }
    self:SetPoint("CENTER", UIParent, "BOTTOMLEFT",CX / Scale, CY / Scale);
    self:StartMoving();
    self.Moving = true;
  end
end

function RBMMinimapButton_OnEnter(self)
  if self.Dragging then
    return;
  end
  GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT");
  if lastboss ~= nil then
	GameTooltip:AddLine("Rob Boss Mods - "..L["CURRENTBOSS"]..": "..boss_label[lastboss]);
  else
	GameTooltip:AddLine("Rob Boss Mods - "..L["CURRENTBOSS"]..": "..L["NOBOSS"]);
  end
  GameTooltip:AddLine(L["LEFTCLICK"],1,1,1);
  GameTooltip:AddLine(L["RIGHTCLICK"],1,1,1);
  GameTooltip:AddLine(L["DRAG"],1,1,1);
  GameTooltip:Show();
end

function RBM_Tooltip_OnEnter(self)
  GameTooltip:SetOwner(RBM_Mainframe, "ANCHOR_CURSOR");
  GameTooltip:AddLine(L["CLOSE_OPT_DESC"],1,1,1);
  GameTooltip:Show();
end

function RBM_Tooltip_OnLeave()
  GameTooltip:Hide();
end

function RBMMinimapButton_OnLeave()
  GameTooltip:Hide();
end


function RBMButton_OnLoad(self) 
self:RegisterForClicks("LeftButtonUp","RightButtonUp");
  self:RegisterForDrag("LeftButton");
  self:SetScript("OnClick", RBMButton_OnClick);
  self:SetScript("OnEnter", RBMMinimapButton_OnEnter);
  self:SetScript("OnLeave", RBMMinimapButton_OnLeave);
  self:SetScript("OnDragStart", RBMMinimapButton_OnDragStart);
  self:SetScript("OnDragStop", RBMMinimapButton_OnDragStop);
end


--end of menu



local function checkUpdate()
	SendAddonMessage( "RBMVersion", rbm_version, "GUILD" );
	if UnitInParty("player") then
		SendAddonMessage( "RBMVersion", rbm_version, "PARTY" );
	end
end

local function resetLang()
	StaticPopupDialogs["RBM_LANGC1"] = {
		text = "RBM: In What language do you want the boss explanation to appear?",
		button1 = "English",
		button2 = "German",
		OnAccept = function()
			rbm_elang = "en"
			StaticPopup_Show ("RBM_LANGCONFIRM")
		end,
		OnCancel = function()
			rbm_elang = "de"
			StaticPopup_Show ("RBM_LANGCONFIRM")
		end,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
	}
	StaticPopupDialogs["RBM_LANGCONFIRM"] = {
		text = "The Language change wont take effect until you restart UI. Restart UI now?",
		button1 = "Reload UI",
		button2 = "No, I'll do that later",
		OnAccept = function()
			ReloadUI();
		end,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
	}
	StaticPopup_Show ("RBM_LANGC1")
end

local function spelllinkBreak(line)
	local tag = false
	local nline = ""
	for i = 1, #line do
		local c = line:sub(i,i)
		if c == "[" then
			tag = true
			nline = nline..c
		elseif c == "]" then
			tag = false
			nline = nline..c
		elseif tag and c == " " then
			nline = nline.."_"
		else
			nline = nline..c
		end
	end
	local wordlist = string.gmatch(nline, "%S+")
	local count = 1
	local ret = {}
	for word in wordlist do
		ret[count] = string.gsub(word, "_", " ")
		count = count +1
	end
	return ret
end

local function parseSpellID(text)
	local s = text:find("SPELL")
	if s == nil then
		return text
	end
	local e = text:find(")",s)
	local temps = text:sub(s,e)
	local spellid = tonumber(temps:match("%d+"))
	
	---
	local s2 = text:find("SPELL",e)
	if s2 == nil then
		if e+1 > #text then
			return text:sub(1,s-1)..GetSpellLink(spellid)
		else
			return text:sub(1,s-1)..GetSpellLink(spellid)..text:sub(e+1)
		end
	else
		--rekursion
		return text:sub(1,s-1)..GetSpellLink(spellid)..parseSpellID(text:sub(e+1))
	end
end

local function getLastDeadBoss() 
	local _,_, encountersTotal,enN = GetInstanceLockTimeRemaining();
	print(enN.."/"..encountersTotal);
	for i= encountersTotal, 1, -1 do
		local bname,asdf,BisKilled = GetInstanceLockTimeRemainingEncounter(i);
		local toprint = i.." "..bname.." "
		if BisKilled then toprint = toprint.."true" else toprint = toprint.."false" end
		print(toprint);
		if BisKilled then
		print("tot");
			if i < encountersTotal then
				return i
			else
				for j=1,encountersTotal,1 do
					_,_,isKilled2 = GetInstanceLockTimeRemainingEncounter(j);
					if not isKilled2 then 
						return (isKilled2-1)
					end
				end
			end
		end
	end
	return 0
end

local function handler(msg, editbox) 
	if msg == "status" or msg == "state" then
		if aktiv == 1 then
			ChatFrame1:AddMessage(L["ENABLED"]);
		else
			ChatFrame1:AddMessage(L["DISABLED"]);
		end
	elseif msg == "off" or msg == "aus" then
		aktiv = 0
	elseif msg == "on" or msg == "ein" then
		aktiv = 1
	elseif msg == "check" then
		checkUpdate();
	elseif msg:find("setzahl") ~= nil then
		local setv = tonumber(msg:sub(9));
		mynumber = setv
	elseif msg == "zahl" or msg == "number" then
		ChatFrame1:AddMessage(mynumber);
	elseif msg == "getlang" then
		ChatFrame1:AddMessage("Language: "..rbm_elang);
	elseif msg == "author" or msg == "autor" then
		ChatFrame1:AddMessage(L["AUTHOR1"]);
		ChatFrame1:AddMessage(L["AUTHOR2"]);
	elseif msg == "test" then
		--print(getLastDeadBoss());
		print(RBM_Mainframe:IsVisible());
	elseif msg == "checks" then
		SendAddonMessage( "RBMCheck", "foo" , "GUILD" );
		if GetNumPartyMembers() > 0 then
			SendAddonMessage( "RBMCheck", "foo" , "PARTY" );
			SendAddonMessage( "RBMCheck", "foo" , "RAID" );
		end
	elseif msg == "resetlang" then
		resetLang();
	elseif msg == "toggle" then 
		if RBM_Mainframe:IsVisible() then
			RBM_Mainframe:Hide();
		else
			RBM_Mainframe:Show();
		end
	elseif msg == "show" then
		RBM_Mainframe:Show();
	elseif msg == "hide" then
		RBM_Mainframe:Hide();
	elseif msg == "minioff" then
		rbm_showminimap = false
		RBMMinimapButton:Hide()
	elseif msg == "minion" then
		rbm_showminimap = true
		RBMMinimapButton:Show()
	else
		ChatFrame1:AddMessage("RobBossMods Version "..rbm_displayversion);
		ChatFrame1:AddMessage(L["MENU_RESETLANG"]);
		ChatFrame1:AddMessage(L["MENU_AUTHOR"]);
		ChatFrame1:AddMessage(L["MENU_HINT1"]);		
		ChatFrame1:AddMessage(L["MENU_MINIMAP_OFF"]);
		ChatFrame1:AddMessage(L["MENU_MINIMAP_ON"]);
		ChatFrame1:AddMessage(L["MENU_FRAME_ON"]);
		ChatFrame1:AddMessage(L["MENU_FRAME_OFF"]);
		ChatFrame1:AddMessage(L["MENU_FRAME_TOGGLE"]);
	end
end

local final_bosses = { 39705, 40484, 42333, 49541, 43875, 44819, 39378, 40792, 46964 , 52148, 23863}
local bosses = { 39665 , 39679, 39698, 39700, 39705 , -1 , 
	39625, 40177, 40319, 40484, -1,
	43438, 43214, 42188, 42333, -1,
	47162, 47297, 43778, 47626, 47739, 49541, -1 ,
	43878, 43873, 43875, -1 ,
	44577, 43614, 43612, 44819, -1,
	39425, 39428, 39788, 39587, 39731, 39732, 39378, -1,
	40586, 40765, 40825, 40792, -1,
	46962, 3887, 4278, 46963, 46964 , -1 ,
	52155, 52151, 52271, 52059,	52053, 52148, -1 ,
	23574, 23576, 23578, 23577, 24239, 23863, -1 }

-- Functions Section 
local bosses_label 

local function getType(ggx)
	local B = tonumber(string.sub(ggx,5,5), 16);
	local maskedB = B % 8;
	return maskedB
end

local function getNPCId(ggg)
	local B = tonumber(string.sub(ggg,-12,-9), 16);
	local maskedB = B % 8;
	return B
end

local function doBossPost(channel,reci) 
	
	if lastboss == nil then
		StaticPopupDialogs["RBM_NOBOSS"] = {
			text = L["NOBOSS"],
			button1 = "okay",
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
		}
		if channel ~= "WHISPER" then
			StaticPopup_Show ("RBM_NOBOSS")
		end
		return
	end
	--bosses
	
	local toPostString
	if rbm_customTactics["T"..tostring(lastboss)] == nil then
		toPostString = L["T"..tostring(lastboss)]
	else
		toPostString = rbm_customTactics["T"..tostring(lastboss)]
	end
	
	if channel == "MYSELF" then
		ChatFrame1:AddMessage(L["TACTICS"]..boss_label[lastboss]..": ");
	else
		SendChatMessage(L["TACTICS"]..boss_label[lastboss]..": ", channel, nil, reci);
	end
	toPostString = parseSpellID(toPostString);
	--announce an split 
	local announceStrings = {""}
	for line in string.gmatch(toPostString,"[^\n]+") do
		local iarr = spelllinkBreak(line)
		for i=1,#iarr,1 do
			local word = iarr[i]
			if strlen(announceStrings[#announceStrings])+1+strlen(word) > 255 then
				tinsert(announceStrings, word)
			else
				if strlen(announceStrings[#announceStrings]) > 0 then
					announceStrings[#announceStrings] = announceStrings[#announceStrings].." "..word
				else
					announceStrings[#announceStrings] = word
				end
			end
		end
		tinsert(announceStrings, "")
	end
	for _, msg in ipairs(announceStrings) do
		if channel == "MYSELF" then
			ChatFrame1:AddMessage(msg);
		else
			SendChatMessage(msg, channel, nil, reci);
		end
	end
	
end	

local function IsEndboss(bo)
	local gefunden = false
	for i,v in ipairs(final_bosses) do
		if bo == v then
			gefunden = true
		end
	end
	return gefunden
end

--DEV



--ENDDEV
function RBM_tellHint() 
	if rbm_tellgrid ~= nil then
		if rbm_tellgrid["hintonce"] == nil then
			SendChatMessage(L["DONTKNOW"], "PARTY",nil,nil)
		else
			SendChatMessage(rbm_tellgrid["hintonce"], "PARTY",nil,nil)
		end
	else
		SendChatMessage(L["DONTKNOW"], "PARTY",nil,nil)
	end
end

local info = {}

function RBM_SetBossLabel()
	if lastboss == nil then 
		print(L["NOBOSS"]);
		RBM_CurrentBoss_Frame:SetText(L["NOBOSS"]);
	else
		RBM_CurrentBoss_Frame:SetText(boss_label[lastboss]);
	end
end


local menuFrame2 = CreateFrame("Frame", "RBM_TitleDropDownMenuRight")
menuFrame2.displayMode = "MENU"
menuFrame2.initialize = function(self, level) 
 if not level then return end
    wipe(info)
    if level == 1 then
        -- Create the title of the menu
        info.isTitle = 1
        info.text = "RobBossMods"
        info.notCheckable = 1
        UIDropDownMenu_AddButton(info, level)
		
		info.isTitle = 1
		if lastboss == nil then
			info.text = L["CURRENTBOSS"]..": "..L["NONE"]
		else
			info.text = L["CURRENTBOSS"]..": "..boss_label[lastboss]
		end
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		
		info.disabled     = nil
        info.isTitle      = nil
        info.notCheckable = nil

		info.hasArrow = 1
		for k,_ in pairs(zones) do
			info.text = k
			info.value = "N-"..k
			UIDropDownMenu_AddButton(info, level)
		end
		
		info.isTitle = nil
		info.text = "Raid"
		info.value = "raid"
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		
		  -- Close menu item
        info.hasArrow     = nil
        info.value        = nil
        info.notCheckable = 1
        info.text         = CLOSE
        info.func         = self.HideMenu
        UIDropDownMenu_AddButton(info, level)

		
    elseif level == 2 then
		if UIDROPDOWNMENU_MENU_VALUE == "raid" then 
			for k,_ in pairs(raid_zones) do
				info.hasArrow = 1
				info.text = k
				info.value = "R-"..k
				UIDropDownMenu_AddButton(info, level)
			end
		elseif UIDROPDOWNMENU_MENU_VALUE:sub(1,1) == "N" then
			for k,v in pairs(zones[UIDROPDOWNMENU_MENU_VALUE:sub(3)]) do
				info.text = boss_label[v]
				info.func = function()
					lastboss = v,
					RBM_CurrentBoss_Frame:SetText(boss_label[v]);
					CloseDropDownMenus()
				end
				UIDropDownMenu_AddButton(info, level)
			end
		end
    elseif level == 3 then
		for k,v in pairs(raid_zones[UIDROPDOWNMENU_MENU_VALUE:sub(3)]) do
			info.text = boss_label[v]
			info.func = function()
				lastboss = v,
				RBM_CurrentBoss_Frame:SetText(boss_label[v]);
				CloseDropDownMenus()
			end
			UIDropDownMenu_AddButton(info, level)
		end
	end
end


function RBM_UncheckAll(self) 
	RBM_Check_Party:SetChecked(false);
	RBM_Check_Guild:SetChecked(false);
	RBM_Check_Myself:SetChecked(false);
	RBM_Check_Officer:SetChecked(false);

	self:SetChecked(true);
end
	
	

function RBMButton_OnClick(self, button)
  if(button=="LeftButton")then
    --nuFrame = CreateFrame("Frame", "ExampleMenuFrame", UIParent, "UIDropDownMenuTemplate")
    --ToggleDropDownMenu(1, nil, menuFrame1, self:GetName(), 0, 0)
	if RBM_Mainframe:IsVisible() then
		RBM_Mainframe:Hide();
	else
		RBM_Mainframe:Show();
	end
  else
    --ToggleDropDownMenu(1, nil menuFrame2, self:GetName(), 0, 0)
	InterfaceOptionsFrame_OpenToCategory("RobBossMods");
  end
end

function RBMButton1_OnClick(self, button)
    ToggleDropDownMenu(1, nil, menuFrame2, self:GetName(), 0, 0)
	
end


function frame:OnEvent(event,...)
		-- I log in and greet the guild, depending which time it is, see below
		if event == "PLAYER_LOGIN" then
			RegisterAddonMessagePrefix("RBMPing")
			RegisterAddonMessagePrefix("RBMPong")
			RegisterAddonMessagePrefix("RBMCheckA")
			RegisterAddonMessagePrefix("RBMVersion")
			RegisterAddonMessagePrefix("RBMCheck")
			
			
			
			--if rbm_tellnextboss == nil then
				rbm_tellnextboss = false
			--end
			if rbm_showminimap == nil then
				rbm_showminimap = true
			end
			if rbm_telleveryboss == nil then
				rbm_telleveryboss = false
			end
			if rbm_whispermode == nil then
				rbm_whispermode = false
			end
			if rbm_tellgrid == nil then
				rbm_tellgrid = {}
			end
			if rbm_showframe == nil then
				rbm_showframe = false
			end
			if rbm_nevershow == nil then
				rbm_nevershow = false
			end
			--[[if rbm_oncetold == nil and (rbm_elang=="de" or GetLocale()== "deDE") then
				rbm_oncetold = 1
					StaticPopupDialogs["RBM_ONCE"] = {
					text = "Hallo an alle deutschen Spieler.\n\nIch habe ein persoenliches Anliegen. Ich (Magier) einen Horderaid.\nIch wuerde gern auf einen Server gehen, auf dem "..
					"die Horde Seite nicht so leer ist und die Stimmung nicht ganz so kiddy like ist. \n\nDesweiteren ist es mir egal ob PVP oder PVE Server. Ich moechte maximal 2 mal in der Woche raiden. Am besten ware auch wenn ein Hunter oder Shami Heal Platz noch frei waere dann wuerde noch ein oder zwei Freunde mit kommen\n\n"..
					"Solltet ihr also einen PVP oder PVE Server kennen, der auf Horde Seite gut gefuellt ist und es eine Gilde geben, die oben genannten Klassen sucht, waere es toll wenn ihr euch meldet unter robert@keinerspieltmitmir.de\n\ndetaillierte Bewerbungen schreiben wir dann natuerlich ( alle seit Classic Erfahrung)",
					button1 = "OK",
					--button2 = "No, I'll do that later",
					timeout = 0,
					whileDead = true,
					hideOnEscape = true,
				}
				StaticPopup_Show ("RBM_ONCE")
			end--]]
			if rbm_showminimap then 
				RBMMinimapButton:Show()
			else
				RBMMinimapButton:Hide()
			end
			L = LibStub("AceLocale-3.0"):GetLocale("RobBossMods")
			if rbm_minimapcords ~= nil then 
				if rbm_minimapcords[1] == 1 then
					RBMMinimapButton:SetPoint("CENTER", UIParent, "BOTTOMLEFT",rbm_minimapcords[2], rbm_minimapcords[3]);
				else
					RBMMinimapButton:SetPoint("CENTER", Minimap, "TOPRIGHT", rbm_minimapcords[2], rbm_minimapcords[3]);
				end
			end
			
			RBM_Mainframe_Init();
			
			RBM_createBlizzOptions();
			ldb = LibStub:GetLibrary("LibDataBroker-1.1")
			dataobj = ldb:NewDataObject("RobBossMods", {
				type = "launcher",
				label = "Rob Boss Mods",
				icon = "Interface\\Icons\\Spell_Nature_StormReach",
				tooltiptext = "RobBossMods",
				OnClick = function(clickedframe, button)
					if button == "LeftButton" then
						if RBM_Mainframe:IsVisible() then
							RBM_Mainframe:Hide();
						else
							RBM_Mainframe:Show();
						end
					else
						InterfaceOptionsFrame_OpenToCategory("RobBossMods");
					end
				end,
			})

			myname = UnitName("player");
			lang = GetLocale();
			if GetNumPartyMembers() > 0 then
				aktiv = 1
				SendAddonMessage( "RBMPing", mynumber, "PARTY" );
			end
			if rbm_elang == nil and lang == "enUS" then
				StaticPopupDialogs["RBM_LANGC"] = {
				text = "RBM: You run the UK or US Client. In What language do you want the boss explanation to appear?",
				button1 = "English",
				button2 = "German",
				OnAccept = function()
					rbm_elang = lang:sub(1,2)
					StaticPopup_Show ("RBM_LANGCONFIRM")
				end,
				OnCancel = function()
					rbm_elang = "de"
					StaticPopup_Show ("RBM_LANGCONFIRM")
				end,
				timeout = 0,
				whileDead = true,
				hideOnEscape = true,
				}
				--hint to reloadui after changed the global var
				StaticPopupDialogs["RBM_LANGCONFIRM"] = {
				text = "The Language change wont take effect until you restart UI. Restart UI now?",
				button1 = "Reload UI",
				button2 = "No, I'll do that later",
				OnAccept = function()
				ReloadUI();
				end,
				timeout = 0,
				whileDead = true,
				hideOnEscape = true,
				}
				StaticPopup_Show ("RBM_LANGC")
				
			elseif rbm_elang == nil and lang == "deDE" then
				rbm_elang = "de" 
			end
		elseif event == "INSTANCE_LOCK_START" then
				--print(getLastDeadBoss());
		elseif event == "PLAYER_REGEN_ENABLED" then
			if rbm_showframe and (GetNumPartyMembers() > 0 or GetNumRaidMembers() > 0) and precombat ~=nil then
				RBM_Mainframe:Show();
			end
			incombat = false
		elseif event == "PLAYER_REGEN_DISABLED" then
			incombat = true
			precombat = RBM_Mainframe:IsVisible();
			RBM_Mainframe:Hide();
		elseif event == "ZONE_CHANGED_NEW_AREA" then
			local whereami = GetInstanceInfo();
			local temp_zones = {}
			local visited_place = false
			for k,v in pairs(zones) do temp_zones[k] = v end
			for k,v in pairs(raid_zones) do temp_zones[k] = v end
			for k,_ in pairs(temp_zones) do
				if k == whereami then
					visited_place = true
					if rbm_showframe then
						RBM_Mainframe:Show();
					end
					local bossdown = 0
					for k = 1,GetNumSavedInstances(),1 do
						local name, id, reset, difficulty, locked, extended, instanceIDMostSig, isRaid, maxPlayers, difficultyName, numEncounters, encounterProgress = GetSavedInstanceInfo(k)
						if (reset > 0 or locked) and encounterProgress > 0 and name == GetInstanceInfo() and encounterProgress < numEncounters then
							bossdown = encounterProgress
							checkUpdate();
							ChatFrame1:AddMessage(name.." "..encounterProgress.."/"..numEncounters);
						end
					end
					for i = 1, bossdown, 1 do
						boss_dead[temp_zones[k][i]] = 1
					end
					lastboss = temp_zones[k][bossdown+1]
					RBM_CurrentBoss_Frame:SetText(boss_label[temp_zones[k][bossdown+1]]);
					ChatFrame1:AddMessage("RobBossMods: "..k.." loaded.");
					havetotell = true
				end
			end
			if not visited_place then
				RBM_Mainframe:Hide();
			end
			--[[local whereami, itype = GetInstanceInfo();
			-- 5 man instances
			if itype == "party" then
				if lastinstance == nil then
					lastinstance = whereami
				end
				ChatFrame1:AddMessage(whereami.." "..itype.." "..lastinstance);
				if lastinstance ~= whereami then
					--reset the progressCounter
					local bossdown = 0
					lastboss = zones[whereami][bossdown+1]
					if lastboss == nil then
						lastboss = 0 
						ChatFrame1:AddMessage("RobBossMods: "..whereami.." not implemented. ");
					else
						ChatFrame1:AddMessage("RobBossMods: "..whereami.." loaded. ");
					end
				else
					--count dead bosses
					local encounterProgress = 0
					local lastdead = nil
					local limes = 0
					if zones[whereami] ~= nil then
						limes = #zones[whereami]
					end
					for k= limes, 1,-1 do
						if boss_dead[zones[whereami][k]] --[[ == 1 then
							encounterProgress = encounterProgress + 1
							if lastdead == nil then
								lastdead = k
							end
						end
					end
					if lastdead == nil then
						lastdead = 0
					end
					if lastdead < limes and zones[whereami] ~= nil then
						lastboss = zones[whereami][lastdead+1]
					elseif lastdead >= limes and zones[whereami] ~= nil then
						lastboss = zones[whereami][#zones[whereami]] --[[
					end
					if limes > 0 then
						ChatFrame1:AddMessage("RobBossMods: "..whereami.." ("..encounterProgress.."/"..limes..") loaded. ");
					else
						ChatFrame1:AddMessage("RobBossMods: "..whereami.." not implemented (yet?). ");
					end
				end
			elseif itype == "raid" then
				for k,_ in pairs(raid_zones) do
					if k == whereami then
						local bossdown = 0
						for k = 1,GetNumSavedInstances(),1 do
							local name, id, reset, difficulty, locked, extended, instanceIDMostSig, isRaid, maxPlayers, difficultyName, numEncounters, encounterProgress = GetSavedInstanceInfo(k)
							if (reset > 0 or locked) and encounterProgress > 0 and name == GetInstanceInfo() then
								bossdown = encounterProgress
								checkUpdate();
								ChatFrame1:AddMessage(name.." "..encounterProgress.."/"..numEncounters);
							end
						end
						for i = 1, bossdown, 1 do
							boss_dead[raid_zones[k][i]]--[[ = 1
						end
						lastboss = raid_zones[k][bossdown+1]
						ChatFrame1:AddMessage("RobBossMods: "..k.." loaded.");
						havetotell = true
					end
				end
			end--]]
		elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
			local a,b,c,d,e,f,g,h = ...
			if b == "UNIT_DIED" then
				local nid = getNPCId(g);
				--ChatFrame1:AddMessage(g.." ist gestorben ID "..nid);
				local gefunden = false
				for i,v in ipairs(bosses) do 
					if nid == v then 
						gefunden = true
						boss_dead[nid] = 1
						if IsEndboss(nid) and aktiv == 1 and rbm_tellnextboss then
							SendChatMessage(boss_label[bosses[i]]..L["LASTBOSS"], "PARTY", nil, reci);
						elseif nid ~= 47297 then
							lastboss = bosses[i+1]
							RBM_CurrentBoss_Frame:SetText(boss_label[bosses[i+1]]);
							if aktiv == 1 and rbm_tellnextboss == true then
								SendChatMessage(boss_label[bosses[i]]..L["BOSS_DEAD1"]..boss_label[bosses[i+1]]..L["BOSS_DEAD2"], "PARTY", nil, reci);
							end
						end
						if bosses[i] == 47626 then
							lastboss = 47739
							RBM_CurrentBoss_Frame:SetText(boss_label[47739]);
						end
					end
				end
				if gefunden == false then
					if nid == 42172 and aktiv == 1 and rbm_tellnextboss then
						SendChatMessage(L["S_OZUMAT"], "PARTY", nil, reci);
					elseif nid == 40788 and aktiv == 1 and rbm_tellnextboss then
						lastboss = 40792
						RBM_CurrentBoss_Frame:SetText(boss_label[40792]);
						SendChatMessage(L["S_GHUR"], "PARTY", nil, reci);
					elseif nid == 47296 and aktiv == 1 and rbm_tellnextboss then
						lastboss = 43778
						RBM_CurrentBoss_Frame:SetText(boss_label[43778]);
						SendChatMessage(L["S_HELIX"], "PARTY", nil, reci);
					end
				end
			end
		elseif event == "PARTY_MEMBERS_CHANGED" then 
			already_told = {}
			if GetNumPartyMembers() == 0 then
				boss_dead = {}
				aktiv = 1
				--ChatFrame1:AddMessage("RobBossMods: aktiv")
			else
				aktiv = 1
				--aushandeln
				SendAddonMessage( "RBMPing", mynumber, "PARTY" );
				partymember = GetNumPartyMembers()
			end
		elseif event == "CHAT_MSG_ADDON" then
			local pref,msg1,kanal,sender = ...
			--ChatFrame1:AddMessage(pref.." "..msg1.." "..kanal);
			--if sender == "RobBossMods"  then
			if pref == "RBMPing"  then
				lastping = GetTime();
				--ChatFrame1:AddMessage("Empfange Ping mache pong" );
				aktiv = 1
				SendAddonMessage( "RBMPong", mynumber, "PARTY" );
			elseif pref == "RBMPong" then
				--ChatFrame1:AddMessage("Empfange pong von "..sender.." mit Wert: "..tonumber(msg1) );
				--auswerten 
				local rndtime = tonumber(msg1)
				if tonumber(msg1) < mynumber then
					--ChatFrame1:AddMessage("schalte mich ab");
					aktiv = 0
				else
					--ChatFrame1:AddMessage("bleibe aktiv");
				end
			elseif pref == "RBMCheckA" then
				local wer,was = string.split("#",msg1)
				if wer == myname then
					ChatFrame1:AddMessage(sender.."("..kanal.."): "..was);
				end
			elseif pref == "RBMCheck" then
				SendAddonMessage("RBMCheckA", sender.."#"..tostring(rbm_version), kanal);
			--update
			elseif pref == "RBMVersion" and sender ~= myname then
				--message("L: "..rbm_version.."  R: "..tonumber(msg1));
				if tonumber(msg1) > rbm_version and update_told == 0 then
					update_told = 1
					local totext = ""
					totext = L["NEW_VER1"]..rbm_version..L["NEW_VER2"]..tonumber(msg1)
					StaticPopupDialogs["RBM_NEWVER"] = {
					text = totext,
					button1 = "Ok",
					timeout = 0,
					whileDead = true,
					hideOnEscape = true,
					}
					StaticPopup_Show ("RBM_NEWVER")
					--message("Du hast RBM Version "..rbm_version.." installiert. Es gibt eine neue Version: "..tonumber(msg1));
				end
			end
		elseif event == "PLAYER_TARGET_CHANGED" then
			local uname = UnitName("target")
			if uname == nil then
				if not rbm_showframe then
					RBM_Mainframe:Hide();
				end
				return
			end
			local guid = UnitGUID("target");
			--ChatFrame1:AddMessage(guid.."  Typ: "..getType(guid).." NPC ID: "..getNPCId(guid));
			local nid = getNPCId(guid);
			if getType(guid) ~=3 and getType(guid) ~= 5 then
				if not rbm_showframe then
					RBM_Mainframe:Hide();
				end
				return 
			end
			--ChatFrame1:AddMessage("NID "..nid);
			local checkv
			if lastSpoken[nid] == nil then
				checkv = 0
			else 	
				checkv = lastSpoken[nid]
			end
			if checkv == 0 then
				local visited_loop = false
				for i,v in ipairs(bosses) do 
					if nid == v and boss_dead[nid] == nil then
						visited_loop = true
						lastboss = nid
						RBM_CurrentBoss_Frame:SetText(boss_label[v]);
						if not incombat and not rbm_nevershow then
							RBM_Mainframe:Show();
						end
						if aktiv == 1 and rbm_telleveryboss and already_told[nid] == nil then
							local tosend 
							if rbm_tellgrid ~= nil then
								if rbm_tellgrid["hintevery"] == nil then
									SendChatMessage(L["DONTKNOW_OLD"],"PARTY",nil,nil);
								else
									SendChatMessage(rbm_tellgrid["hintevery"],"PARTY",nil,nil);
								end
							else
								SendChatMessage(L["DONTKNOW_OLD"],"PARTY",nil,nil);
							end
							lastSpoken[nid] = GetTime();
						end
					end
				end
				if not visited_loop and not rbm_showframe then
					RBM_Mainframe:Hide();
				end
			end
			
		elseif (event == "CHAT_MSG_PARTY" or event == "CHAT_MSG_PARTY_LEADER") and aktiv == 1 then
			local ms,msender = ...
			if ms == "!boss" and (GetTime() - lastbossplot > 15 or rbm_whispermode) then
				if lastboss == nil then
					--nop
				elseif rbm_whispermode then
					doBossPost("WHISPER",msender);
				else
					doBossPost("PARTY");
					already_told[lastboss] = 1
				end
				lastbossplot = GetTime();
				if lastboss == nil then
					lastbossplot = 0
				end
			elseif ms == "!rbminfo" then 
				if rbm_elang == "de" then
					SendChatMessage("RobBossMods v"..rbm_displayversion.." Mehr Infos unter www.keinerspieltmitmir.de/rbm ","PARTY", nil, autor);
				else
					SendChatMessage("RobBossMods v"..rbm_displayversion.." More Information on www.keinerspieltmitmir.de/rbm ","PARTY", nil, autor);
				end
			end
		elseif event == "CHAT_MSG_WHISPER" then
			local lmes, author = ...
			if lmes == "!rbminfo" then 
				if rbm_elang == "de" then
					SendChatMessage("RobBossMods v"..rbm_displayversion.." Mehr Infos unter www.keinerspieltmitmir.de/rbm ","WHISPER", nil, author);
				else
					SendChatMessage("RobBossMods v"..rbm_displayversion.." More Information on www.keinerspieltmitmir.de/rbm ","WHISPER", nil, author);
				end
			elseif lmes == "!boss" then
				doBossPost("WHISPER", author);
			end
		end
end

--Configuration

	local function getgen(info)
		local ns,opt = string.split(".", info.arg)
		if tonumber(opt) == 1 then
			return rbm_showframe
		elseif tonumber(opt) == 2 then
			return rbm_telleveryboss
		elseif tonumber(opt) == 3 then
			return rbm_showminimap
		elseif tonumber(opt) == 4 then
			return rbm_whispermode
		elseif tonumber(opt) == 5 then
			return rbm_nevershow
		end
	end

	local function setgen(info, arg1, arg2, arg3, arg4)
		local ns,opt = string.split(".", info.arg)
		if tonumber(opt) == 1 then
			rbm_showframe = not rbm_showframe
			if rbm_showframe then
				rbm_nevershow = false
			end
		elseif tonumber(opt) == 2 then
			rbm_telleveryboss = not rbm_telleveryboss
		elseif tonumber(opt) == 3 then
			rbm_showminimap = not rbm_showminimap
			if rbm_showminimap then
				RBMMinimapButton:Show();
			else
				RBMMinimapButton:Hide();
			end	
		elseif tonumber(opt) == 4 then
			rbm_whispermode = not rbm_whispermode
		elseif tonumber(opt) == 5 then
			rbm_nevershow = not rbm_nevershow
			if rbm_nevershow then
				rbm_showframe = false
				RBM_Mainframe:Hide();
				if GetLocale() == "deDE" then
					StaticPopupDialogs["RBM_ONCE"] = {
						text = "ACHTUNG! Das Fenster wird dann nur noch erscheinen, wenn du auf das MinimapSymbol / BrokerSymbol drückst oder /rbm show in den Chat eingibst!",
						button1 = "OK",
						--button2 = "No, I'll do that later",
						timeout = 0,
						whileDead = true,
						hideOnEscape = true,
					}
				else
					StaticPopupDialogs["RBM_ONCE"] = {
						text = "WARNING! The RBM MainWindow will now ONLY appear when you click on MinimapIcon/BrokerIcon or you type /rbm show in Chat",
						button1 = "OK",
						--button2 = "No, I'll do that later",
						timeout = 0,
						whileDead = true,
						hideOnEscape = true,
					}
				end
				StaticPopup_Show ("RBM_ONCE")
			end
		end
	end

function RBM_CheckNeverFunc() 
	rbm_nevershow = RBM_Check_Never:GetChecked();
	if rbm_nevershow then
		rbm_showframe = false
		RBM_Mainframe:Hide();
		if GetLocale() == "deDE" then
			StaticPopupDialogs["RBM_ONCE"] = {
				text = "ACHTUNG! Das Fenster wird dann nur noch erscheinen, wenn du auf das MinimapSymbol / BrokerSymbol drückst oder /rbm show in den Chat eingibst!",
				button1 = "OK",
				--button2 = "No, I'll do that later",
				timeout = 0,
				whileDead = true,
				hideOnEscape = true,
			}
		else
			StaticPopupDialogs["RBM_ONCE"] = {
				text = "WARNING! The RBM MainWindow will now ONLY appear when you click on MinimapIcon/BrokerIcon or you type /rbm show in Chat",
				button1 = "OK",
				--button2 = "No, I'll do that later",
				timeout = 0,
				whileDead = true,
				hideOnEscape = true,
			}
		end
		StaticPopup_Show ("RBM_ONCE")
	end
end
	
local function createconfig()	

	local options = {}
	options.type = "group"
	options.name = "Rob Boss Mods"
	options.args = {}
	-- local settings saved in  rbm_customTactics
	if rbm_customTactics == nil then
		rbm_customTactics = {}
	end
	
	
		
		local iterator = 0
		
		options.args.a = {
			type = "group",
			name = L["MENU_GENERAL"],
			desc = L["MENU_GENERAL"],
			get = getgen,
			set = setgen,
			order = 1,
			args = {
				nextboss = {
					order = 1,
					type = "toggle",
					name = L["ALWAYS_SHOW_FRAME"],
					desc = L["ALWAYS_SHOW_FRAME_DESC"],
					width = "double",
					arg = "option.1",
				},	
				nevershow = {
					order = 2,
					type = "toggle",
					name = L["NEVER_SHOW_FRAME"],
					desc = L["NEVER_SHOW_FRAME_DESC"],
					width = "double",
					arg = "option.5",
				},						
				targetboss = {
					order = 3,
					type = "toggle",
					name = L["EVERY_BOSS_ANNOUNCE"],
					desc = L["EVERY_BOSS_ANNOUNCE_DESC"],
					width = "double",
					arg = "option.2",
				},
				minimapopt = {
					order = 4,
					type = "toggle",
					name = L["MINIMAP_SHOW"],
					desc = L["MINIMAP_SHOW"],
					width = "double",
					arg = "option.3",
				},
				whispermode = {
					order = 5,
					type = "toggle",
					name = L["WHISPER_MODE"],
					desc = L["WHISPER_MODE_DESC"],
					width = "double",
					arg = "option.4",
				},
				hintonce = {
					order = 6,
					type = "input",
					name = L["HINTONCE"],
					desc = L["HINTONCE_DESC"],
					arg = "hintonce",
					width = "full",
					multiline = true,
					get = function(info)
						if rbm_tellgrid[info.arg] == nil then
							return L["DONTKNOW"]
						else
							return rbm_tellgrid[info.arg]
						end
					end,
					set = function(info, value)
						rbm_tellgrid[info.arg] = value
					end, 
				},
				hintevery = {
					order = 7,
					type = "input",
					name = L["HINTEVERY"],
					desc = L["HINTEVERY_DESC"],
					arg = "hintevery",
					width = "full",
					multiline = true,
					get = function(info)
						if rbm_tellgrid[info.arg] == nil then
							return L["DONTKNOW_OLD"]
						else
							return rbm_tellgrid[info.arg]
						end
					end,
					set = function(info, value)
						rbm_tellgrid[info.arg] = value
					end, 
				},
				reset = {
					order = 8,
					type = "execute",
					name = L["RESET_CUSTOM"],
					desc = L["RESET_CUSTOM_DESC"],
					func = function()
						rbm_customTactics = {}
						rbm_tellgrid = {}
					end,
				},
			},
		}
		
		for k,v in pairs(zones) do 
			options.args[k] = {
				type = "group",
				name = k,
				desc = k,
				--set = set,
				--get = get,
				args = {},
				order = iterator +2,
			}
			local it2 = 0
			for r,t in pairs(v) do
				options.args[k].args[tostring(t)] = {
					type = "input",
					order = it2+2,
					name = boss_label[t],
					desc = boss_label[t],
					arg = iterator.."."..t,
					width = "full",
					multiline = true,
					get = function(info)
						local ns,opt = string.split(".", info.arg)
						if rbm_customTactics["T"..opt] == nil then
							return L["T"..opt]
						else
							return rbm_customTactics["T"..opt]
						end
					end,
					set = function(info, value)
						local ns,opt = string.split(".", info.arg)
						rbm_customTactics["T"..opt] = value
					end, 
				}
				it2 = it2 +1
			end
			iterator = iterator + 1
		end
		
		--raid boss
		for k,v in pairs(raid_zones) do 
			options.args[k] = {
				type = "group",
				name = k,
				desc = k,
				--set = set,
				--get = get,
				args = {},
				order = iterator +2,
			}
			local it2 = 0
			for r,t in pairs(v) do
				options.args[k].args[tostring(t)] = {
					type = "input",
					order = it2+2,
					name = boss_label[t],
					desc = boss_label[t],
					arg = iterator.."."..t,
					width = "full",
					multiline = true,
					get = function(info)
						local ns,opt = string.split(".", info.arg)
						if rbm_customTactics["T"..opt] == nil then
							return L["T"..opt]
						else
							return rbm_customTactics["T"..opt]
						end
					end,
					set = function(info, value)
						local ns,opt = string.split(".", info.arg)
						rbm_customTactics["T"..opt] = value
					end, 
				}
				it2 = it2 +1
			end
			iterator = iterator + 1
		end
	
	
	return options
end

local config = LibStub("AceConfig-3.0")
local dialog = LibStub("AceConfigDialog-3.0")
local registered = false;

local options
function RBM_createBlizzOptions()
	options = createconfig()

	config:RegisterOptionsTable("RBM-Bliz", {
		name = "RobBossMods",
		type = "group",
		args = {
			help = {
				type = "description",
				name = L["MENU_DESCRIPTION"],
			},
		},
	})
	dialog:SetDefaultSize("RBM-Bliz", 600, 400)
	dialog:AddToBlizOptions("RBM-Bliz", "RobBossMods")

    --Options
	
	config:RegisterOptionsTable("RBM-GENERAL", options.args.a)
	dialog:AddToBlizOptions("RBM-GENERAL", options.args.a.name, "RobBossMods")
	
	local iterator = 0
	for k,v in pairs(zones) do
		if iterator == 0 then
			config:RegisterOptionsTable("RBM-ZONE-0", options.args[k])
			local blizzPanel = dialog:AddToBlizOptions("RBM-ZONE-0", options.args[k].name, "RobBossMods")
		end
		iterator = iterator + 1
	end

	local iterator = 0
	for k,v in pairs(zones) do
		if iterator > 0 then
			config:RegisterOptionsTable("RBM-ZONE-"..tostring(iterator), options.args[k])
			dialog:AddToBlizOptions("RBM-ZONE-"..tostring(iterator), options.args[k].name, "RobBossMods")
		end
		iterator = iterator + 1
	end
	
	for k,v in pairs(raid_zones) do
		if iterator > 0 then
			config:RegisterOptionsTable("RBM-ZONE-"..tostring(iterator), options.args[k])
			dialog:AddToBlizOptions("RBM-ZONE-"..tostring(iterator), options.args[k].name, "RobBossMods")
		end
		iterator = iterator + 1
	end
	
	
	
	return blizzPanel
end


function RBM_Mainframe_Init() 
	RBM_SetBossLabel();
	RBM_Mainframe_Button1:SetText(L["CHOICE"]);
	
	RBM_PARTY_Frame:SetText(L["PARTY"].."/"..L["RAID"]);
	RBM_GUILD_Frame:SetText(L["GUILD"]);
	RBM_MYSELF_Frame:SetText(L["MYSELF"]);
	
	RBM_Mainframe_Button2:SetText(L["POSTON"]);
	RBM_Mainframe_Button3:SetText(L["INFORM_PARTY"]);
	RBM_Mainframe_Button4:SetText("!");
	RBM_Mainframe_Button5:SetText("X");
	
	RBM_CurrentBoss_Frame_fixed:SetText(L["CURRENTBOSS"]);
	
	RBM_Check_Party:SetChecked(true);
	RBM_CLOSE_Frame:SetText(L["CLOSE_OPT"]);
	RBM_NEVER_Frame:SetText(L["NEVER_OPT"]);
	
	RBM_Check_Close:SetChecked(not rbm_showframe);
	
	RBM_CLOSE_TOOLTIP_Frame:SetText(L["CLOSE_OPT_DESC"]);
	
	ChatFrame1:AddMessage("RobBossMods: ",1.0,0.0,0.0);
	if GetLocale()== "deDE" then
		ChatFrame1:AddMessage("Sag mir was du über das neue Fenstersystem denkst auf curse.com oder auf meiner Website /rbm autor");
	else
		ChatFrame1:AddMessage("Tell me what you think about the new Window System on curse.com /rbm autor for contact information");
	end
	
end

function RBM_CheckCloseFunc()
	if RBM_Check_Close:GetChecked() then
		rbm_showframe = false
		RBM_Mainframe:Hide();
	else
		rbm_showframe = true
		rbm_nevershow = false
	end
end

function RBM_PrePost() 
	if RBM_Check_Party:GetChecked() then
		if GetNumRaidMembers() > 0 then
			doBossPost("RAID")
		elseif GetNumPartyMembers() > 0 then
			doBossPost("PARTY")
		end
	elseif  RBM_Check_Guild:GetChecked() then
		doBossPost("GUILD")
	elseif  RBM_Check_Myself:GetChecked() then
		doBossPost("MYSELF")
	elseif RBM_Check_Officer:GetChecked() then
		doBossPost("OFFICER")
	else
		StaticPopupDialogs["RBM_NOBOSS"] = {
			text = L["NOBOSS"],
			button1 = "okay",
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
		}
		StaticPopup_Show ("RBM_NOBOSS")
	end
end


--End of Configuration Frame


--- init
--ende init
SlashCmdList["RBM"] = handler;
frame:SetScript("OnEvent", frame.OnEvent)