local keybinds = {
    [0] =  {label = "Radio", keybind = "F4"},
    [1] =  {label = "Menu personnel", keybind = "F5"},
    [2] =  {label = "Menu Job", keybind = "F6"},
    [3] =  {label = "Menu Gang", keybind = "F7"},
    [4] =  {label = "Passe de combat", keybind = "F9"},
    [5] =  {label = "Screenshot steam", keybind = "F12"},
    [6] =  {label = "Ouvrir le coffre de voiture", keybind = "K"},
    [7] =  {label = "Menu contextuel", keybind = "J"},
    [8] =  {label = "Lever les mains", keybind = "Y"},
    [9] =  {label = "S'accroupir", keybind = "CTRL"},
}

local function openHelpMenu()
    if (active) then
        return
    end    

    local mainMenu <const> = RageUI.CreateMenu("", "Menu touches", nil, nil, "commonmenu", "interaction_bgd")    

    mainMenu.Closed = function() active = false end
    mainMenu:DisplayPageCounter(false)
    mainMenu.Display.Glare = false
    mainMenu.EnableMouse = false

    active = true
    RageUI.Visible(mainMenu, true)

    CreateThread(function()
        while (active) do          
            RageUI.IsVisible(mainMenu, function()
                RageUI.Separator("Toutes les touches sont ~b~configurables")
                for k,v in pairs(keybinds) do
                    RageUI.Button(("%s"):format(v.label), nil, {RightLabel = ("[~b~%s~s~]"):format(v.keybind)}, true, {})
                end
            end)

            Wait(0)
        end
    end)    
end

RegisterCommand("touches", function()
    openHelpMenu()
end)
