local owner = EntityGetRootEntity(GetUpdatedEntityID())
local x, y, rotation, scale_x, scale_y = EntityGetTransform(owner)

local sprite_comps = EntityGetComponentIncludingDisabled(owner, "SpriteComponent") or {}

-- fix to let the enemies also able to turn left
for i, sprc in ipairs(sprite_comps) do
	local special_scale_x = ComponentGetValue2(sprc, "special_scale_x")

	local x_sign = 1

	if scale_x < 0 then
		x_sign = -1
	end

	ComponentSetValue2(sprc, "special_scale_x", math.abs(special_scale_x) * x_sign)
end


