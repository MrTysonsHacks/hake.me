--Author: Neil Tyson
local Huskar = {}

Huskar.optionEnable = Menu.AddOption({ "Hero Specific", "Huskar. Script By Neil Tyson"}, "Enabled", "Script by Neil Tyson")
Huskar.optionLifebreak = Menu.AddOption({ "Hero Specific", "Huskar. Script By Neil Tyson"}, "Auto Lifebreak", "")
Huskar.optionInnerVitality = Menu.AddOption({ "Hero Specific", "Huskar. Script By Neil Tyson"}, "Auto Inner Vitality", "")
Huskar.optionThreshold = Menu.AddOption({ "Hero Specific", "Huskar. Script By Neil Tyson" }, "Auto Inner Vitality Treshhold", "", 10, 100, 5)
Huskar.optionArmlet = Menu.AddOption({ "Hero Specific", "Huskar. Script By Neil Tyson"}, "Auto Armlet", "")
--Huskar.optionBurningSpear = Menu.AddOption({ "Hero Specific", "Huskar. Script By Neil Tyson"}, "Auto Toggle Burning Spear", "")
Huskar.optionBlademail = Menu.AddOption({ "Hero Specific", "Huskar. Script By Neil Tyson"}, "Auto Blademail", "")
Huskar.optionBlackKingBar = Menu.AddOption({ "Hero Specific", "Huskar. Script By Neil Tyson"}, "Auto Black King Bar", "")
Huskar.optionKey = Menu.AddKeyOption({ "Hero Specific", "Huskar. Script By Neil Tyson"}, "Key", Enum.ButtonCode.KEY_F)
Huskar.optionVersion = Menu.AddOption({ "Hero Specific","Huskar. Script By Neil Tyson" }, "Version", "Author: Neil deGrasse Tyson", 2, 2, 2)

Huskar.font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)

-- More options to be added later when suggested

function Huskar.OnUpdate()
	local myHero = Heroes.GetLocal()
	local innervitality = NPC.GetAbilityByIndex(myHero, 0)
	local myHero = Heroes.GetLocal()
	if not Menu.IsEnabled(Huskar.optionEnable) then return end
		if Menu.IsKeyDown(Huskar.optionKey) then
			Huskar.Combo()
		end
		if Menu.IsEnabled(Huskar.optionInnerVitality) then
			Huskar.innervitality(myHero, optionInnerVitality, Menu.GetValue(Huskar.optionThreshold))
		end
end

function Huskar.innervitality(myHero, optionInnerVitality, optionThreshold)
	local min = 99999
	local myHero = Heroes.GetLocal()
	local innervitality = NPC.GetAbilityByIndex(myHero, 0)
   	local percentage = math.floor(Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero) * 100)

    if Entity.GetHealth(myHero) > 0 and Entity.GetHealth(myHero) < min and percentage <= optionThreshold then
       	min = Entity.GetHealth(myHero)
    end
    if(min < 99999) and Menu.IsEnabled(Huskar.optionInnerVitality) then
     Ability.CastTarget(innervitality, myHero)
     return
   end
end


function Huskar.Combo(myHero, myMana)

	local myHero = Heroes.GetLocal()

	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_huskar" then return end

	local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)

	local heroPos = Entity.GetAbsOrigin(hero)

	if (GameRules.GetGameTime() + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + NetChannel.GetAvgLatency(Enum.Flow.FLOW_INCOMING) - time) < delay then return end

	--Abilities
	--local innervitality = NPC.GetAbilityByIndex(myHero, 0)
	local burningspear = NPC.GetAbilityByIndex(myHero, 1)
	local berserkerblood = NPC.GetAbilityByIndex(myHero, 2)
	local lifebreak = NPC.GetAbilityByIndex(myHero, 3)

	--Items
	local armlet = NPC.GetItem(myHero, "item_armlet", true)
	local blademail = NPC.GetItem(myHero, "item_blade_mail"), true
	local bkb = NPC.GetItem(myHero, "item_black_king_bar", true)


	local myMana = NPC.GetMana(myHero)
	local mousePos = Input.GetWorldCursorPos()

	--Inner Vitality removed for auto heal with threshold
	--if Ability.IsCastable(innervitality, myMana) and Menu.IsEnabled(Huskar.optionInnerVitality) and Menu.IsKeyDown(Huskar.optionKey)
		--then 
		--Ability.CastTarget(innervitality, myHero)
		--return 
	--end

	--Blademail
	if Ability.IsCastable(blademail, myMana) and Menu.IsEnabled(Huskar.optionBlademail) and Menu.IsKeyDown(Huskar.optionKey)
		then 
		Ability.CastNoTarget(blademail)
		return 
	end

	--Searing Arrows COMING SOON
	--if not Ability.IsCastable(burningspear, myMana) and Menu.IsEnabled(Huskar.optionBurningSpear)
		--then
		--Ability.CastTarget(burningspear, hero)
		--return
	--end

	--Life Break
	if Ability.IsCastable(lifebreak, myMana) and Menu.IsEnabled(Huskar.optionLifebreak) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(lifebreak)) and Menu.IsKeyDown(Huskar.optionKey)
		then 
		Ability.CastTarget(lifebreak, hero)
		MakeDelay(1.8)
		return 
	end

	--Black King Bar
	if Ability.IsCastable(bkb, myMana) and Menu.IsEnabled(Huskar.optionBlackKingBar) and Menu.IsKeyDown(Huskar.optionKey)
		then 
		Ability.CastNoTarget(bkb)
		MakeDelay(0.1)
		return 
	end

	--Armlet
	--To be added, seems that Hake.me doesn't have a working API for togglestate yet. Armlet rapidly toggles and will not work no matter how much I fuck with it.
	if armlet and not Ability.GetToggleState(armlet) and Menu.IsEnabled(Huskar.optionArmlet)
        then
        Ability.Toggle(armlet, true) 
        --Ghetto Mode... ACTIVATE!
        MakeDelay(20.0)
       return 
    end
end

function MakeDelay(sec)
	delay = sec
	time = GameRules.GetGameTime() + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + NetChannel.GetAvgLatency(Enum.Flow.FLOW_INCOMING)
end
--Log.Write("HUSKAR SUCCESSFULLY RELOADED FINAL????") Ignore this. It was for debugging Purposes.
return Huskar