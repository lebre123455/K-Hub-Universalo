
--==================================================
-- K-HUB UNIVERSAL 2.0
-- Rayfield UI | Mobile / PC
-- Interface de catálogo
--==================================================

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local Player = Players.LocalPlayer

-- CONFIGURAÇÃO
local HUB_NAME = "K-Hub Universal"
local VERSION = "2.0"

-- DETECÇÃO DA PLATAFORMA
local function detectPlatform()
    local input = UIS.PreferredInput

    if input == Enum.PreferredInput.Touch then
        return "Mobile"
    elseif input == Enum.PreferredInput.KeyboardAndMouse then
        return "PC"
    end

    return UIS.TouchEnabled and "Mobile" or "PC"
end

local platform = detectPlatform()

-- CATÁLOGO
local Games = {
    Towers = {
        {"Tower of Hell", "SEM KEY"},
        {"Tower Defense X", "SEM KEY"},
        {"Tower Heroes", "SEM KEY"},
        {"SpongeBob Tower Defense", "SEM KEY"},
        {"Garden Tower Defense", "SEM KEY"},
        {"Toilet Tower Defense", "SEM KEY"},
        {"Anime Adventures", "SEM KEY"},
        {"Ultimate Tower Defense", "SEM KEY"},
        {"All Star Tower Defense", "SEM KEY"},
        {"Toilet Tower Defense", "SEM KEY"},
    },

    Popular = {
        {"Blox Fruits", "COM KEY"},
        {"Brookhaven", "SEM KEY"},
        {"Murder Mystery 2", "SEM KEY"},
        {"DOORS", "SEM KEY"},
        {"Adopt Me", "SEM KEY"},
        {"Blade Ball", "SEM KEY"},
        {"Dress To Impress", "SEM KEY"},
        {"Arsenal", "SEM KEY"},
        {"BedWars", "SEM KEY"},
        {"RIVALS", "SEM KEY"},
    },

    Fish = {
        {"Fisch", "SEM KEY"},
        {"Fishing Simulator", "SEM KEY"},
        {"Scuba Diving at Quill Lake", "SEM KEY"},
        {"Fish Simulator", "SEM KEY"},
    },

    Underrated = {
        {"Robot 64", "SEM KEY"},
        {"Block Tales", "SEM KEY"},
        {"Pilgrammed", "SEM KEY"},
        {"Combat Initiation", "SEM KEY"},
        {"PHIGHTING!", "SEM KEY"},
        {"Fabled Legacy", "SEM KEY"},
        {"Arcane Odyssey", "SEM KEY"},
        {"Apeirophobia", "SEM KEY"},
        {"Entry Point", "SEM KEY"},
        {"Regretevator", "SEM KEY"},
    },

    Hobbies = {
        {"Car Crushers 2", "SEM KEY"},
        {"Vehicle Legends", "SEM KEY"},
        {"Driving Empire", "SEM KEY"},
        {"Theme Park Tycoon 2", "SEM KEY"},
        {"Build A Boat For Treasure", "SEM KEY"},
        {"Plane Crazy", "SEM KEY"},
    }
}

-- CARREGAR RAYFIELD
local loaded, Rayfield = pcall(function()
    return loadstring(game:HttpGet(
        "https://sirius.menu/rayfield"
    ))()
end)

if not loaded or not Rayfield then
    warn("K-Hub: Falha ao carregar a interface Rayfield.")
    return
end

-- JANELA PRINCIPAL
local Window = Rayfield:CreateWindow({
    Name = HUB_NAME .. " | " .. VERSION,
    LoadingTitle = HUB_NAME,
    LoadingSubtitle = "Universal Interface",
    ConfigurationSaving = {
        Enabled = false
    },
    KeySystem = false
})

-- FUNÇÕES AUXILIARES
local function notify(title, message)
    Rayfield:Notify({
        Title = title,
        Content = message,
        Duration = 4
    })
end

local function createTab(name)
    return Window:CreateTab(name)
end

-- INÍCIO
local Home = createTab("Início")

Home:CreateSection("Verificação de dispositivo")

Home:CreateParagraph({
    Title = "Dispositivo detectado",
    Content = "Plataforma atual: " .. platform
})

Home:CreateButton({
    Name = "Selecionar MOBILE",
    Callback = function()
        platform = "Mobile"
        notify("K-Hub", "Plataforma selecionada: Mobile")
    end
})

Home:CreateButton({
    Name = "Selecionar PC",
    Callback = function()
        platform = "PC"
        notify("K-Hub", "Plataforma selecionada: PC")
    end
})

Home:CreateButton({
    Name = "Detectar novamente",
    Callback = function()
        platform = detectPlatform()
        notify("K-Hub", "Detectado: " .. platform)
    end
})

Home:CreateSection("Informações")

Home:CreateParagraph({
    Title = "Bem-vindo ao K-Hub",
    Content = "Versão " .. VERSION ..
    "\nInterface Rayfield com catálogo de experiências."
})

-- CRIAR CATÁLOGOS
local function createCatalog(category)
    local tab = createTab(category)

    tab:CreateSection("Catálogo de " .. category)

    for _, game in ipairs(Games[category]) do
        local gameName = game[1]
        local keyStatus = game[2]

        tab:CreateButton({
            Name = gameName .. " (" .. keyStatus .. ")",

            Callback = function()
                notify(
                    "K-Hub | " .. category,
                    "Jogo selecionado: " .. gameName ..
                    "\nStatus: " .. keyStatus
                )
            end
        })
    end

    return tab
end

createCatalog("Towers")
createCatalog("Popular")
createCatalog("Fish")
createCatalog("Underrated")
createCatalog("Hobbies")

-- HUBS
local Hubs = createTab("Hubs")

Hubs:CreateSection("Central de Hubs")

Hubs:CreateParagraph({
    Title = "K-Hub Universal",
    Content = "Central de organização de experiências."
})

Hubs:CreateButton({
    Name = "Informações do K-Hub",

    Callback = function()
        notify(
            HUB_NAME,
            "Versão " .. VERSION .. " | Interface Rayfield"
        )
    end
})

-- EXTRAS
local Extras = createTab("Extras")

Extras:CreateSection("Configurações")

Extras:CreateButton({
    Name = "Ver plataforma selecionada",

    Callback = function()
        notify("Plataforma", platform)
    end
})

Extras:CreateButton({
    Name = "Ver versão",

    Callback = function()
        notify(HUB_NAME, "Versão " .. VERSION)
    end
})

Extras:CreateButton({
    Name = "Verificar catálogo",

    Callback = function()
        local total = 0

        for _, games in pairs(Games) do
            total = total + #games
        end

        notify(
            "Catálogo",
            tostring(total) .. " entradas cadastradas."
        )
    end
})

-- FINALIZAÇÃO
notify(
    HUB_NAME,
    "Interface carregada! Plataforma: " .. platform
)

print(HUB_NAME .. " " .. VERSION .. " carregado.")
