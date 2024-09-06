local function ToggleNuiFrame(shouldShow)
  SetNuiFocus(shouldShow, shouldShow)
  SendReactMessage('setVisible', shouldShow)
end
local Menus = {}
local currentMenu = ''
local home = ''
local additionalOptions = {}

if not Config.Open.commandonly then
  RegisterKeyMapping('+' .. Config.Open.command, 'Open Radial Menu', 'keyboard', Config.Open.key)
end

CreateThread(function()
  exports.bcs_radialmenu:RegisterMenus(Config.Menu)
  if PlayerData and PlayerData.job then
    for job, values in pairs(Config.JobMenu) do
      if job == PlayerData.job.name then
        exports.bcs_radialmenu:AddOption({
          id = 'job_menu',
          label = 'Job Menu',
          icon = 'fa-solid fa-suitcase',
          menu = job .. '_menu'
        })
      end
      exports.bcs_radialmenu:RegisterMenus(values)
    end
  end
end)

local open = false

RegisterCommand('+' .. Config.Open.command, function()
  local dead = IsDead()
  if not dead then
    SetNuiFocusKeepInput(true)
    ToggleNuiFrame(true)
    SendReactMessage('setMenu', Menus[currentMenu])
    open = true
    while open do
      Wait(0)
      DisableControlAction(0, 1, true)  -- Look Left/Right
      DisableControlAction(0, 2, true)  -- Look up/Down
      DisableControlAction(0, 24, true) -- Attack
    end
  end
end)

RegisterCommand('-' .. Config.Open.command, function()
  ToggleNuiFrame(false)
  SetNuiFocusKeepInput(false)
  open = false
end)

exports('changeMenu', function(menu)
  currentMenu = menu
end)

exports('resetMenu', function()
  currentMenu = home
end)

exports('AddOption', function(option, menu)
  if additionalOptions[option.id] then
    exports.bcs_radialmenu:RemoveOption(option.id)
  end
  if menu and Menus[menu] then
    Menus[menu].options[#Menus[menu].options + 1] = option
  else
    Menus[currentMenu].options[#Menus[currentMenu].options + 1] = option
  end
  additionalOptions[option.id] = true
end)

exports('RemoveOption', function(id, menu)
  local function RemoveOption(options)
    for k, v in pairs(options) do
      if v.id and v.id == id then
        table.remove(options, k)
        additionalOptions[id] = false
        return true
      end
    end
    return false
  end
  if menu then
    RemoveOption(Menus[menu].options)
  else
    if not RemoveOption(Menus[currentMenu].options) then
      for _, val in pairs(Menus) do
        if RemoveOption(val.options) then
          return
        end
      end
    end
  end
end)

exports('RegisterMenus', function(menus)
  menus = table.type(menus) == 'array' and menus or { menus }
  for i = 1, #menus do
    Menus[menus[i].menu] = menus[i]
    if menus[i].isHome then
      currentMenu = menus[i].menu
      home = menus[i].menu
    end
  end
end)

RegisterNUICallback('hideFrame', function(_, cb)
  ToggleNuiFrame(false)
  cb({})
end)

RegisterNUICallback('getMenu', function(data, cb)
  if data then
    cb(Menus[data])
  else
    cb(Menus[currentMenu])
  end
end)

RegisterNUICallback('itemClick', function(data, cb)
  local option = Menus[data.menu].options[data.index]
  if option then
    local onSelect = option.onSelect
    if onSelect then
      onSelect()
    elseif option.event then
      TriggerEvent(option.event, option.args and table.unpack(option.args))
    end
  end
  cb({})
end)
