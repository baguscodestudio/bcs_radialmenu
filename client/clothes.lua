if GetResourceState('fivem-appearance') ~= 'missing' then
    RegisterNetEvent('radial:removeclothes', function(clothes)
        if clothes == 'top' then
            playAnim('missmic4', 'michael_tux_fidget')
            exports['fivem-appearance']:setPedComponent(PlayerPedId(), {component_id=11, drawable=15, texture=0})
            exports['fivem-appearance']:setPedComponent(PlayerPedId(), {component_id=8, drawable=15, texture=0})
            exports['fivem-appearance']:setPedComponent(PlayerPedId(), {component_id=3, drawable=15, texture=0})
        elseif clothes == 'pants' then
            playAnim('re@construction', 'out_of_breath')
            if exports['fivem-appearance']:getPedModel(PlayerPedId()) == 'mp_m_freemode_01' then
                exports['fivem-appearance']:setPedComponent(PlayerPedId(), {component_id=4, drawable=61, texture=0})
            else
                exports['fivem-appearance']:setPedComponent(PlayerPedId(), {component_id=4, drawable=15, texture=0})
            end
        elseif clothes == 'shoes' then
            playAnim('random@domestic', 'pickup_low')
            if exports['fivem-appearance']:getPedModel(PlayerPedId()) == 'mp_m_freemode_01' then
                exports['fivem-appearance']:setPedComponent(PlayerPedId(), {component_id=6, drawable=34, texture=0})
            else
                exports['fivem-appearance']:setPedComponent(PlayerPedId(), {component_id=6, drawable=35, texture=0})
            end
        elseif clothes == 'vest' then
            playAnim('clothingtie', 'try_tie_neutral_a')
            exports['fivem-appearance']:setPedComponent(PlayerPedId(), {component_id=9, drawable=0, texture=0})
        elseif clothes == 'bag' then
            playAnim('anim@heists@ornate_bank@grab_cash', 'intro')
            exports['fivem-appearance']:setPedComponent(PlayerPedId(), {component_id=5, drawable=0, texture=0})
        elseif clothes == 'mask' then
            playAnim('mp_masks@standard_car@ds@', 'take_off_helmet_stand')
            exports['fivem-appearance']:setPedComponent(PlayerPedId(), {component_id=5, drawable=-1, texture=0})
        end
    end)

    RegisterNetEvent('radial:removeaccessories', function(accessories)
        if accessories == 'ears' then
            playAnim('mp_cp_stolen_tut', 'b_think')
            exports['fivem-appearance']:setPedProp(PlayerPedId(), {component_id=2, drawable=-1})
        elseif accessories == 'watch' then
            playAnim('nmt_3_rcm-10', 'cs_nigel_dual-10')
            exports['fivem-appearance']:setPedProp(PlayerPedId(), {component_id=6, drawable=-1})
        elseif accessories == 'hat' then
            playAnim('mp_masks@standard_car@ds@', 'take_off_helmet_stand')
            exports['fivem-appearance']:setPedProp(PlayerPedId(), {component_id=0, drawable=-1})
        elseif accessories == 'glasses' then
            playAnim('clothingspecs', 'take_off')
            exports['fivem-appearance']:setPedProp(PlayerPedId(), {component_id=1, drawable=-1})
        elseif accessories == 'bracelet' then
            playAnim('nmt_3_rcm-10', 'cs_nigel_dual-10')
            exports['fivem-appearance']:setPedProp(PlayerPedId(), {component_id=7, drawable=-1})
        end
    end)
end

function playAnim(dict, anim) 
    if not HasAnimDictLoaded(dict) then
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Wait(0)
		end
	end
    local duration = 1000
    print(HasAnimDictLoaded(dict), duration, dict)
    TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, 1.0, duration, 49, 0.0, 0.0, 0.0, 0.0)
    Wait(duration)
    RemoveAnimDict(dict)
    ClearPedTasks(PlayerPedId())
end