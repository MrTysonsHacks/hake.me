--Author: Twitch
local ZnackMedusa = {}

ZnackMedusa.optionEnable = Menu.AddOption({ "Hero Specific", "ZnackMedusa. Script By Twitch"}, "Enabled", "Script by Twitch")
ZnackMedusa.optionManashield = Menu.AddOption({ "Hero Specific", "ZnackMedusa. Script By Twitch"}, "Mana Shield", "Script by Twitch")
ZnackMedusa.optionMSThreshold = Menu.AddOption({ "Hero Specific", "ZnackMedusa. Script By Twitch" }, "Manashield Treshhold", "", 10, 100, 5)

ZnackMedusa.font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)

-- delay times.
-- add more variables here if you want delays for specific parts of the code.
ZnackMedusa.nextTimes =
{
	global = 0,
	manashield = 0
}

ZnackMedusa.lastKnownHero = nil

function ZnackMedusa.ReinitializeTimes()
	for k, v in pairs(ZnackMedusa.nextTimes) do
		ZnackMedusa.nextTimes[k] = 0
	end
end

-- More options to be added later when suggested by znack

function ZnackMedusa.OnUpdate()
	if not Menu.IsEnabled(ZnackMedusa.optionEnable) then return
	end
	ZnackMedusa.hero = Heroes.GetLocal()
	if NPC.GetUnitName(ZnackMedusa.hero) ~= "npc_dota_hero_medusa" or not Entity.IsAlive(ZnackMedusa.hero) then
		return
	end
	ZnackMedusa.player = Players.GetLocal()
	ZnackMedusa.enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(ZnackMedusa.hero), Enum.TeamType.TEAM_ENEMY)
	local ZnackMedusa.manashield = NPC.GetAbilityByIndex(ZnackMedusa.hero, 3)
	if Menu.IsEnabled(ZnackMedusa.optionManashield) then
		ZnackMedusa.optionMSThreshold(ZnackMedusa.hero, Menu.GetValue(ZnackMedusa.optionMSThreshold))
	end
end

function ZnackMedusa.SaveYourShit(ZnackMedusa.hero)
	if not ZnackMedusa.hero or NPC.IsIllusion(ZnackMedusa.hero) or not Entity.IsAlive(ZnackMedusa.hero) then return false end

	if NPC.IsStunned(ZnackMedusa.hero) or NPC.IsSilenced(ZnackMedusa.hero) then return true end
	if NPC.HasState(ZnackMedusa.hero, Enum.ModifierState.MODIFIER_STATE_ROOTED) then return true end
	if NPC.HasState(ZnackMedusa.hero, Enum.ModifierState.MODIFIER_STATE_DISARMED) then return true end
	if NPC.HasState(ZnackMedusa.hero, Enum.ModifierState.MODIFIER_STATE_HEXED) then return true end
	if NPC.HasState(ZnackMedusa.hero, Enum.ModifierState.MODIFIER_STATE_PASSIVES_DISABLED) then return true end
	if NPC.HasState(ZnackMedusa.hero, Enum.ModifierState.MODIFIER_STATE_BLIND) then return true end

	if Entity.GetHealth(ZnackMedusa.hero) <= 0.2 * Entity.GetMaxHealth(ZnackMedusa.hero) then return true end

	return false
end

function ZnackMedusa.manashield(ZnackMedusa.hero, optionMSThreshold)
	if not Menu.IsEnabled(ZnackMedusa.optionEnable) then return
	end
	ZnackMedusa.hero = Heroes.GetLocal()
	if NPC.GetUnitName(ZnackMedusa.hero) ~= "npc_dota_hero_medusa" or not Entity.IsAlive(ZnackMedusa.hero) then
		return
	end
	ZnackMedusa.player = Players.GetLocal()
	ZnackMedusa.enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(ZnackMedusa.hero), Enum.TeamType.TEAM_ENEMY)
	local min = 99999
	local ZnackMedusa.manashield = NPC.GetAbilityByIndex(ZnackMedusa.hero, 3)
	local ZnackMedusa.mana = NPC.GetMana(ZnackMedusa.Hero)

	if NPC.GetMana(ZnackMedusa.hero) > 0 and NPC.GetMana(ZnackMedusa.hero) < min and ZnackMedusa.mana <= optionMSThreshold then
		min = NPC.GetMana(ZnackMedusa.hero)
	end
	if(min < 999999) and Menu.IsEnabled(ZnackMedusa.optionManashield) and Ability.IsCastable(ZnackMedusa.manashield, ZnackMedusa.mana) then
		return
	end
end



function ZnackMedusa.SaveYourShit(ZnackMedusa.hero)
	if not Menu.IsEnabled(ZnackMedusa.optionEnable) and Menu.IsEnabled(ZnackMedusa.optionManashield) then return
	end
	ZnackMedusa.hero = Heroes.GetLocal()
	if NPC.GetUnitName(ZnackMedusa.hero) ~= "npc_dota_hero_medusa" or not Entity.IsAlive(ZnackMedusa.hero) then
		return
	end
	if Huskar.lastKnownHero ~= ZnackMedusa.hero then
		Huskar.ReinitializeTimes()
		Huskar.lastKnownHero = ZnackMedusa.hero
	end
	ZnackMedusa.player = Players.GetLocal()
	ZnackMedusa.enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(ZnackMedusa.hero), Enum.TeamType.TEAM_ENEMY)
	local ZnackMedusa.manashield = NPC.GetAbilityByIndex(ZnackMedusa.hero, 3)
		if Menu.IsEnabled(ZnackMedusa.optionManashield) then
		ZnackMedusa.optionMSThreshold(ZnackMedusa.hero, Menu.GetValue(ZnackMedusa.optionMSThreshold))
	end
	if ZnackMedusa.SaveYourShit(ZnackMedusa.Hero) then Ability.CastNoTarget(ZnackMedusa.manashield) return
	end
end
return ZnackMedusa