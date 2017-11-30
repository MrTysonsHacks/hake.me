local NavySeal = {}
NavySeal.option = Menu.AddOption({"Utility", "Navy Seal" }, "Enable", "Hold the key to become a navy seal god")
NavySeal.optionKey = Menu.AddKeyOption({"Utility", "Navy Seal"}, "Key", Enum.ButtonCode.KEY_F)

function NavySeal.Reinitialize()
	for k, v in pairs(NavySeal.nextTimes) do
		NavySeal.nextTimes[k] = 0
		Log.Write("Reinitialize Function Loaded")
	end
end

function NavySeal.MakeDelay(key, sec)
	NavySeal.nextTimes[key] = GameRules.GetGameTime() + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + NetChannel.GetAvgLatency(Enum.Flow.FLOW_INCOMING) + sec
	Log.Write("Delay Function Loaded")
end

if Menu.IsEnabled(NavySeal.option) and Menu.IsKeyDown(NavySeal.optionKey)
	then
		Log.Write("Option Key Success") --Ignore this. It is for debugging Purposes.
end

if Menu.IsEnabled(NavySeal.option) and Menu.IsKeyDown(NavySeal.optionKey)
	then
	Chat.Say("DOTAChannelType_GameAll", "What the fuck did you just fucking say about me, you little bitch?")
	NavySeal.MakeDelay("global", 0.5)
	Chat.Say("DOTAChannelType_GameAll", "I’ll have you know I graduated top of my class in the Navy Seals")
	NavySeal.MakeDelay("global", 0.5)
	Chat.Say("DOTAChannelType_GameAll", "and I’ve been involved in numerous secret raids on Al-Quaeda")
	NavySeal.MakeDelay("global", 0.5)
	Chat.Say("DOTAChannelType_GameAll", "and I have over 300 confirmed kills. I am trained in gorilla warfare and I’m the top sniper in the entire US armed forces.")
	NavySeal.MakeDelay("global", 0.5)
	Chat.Say("DOTAChannelType_GameAll", "You are nothing to me but just another target.")
	NavySeal.MakeDelay("global", 0.5)
	Chat.Say("DOTAChannelType_GameAll", "I will wipe you the fuck out with precision the likes of which has never been seen before on this Earth, mark my fucking words.")
	NavySeal.MakeDelay("global", 0.5)
	Chat.Say("DOTAChannelType_GameAll", "You think you can get away with saying that shit to me over the Internet?")
	NavySeal.MakeDelay("global", 0.5)
	Chat.Say("DOTAChannelType_GameAll", "Think again, fucker.")
	NavySeal.MakeDelay("global", 0.5)
	Chat.Say("DOTAChannelType_GameAll", "As we speak I am contacting my secret network of spies across the USA and your IP is being traced right now")
	NavySeal.MakeDelay("global", 0.5)
	Chat.Say("DOTAChannelType_GameAll", "so you better prepare for the storm, maggot.")
	NavySeal.MakeDelay("global", 0.5)
	Chat.Say("DOTAChannelType_GameAll", "The storm that wipes out the pathetic little thing you call your life.")
	NavySeal.MakeDelay("global", 0.5)
	Chat.Say("DOTAChannelType_GameAll", "You’re fucking dead, kid. I can be anywhere, anytime, and I can kill you in over seven hundred ways")
	NavySeal.MakeDelay("global", 0.5)
	Chat.Say("DOTAChannelType_GameAll", "and that’s just with my bare hands.")
	NavySeal.MakeDelay("global", 0.5)
	Chat.Say("DOTAChannelType_GameAll", "Not only am I extensively trained in unarmed combat")
	NavySeal.MakeDelay("global", 0.5)
	Chat.Say("DOTAChannelType_GameAll", "but I have access to the entire arsenal of the United States Marine Corps")
	NavySeal.MakeDelay("global", 0.5)
	Chat.Say("DOTAChannelType_GameAll", "and I will use it to its full extent to wipe your miserable ass off the face of the continent, you little shit.")
	NavySeal.MakeDelay("global", 0.5)
	Chat.Say("DOTAChannelType_GameAll", "If only you could have known")
	NavySeal.MakeDelay("global", 0.5)
	Chat.Say("DOTAChannelType_GameAll", "maybe you would have held your fucking tongue")
	NavySeal.MakeDelay("global", 0.5)
	Chat.Say("DOTAChannelType_GameAll", "But you couldn’t, you didn’t, and now you’re paying the price, you goddamn idiot.")
	NavySeal.MakeDelay("global", 0.5)
	Chat.Say("DOTAChannelType_GameAll", "I will shit fury all over you and you will drown in it.")
	NavySeal.MakeDelay("global", 0.5)
	Chat.Say("DOTAChannelType_GameAll", "You’re fucking dead, kiddo.")
end
Log.Write("Script Returned")
return NavySeal