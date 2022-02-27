local SR = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest

game.Players.PlayerAdded:Connect(function(Player)
    local Data = syn.request({
        Url = "https://raw.githubusercontent.com/Curvn/Anti-Bot-Services/main/BL",
        Method = "GET"
    })
	local LC = string.split(Data.Body, ";")
	print(LC)
	if table.find(LC, tostring(Player.UserId)) then
	    print("BOT HAS JOINED: " .. Player.Name .. " | " .. Player.UserId)
	    SR:FireServer("/mute "..Player.Name, "All")
		wait(2)
		if Player.Character:FindFirstChild("ForceField") then Player.Character.ForceField:Destroy() end
		for i,v in pairs(Player.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v:Destroy()
            end
        end
        Player.CharacterAdded:Connect(function(Char)
            wait()
            if Char:FindFirstChild("ForceField") then Char.ForceField:Destroy() end
            for i,v in pairs(Char:GetDescendants()) do
                if v:IsA("BasePart") then
                    v:Destroy()
                end
            end
        end)
	end
end)
