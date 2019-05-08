function FindKey()
	keyLink = nil
	flag = false
	for bag=0,NUM_BAG_SLOTS,1
		do
			numSlots = GetContainerNumSlots(bag)
			for i=0,numSlots,1
				do
				local texture, count, locked, quality, readable, lootable, link, isFiltered, hasNoValue, itemID = GetContainerItemInfo(bag, i)
				if(itemID == 138019)
					then
					keyLink = link
					flag = true
				break end
			end
		if(flag) then break end
		end
	if(flag) then SendChatMessage(keyLink,"PARTY") else print("JKey could not find a key in your bags.")
	end
end

MyMod_Settings = {
	MinimapPos = 50
}

function JKeyMapButton_Reposition()
	MyMod_MinimapButton:SetPoint("TOPLEFT","Minimap","TOPLEFT",52-(80*cos(MyMod_Settings.MinimapPos)),(80*sin(MyMod_Settings.MinimapPos))-52)
end

-- dragging doesnt work r i p i n p i e c e s
function JKeyMapButton_DraggingFrame_OnUpdate()

	local xpos,ypos = GetCursorPosition()
	local xmin,ymin = Minimap:GetLeft(), Minimap:GetBottom()

	xpos = xmin-xpos/UIParent:GetScale()+70 -- get coordinates as differences from the center of the minimap
	ypos = ypos/UIParent:GetScale()-ymin-70

	MyMod_Settings.MinimapPos = math.deg(math.atan2(ypos,xpos)) -- save the degrees we are relative to the minimap center
	MyMod_MinimapButton_Reposition() -- move the button
end

function JKeyMapButton_OnClick()
	if("LeftButton" == GetMouseButtonClicked())
		then
		FindKey()
		end
end

function JKeyMapButton_OnEnter(self)
	 GameTooltip_SetDefaultAnchor( GameTooltip, UIParent )
	 GameTooltip:SetText( "Left Click to post key in Party Chat || Right Click to reply with key (NYI)" )
	 GameTooltip:Show()
end

function JKeyMapButton_OnLeave(self)
	GameTooltip:Hide()
end






