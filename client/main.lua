local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }
  
  ESX = nil
  local PlayerData              = {}
  local training = false
  local resting = false
  local membership = false
  
  Citizen.CreateThread(function()
	  while ESX == nil do
		  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		  Citizen.Wait(0)
		  PlayerData = ESX.GetPlayerData()
	  end
  end)
  
  RegisterNetEvent('esx:playerLoaded')
  AddEventHandler('esx:playerLoaded', function(xPlayer)
	  PlayerData = xPlayer
  end)
  
  RegisterNetEvent('esx:setJob')
  AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
  end)
  
  function hintToDisplay(text)
	  SetTextComponentFormat("STRING")
	  AddTextComponentString(text)
	  DisplayHelpTextFromStringLabel(0, 0, 1, -1)
  end
  
  local blips = {
	  {title="Gym", colour=7, id=311, x = -1201.2257, y = -1568.8670, z = 4.6101}
  }
	  
  Citizen.CreateThread(function()
  
	  for _, info in pairs(blips) do
		  info.blip = AddBlipForCoord(info.x, info.y, info.z)
		  SetBlipSprite(info.blip, info.id)
		  SetBlipDisplay(info.blip, 4)
		  SetBlipScale(info.blip, 1.0)
		  SetBlipColour(info.blip, info.colour)
		  SetBlipAsShortRange(info.blip, true)
		  BeginTextCommandSetBlipName("STRING")
		  AddTextComponentString(info.title)
		  EndTextCommandSetBlipName(info.blip)
	  end
  end)
  
  RegisterNetEvent('esx_gym:useBandage')
  AddEventHandler('esx_gym:useBandage', function()
	  local playerPed = GetPlayerPed(-1)
	  local maxHealth = GetEntityMaxHealth(playerPed)
	  local health = GetEntityHealth(playerPed)
	  -- Calculate how much the bandage heals
	  local newHealth = math.min(maxHealth , math.floor(health + maxHealth/3))
	  SetEntityHealth(playerPed, newHealth)
	  --SetEntityHealth(playerPed, maxHealth) -- Give them full health by one bandage
	  ESX.ShowNotification(_U('bandage'))
  end)
  
  RegisterNetEvent('esx_gym:trueMembership')
  AddEventHandler('esx_gym:trueMembership', function()
	  membership = true
  end)
  
  RegisterNetEvent('esx_gym:falseMembership')
  AddEventHandler('esx_gym:falseMembership', function()
	  membership = false
  end)
  
  -- LOCATION (START)
  
  local arms = {
	  {x = -1202.9837,y = -1565.1718,z = 4.6115}
  }
  
  local pushup = {
	  {x = -1203.3242,y = -1570.6184,z = 4.6115}
  }
  
  local yoga = {
	  {x = -1204.7958,y = -1560.1906,z = 4.6115}
  }
  
  local situps = {
	  {x = -1206.1055,y = -1565.1589,z = 4.6115}
  }
  
  local gym = {
	  {x = -1195.6551,y = -1577.7689,z = 4.6115}
  }
  
  local chins = {
	  {x = -1200.1284,y = -1570.9903,z = 4.6115}
  }
  
  local rentbike = {
	  {x = -1199.1164,y = -1584.5972,z = 4.3249}
  }
  
  -- LOCATION (END)
  
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(0)
		  for k in pairs(rentbike) do
			  DrawMarker(21, rentbike[k].x, rentbike[k].y, rentbike[k].z, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 153, 255, 255, 0, 0, 0, 0)
		  end
	  end
  end)
  
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(0)
		  for k in pairs(arms) do
			  DrawMarker(21, arms[k].x, arms[k].y, arms[k].z, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 255, 50, 200, 0, 0, 0, 0)
		  end
	  end
  end)
  
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(0)
		  for k in pairs(pushup) do
			  DrawMarker(21, pushup[k].x, pushup[k].y, pushup[k].z, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 255, 50, 200, 0, 0, 0, 0)
		  end
	  end
  end)
  
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(0)
		  for k in pairs(yoga) do
			  DrawMarker(21, yoga[k].x, yoga[k].y, yoga[k].z, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 255, 50, 200, 0, 0, 0, 0)
		  end
	  end
  end)
  
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(0)
		  for k in pairs(situps) do
			  DrawMarker(21, situps[k].x, situps[k].y, situps[k].z, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 255, 50, 200, 0, 0, 0, 0)
		  end
	  end
  end)
  
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(0)
		  for k in pairs(gym) do
			  DrawMarker(21, gym[k].x, gym[k].y, gym[k].z, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 153, 255, 255, 0, 0, 0, 0)
		  end
	  end
  end)
  
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(0)
		  for k in pairs(chins) do
			  DrawMarker(21, chins[k].x, chins[k].y, chins[k].z, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 255, 50, 200, 0, 0, 0, 0)
		  end
	  end
  end)
  
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(0)
		  for k in pairs(rentbike) do		
			  local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			  local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, rentbike[k].x, rentbike[k].y, rentbike[k].z)
			  -- Check distance to show hint
			  if dist <= 0.5 then
				  hintToDisplay(_U('rentbike'))
				  -- Check if key is pressed
				  if IsControlJustPressed(0, Keys['E']) then -- "E"
					  if IsPedInAnyVehicle(GetPlayerPed(-1)) then
						  ESX.ShowNotification(_U('alreadyrented'))
					  else
						  OpenBikeMenu()
					  end
				  end			
			  end
		  end
	  end
  end)
  
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(0)
		  for k in pairs(gym) do		
			  local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			  local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, gym[k].x, gym[k].y, gym[k].z)
			  -- Check distance to show hint
			  if dist <= 0.5 then
				  hintToDisplay(_U('gym'))	
				  -- Check if key is pressed
				  if IsControlJustPressed(0, Keys['E']) then
					  OpenGymMenu()
				  end			
			  end
		  end
	  end
  end)
  
  -- Arms
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(0)
		  for k in pairs(arms) do
			  local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			  local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, arms[k].x, arms[k].y, arms[k].z)
			  -- Check distance to show hint
			  if dist <= 0.5 then
				  hintToDisplay(_U('arms'))
				  -- Check if key is pressed
				  if IsControlJustPressed(0, Keys['E']) then
					  if training == false then					
						  TriggerServerEvent('esx_gym:checkChip')
						  ESX.ShowNotification(_U('excercise'))
						  Citizen.Wait(1000)
						  -- Membership card check
						  if membership == true then
							local playerPed = GetPlayerPed(-1)
							TaskStartScenarioInPlace(playerPed, "world_human_muscle_free_weights", 0, true)
							Citizen.Wait(30000)
							ClearPedTasksImmediately(playerPed)
							ESX.ShowNotification(_U('rest_excercise', Config.Cooldown))
							--TriggerServerEvent('esx_gym:trainArms') ## COMING SOON...
							training = true
						  elseif membership == false then
							ESX.ShowNotification(_U('membership'))
						  end
					  elseif training == true then
						ESX.ShowNotification(_U('rest'))
						resting = true
						CheckTraining()
					  end
				  end			
			  end
		  end
	  end
  end)
  
  -- Pullups
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(0)
  		  for k in pairs(chins) do
			  local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			  local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, chins[k].x, chins[k].y, chins[k].z)
			  -- Check distance to show hint
			  if dist <= 0.5 then
				  hintToDisplay(_U('pullups'))
				  -- Check if key is pressed
				  if IsControlJustPressed(0, Keys['E']) then
					  if training == false then
						  TriggerServerEvent('esx_gym:checkChip')
						  ESX.ShowNotification(_U('excercise'))
						  Citizen.Wait(1000)
						  -- Membership card check
						  if membership == true then
							  local playerPed = GetPlayerPed(-1)
							  TaskStartScenarioInPlace(playerPed, "prop_human_muscle_chin_ups", 0, true)
							  Citizen.Wait(30000)
							  ClearPedTasksImmediately(playerPed)
							  ESX.ShowNotification(_U('rest_excercise', Config.Cooldown))
							  --TriggerServerEvent('esx_gym:trainChins') ## COMING SOON...							
							  training = true
						  elseif membership == false then
							  ESX.ShowNotification(_U('membership'))
						  end
					  elseif training == true then
						ESX.ShowNotification(_U('rest'))
						resting = true
						CheckTraining()
					  end
				  end			
			  end
		  end
	  end
  end)
  
  -- Pushups
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(0)
		  for k in pairs(pushup) do
			  local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			  local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pushup[k].x, pushup[k].y, pushup[k].z)
			  -- Check distance to show hint
			  if dist <= 0.5 then
				  hintToDisplay(_U('pushups'))
				  -- Check if key is pressed
				  if IsControlJustPressed(0, Keys['E']) then
					  if training == false then
						  TriggerServerEvent('esx_gym:checkChip')
						  ESX.ShowNotification(_U('excercise'))
						  Citizen.Wait(1000)
						  -- Membership card check
						  if membership == true then				
							  local playerPed = GetPlayerPed(-1)
							  TaskStartScenarioInPlace(playerPed, "world_human_push_ups", 0, true)
							  Citizen.Wait(30000)
							  ClearPedTasksImmediately(playerPed)
							  ESX.ShowNotification(_U('rest_excercise', Config.Cooldown))
							  --TriggerServerEvent('esx_gym:trainPushups') ## COMING SOON...							
							  training = true
						  elseif membership == false then
							  ESX.ShowNotification(_U('membership'))
						  end							
					  elseif training == true then
						  ESX.ShowNotification(_U('rest'))
						  resting = true						
						  CheckTraining()
					  end
				  end			
			  end
		  end
	  end
  end)
  
  -- Yoga
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(0)
		  for k in pairs(yoga) do
			  local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			  local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, yoga[k].x, yoga[k].y, yoga[k].z)
			  -- Check distance to show hint
			  if dist <= 0.5 then
				  hintToDisplay(_U('yoga'))
				  -- Check if key is pressed
				  if IsControlJustPressed(0, Keys['E']) then
					  if training == false then					
						  TriggerServerEvent('esx_gym:checkChip')
						  ESX.ShowNotification(_U('excercise'))
						  Citizen.Wait(1000)
						  -- Membership card check
						  if membership == true then	
							  local playerPed = GetPlayerPed(-1)
							  TaskStartScenarioInPlace(playerPed, "world_human_yoga", 0, true)
							  Citizen.Wait(30000)
							  ClearPedTasksImmediately(playerPed)
							  ESX.ShowNotification(_U('rest_excercise', Config.Cooldown))
							  --TriggerServerEvent('esx_gym:trainYoga') ## COMING SOON...							
							  training = true
						  elseif membership == false then
							  ESX.ShowNotification(_U('membership'))
						  end
					  elseif training == true then
						  ESX.ShowNotification(_U('rest'))						
						  resting = true						
						  CheckTraining()
					  end
				  end			
			  end
		  end
	  end
  end)
  
  -- Situps
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(0)
		  for k in pairs(situps) do
			  local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			  local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, situps[k].x, situps[k].y, situps[k].z)
			  -- Check distance to show hint
			  if dist <= 0.5 then
				  hintToDisplay(_U('situps'))
				  -- Check if key is pressed				
				  if IsControlJustPressed(0, Keys['E']) then
					  if training == false then  
						  TriggerServerEvent('esx_gym:checkChip')
						  ESX.ShowNotification(_U('excercise'))
						  Citizen.Wait(1000)
						  -- Membership card check
						  if membership == true then	
							  local playerPed = GetPlayerPed(-1)
							  TaskStartScenarioInPlace(playerPed, "world_human_sit_ups", 0, true)
							  Citizen.Wait(30000)
							  ClearPedTasksImmediately(playerPed)
							  ESX.ShowNotification(_U('rest_excercise', Config.Cooldown))
							  --TriggerServerEvent('esx_gym:trainSitups') ## COMING SOON...							
							  training = true
						  elseif membership == false then
							  ESX.ShowNotification(_U('membership'))
						  end
					  elseif training == true then
						ESX.ShowNotification(_U('rest'))
						resting = true
						CheckTraining()
					  end
				  end			
			  end
		  end
	  end
  end)
  
  function CheckTraining()
	  if resting == true then
		  ESX.ShowNotification(_U('resting'))
		  resting = false
		  local resting = Config.Cooldown * 1000
		  Citizen.Wait(resting)
		  training = false
	  end
  
	  if resting == false then
		  ESX.ShowNotification(_U('rested'))
	  end
  end
  
  function OpenGymMenu()
	  ESX.UI.Menu.CloseAll()
  
	  ESX.UI.Menu.Open(
		  'default', GetCurrentResourceName(), 'gym_menu',
		  {
			  title    = 'Gym',
			  elements = {
				  {label = 'Shop', value = 'shop'},
				  {label = 'Business Hours', value = 'hours'},
				  {label = 'Membership', value = 'ship'},
			  }
		  },
		  function(data, menu)
			  if data.current.value == 'shop' then
				  OpenGymShopMenu()
			  elseif data.current.value == 'hours' then
				  ESX.UI.Menu.CloseAll()				  
				  ESX.ShowNotification("We are open ~g~24~w~ hours/ day. Welcome!")
			  elseif data.current.value == 'ship' then
				  OpenGymShipMenu()
			  end
		  end,
		  function(data, menu)
			  menu.close()
		  end
	  )
  end
  
  function OpenGymShopMenu()
	  ESX.UI.Menu.CloseAll()
  
	  ESX.UI.Menu.Open(
		  'default', GetCurrentResourceName(), 'gym_shop_menu',
		  {
			  title    = 'Gym - Shop',
			  elements = {
				  {label = _U('proteinshake', Config.Protein_shake), value = 'protein_shake'},
				  {label = _U('water', Config.Water),  value = 'water'},
				  {label = _U('sportlunch', Config.Sportlunch), value = 'sportlunch'},
				  {label = _U('powerade', Config.Powerade), value = 'powerade'},
				  {label = _U('bandage', Config.Bandage), value = 'bandage'},
			  }
		  },
		  function(data, menu)
			  if data.current.value == 'protein_shake' then
				  TriggerServerEvent('esx_gym:buyProteinshake')
			  elseif data.current.value == 'water' then
				  TriggerServerEvent('esx_gym:buyWater')
			  elseif data.current.value == 'sportlunch' then
				  TriggerServerEvent('esx_gym:buySportlunch')
			  elseif data.current.value == 'powerade' then
				  TriggerServerEvent('esx_gym:buyPowerade')
			  elseif data.current.value == 'bandage' then
				  TriggerServerEvent('esx_gym:buyBandage')
			  end
		  end,
		  function(data, menu)
			  menu.close()
		  end
	  )
  end
  
  function OpenGymShipMenu()
	  ESX.UI.Menu.CloseAll()
  
	  ESX.UI.Menu.Open(
		  'default', GetCurrentResourceName(), 'gym_ship_menu',
		  {
			  title    = 'Gym - Membership',
			  elements = {
				  {label = _U('membership', Config.Membership), value = 'membership'},
			  }
		  },
		  function(data, menu)
			  if data.current.value == 'membership' then
				  TriggerServerEvent('esx_gym:buyMembership')				  
				  ESX.UI.Menu.CloseAll()
			  end
		  end,
		  function(data, menu)
			  menu.close()
		  end
	  )
  end
  
  function OpenBikeMenu()
	  ESX.UI.Menu.CloseAll()
  
	  ESX.UI.Menu.Open(
		  'default', GetCurrentResourceName(), 'bike_menu',
		  {
			  title    = 'Hire a bike',
			  elements = {
				  {label = _U('bmx', Config.BMX), value = 'bmx'},
				  {label = _U('cruiser', Config.Cruiser), value = 'cruiser'},
				  {label = _U('fixter', Config.Fixter), value = 'fixter'},
				  {label = _U('scorcher', Config.Scorcher), value = 'scorcher'},
			  }
		  },
		  function(data, menu)
			  if data.current.value == 'bmx' then
				  TriggerServerEvent('esx_gym:hireBmx')
				  TriggerEvent('esx:spawnVehicle', "bmx")				  
				  ESX.UI.Menu.CloseAll()
			  elseif data.current.value == 'cruiser' then
				  TriggerServerEvent('esx_gym:hireCruiser')
				  TriggerEvent('esx:spawnVehicle', "cruiser")				  
				  ESX.UI.Menu.CloseAll()
			  elseif data.current.value == 'fixter' then
				  TriggerServerEvent('esx_gym:hireFixter')
				  TriggerEvent('esx:spawnVehicle', "fixter")				  
				  ESX.UI.Menu.CloseAll()
			  elseif data.current.value == 'scorcher' then
				  TriggerServerEvent('esx_gym:hireScorcher')
				  TriggerEvent('esx:spawnVehicle', "scorcher")				  
				  ESX.UI.Menu.CloseAll()
			  end
		  end,
		  function(data, menu)
			  menu.close()
		  end
	  )
  end